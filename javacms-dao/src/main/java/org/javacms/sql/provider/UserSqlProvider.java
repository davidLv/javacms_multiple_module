package org.javacms.sql.provider;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.jdbc.SQL;
import org.javacms.beans.User;


public class UserSqlProvider {
	
	public String update(final User user) {
		return new SQL(){
			{
				UPDATE("jo_user");
				
				if (StringUtils.isNotBlank(user.getUsername())) {
					SET("username = #{username}");
				}
				
				if (StringUtils.isNotBlank(user.getEmail())) {
					SET("email = #{email}");
				}
				
				if (StringUtils.isNotBlank(user.getPassword())) {
					SET("password = #{password}");
				}
				
				if (user.getRegisterTime() != null) {
					SET("register_time = #{registerTime}");
				}
				
				if (StringUtils.isNotBlank(user.getRegisterIp())) {
					SET("register_ip = #{registerIp}");
				}
				
				if (user.getLastLoginTime() != null ) {
					SET("last_login_time = #{lastLoginTime}");
				}
				
				if (StringUtils.isNotBlank(user.getLastLoginIp())) {
					SET("last_login_ip = #{lastLoginIp}");
				}
				
				if (StringUtils.isNotBlank(user.getLoginCount().toString())) {
					SET("login_count = #{loginCount}");
				}
				
				if (StringUtils.isNotBlank(user.getResetKey())) {
					SET("reset_key = #{resetKey}");
				}
				
				if (StringUtils.isNotBlank(user.getResetPwd())) {
					SET("reset_pwd = #{resetPwd}");
				}
				
				if (user.getErrorTime() != null) {
					SET("error_time = #{errorTime}");
				}
				
				if (StringUtils.isNotBlank(user.getErrorCount().toString())) {
					SET("error_count = #{errorCount}");
				}
				
				if (StringUtils.isNotBlank(user.getErrorIp())) {
					SET("error_ip = #{errorIp}");
				}
				
				if (StringUtils.isNotBlank(user.getActivationCode())) {
					SET("activation_code = #{activationCode}");
				}
				
				WHERE("user_id = #{userId}");
			}
		}.toString();
	}

}
