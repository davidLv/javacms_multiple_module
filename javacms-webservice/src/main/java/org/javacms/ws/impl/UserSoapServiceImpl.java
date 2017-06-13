package org.javacms.ws.impl;

import org.javacms.beans.User;
import org.javacms.service.UserService;
import org.javacms.ws.UserSoapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.jws.WebService;
import java.util.List;

/**
 * Created by David-CB.Lv on 2017/3/1.
 */
@WebService(endpointInterface = "org.javacms.ws.UserSoapService")
@Component
public class UserSoapServiceImpl implements UserSoapService {

    @Autowired
    private UserService userService;

    @Override
    public List<User> getAllUserList(String id) {
        return userService.getUserList();
    }
}
