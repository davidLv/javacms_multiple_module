package org.javacms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.webflow.engine.model.Model;

@Controller
@SessionAttributes({"userId", "userName"})
public class BaseController {
    private Model model;
    public BaseController() {
    }
}
