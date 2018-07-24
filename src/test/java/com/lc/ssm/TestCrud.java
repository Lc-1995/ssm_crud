package com.lc.ssm;

import com.lc.ssm.mapper.DeptMapper;
import com.lc.ssm.mapper.EmployeeMapper;
import com.lc.ssm.pojo.Dept;
import com.lc.ssm.pojo.Employee;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.UUID;

/**
 * @Author: lichao
 * @Description: 测试CRUD
 * @Date: 2018/7/21 17:20
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestCrud {

    private final static Logger LOG = LogManager.getLogger(TestCrud.class);

    @Resource
    private SqlSession sqlSession;

    @Resource
    private DeptMapper deptMapper;

    @Resource
    private EmployeeMapper employeeMapper;

    @Test
    public void crud() {

        // 1.insert dept
        /*deptMapper.insertSelective(new Dept(null,"开发部"));
        deptMapper.insertSelective(new Dept(null,"测试部"));*/

        // 2.insert employee
        /*employeeMapper.insertSelective(new Employee(null,"语风","0","yufeng@dota.com",1));*/

        // 3.batch inserts employee
        /*EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 10; i++) {
            String uuid= UUID.randomUUID().toString().substring(0,5) + i;
            mapper.insertSelective(new Employee(null,uuid,"0",uuid + "@dota.com",1));
        }
        LOG.info("Success!");*/

        // 4.select employee
        /*Employee employee = employeeMapper.selectByPrimaryKey(1);
        LOG.info("data:" + employee);

        Employee employee1 = employeeMapper.selectByPrimaryKeyWithDept(2);
        LOG.info("data2:" + employee1);*/
    }
}
