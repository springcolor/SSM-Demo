package com.zsp.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zsp.crud.bean.Employee;
import com.zsp.crud.bean.Msg;
import com.zsp.crud.service.EmployeeService;


/**
 * 处理员工CRUD请求
 * @author Admin
 */

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmpById(@PathVariable("ids")String ids) {
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			employeeService.deleteBatch(del_ids);
		}else{
			Integer id = Integer.parseInt(ids);
			employeeService.deleteEmp(id);
		}
			return Msg.success();
	}
	
	/**
	 * 如果直接ajax=PUT形式的请求
	 * 封装的数据
	 * Employee
	 * Employee [empId=5, empName=null, gender=F, email=46b650@zsp.com, dId=7]
	 * 问题：请求体中有数据，但是Employee对象封装不上
	 * update tbl_emp where emp_id =  #{empId,jdbcType=INTEGER}
	 * Tomcat将请求体中的数据，封装成一个map，request.getParameter("empName")就会从这个map中取值。SpringMVC封装POJO对象的时候，会把POJO中每个属性的值，request.getParameter("email");
	 * ajax发送PUT请求，Tomcat不会封装为map，post请求才可以
	 * org.apache.catalina.connector.Request--parseParameters()(3111);
	 * 我们要能支持直接发送PUT之类的请求，还要封装请求体中的数据
	 * 配置上HttpPutFormContentFilter，将请求体中的数据解析包装成一个map
	 * request被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据。
	 * 
	 * 员工更新方法
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg saveEmp(Employee employee ,HttpServletRequest request) {
		System.out.println("请求体中的值"+request.getParameter("gender"));
		System.out.println("将要更新的员工数据："+employee);
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	
	/**
	 * 根据id查询员工
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id) {
		Employee employee = employeeService.getEmp(id);		
		return Msg.success().add("emp", employee);
	}
	
	/**
	 * 检查用户名是否可用
	 * @param empName
	 * @return
	 */
	
	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg checkuser(@RequestParam("empName")String empName){
		//先判断用户名是否是合法的表达式
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!empName.matches(regx)){
			return Msg.fail().add("validate_msg", "用户名可以是6-16位英文和数字的组合或者2-5位中文(后端校验)");
		}
		//数据库用户名重复校验
		boolean b = employeeService.checkuser(empName);
		if(b){
			return Msg.success();
		}else{
			return Msg.fail().add("validate_msg", "用户名不可用");
		}
	}
		
	/**
	 * 员工保存
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee,BindingResult result) {
		if(result.hasErrors()){
			//校验失败，返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名"+fieldError.getField());
				System.out.println("错误信息"+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else{
			employeeService.saveEmp(employee);
			return Msg.success();
		}
	}
		
	/**
	 * 导入jackson包
	 * @param pn
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn){
		//这不是一个分页查询
		//引入PageHelper分页插件
		//在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		PageHelper.orderBy("emp_id asc");
		//startPage后面紧跟的这个查询就是一个分页查询
		List<Employee> emps = employeeService.getAll();
		//使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
		//封装了详细的分页信息，包括有我们查询出来的数据，传入连续显示的页数
		PageInfo<Employee> page = new PageInfo<Employee>(emps,5);
		//PageInfo page = new PageInfo(emps,5);		
		return Msg.success().add("pageInfo",page);
	}
	
	/**
	 * 查询员工数据（分页查询）
	 * @return
	 */
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		//这不是一个分页查询
		//引入PageHelper分页插件
		//在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		PageHelper.orderBy("emp_id asc");
		//startPage后面紧跟的这个查询就是一个分页查询
		List<Employee> emps = employeeService.getAll();
		//使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
		//封装了详细的分页信息，包括有我们查询出来的数据，传入连续显示的页数
		PageInfo<Employee> page = new PageInfo<Employee>(emps,5);
		//PageInfo page = new PageInfo(emps,5);
		model.addAttribute("pageInfo",page);
		return "list";
	}
	
}
