package org.javacms.utils.validator.exception;

import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.validation.beanvalidation.MethodValidationPostProcessor;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
@Component
public class GlobalExceptionHandler {
	@Bean
	public MethodValidationPostProcessor methodValidationPostProcessor() {
		return new MethodValidationPostProcessor();
	}
	
	@ExceptionHandler
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	//public String handler(ValidationException exception) {
	public Map<String, Object> handler(ConstraintViolationException e) {
		@SuppressWarnings("rawtypes")
		ArrayList<Map> errorList = new ArrayList<Map>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(ConstraintViolation<?> violation : e.getConstraintViolations()) {
			System.out.println(violation.getMessage());
			String[] error = violation.getMessage().split(":");
			Map<String, String> errorMap = new HashMap<String, String>();
			errorMap.put("errorCode", error[0]);
			errorMap.put("errorMsg", error[1]);
			errorList.add(errorMap);
		}
		map.put("code", "VF1001");
		map.put("errors", errorList);
		return map;
	}
}
