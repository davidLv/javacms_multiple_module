package org.javacms.controller;

import org.javacms.utils.memory.MemoryStastic;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
//@RequestMapping("admin")
public class IndexController {
	//@RequestMapping(value = "/admin/tpl", method = RequestMethod.GET)
    @RequestMapping({"/admin", "/admin/login"})
    public String loginAction(Model model) {
        return "/admin/login";
    }
    
    @RequestMapping("/admin/index")
    public String indexAction(HttpSession session) {
        return "/admin/common/layout";
    }
    
    @RequestMapping("/admin/top")
    public String topAction(HttpSession session) {
        return "/admin/common/top";
    }
    
    @RequestMapping("/admin/frame")
    public String contentAction() {
        return "/admin/common/frame";
    }
    
    @RequestMapping("/admin/left")
    public String leftAction() {
        return "/admin/common/left";
    }
    
    @RequestMapping("/admin/content")
    public ModelAndView rightAction() {
    	ModelAndView model = new ModelAndView("/admin/index");
    	model.addObject("memoryMap", MemoryStastic.getMemoryStastic());
    	return model;
        //return "/admin/common/right";
    }
    
    @RequestMapping("/admin/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/";
    }
}
