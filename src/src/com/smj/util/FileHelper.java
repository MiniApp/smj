package com.smj.util;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.channels.FileLock;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.cfg.Environment;
/**
 * 文件操作类
 * @author Fengyu
 */
public final class FileHelper {
	public static boolean writeFile(File file, String content) {
		return writeFile(file.getPath(), content, false);
	}
	public static boolean writeFile(String filePath, String content) {
		return writeFile(filePath, content, false);
	}
	public static boolean writeFile(String filePath, String content, boolean append) {
		try {
			File file = new File(filePath);
			FileOutputStream out = new FileOutputStream(file, append);
			OutputStreamWriter fwout = new OutputStreamWriter(out, JavaCenterHome.JCH_CHARSET);
			BufferedWriter bw = new BufferedWriter(fwout);
			FileLock fl = out.getChannel().tryLock();
			if (fl.isValid()) {
				bw.write(content);
				fl.release();
			}
			bw.flush();
			fwout.flush();
			out.flush();
			bw.close();
			fwout.close();
			out.close();
			bw = null;
			fwout = null;
			out = null;
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	public static boolean writeFile(String filePath, String content, int off, int len) {
		File file = new File(filePath);
		if (file.exists()) {
			FileOutputStream outputStream = null;
			OutputStreamWriter outputWriter = null;
			BufferedWriter bufWriter = null;
			try {
				outputStream = new FileOutputStream(filePath);
				outputWriter = new OutputStreamWriter(outputStream, JavaCenterHome.JCH_CHARSET);
				bufWriter = new BufferedWriter(outputWriter);
				FileLock fl = outputStream.getChannel().tryLock();
				if (fl.isValid()) {
					bufWriter.write(content, off, len);
					fl.release();
				}
				return true;
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					bufWriter.close();
					outputWriter.close();
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}
	public static String readFile(File file, int len) {
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		try {
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			byte datas[] = new byte[len];
			bis.read(datas, 0, len);
			return new String(datas,JavaCenterHome.JCH_CHARSET);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (bis != null) {
					bis.close();
				}
				if (fis != null) {
					fis.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	public static String readFile(String filePath) {
		return readFile(new File(filePath));
	}
	public static String readFile(File file) {
		StringBuffer content = new StringBuffer();
		if (file != null && file.exists()) {
			FileInputStream fis = null;
			InputStreamReader isr = null;
			BufferedReader br = null;
			try {
				fis = new FileInputStream(file);
				isr = new InputStreamReader(fis, JavaCenterHome.JCH_CHARSET);
				br = new BufferedReader(isr);
				String temp = null;
				while ((temp = br.readLine()) != null) {
					content.append(temp);
					content.append("\n");
				}
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					if (br != null) {
						br.close();
					}
					if (isr != null) {
						isr.close();
					}
					if (fis != null) {
						fis.close();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return content.toString().trim();
	}
	public static List<String> readFileToList(File file) {
		List<String> lines = new ArrayList<String>();
		if (file != null && file.exists()) {
			FileInputStream fis = null;
			InputStreamReader isr = null;
			BufferedReader br = null;
			try {
				fis = new FileInputStream(file);
				isr = new InputStreamReader(fis, JavaCenterHome.JCH_CHARSET);
				br = new BufferedReader(isr);
				String temp = null;
				while ((temp = br.readLine()) != null) {
					lines.add(temp);
				}
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					if (br != null) {
						br.close();
					}
					if (isr != null) {
						isr.close();
					}
					if (fis != null) {
						fis.close();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return lines;
	}
	public static InputStream getResourceAsStream(String resource) throws FileNotFoundException {
		String stripped = resource.startsWith("/") ? resource.substring(1) : resource;
		InputStream stream = null;
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		if (classLoader != null) {
			stream = classLoader.getResourceAsStream(stripped);
		}
		if (stream == null) {
			stream = Environment.class.getResourceAsStream(resource);
		}
		if (stream == null) {
			stream = Environment.class.getClassLoader().getResourceAsStream(stripped);
		}
		if (stream == null) {
			throw new FileNotFoundException(resource + " not found");
		}
		return stream;
	}
}