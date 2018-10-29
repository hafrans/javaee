<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

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


	function updateMember(form) {
		$.ajax({
			url : form.action,
			type : "POST",
			dataType : "json",
			data : $(form).serialize(),
			success : function(data, text, xhr) {
				console.log(xhr, text, data);
				alert(data.msg);
				if (data.status == 1) {
					location.href = "${pageContext.request.contextPath}/Member/UserInfo/";
				} else {

				}
			},
			error : function(xhr, text, err) {
				alert("网络异常");
				//window.top.location.reload();
				console.log(xhr, text, err);
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
			<li><a
				href="${pageContext.request.contextPath}/Member/UserInfo/">用户管理</a></li>
			<li><a href="#">修改</a></li>
		</ul>
	</div>

	<form
		action="${pageContext.request.contextPath}/Member/UserInfo/update"
		method="post" onsubmit="return updateMember(this)">
		<div class="formbody">
			<div class="formtitle">
				<span>用户基本信息</span>
			</div>

			<ul class="forminfo">
				<input type="hidden" name="id" value="${entity.id }" />
				<li><label>用户编号</label><input name="" type="text"
					class="dfinput" value="${entity.id }" readonly /><i>编号不允许修改</i></li>
				<li><label>姓名</label><input name="name" type="text"
					class="dfinput" value="${entity.name}" /></li>
				<li><label>性别</label><cite><input name="sex"
						type="radio" value="F" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;<input
						name="sex" type="radio" value="M" />女</cite></li>
				<li><label>出生日期</label><input name="born" type="date"
					class="dfinput"
					value="<fmt:formatDate pattern="yyyy-MM-dd" 
            value="${entity.born}" />" /></li>
				<li><label>角色</label><cite><select name="roleId"
						class="dfselect"><option value="0">请选择</option>
							<option value="1">管理员</option>
							<option value="2">客户经理</option></select></cite></li>
				<li><label>&nbsp;</label><input name="" type="submit"
					class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;<input name=""
					type="reset" class="btn" value="重置" /></li>
			</ul>

		</div>
	</form>
</body>

</html>
