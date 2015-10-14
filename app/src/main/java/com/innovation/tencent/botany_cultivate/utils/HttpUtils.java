package com.innovation.tencent.botany_cultivate.utils;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by Mr.Jadyn on 15/8/27.
 */
public class HttpUtils {
    /**
     * 下载
     * @param key 地址
     * @return
     * @throws IOException
     */
    public static InputStream downLoad(String key) throws IOException {
        HttpURLConnection conn= (HttpURLConnection) new URL(key).openConnection();
        return conn.getInputStream();
    }
}
