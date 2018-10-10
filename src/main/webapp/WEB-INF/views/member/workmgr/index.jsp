<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/select-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/editor/kindeditor.js"></script>
<script type="text/javascript"> 
  function confirmMsgDel()
  {  
     if(confirm("删除工作记录,您确定要删除吗?"))
        window.close();
  } 

</script>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>


</head>


<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">工作管理</a></li>
    </ul>
    </div>
   
	<form action="" method="post">
	<div class="formbody">
	    <ul class="seachform">
	    <li><label>客户经理编号</label><input name="" type="text" class="scinput" /></li>
	    <li><label>录入日期</label><input name="" type="text" class="scinput" /></li>
	    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
	    </ul>
	</div>

    <div class="rightinfo">
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="workMgrAdd.html"><span><img src="${pageContext.request.contextPath}/static/images/t01.png" /></span>添加</a></li>
	        <li><a href="workMgrUpdate.html"><span><img src="${pageContext.request.contextPath}/static/images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:confirmMsgDel()" ><span><img src="${pageContext.request.contextPath}/static/images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>
	    <table class="tablelist">
	    	<thead>
		    	<tr class="tablehead"><td colspan="11">工作记录</td></tr>
		    	</thead>
		    	<thead>
		    	<tr>
		        <th><input name="" type="checkbox" value=""/></th>
		        <th>记录时间</th>
		        <th>客户维护</th>
		        <th>产品信息</th>
		        <th>货后管理</th>
		        <th>风险预警</th>
		        <th>发现问题</th>
		        <th>工作建议及感悟</th>
		        </tr>
	        </thead>
	        <tbody>
		        <tr>
		        <td><input name="" type="checkbox" value="" /></td>
		        <td>2016-4-16</td>
		        <td>新增加一个客户</td>
		        <td>购买基金</td>
		        <td>继续跟踪</td>
		        <td>低风险</td>
		        <td></td>
		        <td>真诚对待每个客户</td>
		        </tr> 
		        <tr>
		       	<td><input name="" type="checkbox" value="" /></td>
		        <td>2016-3-30</td>
		        <td>处理客户投诉</td>
		        <td>购买基金未成功，钱没了</td>
		        <td>继续跟踪</td>
		        <td>高风险</td>
		        <td>网络断了</td>
		        <td>用实际行动，解决客户的每一个问题</td>
		        </tr> 
		        <tr>
		        <td><input name="" type="checkbox" value="" /></td>
		        <td>2016-7-11</td>
		        <td>新增加一个客户</td>
		        <td>购买基金</td>
		        <td>继续审批</td>
		        <td>低风险</td>
		        <td></td>
		        <td>真诚对待每个客户</td>
		        </tr> 
	        </tbody>
	    </table>
		   <div class="pagin">
	 		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td class="STYLE4"><div class="message">共<i class="blue">260</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
	           </td>
	            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
	                <tr>
	                  <td width="45"><img src="${pageContext.request.contextPath}/static/images/first.gif" width="33" height="20" style="cursor:hand" onclick="firstPage()"/></td>
	                  <td width="50"><img src="${pageContext.request.contextPath}/static/images/back.gif" width="43" height="20" style="cursor:hand" onclick="priviousPage()"/></td>
	                  <td width="50"><img src="${pageContext.request.contextPath}/static/images/next.gif" width="43" height="20" style="cursor:hand" onclick="nextPage()"/></td>
	                  <td width="40"><img src="${pageContext.request.contextPath}/static/images/last.gif" width="33" height="20" style="cursor:hand" onclick="lastPage()"/></td>
	                  <td width="100"><div align="center"><span class="STYLE1">转到第
	                    <input name="textfield" type="text" size="4" style="height:16px; width:35px; border:1px solid #999999;" /> 
	                    页 </span></div></td>
	                  <td width="40"><img src="${pageContext.request.contextPath}/static/images/go.gif" width="33" height="17" style="cursor:hand" onclick="goPage()"/></td>
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
	</script>

</body>

</html>
