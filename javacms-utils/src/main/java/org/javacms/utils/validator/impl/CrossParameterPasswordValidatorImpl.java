package org.javacms.utils.validator.impl;

import org.apache.commons.beanutils.BeanUtils;
import org.javacms.utils.validator.CrossParameterPasswordValidator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.lang.reflect.InvocationTargetException;

public class CrossParameterPasswordValidatorImpl implements ConstraintValidator<CrossParameterPasswordValidator, Object> {
	private String password;
	
	private String confirmPassword;
	
	private String errorMsg;
	
	//private static Pattern pattern = Pattern.compile("^[a-zA-Z0-9]{5,20}");
	@Override
	public void initialize(CrossParameterPasswordValidator constraintAnnotation) {
		this.password = constraintAnnotation.password();
		this.confirmPassword = constraintAnnotation.confirmPassword();
		this.errorMsg = constraintAnnotation.message();
	}

	@Override
	public boolean isValid(Object bean, ConstraintValidatorContext context) {
		try {
			String passwordValue = BeanUtils.getProperty(bean, this.password);
			String confirmPasswordValue = BeanUtils.getProperty(bean, this.confirmPassword);
			
			if ((passwordValue == null) && (confirmPasswordValue == null)) {
				return false;
			} else if (!passwordValue.equals(confirmPasswordValue)) {
				return false;
			}
		} catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

}
