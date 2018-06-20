package com.sign.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class PropertyReadUtil {
	public String timeProperty(String url) throws UnsupportedEncodingException {
		Properties pro = new Properties();
		try {
			InputStream in = PropertyReadUtil.class.getResourceAsStream(url);
			pro.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
		String startTime = pro.getProperty("begin");
		startTime = new String(startTime.getBytes("ISO-8859-1"), "UTF-8");
		return startTime;
	}
}
