<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  pageContext.setAttribute("APP_PATH", request.getContextPath());%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<title>员工列表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- 以/开始的相对路径找资源，以服务器的路径为标准(http://localhost:3306),需要加上项目名 -->

		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script> -->

		<script type="text/javascript"  src="${APP_PATH}/static/js/jquery-3.0.0.min.js"></script>	
		<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
		<script type="text/javascript"  src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

 
	</head>
	<body>
	
	<!-- 员工修改的模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" >员工修改</h4>
	      </div>
	      <div class="modal-body">
			<form class="form-horizontal">
			  <div class="form-group">
			    <label for="empName_update_input" class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <p class="form-control-static"  id="empName_update_static"></p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="email_update_input" class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="gender_update_input" class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">
				  	<input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
				  </label>
				  <label class="radio-inline">
				    <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
				  </label>
			    </div>
			  </div>	
			  <div class="form-group">
			    <label for="gender_add_input" class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			      <!-- 部门提交部门id即可 -->
			      <select class="form-control" name="dId" id="dept_update_select"></select>
			    </div>
			  </div>				  
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 员工添加的模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
	      </div>
	      <div class="modal-body">
			<form class="form-horizontal">
			  <div class="form-group">
			    <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="email_add_input" class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="gender_add_input" class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">
				  	<input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
				  </label>
				  <label class="radio-inline">
				    <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
				  </label>
			    </div>
			  </div>	
			  <div class="form-group">
			    <label for="gender_add_input" class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			      <!-- 部门提交部门id即可 -->
			      <select class="form-control" name="dId" id="dept_add_select"></select>
			    </div>
			  </div>				  
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
		<!-- 搭建显示页面 -->
		<div class="container">
			<!-- 标题 -->
			<div class="row">
	  			<div class="col-md-12">
	  				<h1>SSM-CRUD</h1>
	  			</div>
	  		</div>
	  		<!-- 按钮 -->
	  		<div class="row">
	  			<div class="col-md-2">
	  				<button class="btn btn-info" id="emp_add_modal_btn">新增</button>
	  				<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
	  			</div>
	  		</div>	
	  		<!-- 数据 -->
	  		<div class="row">
	  			<div class="col-md-12" class="text-center">
	  				<table class="table table-hover" class="table table-bordered" id="emps_table">
	  					<thead>
		  					<tr class="info">
		  						<th>
		  							<input type="checkbox" id="check_all"/>
		  						</th>
		  						<th>#</th>
		  						<th>empName</th>
		  						<th>gender</th>
		  						<th>email</th>
		  						<th>deptName</th>
		  						<th >操作</th>
		  					</tr>
	  					</thead>
	  					<tbody>
	  					</tbody>	  				
	  				</table>
	  			</div>
	  		</div>
	  		<!-- 分页 -->
			<div class="row">
				<!-- 分页文字信息 -->
				<div class="col-md-6" id="page_info_area">

				</div>
			</div>
			<div class="row">
				<!-- 分页条信息 -->
				<div class="col-md-6" id="page_nav_area">
					
				</div>
			</div>

			<div class="row">
			  <form class="navbar-form navbar-left">
		        <div class="form-group" id="pageJump">
		          <span>跳转到</span>
		          <input type="text" class="form-control" placeholder="Search" id="jump_input">
		          <span>页</span>
		        </div>
		        <button type="button" class="btn btn-default" id="jump_btn">点击跳转</button>
		      </form>
		      </div>
			
		</div>
		<script type="text/javascript">
			
			var totalRecord , currentPage ,totalPage;
			
			//1、页面加载完成以后，直接去发送ajax请求，要到分页数据
			$(function(){
				//去首页
				to_page(1);
			});
			
			$("#jump_btn"). click(function(){
				$("#jump_input").empty();
				var jump_num = 0;				
				//alert($("#jump_input").val());
				jump_num = $("#jump_input").val();
				//alert(jump_num);
				var r=/^[0-9]*$/;
				if(r.test(jump_num)){				
					if(0<jump_num&&jump_num<=totalPage){
					//alert("TRUE");
						to_page(jump_num);
					}else{
						alert("请输入1到"+totalPage+"的页数");
					}
				}else{
					alert("请正确输入页数");				
				}
			});
			
			function to_page(pn){
				$.ajax({
					url:"${APP_PATH}/emps",data:"pn="+pn,type:"GET",success:function(result){
						//console.log(result);
						//1、解析并显示员工数据
						build_emps_table(result);
						//2、解析并显示分页信息
						build_page_info(result);
						//3、解析显示分页条数据
						build_page_nav(result);
					}
				});
			}
			
			function build_emps_table(result){
				//清空table表格信息
				$("#emps_table tbody").empty();
				var emps = result.extend.pageInfo.list;
				$.each(emps,function(index,item){
					/* alert(item.empName); */
					var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
					var empIdTd = $("<td></td>").append(item.empId);
					var empNameTd = $("<td></td>").append(item.empName);
					var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
					var emailTd = $("<td></td>").append(item.email);
					var deptNameTd = $("<td></td>").append(item.department.deptName);					
					var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
					//为编辑按钮添加一个自定义属性，来表示当前员工的id
					editBtn.attr("edit-id",item.empId);
					var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
					//为删除按钮添加一个自定义属性，来表示当前删除员工的id
					delBtn.attr("del-id",item.empId);
					var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
					$("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(genderTd).append(emailTd).append(deptNameTd).append(btnTd).appendTo("#emps_table tbody");
				});
			}
			//解析显示分页信息
			function build_page_info(result){
				$("#page_info_area").empty();
				$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总"+result.extend.pageInfo.pages+"页，总共"+result.extend.pageInfo.total+"条记录");
				totalRecord = result.extend.pageInfo.total;
				currentPage = result.extend.pageInfo.pageNum;
				totalPage = result.extend.pageInfo.pages;
			}
			//解析显示分页条，点击分页要能去下一页
			function build_page_nav(result){
				//page_nav_area
				$("#page_nav_area").empty();
				var ul = $("<ul></ul>").addClass("pagination");
				
				//构建元素
				var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
				var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
				if(result.extend.pageInfo.hasPreviousPage == false){
					firstPageLi.addClass("disabled");
					prePageLi.addClass("disabled");
				}else{
					//为元素添加点击跳转事件
					firstPageLi.click(function(){
						to_page(1);
					});
					prePageLi.click(function(){
						to_page(result.extend.pageInfo.pageNum-1);
					});
				}				
				
				var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
				var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
				if(result.extend.pageInfo.hasNextPage == false){
					nextPageLi.addClass("disabled");
					lastPageLi.addClass("disabled");
				}else{
					//为元素添加点击跳转事件
					nextPageLi.click(function(){
						to_page(result.extend.pageInfo.pageNum+1);
					});
					lastPageLi.click(function(){
						to_page(result.extend.pageInfo.pages);
					});
				}
								
				//添加首页和前一页的提示
				ul.append(firstPageLi).append(prePageLi);
				//显示相邻的页码号
				$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
					var numLi = $("<li></li>").append($("<a></a>").append(item));
					if(result.extend.pageInfo.pageNum == item){
						numLi.addClass("active");
					}
					numLi.click(function(){
						to_page(item);
					});
					ul.append(numLi);
				});
				//添加下一页和末页的提示
				ul.append(nextPageLi).append(lastPageLi);
				//把ul加入到nav
				var navEle = $("<nav></nav>").append(ul);
				navEle.appendTo("#page_nav_area");
			}
			
			function reset_form(ele){
				//清空表单数据
				$(ele)[0].reset();
				//清空表单样式
				$(ele).find("*").removeClass("has-success has-error glyphicon glyphicon-ok-sign glyphicon glyphicon-remove-sign");
				$(ele).find(".help-block").text("");
			}
			
			$("#emp_add_modal_btn").click(function(){
				//清除表单数据，即表单重置，包括表单的数据和样式
				reset_form("#empAddModal form");
				//$("#empAddModal form")[0].reset();
				//发送ajax请求，查出部门信息，显示在下拉列表中
				getDepts("#dept_add_select");
				//弹出模态框				
				$("#empAddModal").modal({
					backdrop:"static"
				});
			});
			
			//查出所有部门信息并显示在下拉列表中
			function getDepts(ele){
				$(ele).empty();
				$.ajax({
					url:"${APP_PATH}/depts",type:"GET",success:function(result){
						console.log(result);
						//显示部门信息在下拉列表中
						//$("#dept_add_select").append("")
						$.each(result.extend.depts,function(){
							var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
							optionEle.appendTo(ele);
						});
					}
				});
			}
			
			//校验用户名是否可用
			$("#empName_add_input").change(function(){
				//alert("123");
				//发送ajax请求校验用户名是否可用
				var empName = this.value;
				$.ajax({
					url:"${APP_PATH}/checkuser",data:"empName="+empName,type:"POST",success:function(result){
						if(result.code==100){
							show_validate_msg("#empName_add_input","success","");
							$("#emp_save_btn").attr("ajax-validate","success");
						}else{
							show_validate_msg("#empName_add_input","error",result.extend.validate_msg);
							$("#emp_save_btn").attr("ajax-validate","error");
						}
					}
				});
			});
						
			//保存员工方法
			$("#emp_save_btn").click(function(){
				//1、模态框中填写的表单数据提交给服务器进行保存，先对要提交给服务器的数据进行校验
				if(validate_add_form1()&validate_add_form2()){
				//2、判断之前的ajax用户名校验是否成功
				if($(this).attr("ajax-validate")=="error"){
					return false;
				}else{
				//3、发送ajax请求保存员工
				/* alert($("#empAddModal form").serialize()); */
				$.ajax({
					url:"${APP_PATH}/emp",type:"POST",data:$("#empAddModal form").serialize(),success:function(result){
						//alert(result.msg);
						if(result.code==100){
						//员工保存成功
						//1、关闭模态框
						$("#empAddModal").modal('hide');
						//2、来到最后一页，显示刚才保存的数据
						//发送ajax请求显示最后一页数据即可
						to_page(totalRecord);
						}else{
							//console.log(result);
							//哪个字段错误就显示哪个
							if(undefined !=result.extend.errorFields.email){
								show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
							}
							if(undefined !=result.extend.errorFields.empName){
								show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
							}
						}
					}
				});
				}
				}else{
					return false;
				}
			});
			
			//校验表单数据
			function validate_add_form1(){
				//1、拿到要校验的数据，所有正则表达式
				var empName = $("#empName_add_input").val();
				var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
				/* alert(regName.test(empName)); */
				if(!regName.test(empName)){
					//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
					//$("#empName_add_input").parent().addClass("has-error");
					//$("#empName_add_input").next("span").text("用户名可以是2-5位中文或者6-16位英文和数字的组合");
					show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或者6-16位英文和数字的组合");
					return false;					
				}else{
					//$("#empName_add_input").parent().addClass("has-success");
					//$("#empName_add_input").next("span").text("");
					show_validate_msg("#empName_add_input","success","");
					return true;
				}
				return false;
			}
			function validate_add_form2(){
				var email = $("#email_add_input").val();
				var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				if(!regEmail.test(email)){
					//alert("邮箱格式不正确");
					//$("#email_add_input").parent().addClass("has-error");
					//$("#email_add_input").next("span").text("邮箱格式不正确");
					show_validate_msg("#email_add_input","error","邮箱格式不正确");
					return false;
				}else{
					//$("#email_add_input").parent().addClass("has-success");
					//$("#email_add_input").next("span").text("");
					show_validate_msg("#email_add_input","success","");
					return true;
				}
				return false;							
			}
			
			//显示校验结果的提示信息
			function show_validate_msg(ele,status,msg){
				//清除当前元素的校验状态
				$(ele).parent().removeClass("has-success has-error");
				$(ele).next().removeClass("glyphicon glyphicon-ok-sign glyphicon glyphicon-remove-sign");
				$(ele).next("span").text("");
				if("success"==status){
					$(ele).parent().addClass("has-success");
					$(ele).next().addClass("glyphicon glyphicon-ok-sign");
					$(ele).next("span").text(msg);
				}else if("error"==status){
					$(ele).parent().addClass("has-error");
					$(ele).next().addClass("glyphicon glyphicon-remove-sign");
					$(ele).next("span").text(msg);
				}
			}
			
			$(document).on("click",".delete_btn",function(){
				//1、弹出是否删除对话框
				//alert($(this).parents("tr").find("td:eq(1)").text());
				var empName = $(this).parents("tr").find("td:eq(2)").text();
				var empId = $(this).attr("del-id");
				//alert(empId);
				if(confirm("确认删除【"+empName+"】吗？")){
					//2、确认，发送ajax请求删除即可
					$.ajax({
						url:"${APP_PATH}/emp/"+empId,type:"DELETE",success:function(result){
							alert(result.msg);
							to_page(currentPage);
						}
					});
				}
				
			});
			
			//按钮创建之前绑定不上click，jQuery新版本没有live，使用on代替
			/* $(".edit_btn").click(function(){
				alert("edit");
			}); */
			$(document).on("click",".edit_btn",function(){
				//alert("edit");
				//查出员工信息并显示，查出部门信息并显示
				getDepts("#dept_update_select");
				getEmp($(this).attr("edit-id"));
				//把员工的id传递给模态框的更新按钮
				$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
				$("#empUpdateModal").modal({
					backdrop:"static"
				});
				
			});
			
			function getEmp(id){
				$.ajax({
					url:"${APP_PATH}/emp/"+id,type:"GET",success:function(result){
						//console.log(result);
						var empData = result.extend.emp;
						$("#empName_update_static").text(empData.empName);
						$("#email_update_input").val(empData.email);
						$("#empUpdateModal input[name=gender]").val([empData.gender]);
						$("#empUpdateModal select").val([empData.dId]);
					}
				});
			}
			
			//点击更新，更新员工信息
			$("#emp_update_btn").click(function(){
				//验证邮箱是否格式正确
				var email = $("#email_update_input").val();
				var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				if(!regEmail.test(email)){
					//alert("邮箱格式不正确");
					//$("#email_update_input").parent().addClass("has-error");
					//$("#email_update_input").next("span").text("邮箱格式不正确");
					show_validate_msg("#email_update_input","error","邮箱格式不正确");
					return false;
				}else{
					//$("#email_update_input").parent().addClass("has-success");
					//$("#email_update_input").next("span").text("");
					show_validate_msg("#email_update_input","success","");		
				}
				//发送ajax请求保存更新的员工数据
				$.ajax({
					/* url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),type:"POST",data:$("#empUpdateModal form").serialize()+"&_method=PUT",success:function(result){ */
					url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),type:"PUT",data:$("#empUpdateModal form").serialize(),success:function(result){
						//alert(result.msg);
						//关闭对话框，回到本页面
						$("#empUpdateModal").modal("hide");
						to_page(currentPage);
					}	
				});
			});
			
			//check_all完成全选全不选功能
			$("#check_all").click(function(){
				//alert($(this).attr("checked"));
				//alert($(this).prop("checked"));				
				$(".check_item").prop("checked",$(this).prop("checked"));
			});
			
			//check_item完成选择不选择功能
			$(document).on("click",".check_item",function(){
				var flag = $(".check_item:checked").length==$(".check_item").length;
				$("#check_all").prop("checked",flag);
			});
			
			$("#emp_delete_all_btn").click(function(){
				var empNames = "";
				var del_idstr = "";
				$.each($(".check_item:checked"),function(){
					empNames +=$(this).parents("tr").find("td:eq(2)").text()+",";
					del_idstr +=$(this).parents("tr").find("td:eq(1)").text()+"-";
				});
				empNames = empNames.substring(0,empNames.length-1);
				del_idstr = del_idstr.substring(0,del_idstr.length-1);
				if(!empNames==""){
				if(confirm("确认删除【"+empNames+"】吗？")){
					$.ajax({
						url:"${APP_PATH}/emp/"+del_idstr,type:"DELETE",success:function(result){
							alert(result.msg);
							to_page(currentPage);
						}
					});	
				}
				}				
			});
			
		</script>				
	</body>
</html>