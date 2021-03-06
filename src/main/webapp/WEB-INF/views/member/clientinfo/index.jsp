<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		if (confirm("删除客户信息,您确定要删除吗?"))
			sendForDelete(findAllSelected());

	}
</script>
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
	
	
	function workUpdate(arr) {
		if (arr.length != 1) {
			alert("请选择一个需要修改的项目！");
			return false;
		}
		location.href = "${pageContext.request.contextPath}/Member/ClientInfo/update?id=" + arr[0];
		return true;
	}
</script>


</head>


<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">客户信息管理</a></li>
		</ul>
	</div>
	<form action="${pageContext.request.contextPath}/Member/ClientInfo/" method="get">
		<div class="formbody">
			<ul class="seachform">
				<li><label>客户经理编号</label><input name="cmshowno" type="text"
					class="scinput" /></li>
				<li><label>客户姓名</label><input name="cname" type="text"
					class="scinput" /></li>
				<li><label>客户身份证号</label><input name="cssn" type="text"
					class="scinput" /></li>
				<li><label>&nbsp;</label><input name="" type="submit"
					class="scbtn" value="查询" /></li>
			</ul>
		</div>

		<div class="rightinfo">
			<div class="tools">
				<ul class="toolbar1">
					<li><a href="${pageContext.request.contextPath}/Member/ClientInfo/add"><span><img
								src="${pageContext.request.contextPath}/static/images/t01.png" /></span>添加</a></li>
					<li><a href="javascript:workUpdate(findAllSelected())"><span><img
								src="${pageContext.request.contextPath}/static/images/t02.png" /></span>修改</a></li>
					<li><a href="javascript:confirmMsgDel()"><span><img
								src="${pageContext.request.contextPath}/static/images/t03.png" /></span>删除</a></li>
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
						<th><input name="" type="checkbox" value="" onchange="javascript:$('.userinfo input[type=checkbox]').attr('checked',this.checked)" /></th>
						<th>姓名</th>
						<th>身份证号</th>
						<th>联系方式</th>
						<th>年收入（万元）</th>
						<th>资产（万元）</th>
						<th>负债（万元）</th>
						<th>客户单位</th>
						<th>家庭住址</th>
						<th>业务关联</th>
						<th>客户经理</th>
					</tr>
				</thead>
				<tbody>

					<c:choose>
						<c:when test="${not(empty(list)) }">
							<c:forEach items="${list }" var="item">
								<tr class="userinfo">
									<td><input name="id" type="checkbox" value="${item.key }" />
									</th>
									<td>${item.name }</td>
									<td>${item.ssn }</td>
									<td>${item.tel }</td>
									<td>${item.salary }</td>
									<td>${item.balance }</td>
									<td>${item.debt }</td>
									<td>${item.unit }</td>
									<td>${item.add }</td>
									<td>${item.business }</td>
									<td>
										<c:choose>
											<c:when test="${item.cm == null}">
												客户经理不存在
											</c:when>
											<c:otherwise>
												${item.cm.showNo }
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="userinfo">
								<td colspan="11" style="text-align:center;color:gray">-- 客户信息为空！ --</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
				<div class="pagin">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class="STYLE4"><div class="message">
									共<i class="blue">${total }</i>条记录，当前显示第&nbsp;<i class="blue">${current }&nbsp;</i>页,共<i class="blue">${max }</i>页
								</div></td>
							<td>
								<table border="0" align="right" cellpadding="0" cellspacing="0">
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
								</table>
							</td>
						</tr>
					</table>
				</div>
		</div>
	</form>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
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
	
		function findAllSelected() {
			let arr = [];
			let $arr = $(".userinfo input:checked");
			$arr.map(e => {
				arr.push($arr[e].value);
			});
			return arr;
		}
		///
		function sendForDelete(arr) {
			if(arr.length == 0){
				alert("您没有选中任何一条");
				return false;
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/Member/ClientInfo/delete",
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
