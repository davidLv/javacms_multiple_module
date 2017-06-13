package org.javacms.utils.validator.impl;

import org.javacms.utils.validator.CrossParameterValidator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import javax.validation.constraintvalidation.SupportedValidationTarget;
import javax.validation.constraintvalidation.ValidationTarget;

@SupportedValidationTarget(value = { ValidationTarget.PARAMETERS })
public class CrossParameterValidatorImpl implements ConstraintValidator<CrossParameterValidator, Object[]> {
	//private String field;
	//private String verifyField;
	private String errorMessage;
	
	public void initialize(CrossParameterValidator constraintAnnotation) {
		this.errorMessage = constraintAnnotation.message();
		/*this.field = constraintAnnotation.field();
		this.verifyField = constraintAnnotation.verifyField();*/
	}

	public boolean isValid(Object[] value, ConstraintValidatorContext context) {
		/*try {
			Class valueClass = value.getClass();
			
			final Object firstField = BeanUtils.getProperty(value, this.field);
			final Object secondField = BeanUtils.getProperty(value, this.verifyField);
			
			return (firstField == null && secondField == null) || firstField.equals(secondField);
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		if (value == null || value.length != 2) {
			throw new IllegalArgumentException("There are two args need to be provided for"+this.getClass());
		}
		
		if (value[0].equals(value[1])) {
			return true;
		}
		
		context.disableDefaultConstraintViolation();
		context.buildConstraintViolationWithTemplate(this.errorMessage).addConstraintViolation();
		return false;
	}

}
