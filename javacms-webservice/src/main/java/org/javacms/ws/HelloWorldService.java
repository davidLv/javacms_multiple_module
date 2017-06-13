package org.javacms.ws;

import javax.jws.WebService;

/**
 * Created by David-CB.Lv on 2017/3/1.
 */
@WebService
public interface HelloWorldService {
    void hello(String name);
}
