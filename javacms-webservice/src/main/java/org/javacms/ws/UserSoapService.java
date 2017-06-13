package org.javacms.ws;

import org.javacms.beans.User;

import javax.jws.WebService;
import java.util.List;

/**
 * Created by David-CB.Lv on 2017/3/1.
 */
@WebService
public interface UserSoapService {
    List<User> getAllUserList(String id);
}
