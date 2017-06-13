package org.javacms.ws.impl;

import org.javacms.ws.HelloWorldService;
import org.springframework.stereotype.Component;

import javax.jws.WebService;

/**
 * Created by David-CB.Lv on 2017/3/1.
 */
@WebService(endpointInterface = "org.javacms.ws.HelloWorldService")
@Component("helloWorldServiceImpl")
public class HelloWorldServiceImpl implements HelloWorldService{

    @Override
    public void hello(String name) {
        System.out.println("Hello World");
    }
}
