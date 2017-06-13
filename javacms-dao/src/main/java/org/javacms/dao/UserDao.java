package org.javacms.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.javacms.beans.Role;
import org.javacms.beans.User;
import org.javacms.sql.provider.UserSqlProvider;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public interface UserDao {
    /**
     * login method
     * @param username
     * @param password
     * @return
     */
	//@Select("select jo.* from jo_user jo left join jc_user_role jcr on jcr.user_id = jo.user_id where jo.username=#{username} and jo.password=#{password}")
    @Select("select * from jo_user where username=#{username} and password=#{password}")
    @Results({
        @Result(id=true, property="userId", column="user_id", javaType=Integer.class),
        @Result(property="username", column="username", javaType=String.class),
        @Result(property="password", column="password", javaType=String.class),
        @Result(property="email", column="email", javaType=String.class),
        @Result(property="registerTime", column="register_time", javaType=Timestamp.class),
        @Result(property="registerIp", column="register_ip", javaType=String.class),
        @Result(property="lastLoginTime", column="last_login_time", javaType=Timestamp.class),
        @Result(property="lastLoginIp", column="last_login_ip", javaType=String.class),
        @Result(property="loginCount", column="login_count", javaType=Integer.class),
        @Result(property="errorTime", column="error_time", javaType=Timestamp.class),
        @Result(property="errorCount", column="error_count", javaType=Integer.class),
        @Result(property="errorIp", column="error_ip", javaType=String.class)
    })
    User getUserByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
    
    @UpdateProvider(type = UserSqlProvider.class, method = "update")
    int updateLoginInfo(User user);
    
    @Select("SELECT count(user_id) FROM jo_user WHERE user_id=#{userId} AND password=#{password}")
    int getUserByUserIdAndPassword(@Param("userId") String userId, @Param("password") String password);
    
    @Update("UPDATE jo_user SET password=#{newPassword} WHERE user_id=#{userId} AND password=#{oldPassword}")
    int updatePassword(@Param("newPassword") String newPassword, @Param("userId") String userId, @Param("oldPassword") String oldPassword);
    
    //@Select("SELECT * FROM jo_user WHERE username=#{username} AND activation = 1")
     User getUserByUsername(@Param("username") String username);
    
    List<Role> getUserRole(@Param("id") int id);
    
    
    
    @Select("SELECT "
    		+ "user_id,"
    		+ "username,"
    		+ "email,"
    		+ "register_time,"
    		+ "register_ip,"
    		+ "last_login_time,"
    		+ "last_login_ip,"
    		+ "login_count,"
    		+ "error_time,"
    		+ "error_count,"
    		+ "error_ip,"
    		+ "activation,"
    		+ "activation_code "
    		+ "FROM "
    		+ "jo_user "
    		+ "WHERE "
    		+ "activation = 1")
    @ResultMap("UserResultMap")
    List<User> getUserList();
}
