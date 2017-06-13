package org.javacms.core.security.handler;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by David-CB.Lv on 2017/3/2.
 */
@Component("customLoginFailHandler")
public class CustomLoginFailHandler extends SimpleUrlAuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String[] errorCode = exception.getMessage().split(":");
        response.sendRedirect(request.getContextPath() + "/admin?error=" + errorCode[0]);
        //super.onAuthenticationFailure(request, response, exception);
    }
}
