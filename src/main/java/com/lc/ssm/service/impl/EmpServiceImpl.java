package com.lc.ssm.service.impl;

import com.lc.ssm.mapper.EmployeeMapper;
import com.lc.ssm.pojo.Employee;
import com.lc.ssm.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: lichao
 * @Description:
 * @Date: 2018/7/24 23:58
 */
@Service
public class EmpServiceImpl implements EmployeeService {

    @Resource
    private EmployeeMapper employeeMapper;


    @Override
    public List<Employee> findAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }
}
