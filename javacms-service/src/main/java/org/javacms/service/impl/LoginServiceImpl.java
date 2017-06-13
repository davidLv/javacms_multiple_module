package org.javacms.service.impl;

import org.javacms.beans.User;
import org.javacms.dao.UserDao;
import org.javacms.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
@Service("loginService")
public class LoginServiceImpl implements LoginService {
    @Autowired
    private UserDao userDao;
    
    @Autowired
    private HttpServletRequest request;
    
    @Autowired
    private HttpSession session;
    
    public Boolean login(String username, String password) {
    	User user = userDao.getUserByUsernameAndPassword(username, password);
    	
    	if (user != null) {
    		//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		session.setAttribute("lastLoginTime", user.getLastLoginTime());
    		String ip = null;
    		String remoteAddr = request.getRemoteAddr();
    		String forwardIp = request.getHeader("X-Forwarded-For");
    		String realIp = request.getHeader("X-Real-IP");
    		
    		if (realIp == null) {
    			if (forwardIp == null) {
    				ip = remoteAddr;
    			} else {
    				ip = forwardIp.split(",")[0];
    			}
    		} else {
    			if (realIp.equals(forwardIp)) {
    				ip = realIp;
    			} else {
    				if (forwardIp != null) {
    					ip = realIp + "/" + forwardIp.split(",")[0];
    				}
    			}
    		}
    		
    		user.setLastLoginIp(ip);
    		user.setLoginCount(user.getLoginCount()+1);
    		user.setLastLoginTime(new Date());
    		
    		int res = this.userDao.updateLoginInfo(user);
    		
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getUsername());
            return true;
        }
    	return false;
    }

}
