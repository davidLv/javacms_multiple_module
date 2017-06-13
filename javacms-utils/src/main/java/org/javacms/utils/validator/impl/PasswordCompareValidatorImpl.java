package org.javacms.utils.validator.impl;

import org.javacms.utils.validator.PasswordCompareValidator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import javax.validation.constraintvalidation.SupportedValidationTarget;
import javax.validation.constraintvalidation.ValidationTarget;

@SupportedValidationTarget(value = { ValidationTarget.PARAMETERS })
public class PasswordCompareValidatorImpl implements ConstraintValidator<PasswordCompareValidator, Object[]> {
	private String errorMsg;
	public void initialize(PasswordCompareValidator pcv) {
		this.errorMsg = pcv.message();
	}

	public boolean isValid(Object[] value, ConstraintValidatorContext context) {
		if (value == null || value.length != 2) {
			throw new IllegalArgumentException("There are two args need to be provided for"+this.getClass());
		}
		
		if (value[0].equals(value[1])) {
			return true;
		}
		context.disableDefaultConstraintViolation();
		// when validation is failed, it will throw a ContraintViolationException and we could catch the error msg in GlobalExceptionHandler
		context.buildConstraintViolationWithTemplate(this.errorMsg).addConstraintViolation();
		return false;
	}

}
