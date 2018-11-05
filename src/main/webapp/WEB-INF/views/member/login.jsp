<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录客户经理信息管理系统</title>
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/static/js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	
	if(window.top.location.href != location.href){
		window.top.location.href = location.href;
	}

	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(${pageContext.request.contextPath}/static/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  
    <div class="loginbody">
	    <span></span> 
	    <div class="loginbox">
		    <ul>
		    <li><input id="username" name="username" type="text" class="loginuser" value="${cookie.usr.value }" onclick="JavaScript:this.value=''"/></li>
		    <li><input id="password" name="password" type="text" class="loginpwd" value="${cookie.pwd.value }" onclick="JavaScript:this.value=''"/></li>
		    <li><input name="" type="button" class="loginbtn" value="登录"  onclick="login()"  /><label><input name="" type="checkbox" value="" checked="checked" />记住密码</label></li>
		    </ul>
	    </div>
    </div>
    
    <script type="text/javascript">
    	
    	
    	function login(){
    		
    		if($("#username").val().length > 0 && $("#password").val() > 0){
				
				$.ajax({
					url:"${pageContext.request.contextPath}/Member/login",
					type:"post",
					dataType:"json",
					data:{
						username:$("#username").val(),
						password:$("#password").val()	
					},
					success:function(result,text,xhr){
						console.log(text);
						if(result.status == 1){
							location.href = result.redirectURI;
						}else{
							alert(result.msg);
						}
					},
					error:function(xhr,text,errThrown){
						
						alert("网络请求错误！");
					
					}
				});
				
				    		
    		}else{
    			alert("请输入完整的登陆信息！");
    			return;
    		}	
    			
    		
    		
    	}
    	
    	
    </script>
    
</body>
</html>
