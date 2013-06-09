package com.smj.util;
import java.io.BufferedReader;import java.io.BufferedWriter;import java.io.FileInputStream;import java.io.FileOutputStream;import java.io.IOException;import java.io.InputStream;import java.io.InputStreamReader;import java.io.OutputStreamWriter;import java.util.ArrayList;import java.util.List;import java.util.Properties;import java.util.Set;
/**
 * 配置文件操作类
 */public final class PropertiesHelper {
	private String charset = "UTF-8";
	private Properties properties = null;//配置
	private String fileName = null;//文件
	/**
	 * 构造方法
	 */
	public PropertiesHelper(String fileName) throws IOException {
		this.properties = new Properties();
		this.fileName = fileName;
		InputStream fis = new FileInputStream(fileName);
		this.properties.load(fis);
		fis.close();
	}
	/**
	 * 保存配置文件信息
	 */
	public void saveProperties() throws IOException {
		FileInputStream fis = new FileInputStream(fileName);
		InputStreamReader fsr = new InputStreamReader(fis, charset);
		BufferedReader br = new BufferedReader(fsr);
		List<String> datas = new ArrayList<String>();
		int index = -1;
		while (br.ready()) {
			index++;
			datas.add(br.readLine());
		}
		br.close();
		fsr.close();
		fis.close();
		Set<Object> keys = properties.keySet();
		for (Object key : keys) {
			boolean isnew = true;
			for (int i = 0; i <= index; i++) {
				if (datas.get(i).matches("^\\s*" + key + "\\s*\\=.*")) {
					datas.set(i, key + " = "
							+ properties.getProperty(key.toString()).replaceAll("\n", "\\\\n"));
					isnew = false;
					break;
				}
			}
			if (isnew) {
				index++;
				datas.add(index, key + " = "
						+ properties.getProperty(key.toString()).replaceAll("\n", "\\\\n"));
			}
		}
		FileOutputStream fos = new FileOutputStream(fileName);
		OutputStreamWriter osw = new OutputStreamWriter(fos, charset);
		BufferedWriter bw = new BufferedWriter(osw);
		for (String data : datas) {
			bw.write(data);
			bw.newLine();
		}
		bw.flush();
		osw.flush();
		fos.flush();
		bw.close();
		osw.close();
		fos.close();
	}
	public String getCharset() {
		return charset;
	}
	public void setCharset(String charset) {
		this.charset = charset;
	}
	public Properties getProperties() {
		return properties;
	}
	public void setProperties(Properties properties) {
		this.properties = properties;
	}
	public String getValue(String key) {
		return properties.getProperty(key);
	}
	public void setValue(String key, String value) {
		properties.setProperty(key, value);
	}
}