package com.test.pet.init;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import com.test.pet.config.PropertyLoader;


@WebListener
public class AppInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // 서버가 시작되면 환경변수 치환 작업 수행
        PropertyLoader.loadAndReplaceEnv("/config/jdbc.properties");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
