package com.test.pet.config;

import java.io.InputStream;
import java.util.Properties;

public class PropertyLoader {

    public static void loadAndReplaceEnv(String path) {
        try (InputStream input = PropertyLoader.class.getResourceAsStream(path)) {
            Properties props = new Properties();
            props.load(input);

            for (String key : props.stringPropertyNames()) {
                String value = props.getProperty(key);
                if (value != null && value.contains("${")) {
                    String envKey = value.replace("${", "").replace("}", "");
                    String envValue = System.getenv(envKey);
                    if (envValue != null) {
                        System.setProperty(key, envValue); // Spring이 ${key}로 인식함
                    } else {
                        throw new RuntimeException("환경변수 " + envKey + "가 정의되지 않았습니다.");
                    }
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("프로퍼티 로딩 실패: " + path, e);
        }
    }
}
