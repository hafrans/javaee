<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	trimDirectiveWhitespaces="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/static/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".click").click(function() {
			$(".tip").fadeIn(200);
		});

		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

	});
	
	
	function addMember(form){
		if(form.roleId.value == "0"){
			alert("请选择一个角色！");
			return false;
		}
		
		if(form.name.value.length == "0"){
			alert("请输入名字");
			return false;
		}
		
		if(form.born.value.length == "0"){
			alert("请输入生日");
			return false;
		}
		
		$.ajax({
		url:form.action,
		type:"POST",
		dataType:"json",
		data:$(form).serialize(),
		success:function(data,text,xhr){
			console.log(xhr,text,data);
			alert(data.msg);
			if(data.status == 1){
				location.href = "${pageContext.request.contextPath}/Member/UserInfo/";	
			}else{
				
			}
		},
		error:function(xhr,text,err){
			alert("网络异常");
			//window.top.location.reload();
			console.log(xhr,text,err);
		}
		});
		
		
		return false;
	}
	
</script>

</head>


<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="${pageContext.request.contextPath}/Member/UserInfo">用户管理</a></li>
			<li><a href="#">添加</a></li>
		</ul>
	</div>

	<form action="${pageContext.request.contextPath}/Member/UserInfo/add"
		method="post" onsubmit="return addMember(this)">
		<div class="formbody">
			<div class="formtitle">
				<span>用户基本信息</span>
			</div>

			<ul class="forminfo">
				<li><label>姓名</label><input name="name" type="text"
					class="dfinput" value="" /></li>
				<li><label>性别</label><cite><input name="sex"
						type="radio" value="M" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;<input
						name="sex" type="radio" value="F" />女</cite></li>
				<li><label>出生日期</label><input name="born" type="date"
					class="dfinput" value="" /></li>
				<li><label>角色</label><cite><select name="roleId" class="dfselect"><option
								value="0">请选择</option>
							<option value="1">管理员</option>
							<option value="2">客户经理</option></select></cite></li>
				<li><label>&nbsp;</label>
				
				
				<input type="submit"
					class="btn" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;<input name=""
					type="reset" class="btn" value="重置" /></li>
			</ul>

		</div>
	</form>
</body>

</html>
