<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title></title>
<link type="text/css" rel="stylesheet" href="../resources/css/login.css" />
<script>
	function checkLogin(){
		document.forms[0].submit();
	}

</script>
</head>
<BODY>
<form id="loginForm" action="userlogin.do" method="post">
<div id='login' align=center>
&nbsp;
	<div style="position:relative;margin-top:170px; margin-left: -25px;">
		<ul>
			<li style="list-style-type:none;padding-top:5px;">
				<p>
					<input type='text' size="20" name="user.userName" style="outline:none;border:0px;"/>
				</p>
			</li>
			<li style="list-style-type:none;padding-top: 48px;">
				<p>
					<input type='password' name="user.password" size="20" style="outline:none;border:0px;"/>
				</p>
				
			</li>
			<li style="list-style-type:none;">
				<p style="margin-top: 10px;margin-left:-60px;">
					<input type='checkbox'/>Remember Me
				</p>
			</li>
			<li style="list-style-type:none;">
				<a href="#" onclick="checkLogin();">
					<img src='../resources/images/login/login_button.jpg' style="margin-top:10px;margin-left:120px;" />
				</a>
			</li>
			<li style="list-style-type:none;padding-top:25px;">
				<a style="margin-left:40px;" href="#" class='redlink' target="_blank">
					注册
				</a>
				
				<a href="www.163.com" style="margin-left:60px;" class='redlink' target="_blank">
					找回密码
				</a>
			</li>
			
		</ul>
		
	</div>
</div>
</form>
</body>
</html>