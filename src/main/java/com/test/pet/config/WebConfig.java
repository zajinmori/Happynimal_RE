package com.test.pet.config;

import com.test.pet.interceptors.SessionInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Bean
    public SessionInterceptor sessionInterceptor() {
        return new SessionInterceptor(); // 생성자에서 주입하지 않고 바로 빈 생성
    }

  /*  @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/upload/**")
                .addResourceLocations("file:///C:/Users/LG/Desktop/zajinmori/project/SpringProject/SpringProject/pet/target/pet-1.0.0-BUILD-SNAPSHOT/upload/");
    }
*/

    @Override
    public void addInterceptors(InterceptorRegistry registry){

        registry.addInterceptor(sessionInterceptor())
                .excludePathPatterns("applicationadoption.do", "adoptioninfo.do", "petdetail.do") // 인터셉터 감시를 제외할 경로
                .addPathPatterns("/**"); // 적용할 경로
    }



    // @Value 사용 가능하게 하는 설정
    @Bean
    public static PropertySourcesPlaceholderConfigurer propertyPlaceholderConfigurer() {
        return new PropertySourcesPlaceholderConfigurer();
    }
}




