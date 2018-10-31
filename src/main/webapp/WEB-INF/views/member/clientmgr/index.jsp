<%@ page language="java" import="java.util.*" pageEncoding="UTF-9"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


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
     if(confirm("删除客户经理信息,您确定要删除吗?"))
        window.close();
  } 
  function exportMsg()
  {  
     if(confirm("您确定要导出吗?"))
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
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 100			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>

</head>


<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">客户经理信息综合管理维护</a></li>
    </ul>
    </div>
	<form action="" method="post">
	<div class="formbody">
	    <ul class="seachform">
	    <li><label>机构</label><input name="" type="text" class="scinput" /></li>
	    <li><label>客户经理编号</label><input name="" type="text" class="scinput" /></li>
	    <li><label>姓名</label><input name="" type="text" class="scinput" /></li>
	    <li><label>状态</label>  
	    <div class="vocation">
	    <select class="select1">
	    <option value="">请选择</option>
	    <option value="1">在职</option>
	    <option value="2">退出</option>
	    </select>
	    </div>
	    </li>
	    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
	    </ul>
	</div>
	
    <div class="rightinfo">
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="clientMgrAdd.html"><span><img src="${pageContext.request.contextPath}/static/images/t01.png" /></span>添加</a></li>
	        <li><a href="clientMgrUpdate.html"><span><img src="${pageContext.request.contextPath}/static/images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:confirmMsgDel()" ><span><img src="${pageContext.request.contextPath}/static/images/t03.png"/></span>删除</a></li>
	        <li><a href="javascript:exportMsg()" ><span><img src="${pageContext.request.contextPath}/static/images/t06.png"  height="24" width="20"/></span>导出</a></li>
	        </ul>
	    </div>
	    <table class="tablelist">
	    	<thead>
		    	<tr class="tablehead"><td colspan="10">客户经理信息列表</td></tr>
		    	</thead>
		    	<thead>
		    	<tr>
		        <th><input name="" type="checkbox" value=""/></th>
		        <th>员工号</th>
		        <th>姓名</th>
		        <th>性别</th>
		        <th>身份证号</th>
		        <th>出生日期</th>
		        <th>客户经理等级</th>
		        <th>机构</th>
		        <th>部门</th>
		        <th></th>
		        </tr>
	        </thead>
	        <tbody>
		        <tr>
		        <td><input name="" type="checkbox" value="" /></td>
		        <td>000023</td>
		        <td>Huoo</td>
		        <td>男</td>
		        <td>371607198506167889</td>
		        <td>1985-06-16</td>
		        <td></td>
		        <td>中国农业银行黔西商分</td>
		        <td>公司业务部</td>
		        <td><a href="clientMgrInfoDetail.html" class="tablelink">查看</a> <a href="#" class="tablelink"> 删除</a></td>
		        </tr> 
		        <tr>
		        <td><input name="" type="checkbox" value="" /></td>
		        <td>000022</td>
		        <td>Tom</td>
		        <td>男</td>
		        <td>371508198809217654</td>
		        <td>1988-09-21</td>
		        <td></td>
		        <td>中国农业银行贵州省分行</td>
		        <td></td>
		        <td><a href="clientMgrInfoDetail.html" class="tablelink">查看</a> <a href="#" class="tablelink"> 删除</a></td>
		        </tr>     
		        <tr>
		        <td><input name="" type="checkbox" value="" /></td>
		        <td>000020</td>
		        <td>Baron</td>
		        <td>男</td>
		        <td>371602198707154016</td>
		        <td>1987-07-15</td>
		        <td></td>
		        <td>中国农业银行贵州省分行</td>
		        <td></td>
		        <td><a href="clientMgrInfoDetail.html" class="tablelink">查看</a> <a href="#" class="tablelink"> 删除</a></td>
		        </tr>
		        <tr>
		        <td><input name="" type="checkbox" value="" /></td>
		        <td>000007</td>
		        <td>Rain</td>
		        <td>男</td>
		        <td>371502198209178855</td>
		        <td>1982-09-17</td>
		        <td></td>
		        <td>中国农业银行黔西商分</td>
		        <td>公司业务部</td>
		        <td><a href="clientMgrInfoDetail.html" class="tablelink">查看</a> <a href="#" class="tablelink"> 删除</a></td>
		        </tr>
		        <tr>
		        <td><input name="" type="checkbox" value="" /></td>
		        <td>000003</td>
		        <td>test</td>
		        <td>男</td>
		        <td>371111198504021111</td>
		        <td>1985-04-02</td>
		        <td>高级专家级客户经理</td>
		        <td>中国农业银行六盘水分行</td>
		        <td></td>
		        <td><a href="clientMgrInfoDetail.html" class="tablelink">查看</a> <a href="#" class="tablelink"> 删除</a></td>
		        </tr>
		        <tr>
		        <td><input name="" type="checkbox" value="" /></td>
		        <td>000001</td>
		        <td>Baron Gao</td>
		        <td>男</td>
		        <td>371502198707154000</td>
		        <td>1982-02-02</td>
		        <td>高级专家级客户经理</td>
		        <td>中国农业银行黔西商分</td>
		        <td></td>
		        <td><a href="clientMgrInfoDetail.html" class="tablelink">查看</a> <a href="#" class="tablelink"> 删除</a></td>
		        </tr>	        
		        <tr>
		        <td><input name="" type="checkbox" value="" /></td>
		        <td>000000</td>
		        <td>Baron Admin</td>
		        <td>男</td>
		        <td>371502198707154000</td>
		        <td>1987-07-15</td>
		        <td></td>
		        <td>中国农业银行黔西商分</td>
		        <td>公司业务部</td>
		        <td><a href="clientMgrInfoDetail.html" class="tablelink">查看</a> <a href="#" class="tablelink"> 删除</a></td>
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
