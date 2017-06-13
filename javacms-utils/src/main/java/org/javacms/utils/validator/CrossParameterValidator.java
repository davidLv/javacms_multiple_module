package org.javacms.utils.validator;

import org.javacms.utils.validator.impl.CrossParameterValidatorImpl;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Constraint(validatedBy = CrossParameterValidatorImpl.class)
@Target(value = { ElementType.METHOD, ElementType.FIELD, ElementType.CONSTRUCTOR, ElementType.ANNOTATION_TYPE, ElementType.PARAMETER })
@Retention(value = RetentionPolicy.RUNTIME)
@Documented
public @interface CrossParameterValidator {
	String message() default "{password.confirm_password.checking.error}";
	Class<?>[] groups() default { };
	Class<? extends Payload>[] payload() default { };
	
	/*String field();
	
	String verifyField();*/
}
