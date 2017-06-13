package org.javacms.beans;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.javacms.utils.validator.group.Regist;
import org.javacms.utils.validator.group.UpdateProfile;
import org.javacms.utils.validator.group.ValidLogin;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5931455842143278729L;
	private Integer userId;
    @NotEmpty(message="{username.empty.illegal}", groups={ValidLogin.class, Regist.class})
    @Pattern(regexp = "^[a-zA-Z0-9]+$", message="{username.format.illegal}", groups={ValidLogin.class, Regist.class})
    @Size(min=5, max=20, message="{username.length.illegal}", groups={ValidLogin.class, Regist.class})
    private String username;
    
    @NotEmpty(message="{email.empty.illegal}", groups={Regist.class, UpdateProfile.class})
    @Email(message="{email.format.illegal}", groups={Regist.class, UpdateProfile.class})
    private String email;
    
    @NotEmpty(message="{password.empty.illegal}", groups={ValidLogin.class, Regist.class, UpdateProfile.class})
    @Pattern(regexp = "^[a-zA-Z0-9]+$", message="{password.format.illegal}", groups={ValidLogin.class, Regist.class, UpdateProfile.class})
    @Size(min=5, max=20, message="{password.length.illegal}", groups={ValidLogin.class, Regist.class, UpdateProfile.class})
    private String password;
    
    private Date registerTime;
    private String registerIp;
    private String lastLoginIp;
	private Date lastLoginTime;
    private Integer loginCount;
    private String resetKey;
    private String resetPwd;
    private Date errorTime;
    private Integer errorCount;
    private String errorIp;
    private byte activation;
    private String activationCode;
    
    private Role role;

	public User() {
    }
	
	public User(User user) {
	}

    public Integer getUserId() {
        return userId;
    }
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public Date getRegisterTime() {
        return registerTime;
    }
    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }
    public String getRegisterIp() {
        return registerIp;
    }
    public void setRegisterIp(String registerIp) {
        this.registerIp = registerIp;
    }
    public Date getLastLoginTime() {
        return lastLoginTime;
    }
    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }
    public Integer getLoginCount() {
        return loginCount;
    }
    public void setLoginCount(Integer loginCount) {
        this.loginCount = loginCount;
    }
    public String getResetKey() {
        return resetKey;
    }
    public void setResetKey(String resetKey) {
        this.resetKey = resetKey;
    }
    public String getResetPwd() {
        return resetPwd;
    }
    public void setResetPwd(String resetPwd) {
        this.resetPwd = resetPwd;
    }
    public Date getErrorTime() {
        return errorTime;
    }
    public void setErrorTime(Date errorTime) {
        this.errorTime = errorTime;
    }
    public Integer getErrorCount() {
        return errorCount;
    }
    public void setErrorCount(Integer errorCount) {
        this.errorCount = errorCount;
    }
    public String getErrorIp() {
        return errorIp;
    }
    public void setErrorIp(String errorIp) {
        this.errorIp = errorIp;
    }
    public byte getActivation() {
        return activation;
    }
    public void setActivation(byte activation) {
        this.activation = activation;
    }
    public String getActivationCode() {
        return activationCode;
    }
    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }
    
    public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
	
}
