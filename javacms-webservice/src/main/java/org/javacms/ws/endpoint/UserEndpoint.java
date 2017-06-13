package org.javacms.ws.endpoint;/*
package org.ita.ws.endpoint;

import org.ita.admin.services.UserServiceInterface;
import org.ita.entity.User;
import org.ita.jaxb.UserProfileCreateRequest;
import org.ita.jaxb.UserProfileCreateResponse;
import org.jdom2.Element;
import org.jdom2.Namespace;
import org.jdom2.filter.Filters;
import org.jdom2.xpath.XPathExpression;
import org.jdom2.xpath.XPathFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;

import java.util.List;

*/
/**
 * Created by David-CB.Lv on 2017/2/28.
 *//*

//@Endpoint
public class UserEndpoint {
    private static final String NAMESPACE_URI = "http://localhost:8080/ita/usermanagement/schemas";

    private XPathExpression<Element> usernameExpression;

    private XPathExpression<Element> nicknameExpression;

    private XPathExpression<Element> emailExpression;

    private XPathExpression<Element> cellphoneExpression;

    private XPathExpression<Element> creatTimeExpression;

    private XPathExpression<Element> updateTimeExpression;

    private XPathExpression<Element> deletedExpression;

    private XPathExpression<Element> lastLoginTimeExpression;

    private XPathExpression<Element> lastLoginIpExpression;

    private XPathExpression<Element> registerTimeExpression;

    private UserServiceInterface userServiceImpl;

    @Autowired
    public UserEndpoint(UserServiceInterface userServiceImpl) {
        this.userServiceImpl = userServiceImpl;

        Namespace namespace = Namespace.getNamespace("user", NAMESPACE_URI);
        XPathFactory xPathFactory = XPathFactory.instance();
        usernameExpression = xPathFactory.compile("//user:username", Filters.element(), null, namespace);
        nicknameExpression = xPathFactory.compile("//user:nickname", Filters.element(), null, namespace);
        emailExpression = xPathFactory.compile("//user:email", Filters.element(), null, namespace);
        cellphoneExpression = xPathFactory.compile("//user:cellphone", Filters.element(), null, namespace);
        creatTimeExpression = xPathFactory.compile("//user:createtime", Filters.element(), null, namespace);
        updateTimeExpression = xPathFactory.compile("//user:updatetime", Filters.element(), null, namespace);
        deletedExpression = xPathFactory.compile("//user:deleted", Filters.element(), null, namespace);
        lastLoginTimeExpression = xPathFactory.compile("//user:lastLoginTime", Filters.element(), null, namespace);
        lastLoginIpExpression = xPathFactory.compile("//user:lastLoginIp", Filters.element(), null, namespace);
        registerTimeExpression = xPathFactory.compile("//user:registerTime", Filters.element(), null, namespace);
    }

    @PayloadRoot(namespace = "http://localhost:8080/ita/usermanagement/schemas", localPart = "UserProfileCreateRequest")
    @ResponsePayload
    public UserProfileCreateResponse UserProfileCreateResponseCreate(@RequestPayload UserProfileCreateRequest request) {
        //String username = request.getAttribute("username").toString();
        //String message = "hello";
        UserProfileCreateResponse response = new UserProfileCreateResponse();
        response.setMessage(userServiceImpl.getUserByUsername("admin").toString());

        return response;

    }

    @PayloadRoot(namespace = "http://localhost:8080/ita/usermanagement/schemas", localPart = "GetUserList")
    @ResponsePayload
    public List<User> getUserList(@RequestPayload Element request) {
        //String message = "hello";
        //UserProfileCreateResponse response = new UserProfileCreateResponse();
        //response.setMessage(message);

        return userServiceImpl.getUserList();

    }
}
*/
