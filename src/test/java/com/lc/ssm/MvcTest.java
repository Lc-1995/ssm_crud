package com.lc.ssm;

import com.github.pagehelper.PageInfo;
import com.lc.ssm.pojo.Employee;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: lichao
 * @Description: 使用Spring测试模块的测试请求的功能, 测试CRUD的请求的正确性
 * @Date: 2018/7/25 0:37
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml",
        "classpath:springMVC.xml"})
public class MvcTest {

    private final static Logger LOG = LogManager.getLogger(MvcTest.class);

    // 注入SpringMVC的IOC,传入容器需要使用@WebAppConfiguration
    @Resource
    WebApplicationContext context;

    // 虚拟一个mvc请求
    MockMvc mockMvc;

    // 每次调用都初始化mockMvc对象
    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        // 模拟请求,设置参数,获取返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emp/getEmps").param("pn", "1")).andReturn();

        // 请求成功,拿到PageInfo,验证数据
        ModelAndView mav = result.getModelAndView();
        PageInfo pageInfo = (PageInfo) mav.getModel().get("pageInfo");
        LOG.info("当前页码:" + pageInfo.getPageNum());
        LOG.info("总页数:" + pageInfo.getPages());
        LOG.info("总记录数:" + pageInfo.getTotal());
        LOG.info("当前页需要显示的连续页码:");
        int[] nums = pageInfo.getNavigatepageNums();
        for (int num : nums) {
            LOG.info(" " + num);
        }

        // 获取员工信息
        List<Employee> employeeList = pageInfo.getList();
        for (Employee employee : employeeList) {
            LOG.info("员工Id:" + employee.getEmpId());
            LOG.info("员工姓名:" + employee.getEmpName());
        }
    }
}
