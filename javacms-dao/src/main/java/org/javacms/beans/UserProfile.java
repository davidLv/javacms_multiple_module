package org.javacms.beans;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.javacms.utils.validator.CrossParameterPasswordValidator;
import org.javacms.utils.validator.group.UpdatePassword;
import org.javacms.utils.validator.group.UpdateProfile;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
@Validated
@CrossParameterPasswordValidator(confirmPassword = "confirmPassword", password = "newPassword", message="{password.compare.illegal}", groups={UpdatePassword.class})
public class UserProfile {
	@NotEmpty(message="{1000:password.empty.illegal}", groups={UpdatePassword.class})
	@Pattern(regexp = "^[a-zA-Z0-9]{5,20}", message="{password.format.illegal}", groups={UpdatePassword.class})
	@Length(min=5, max=20, message="{password.length.illegal}", groups={UpdatePassword.class})
	private String password;
	
	@NotEmpty(message="{password.empty.illegal}", groups={UpdatePassword.class})
    @Pattern(regexp = "^[a-zA-Z0-9]{5,20}", message="{password.format.illegal}", groups={UpdatePassword.class})
    @Length(min=5, max=20, message="{password.length.illegal}", groups={UpdatePassword.class})
	private String newPassword;
	
	@NotEmpty(message="{password.empty.illegal}", groups={UpdatePassword.class})
    @Pattern(regexp = "^[a-zA-Z0-9]{5,20}", message="{password.format.illegal}", groups={UpdatePassword.class})
    @Length(min=5, max=20, message="{password.length.illegal}", groups={UpdatePassword.class})
	private String confirmPassword;
	
	@NotEmpty(message="{realname.empty.illegal}", groups={UpdateProfile.class})
	@Length(min=6, max=24, message="{realname.length.illegal}", groups={UpdateProfile.class})
	private String realName;
	
	@NotEmpty(message="{email.empty.illegal}", groups={UpdateProfile.class})
	@Email(message="{email.format.illegal}", groups={UpdateProfile.class})
	private String email;
	
	
	public String getNewPassword() {
		return newPassword;
	}

	
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	@NotNull
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	
}
