package org.javacms.core.security.handler;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by David-CB.Lv on 2017/3/3.
 */
@Component("accessDenyHandler")
public class CustomAccessDenyHandler extends AccessDeniedHandlerImpl {

    private static final String ACCESS_DENIED_URL = "/admin";

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        request.getSession().invalidate();

        response.sendRedirect(request.getContextPath() + ACCESS_DENIED_URL + "?error=ACCESS_DENIED");
        super.handle(request, response, accessDeniedException);
        //request.getSession().setAttribute("ACCESS_DENIED_MSG", accessDeniedException.getMessage());
        //super.handle(request, response, accessDeniedException);
    }
}
