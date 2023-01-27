package paw.togaether.member.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import paw.togaether.common.domain.CommandMap;
import paw.togaether.member.service.LoginService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    Logger log = Logger.getLogger(this.getClass());

    @Resource(name="loginService")
    private LoginService loginService;

    @GetMapping(value="/member/login")
    public ModelAndView getLogin(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("/member/Login");

        return mv;
    }

    @PostMapping(value="/member/login")
    public ModelAndView postLogin(CommandMap commandMap, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();

        Boolean isLoginSuccess = loginService.Login(commandMap.getMap());

        if (isLoginSuccess) {
            HttpSession session = request.getSession();
            String mem_id = commandMap.get("MEM_ID").toString();
            session.setAttribute("mem_id", mem_id);
            mv.setViewName("redirect:/sample.paw");
        } else {
            mv.setViewName("redirect:/member/loginError.paw");
        }

        return mv;

    }

    @GetMapping(value="/member/loginError")
    public ModelAndView loginError() throws Exception{
        ModelAndView mv = new ModelAndView("/member/loginError");

        return mv;
    }

}
