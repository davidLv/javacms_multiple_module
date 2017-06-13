package org.javacms.controller;

import org.apache.commons.codec.digest.DigestUtils;
import org.javacms.beans.UserProfile;
import org.javacms.utils.validator.group.UpdatePassword;
import org.javacms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolationException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@SuppressWarnings("UnusedDeclaration")
@Validated
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/admin/user/profile")
	public String editProfileFrameAction() {
		return "/admin/frame/user_profile_frame";
	}
	
	@RequestMapping("/admin/user/edit_profile")
	public String editProfileAction() {
		return "/admin/user/edit_profile";
	}
	
	@RequestMapping("/admin/user/left")
	public String editProfileLeftAction() {
		return "/admin/user/left";
	}
	
	@RequestMapping("/admin/user/edit_password")
	public String editPasswordAction() {
		return "/admin/user/edit_password";
	}
	
	@ResponseBody
	@RequestMapping("/admin/user/change_password")
	//@ResponseStatus(HttpStatus.OK)
	//@Validated
	//@CrossParameterValidator(message = "{password.compare.illegal}")
	public Map<String, Object> updatePassword(
			@Validated(value={UpdatePassword.class}) @ModelAttribute("userProfile") UserProfile userProfile,
			BindingResult br,
			HttpSession session
			) throws ConstraintViolationException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (br.hasErrors()) {
			List<FieldError> errorList = br.getFieldErrors();
			List<Map> errors = new ArrayList<Map>();
			for(FieldError error : errorList) {
				Map<String, String> errorMap = new HashMap<String, String>();
				errorMap.put("errorCode", error.getField());
				errorMap.put("errorMsg", error.getDefaultMessage());
				errors.add(errorMap);
			}
			map.put("code", "VF1001");
			map.put("errors", errors);
			return map;
		}
		
		if (!userService.checkUserWithIdAndPassword(session.getAttribute("userId").toString(), DigestUtils.md5Hex(userProfile.getPassword()))) {
			map.put("code", "Error101");
			map.put("errors", "密码不正确");
			return map;
		}
		
		if (!userService.changePassword(DigestUtils.md5Hex(userProfile.getNewPassword()), session.getAttribute("userId").toString(), DigestUtils.md5Hex(userProfile.getPassword()))) {
			map.put("code", "F1001");
			map.put("errors", "修改密码未成功！");
			return map;
		}
		map.put("code", 200);
		map.put("msg", "修改密码成功，请使用新密码登录");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/admin/user/check_password")
	public boolean checkPassword(HttpSession session, @RequestParam("password") String password) {
		return this.userService.checkUserWithIdAndPassword(session.getAttribute("userId").toString(), DigestUtils.md5Hex(password));
	}
}
