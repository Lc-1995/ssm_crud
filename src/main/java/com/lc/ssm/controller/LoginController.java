package com.lc.ssm.controller;

import com.lc.ssm.pojo.Employee;
import com.lc.ssm.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Author: lichao
 * @Description:
 * @Date: 2018/7/27 17:24
 */
@Controller
@SessionAttributes("employee")
public class LoginController {

    @Resource
    private EmployeeService employeeService;

    @RequestMapping("/")
    public String toMain(Map<String, Object> map) {
        if (map.get("employee") == null) {
            return "redirect:/login";
        }
        return "employee/employeeInfo";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String toLogin() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("username") String username) {
        ModelAndView mav = new ModelAndView();
        Employee employee = employeeService.findByNameAndPassword(username);
        if (null != employee) {
            mav.addObject("employee", employee);
            mav.setViewName("redirect:/");
            return mav;
        }
        mav.setViewName("redirect:/login");
        return mav;
    }
}
