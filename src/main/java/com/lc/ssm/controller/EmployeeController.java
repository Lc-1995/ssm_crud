package com.lc.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lc.ssm.pojo.Employee;
import com.lc.ssm.service.EmployeeService;
import com.lc.ssm.woEntity.Msg;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: lichao
 * @Description:
 * @Date: 2018/7/24 23:48
 */
@Controller
@RequestMapping("/emp")
public class EmployeeController {

    @Resource
    private EmployeeService employeeService;

    @RequestMapping(value = "/{pn}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("pn") Integer pn) {
        // 传入页码, 每页显示条数
        PageHelper.startPage(pn, 5);
        List<Employee> employeeList = employeeService.findAll();
        // 使用PageInfo包装查询出的数据, 封装了分页的详细信息
        // navigatePages: 连续显示几页
        PageInfo pageInfo = new PageInfo(employeeList, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }
}
