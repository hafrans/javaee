<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	function confirmMsgDel() {
		if (confirm("删除用户信息,您确定要删除吗?"))
			sendForDelete(findAllSelected());

	}
	function userOpen() {
		if (confirm("您确定要启用该用户吗?"))
			sendForEnable(findAllSelected());
	}
	function userClose() {
		if (confirm("您确定要禁用该用户吗?"))
			sendForDisable(findAllSelected());
	}
	function resetPass() {
		if (confirm("重置密码,您确定要恢复初始密码吗?"))
			sendForResetPassword(findAllSelected());
	}
</script>
<script type="text/javascript">
	function workUpdate(arr) {
		if (arr.length != 1) {
			alert("请选择一个需要修改的项目！");
			return false;
		}
		location.href = "${pageContext.request.contextPath}/Member/UserInfo/update?id=" + arr[0];
		return true;
	}
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
</script>


</head>


<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">用户管理</a></li>
		</ul>
	</div>
	<!-- //TODO -->
	<form action="${pageContext.request.contextPath}/Member/UserInfo/index"
		method="post" id="userinfo">
		<div class="formbody">
			<ul class="seachform">
				<li><label>用户编号</label><input name="id" type="number"
					class="scinput" /></li>
				<li><label>姓名</label><input name="name" type="text"
					class="scinput" /></li>
				<li><label>&nbsp;</label><input name="" type="submit"
					class="scbtn" value="查询" /></li>
			</ul>
		</div>

		<div class="rightinfo">
			<div class="tools">
				<ul class="toolbar1">
					<li><a
						href="${pageContext.request.contextPath}/Member/UserInfo/add"><span><img
								src="${pageContext.request.contextPath}/static/images/t01.png" /></span>添加</a></li>
					<li><a onclick="workUpdate(findAllSelected())"><span><img
								src="${pageContext.request.contextPath}/static/images/t02.png" /></span>修改</a></li>
					<li><a href="javascript:confirmMsgDel()"><span><img
								src="${pageContext.request.contextPath}/static/images/t03.png" /></span>删除</a></li>
					<li><a href="javascript:userOpen()"><span><img
								src="${pageContext.request.contextPath}/static/images/t08.png"
								height="24" width="24" /></span>启用</a></li>
					<li><a href="javascript:userClose()"><span><img
								src="${pageContext.request.contextPath}/static/images/t09.png"
								height="24" width="24" /></span>禁用</a></li>
					<li><a href="javascript:resetPass()"><span><img
								src="${pageContext.request.contextPath}/static/images/t07.png"
								height="20" width="20" /></span>重置密码</a></li>
				</ul>
			</div>
			<table class="tablelist">
				<thead>
					<tr class="tablehead">
						<td colspan="11">客户信息列表</td>
					</tr>
				</thead>
				<thead>
					<tr>
						<th><input
							onchange="javascript:$('.userinfo input[type=checkbox]').attr('checked',this.checked)"
							name="" type="checkbox" value="" /></th>
						<th>用户编号</th>
						<th>姓名</th>
						<th>状态</th>
						<th>注册时间</th>
						<th>最后登录时间</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not(empty(userlist))}">
							<c:forEach items="${userlist}" var="item">
								<tr class="userinfo">
									<td><input name="id" type="checkbox" value="${item.id}" /></td>
									<td>${item.id }</td>
									<td>${item.name }</td>
									<td>${item.isEnable == "T" ? "是":"否" }</td>
									<td>${item.registerTime }</td>
									<td>${item.lastTime}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" style="text-align: center">没有用户</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="pagin">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="STYLE4"><div class="message">
								共<i class="blue">${total }</i>条记录，当前显示第&nbsp;<i class="blue">${current }&nbsp;</i>页,共<i
									class="blue">${max }</i>页
							</div></td>
						<td><table border="0" align="right" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="45"><img
										src="${pageContext.request.contextPath}/static/images/first.gif"
										width="33" height="20" style="cursor:hand"
										onclick="firstPage()" /></td>
									<td width="50"><img
										src="${pageContext.request.contextPath}/static/images/back.gif"
										width="43" height="20" style="cursor:hand"
										onclick="priviousPage()" /></td>
									<td width="50"><img
										src="${pageContext.request.contextPath}/static/images/next.gif"
										width="43" height="20" style="cursor:hand"
										onclick="nextPage()" /></td>
									<td width="40"><img
										src="${pageContext.request.contextPath}/static/images/last.gif"
										width="33" height="20" style="cursor:hand"
										onclick="lastPage()" /></td>
									<td width="100"><div align="center">
											<span class="STYLE1">转到第 <input name="textfield"
												type="text" size="4"
												style="height:16px; width:35px; border:1px solid #999999;" />
												页
											</span>
										</div></td>
									<td width="40"><img
										src="${pageContext.request.contextPath}/static/images/go.gif"
										width="33" height="17" style="cursor:hand" onclick="goPage()" /></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
		</div>
	</form>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		
		function findAllSelected(){
			let arr = [];
			let $arr = $("#userinfo input:checked");
			$arr.map(e => {
				arr.push($arr[e].value);
			});
			return arr;
		}
	
		
		function sendForDisable(arr){
			$.ajax({
				url:"${pageContext.request.contextPath}/Member/UserInfo/disable",
				type:"POST",
				data:{
					id:arr
				},
				dataType:"json",
				success:function(data,text,xhr){
					if(data.status == 1){//成功
						alert(data.msg);
						location.reload();
					}else{
						alert(data.msg);
					}
				},
				error:function(xhr,text,errThrown){
					alert("请求异常"+text);
				}
			});
		}
		
		function sendForEnable(arr){
			$.ajax({
				url:"${pageContext.request.contextPath}/Member/UserInfo/enable",
				type:"POST",
				data:{
					id:arr
				},
				dataType:"json",
				success:function(data,text,xhr){
					if(data.status == 1){//成功
						alert(data.msg);
						location.reload();
					}else{
						alert(data.msg);
					}
				},
				error:function(xhr,text,errThrown){
					alert("请求异常"+text);
				}
			});
		}
		
		function sendForResetPassword(arr){
			$.ajax({
				url:"${pageContext.request.contextPath}/Member/UserInfo/resetPassword",
				type:"POST",
				data:{
					id:arr
				},
				dataType:"json",
				success:function(data,text,xhr){
					if(data.status == 1){//成功
						alert(data.msg);
						location.reload();
					}else{
						alert(data.msg);
					}
				},
				error:function(xhr,text,errThrown){
					alert("请求异常"+text);
				}
			});
		}
		
		
		///page
		
		function deletePage(){
			//var search = location.search.slice(1).replace(/(.*)?((?<=&{1}|^)page=\d+&|&{1}page=\d+$)(.*)/,"$1$3");
			/**
			 Bug fix: javascript does not support this feature : ?<= except new Chrome 
			**/
			var search = location.search.slice(1).replace(/(.*)?(&{1}page=\d+$)(.*)/,"$1$3");
			return location.pathname+"?"+search;
		}
		
		function firstPage(){
			location.href = deletePage()+"&page=1";
		}
		
		function lastPage(){
			location.href = deletePage()+"&page=${max}";
		}
		function priviousPage(){//拼写错误补丁
			previousPage();
		}
		function previousPage(){
			var cur = ${current};
			var max = ${max};
			if(cur == 1){
				alert("这是第一页！");
				return false;
			}
			
			location.href = deletePage()+"&page="+(cur-1);
		}	
		
		function nextPage(){
			var cur = ${current};
			var max = ${max};
			if(cur == max){
				alert("这是最后一页！");
				return false;
			}
			location.href = deletePage()+"&page="+(cur+1);
		}	
		///
		
		function sendForDelete(arr) {
			if(arr.length == 0){
				alert("您没有选中任何一条");
				return false;
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/Member/UserInfo/delete",
				type : "POST",
				data : {
					id : arr
				},
				dataType : "json",
				success : function(data, text, xhr) {
					if (data.status == 1) { //成功
						alert(data.msg);
						location.reload();
					} else {
						alert(data.msg);
					}
				},
				error : function(xhr, text, errThrown) {
					alert("请求异常" + text);
				}
			});
		}
		
	</script>

</body>

</html>
