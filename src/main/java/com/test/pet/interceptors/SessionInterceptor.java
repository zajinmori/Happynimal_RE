package com.test.pet.interceptors;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class SessionInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(false); // false = 없으면 null 반환

        if (session != null) {
            Object flag = session.getAttribute("adoptSessionActive");

            if (flag == null) {
                // adoptSessionActive 플래그가 없으면 세션 전체 무효화
                session.invalidate();
                System.out.println("세션 무효화: adoptSessionActive 없음");
            }
        }

        return true; //세션을 계속 가지고 있기
    }
}
