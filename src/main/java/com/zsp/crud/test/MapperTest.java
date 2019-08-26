package com.zsp.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zsp.crud.bean.Department;
import com.zsp.crud.bean.Employee;
import com.zsp.crud.bean.User;
import com.zsp.crud.dao.DepartmentMapper;
import com.zsp.crud.dao.EmployeeMapper;
import com.zsp.crud.dao.UserMapper;

/**
 * 测试dao层的工作
 * @author Admin
 * 推荐Spring的项目使用Spring的单元测试，可以自动注入我们需要的组件
 * 1、导入SpringTest模块spring-test-x.x.x.RELEASE.jar
 * 2、@ContextConfiguration指定Spring配置文件的位置
 * 3、直接autowired要使用的组件即可
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	SqlSession sqlSession;
	
	/*
	//1、创建SpringIOC容器
	ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
	//2、从容器中获取mapper
	ioc.getBean(DepartmentMapper.class);
	*/
	
	//System.out.println(departmentMapper);
	
	//1、插入几个部门		
	//departmentMapper.insertSelective(new Department(null,"开发部"));
	//departmentMapper.insertSelective(new Department(null,"测试部"));
	
	//2、生成员工数据，测试员工插入
	//employeeMapper.insertSelective(new Employee(null, "Jerry", "M", "Jerry@zsp.com", 1));
	//employeeMapper.insertSelective(new Employee(null, "Lucy", "M", "Lucy@zsp.com", 5));
	
	//3、批量插入多个员工，批量，使用可以执行操作的sqlSession
	
	@Test
	public void testCRUD1() {	
		DepartmentMapper departmentMapper = sqlSession.getMapper(DepartmentMapper.class);
		//部门批量插入
		departmentMapper.insertSelective(new Department(null,"开发部"));
		departmentMapper.insertSelective(new Department(null,"设计部"));
		departmentMapper.insertSelective(new Department(null,"运维部"));
		departmentMapper.insertSelective(new Department(null,"工程部"));
		departmentMapper.insertSelective(new Department(null,"测试部"));
		departmentMapper.insertSelective(new Department(null,"后勤部"));
		departmentMapper.insertSelective(new Department(null,"决策部"));
		System.out.println("部门批量插入完成");
	}

	@Test
	public void testCRUD2() {
		//部门批量删除
		DepartmentMapper departmentMapper = sqlSession.getMapper(DepartmentMapper.class);
		departmentMapper.deleteByPrimaryKey(8);
		System.out.println("部门批量删除完成");
	}

	@Test
	public void testCRUD3() {	
	
		EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);		
		//员工批量插入		
		for (int i = 0; i < 100; i++) {
			String uid = UUID.randomUUID().toString().substring(0,5)+i;
			int u = ((int)(Math.random()*7))+1;
			String t = ((((int)(Math.random()*2))+1)==1)?(t="M"):(t="F");
			employeeMapper.insertSelective(new Employee(null, uid, t, uid+"@zsp.com", u));
		}
		System.out.println("员工批量插入完成");	
	}

	@Test
	public void testCRUD4() {
		EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
		//员工批量删除
		for (int i = 61; i < 81; i++) {			
			employeeMapper.deleteByPrimaryKey(i);
			//System.out.println(u);
		}
		System.out.println("员工批量删除完成");				
	}
	
	@Test
	public void testCRUD5() {		
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		//用户批量添加
		for(int i = 1;i <= 10;i++){
            String uid = UUID.randomUUID().toString().substring(0, 5);
            int f = (int) (Math.random()*20+20);
            String h =""+i;
            //userMapper.insertSelective(new User(null, h, h, f));
            userMapper.insertSelective(new User(null, uid, h, f));           
        }
		System.out.println("用户批量插入成功！");
	}
	
	@Test
	public void testCRUD6() {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		//用户批量删除
		/*for (int i = 1; i < 6; i++) {			
			userMapper.deleteByPrimaryKey(i);
		}*/
		userMapper.deleteByPrimaryKey(1);
		System.out.println("用户批量删除完成");		
	}
	
	@Test
	public void testCRUD7() {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		User user = new User(null,"5","5",null);
		User user2 =userMapper.logincheck(user);
		if(user2!=null){
		System.out.println(user2.toString());
		}else{
			System.out.println("没有合适的");
		}
	}
	
	@Test
	public void testCRUD8() {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		String username = "8";
		User user =userMapper.selectByUserName(username);
		if(user!=null){
		System.out.println(user.toString());
		}else{
			System.out.println("没有合适的");
		}
	}
	
	@Test
	public void testCRUD9() {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		User user = new User(null,"5","5",null);
		userMapper.register(user);
		System.out.println("注册成功");
	}
	
}
