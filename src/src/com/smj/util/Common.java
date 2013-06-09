package com.smj.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.text.StringCharacterIterator;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.oro.text.regex.MalformedPatternException;
import org.apache.oro.text.regex.MatchResult;
import org.apache.oro.text.regex.Pattern;
import org.apache.oro.text.regex.PatternCompiler;
import org.apache.oro.text.regex.PatternMatcher;
import org.apache.oro.text.regex.Perl5Compiler;
import org.apache.oro.text.regex.Perl5Matcher;
import org.apache.struts.Globals;
import org.apache.struts.util.MessageResources;

/**
 * 常用类
 * @author Fengyu
 */
public class Common {
	private static MessageResources mr = null;
	private static Random random = new Random();
	private static final String randChars = "0123456789abcdefghigklmnopqrstuvtxyzABCDEFGHIGKLMNOPQRSTUVWXYZ";
	private static Map<String, String[]> timeZoneIDs = new LinkedHashMap<String, String[]>(32);
	static {
		timeZoneIDs.put("-12", new String[] {"GMT-12:00", "(GMT -12:00) Eniwetok, Kwajalein"});
		timeZoneIDs.put("-11", new String[] {"GMT-11:00", "(GMT -11:00) Midway Island, Samoa"});
		timeZoneIDs.put("-10", new String[] {"GMT-10:00", "(GMT -10:00) Hawaii"});
		timeZoneIDs.put("-9", new String[] {"GMT-09:00", "(GMT -09:00) Alaska"});
		timeZoneIDs.put("-8", new String[] {"GMT-08:00",
				"(GMT -08:00) Pacific Time (US &amp; Canada), Tijuana"});
		timeZoneIDs.put("-7", new String[] {"GMT-07:00",
				"(GMT -07:00) Mountain Time (US &amp; Canada), Arizona"});
		timeZoneIDs.put("-6", new String[] {"GMT-06:00",
				"(GMT -06:00) Central Time (US &amp; Canada), Mexico City"});
		timeZoneIDs.put("-5", new String[] {"GMT-05:00",
				"(GMT -05:00) Eastern Time (US &amp; Canada), Bogota, Lima, Quito"});
		timeZoneIDs.put("-4", new String[] {"GMT-04:00",
				"(GMT -04:00) Atlantic Time (Canada), Caracas, La Paz"});
		timeZoneIDs.put("-3.5", new String[] {"GMT-03:30", "(GMT -03:30) Newfoundland"});
		timeZoneIDs.put("-3", new String[] {"GMT-03:00",
				"(GMT -03:00) Brassila, Buenos Aires, Georgetown, Falkland Is"});
		timeZoneIDs.put("-2", new String[] {"GMT-02:00",
				"(GMT -02:00) Mid-Atlantic, Ascension Is., St. Helena"});
		timeZoneIDs.put("-1", new String[] {"GMT-01:00", "(GMT -01:00) Azores, Cape Verde Islands"});
		timeZoneIDs.put("0", new String[] {"GMT",
				"(GMT) Casablanca, Dublin, Edinburgh, London, Lisbon, Monrovia"});
		timeZoneIDs.put("1", new String[] {"GMT+01:00",
				"(GMT +01:00) Amsterdam, Berlin, Brussels, Madrid, Paris, Rome"});
		timeZoneIDs.put("2", new String[] {"GMT+02:00",
				"(GMT +02:00) Cairo, Helsinki, Kaliningrad, South Africa"});
		timeZoneIDs.put("3", new String[] {"GMT+03:00", "(GMT +03:00) Baghdad, Riyadh, Moscow, Nairobi"});
		timeZoneIDs.put("3.5", new String[] {"GMT+03:30", "(GMT +03:30) Tehran"});
		timeZoneIDs.put("4", new String[] {"GMT+04:00", "(GMT +04:00) Abu Dhabi, Baku, Muscat, Tbilisi"});
		timeZoneIDs.put("4.5", new String[] {"GMT+04:30", "(GMT +04:30) Kabul"});
		timeZoneIDs.put("5", new String[] {"GMT+05:00",
				"(GMT +05:00) Ekaterinburg, Islamabad, Karachi, Tashkent"});
		timeZoneIDs
				.put("5.5", new String[] {"GMT+05:30", "(GMT +05:30) Bombay, Calcutta, Madras, New Delhi"});
		timeZoneIDs.put("5.75", new String[] {"GMT+05:45", "(GMT +05:45) Katmandu"});
		timeZoneIDs.put("6", new String[] {"GMT+06:00", "(GMT +06:00) Almaty, Colombo, Dhaka, Novosibirsk"});
		timeZoneIDs.put("6.5", new String[] {"GMT+06:30", "(GMT +06:30) Rangoon"});
		timeZoneIDs.put("7", new String[] {"GMT+07:00", "(GMT +07:00) Bangkok, Hanoi, Jakarta"});
		timeZoneIDs.put("8", new String[] {"GMT+08:00",
				"(GMT +08:00) Beijing, Hong Kong, Perth, Singapore, Taipei"});
		timeZoneIDs
				.put("9", new String[] {"GMT+09:00", "(GMT +09:00) Osaka, Sapporo, Seoul, Tokyo, Yakutsk"});
		timeZoneIDs.put("9.5", new String[] {"GMT+09:30", "(GMT +09:30) Adelaide, Darwin"});
		timeZoneIDs.put("10", new String[] {"GMT+10:00",
				"(GMT +10:00) Canberra, Guam, Melbourne, Sydney, Vladivostok"});
		timeZoneIDs.put("11", new String[] {"GMT+11:00",
				"(GMT +11:00) Magadan, New Caledonia, Solomon Islands"});
		timeZoneIDs.put("12", new String[] {"GMT+12:00",
				"(GMT +12:00) Auckland, Wellington, Fiji, Marshall Island"});
	}
	/**
	 * 大写字母
	 */
	public static Map pinyin(){
		Map<Integer, String> py = new LinkedHashMap<Integer,String>();
		py.put(1, "A");
		py.put(2, "B");
		py.put(3, "C");
		py.put(4, "D");
		py.put(5, "E");
		py.put(6, "F");
		py.put(7, "G");
		py.put(8, "H");
		py.put(9, "I");
		py.put(10, "J");
		py.put(11, "K");
		py.put(12, "L");
		py.put(13, "M");
		py.put(14, "N");
		py.put(15, "O");
		py.put(16, "P");
		py.put(17, "Q");
		py.put(18, "R");
		py.put(19, "S");
		py.put(20, "T");
		py.put(21, "U");
		py.put(22, "V");
		py.put(23, "W");
		py.put(24, "X");
		py.put(25, "Y");
		py.put(26, "Z");
		return py;
	}
	/**
	 * 判断是否为空
	 */
	public static boolean empty(Object obj) {
		if (obj == null) {
			return true;
		} else if (obj instanceof String && (obj.equals("") || obj.equals("0"))) {
			return true;
		} else if (obj instanceof Number && ((Number) obj).doubleValue() == 0) {
			return true;
		} else if (obj instanceof Boolean && !((Boolean) obj)) {
			return true;
		} else if (obj instanceof Collection && ((Collection) obj).isEmpty()) {
			return true;
		} else if (obj instanceof Map && ((Map) obj).isEmpty()) {
			return true;
		} else if (obj instanceof Object[] && ((Object[]) obj).length == 0) {
			return true;
		}
		return false;
	}
	/**
	 * 转译HTML特殊字符(&,<,>,")
	 */
	public static String htmlSpecialChars(String string) {
		return htmlSpecialChars(string, 1);
	}
	/**
	 * 转译HTML特殊字符(&,<,>,",')
	 * quotestyle=1 OR quotestyle=2 时转译"
	 * quotestyle=2 时转译'
	 */
	public static String htmlSpecialChars(String text, int quotestyle) {
		if (text == null || text.equals("")) {
			return "";
		}
		StringBuffer sb = new StringBuffer(text.length() * 2);
		StringCharacterIterator iterator = new StringCharacterIterator(text);
		char character = iterator.current();
		while (character != StringCharacterIterator.DONE) {
			switch (character) {
				case '&':
					sb.append("&amp;");
					break;
				case '<':
					sb.append("&lt;");
					break;
				case '>':
					sb.append("&gt;");
					break;
				case '"':
					if (quotestyle == 1 || quotestyle == 2) {
						sb.append("&quot;");
					} else {
						sb.append(character);
					}
					break;
				case '\'':
					if (quotestyle == 2) {
						sb.append("&#039;");
					} else {
						sb.append(character);
					}
					break;
				default:
					sb.append(character);
					break;
			}
			character = iterator.next();
		}
		return sb.toString();
	}
	/**
	 * 为特殊字符加斜杠(',",\)
	 */
	public static String addSlashes(String text) {
		if (text == null || text.equals("")) {
			return "";
		}
		StringBuffer sb = new StringBuffer(text.length() * 2);
		StringCharacterIterator iterator = new StringCharacterIterator(text);
		char character = iterator.current();
		while (character != StringCharacterIterator.DONE) {
			switch (character) {
				case '\'':
				case '"':
				case '\\':
					sb.append("\\");
				default:
					sb.append(character);
					break;
			}
			character = iterator.next();
		}
		return sb.toString();
	}
	@SuppressWarnings("unchecked")
	public static String template(String pageName) {
		String tpl = null;
		if (pageName.startsWith("/")) {
			tpl = pageName;
		} else {
			tpl = "/" + pageName;
		}
		return tpl;
	}
	public static int rand(int max) {
		return rand(0, max);
	}
	public static int rand(int min, int max) {
		if (min < max) {
			return random.nextInt(max - min + 1) + min;
		} else {
			return min;
		}
	}
	/**
	 * 获取随机字符串
	 * @param length 字符串长度
	 * @param isOnlyNum 是否全数字
	 * @return
	 */
	public static String getRandStr(int length, boolean isOnlyNum) {
		int size = isOnlyNum ? 10 : 62;
		StringBuffer hash = new StringBuffer(length);
		for (int i = 0; i < length; i++) {
			hash.append(randChars.charAt(random.nextInt(size)));
		}
		return hash.toString();
	}
	/**
	 * 正则表达式匹配器
	 * @param content 内容
	 * @param reg 匹配规则
	 * @param type 匹配类型 1:精确匹配 2:起始匹配 3:部分匹配
	 * @return
	 */
	public static boolean matchMachine(String content, String reg, String type) {
		PatternCompiler compiler = new Perl5Compiler();
		PatternMatcher matcher = null;
		Pattern pattern = null;
		boolean flag = false;
		try{
			pattern = compiler.compile(reg);
			matcher = new Perl5Matcher();
			if("1".equals(type.trim())){
				flag = matcher.matches(content, pattern);
			}else if("2".equals(type.trim())){
				flag = matcher.matchesPrefix(content, pattern);
			}else if("3".equals(type.trim())){
				flag = matcher.contains(content, pattern);
			}
		}catch(MalformedPatternException e){
			e.printStackTrace();
		}
		return flag;
	}
	public static List<String> pregMatch(String content, String regex) {
		List<String> strList = new ArrayList<String>();
		try {
			Perl5Matcher patternMatcher = new Perl5Matcher();
			if (patternMatcher.contains(content, new Perl5Compiler().compile(regex))) {
				MatchResult result = patternMatcher.getMatch();
				for (int i = 0; i < result.groups(); i++) {
					strList.add(result.group(i));
				}
				result = null;
			}
		} catch (MalformedPatternException e) {
			e.printStackTrace();
		}
		return strList;
	}
	/**
	 * 日期转换为字符串
	 * @param date 日期
	 * @param format 格式 如：yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String dateToStr(Date date,String format){
		try{
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return sdf.format(date);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 字符串转换为日期
	 * @param sDate 日期
	 * @param format 格式 如：yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static Date strToDate(String sDate,String format){
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date dd = new Date();
		try {
			dd = sdf.parse(sDate);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return dd;
	}
	/**
	 * 日期的分钟计算
	 * @param datestr 日期
	 * @param i
	 * @return
	 */
	public static Date accountDate(String datestr,int i){
		Date date = strToDate(datestr,"yyyy-MM-dd HH:mm");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MINUTE, i);
		return calendar.getTime();
	}
	/**
	 * 获得当前日期字符串
	 * @param format 格式 如：yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String getCurrentDate(String format){
		try{
			SimpleDateFormat sf = new SimpleDateFormat(format);
			Date date = Calendar.getInstance().getTime();
			return sf.format(date);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 获取客户端IP
	 * @param request
	 * @return
	 */
	public static String getOnlineIP(HttpServletRequest request) {
		String onlineip = request.getHeader("x-forwarded-for");
		if (Common.empty(onlineip) || "unknown".equalsIgnoreCase(onlineip)) {
			onlineip = request.getHeader("X-Real-IP");
		}
		if (Common.empty(onlineip) || "unknown".equalsIgnoreCase(onlineip)) {
			onlineip = request.getRemoteAddr();
		}
		onlineip = onlineip != null && onlineip.matches("^[\\d\\.]{7,15}$") ? onlineip : "unknown";
		return onlineip;
	}
	/**
	 * 是否为数字
	 * @return
	 */
	public static boolean isNum(Object id){
		if(id==null || "".equals(id.toString().trim())) return false;
		try{
			Integer.parseInt(id.toString().trim());
		}catch(Exception e){
			return false;
		}
		return true;
	}
	/**
	 * 获得字符串长度
	 */
	public static int strlen(String text) {
		return strlen(text, JavaCenterHome.JCH_CHARSET);
	}
	/**
	 * 获得字符串长度
	 */
	public static int strlen(String text, String charsetName) {
		if (text == null || text.length() == 0) {
			return 0;
		}
		int length = 0;
		try {
			length = text.getBytes(charsetName).length;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return length;
	}
	/**
	 * URL加密
	 */
	public static String urlEncode(String s) {
		return urlEncode(s, JavaCenterHome.JCH_CHARSET);
	}
	/**
	 * URL加密
	 */
	public static String urlEncode(String s, String enc) {
		if (!empty(s)) {
			try {
				return URLEncoder.encode(s, enc);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return s;
	}
	/**
	 * URL解码
	 */
	public static String urlDecode(String s) {
		return urlDecode(s, JavaCenterHome.JCH_CHARSET);
	}
	/**
	 * URL解码
	 */
	public static String urlDecode(String s, String enc) {
		if (!empty(s)) {
			try {
				return URLDecoder.decode(s, enc);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return s;
	}
	/**
	 * 字符串转为10进制整数
	 */
	public static int intval(String s) {
		return intval(s, 10);
	}
	/**
	 * 字符串转为整数
	 * @param s 字符串
	 * @param radix 进制
	 */
	public static int intval(String s, int radix) {
		if (s == null || s.length() == 0) {
			return 0;
		}
		if (radix == 0) {
			radix = 10;
		} else if (radix < Character.MIN_RADIX) {
			return 0;
		} else if (radix > Character.MAX_RADIX) {
			return 0;
		}
		int result = 0;
		int i = 0, max = s.length();
		int limit;
		int multmin;
		int digit;
		boolean negative = false;
		if (s.charAt(0) == '-') {
			negative = true;
			limit = Integer.MIN_VALUE;
			i++;
		} else {
			limit = -Integer.MAX_VALUE;
		}
		if (i < max) {
			digit = Character.digit(s.charAt(i++), radix);
			if (digit < 0) {
				return 0;
			} else {
				result = -digit;
			}
		}
		multmin = limit / radix;
		while (i < max) {
			digit = Character.digit(s.charAt(i++), radix);
			if (digit < 0) {
				break;
			}
			if (result < multmin) {
				result = limit;
				break;
			}
			result *= radix;
			if (result < limit + digit) {
				result = limit;
				break;
			}
			result -= digit;
		}
		if (negative) {
			if (i > 1) {
				return result;
			} else {
				return 0;
			}
		} else {
			return -result;
		}
	}
	public static String authCode(String string, String operation, String key, int expiry) {
		long currentTime = System.currentTimeMillis();
		int time = (int)(currentTime/1000);
		try {
			int ckey_length = 4;
			key = MD5.getMD5((key == null ? JavaCenterHome.jchConfig.get("KEY") : key));
			String keya = MD5.getMD5(key.substring(0, 16));
			String keyb = MD5.getMD5(key.substring(16, 32));
			String keyc = ckey_length > 0 ? ("DECODE".equals(operation) ? string.substring(0, ckey_length)
					: MD5.getMD5(String.valueOf(currentTime)).substring(32 - ckey_length)) : "";
			String cryptkey = keya + MD5.getMD5(keya + keyc);
			int key_length = cryptkey.length();
			string = "DECODE".equals(operation) ? Base648.decode(string.substring(ckey_length),
					JavaCenterHome.JCH_CHARSET) : (expiry > 0 ? expiry + time : "0000000000")
					+ MD5.getMD5(string + keyb).substring(0, 16) + string;
			int string_length = string.length();
			StringBuffer result = new StringBuffer(string_length);
			int range = 128;
			int[] rndkey = new int[range];
			for (int i = 0; i < range; i++) {
				rndkey[i] = cryptkey.charAt(i % key_length);
			}
			int tmp;
			int[] box = new int[range];
			for (int i = 0; i < range; i++) {
				box[i] = i;
			}
			for (int i = 0, j = 0; i < range; i++) {
				j = (j + box[i] + rndkey[i]) % range;
				tmp = box[i];
				box[i] = box[j];
				box[j] = tmp;
			}
			for (int a = 0, i = 0, j = 0; i < string_length; i++) {
				a = (a + 1) % range;
				j = (j + box[a]) % range;
				tmp = box[a];
				box[a] = box[j];
				box[j] = tmp;
				result.append((char) ((int) string.charAt(i) ^ (box[(box[a] + box[j]) % range])));
			}
			if ("DECODE".equals(operation)) {
				int resulttime = Common.intval(result.substring(0, 10));
				if ((resulttime == 0 || resulttime - time > 0)
						&& result.substring(10, 26).equals(MD5.getMD5(result.substring(26) + keyb).substring(0, 16))) {
					return result.substring(26);
				} else {
					return "";
				}
			} else {
				return keyc + (Base648.encode(result.toString(), JavaCenterHome.JCH_CHARSET)).replaceAll("=", "");
			}
		} catch (Exception e) {
			return "";
		}
	}
	/**
	 * MYSQL提示信息
	 */
	public static void showMySQLMessage(HttpServletResponse response, String message, String sql, SQLException e) {
		String dbError = e.getMessage();
		int dbErrno = e.getErrorCode();
		try {
			PrintWriter out = response.getWriter();
			out.write("<div style=\"position:absolute;font-size:11px;font-family:verdana,arial;background:#BFBFBF;padding:0.5em;\">");
			out.write("<b>MySQL Error</b><br>");
			out.write("<b>Message</b>: <font color=\"red\">" + message + "</font><br>");
			if (sql != null) {out.write("<b>SQL</b>: " + sql + "<br>");}
			out.write("<b>Error</b>: <font color=\"red\">" + dbError + "<br></font>");
			out.write("<b>Errno.</b>: <font color=\"red\">" + dbErrno + "<br></font>");
			out.write("</div>");
			out.flush();
			out.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	/**
	 * 站点全路径
	 */
	public static String getSiteUrl(HttpServletRequest request) {
		int port = request.getServerPort();
		String url =  request.getScheme() + "://" + request.getServerName() + (port == 80 ? "" : ":" + port) + request.getContextPath() + "/";
		return url;
	}
	public static String getTimeOffset() {
		String timeoffset = "8";
		return timeoffset;
	}
	public static String gmdate(String format, int timestamp, String timeoffset) {
		return getSimpleDateFormat(format, timeoffset).format(timestamp * 1000l);
	}
	public static SimpleDateFormat getSimpleDateFormat(String format, String timeoffset) {
		SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.ENGLISH);
		sdf.setTimeZone(TimeZone.getTimeZone(timeZoneIDs.get(timeoffset)[0]));
		return sdf;
	}
	public static String getMessage(HttpServletRequest request, String key, Object... args) {
		if (key == null || key.length() == 0) {
			return key;
		}
		HttpSession session = request.getSession();
		if (mr == null) {
			mr = (MessageResources) session.getServletContext().getAttribute(Globals.MESSAGES_KEY);
		}
		Locale locale = (Locale) session.getAttribute(Globals.LOCALE_KEY);
		if (locale == null) {
			locale = request.getLocale();
		}
		String message = null;
		if (args == null || args.length == 0) {
			message = mr.getMessage(locale, key);
		} else {
			message = mr.getMessage(locale, key, args);
		}
		return message == null ? key : message;
	}
	public static String getData(String string) {
		// TODO Auto-generated method stub
		return null;
	}
}