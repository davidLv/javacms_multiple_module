package org.javacms.utils.validator;

import org.javacms.utils.validator.impl.CrossParameterPasswordValidatorImpl;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Constraint(validatedBy = CrossParameterPasswordValidatorImpl.class)
@Target(value = { ElementType.TYPE, ElementType.FIELD, ElementType.CONSTRUCTOR, ElementType.ANNOTATION_TYPE, ElementType.PARAMETER })
@Retention(value = RetentionPolicy.RUNTIME)
@Documented
public @interface CrossParameterPasswordValidator {
	String message() default "{password.compare.illegal}";
	Class<?>[] groups() default { };
	Class<? extends Payload>[] payload() default { };
	
	String password();
	
	String confirmPassword();
}
