package com.lc.ssm.service;

import com.lc.ssm.pojo.Employee;

import java.util.List;

/**
 * @Author: lichao
 * @Description:
 * @Date: 2018/7/24 23:55
 */
public interface EmployeeService {

    List<Employee> findAll();
}
