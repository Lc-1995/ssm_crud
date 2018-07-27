package com.lc.ssm.service;

import com.lc.ssm.pojo.Employee;

import java.util.List;

/**
 * @Author: lichao
 * @Description:
 * @Date: 2018/7/24 23:55
 */
public interface EmployeeService {

    /**
     *
     * @Description: findAll
     * @auther: lichao
     * @date: 2018/7/27 18:03
     * @param: []
     * @return: java.util.List<com.lc.ssm.pojo.Employee>
     */
    List<Employee> findAll();


    /**
     *
     * @Description: findByNameAndPassword
     * @auther: lichao
     * @date: 2018/7/27 18:04
     * @param: [username, password]
     * @return: com.lc.ssm.pojo.Employee
     */
    Employee findByNameAndPassword(String username);
}
