<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试系统后台管理</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link href="css/public.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/animate.min.css" />
<!-- 动画效果 -->
<link rel="stylesheet" href="css/common1.css" />
<!-- 页面基本样式 -->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript" src="js/modernizr.min.js"></script>


<style type="text/css">
.addmin {
	position: fixed;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	background-color:;
}

.admin img {
	float: right;
}

#add {
	display: none;
	background-image: url("images/15.jpg");
}

#updateName {
	display: none;
	background-image: url("images/16.jpg");
}

#updataPwd {
	display: none;
	background-image: url("images/19.jpg");
}

.admin fieldset {
	text-align: center;
	border: 0px solid red;
	width: 400px;
	height: 140px;
	position: fixed;
	top: 200px;
	left: 400px;
}

.admin form table {
	color: #fff;
	margin-left: 30px;
	margin-top: 20px;
}

.inp {
	background-color: gray;
	margin-top: 10px;
	width: 50px;
	height: 30px;
}
</style>

<script type="text/javascript">
	$(function() {

		$(".inp").mouseover(function() {
			$(this).css("background-color", "blue");
		});
		$(".inp").mouseout(function() {
			$(this).css("background-color", "gray");
		});

	});

	function ck() {
		document.getElementById("add").style.display = 'none';
		document.getElementById("updataPwd").style.display = 'none';
		document.getElementById("updateName").style.display = 'none';
	}
</script>
</head>
<body>
	<c:if test="${sessionScope.admin==null }">
		<script>
			if(confirm("请您登陆后再访问!")){
				window.location.href='Login.jsp';
			}else{
				window.location.href='Login.jsp';
			}
		</script>
</c:if>
	<div id="dcHead">
		<div id="head">
			<div class="logo" style="border-right: 0px;">
				<a href="#"><font color="#fff" size="4">考试系统后台管理</font></a>
			</div>
			<div class="nav" style="border-left: 0px;">
				<ul style="margin-left: 8px;">
					<li class="M"><a href="JavaScript:void(0);" class="topAdd">快速入口</a>
						<div class="drop mTopad">
							<a href="/KaoShiXiTo/houtai/Sbanjie?type=select" target="_blank">班级管理</a>
							<a href="/KaoShiXiTo/houtai/Sbishiti?type=selectAll"
								target="_blank">试题管理</a> <a
								href="/KaoShiXiTo/houtai/Sshijuan?type=select" target="_blank">试卷管理</a>
							<a href="/KaoShiXiTo/houtai/Sstudentinfo?type=selectAll"
								target="_blank">学生管理</a>
						</div></li>
					<li><a href="/KaoShiXiTo/houtai/Sstudentinfo?type=selectAll"
						target="_blank">查看学生信息</a></li>
					<li><a href="/KaoShiXiTo/houtai/Sshijuan?type=select"
						target="_blank">查看试卷信息</a></li>
					<li class="noRight"><a href="javascript:void(0)">Java Web</a></li>
				</ul>
				<ul class="navRight">
					<li class="M noLeft"><a href="JavaScript:void(0);">管理员:${sessionScope.admin
							}</a>
						<div class="drop mUser">
							才艺展示 <img alt="" src="images/t1.gif"> <a
								href="javascript:void(0)"
								onclick="javascript:document.getElementById('updataPwd').style.display='block';">修改我的密码</a>
							<a href="javascript:void(0)"
								onclick="javascript:document.getElementById('add').style.display='block';">修改我的用户</a>
						</div></li>
					<li class="noRight"><a href="Login.html">注销</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="container clearfix">
		<div class="sidebar-wrap">
			<div class="sidebar-title">
				<h1>菜单</h1>
			</div>
			<div class="sidebar-content">
				<ul class="sidebar-list">
					<li><a href="javascript:void(0)"><i class="icon-font">&#xe003;</i>用户管理</a>
						<ul class="sub-menu">
							<li><a href="javascript:void(0)"
								onclick="javascript:document.getElementById('add').style.display='block';"
								target="if"><i class="icon-font">&#xe008;</i>添加管理员</a></li>
							<li><a href="javascript:void(0)"
								onclick="javascript:document.getElementById('updataPwd').style.display='block';"><i
									class="icon-font">&#xe005;</i>修改密码</a></li>
							<li><a href="javascript:void(0)"
								onclick="javascript:document.getElementById('updateName').style.display='block';"><i
									class="icon-font">&#xe006;</i>修改用户名</a></li>
						</ul></li>
					<li><a href="javascript:void(0)"><i class="icon-font">&#xe018;</i>试卷管理</a>
						<ul class="sub-menu">
							<li><a href="/KaoShiXiTo/houtai/Sbishiti?type=selectAll"
								target="if"><i class="icon-font">&#xe017;</i>出题管理</a></li>
							<li><a href="/KaoShiXiTo/houtai/Sshijuan?type=select"
								target="if"><i class="icon-font">
										<!--&#xe037 删除图标  -->&#xe017;
								</i>组卷管理</a></li>
						</ul></li>
					<li><a href="javascript:void(0)"><i class="icon-font">&#xe018;</i>学生管理</a>
						<ul class="sub-menu">
							<li><a href="/KaoShiXiTo/houtai/Sstudentinfo?type=selectAll"
								target="if"><i class="icon-font">&#xe017;</i>学生管理</a></li>
							<li><a href="/KaoShiXiTo/houtai/Sbanjie?type=select"
								target="if"><i class="icon-font">&#xe017;</i>班级管理</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!--/sidebar-->
		<div class="main-wrap">
			<iframe name="if" src="index.jsp"
				style="border: 0px solid red; width: 1150px; height: 700px;">

			</iframe>
		</div>
		<!--/main-->
	</div>

	<div class="admin">
		<!-- 添加管理员 -->
		<fieldset id="add">
			<legend>添加管理员</legend>
			<img alt="img" src="images/icon_no.png" onmouseout="ck()">
			<form action="/KaoShiXiTo/houtai/Suser?type=addAdmin" method="post"
				name="frm">
				<table>
					<thead>
						<tr>
							<th>管理员</th>
							<th>密码</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" required="required" name="addname"
								required="required" /></td>
							<td><input type="password" required="required" name="addpwd"
								required="required" /></td>
						</tr>

						<tr>
							<th><input class="inp" type="submit" value="OK" /></th>
							<th><input class="inp" type="reset" value="NO" /></th>
						</tr>
					</tbody>
				</table>
			</form>
		</fieldset>

		<!-- 修改管理员用户名 -->
		<fieldset id="updateName">
			<img alt="img" src="images/icon_no.png" onmouseout="ck()">
			<legend>修改管理员用户名</legend>
			<form action="/KaoShiXiTo/houtai/Suser?type=updateAdminName"
				method="post" name="frm">
				<table>
					<thead>
						<tr>
							<th>旧管理员</th>
							<th>新管理员</th>
							<th>密码</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" required="required" name="name" /></td>
							<td><input type="text" required="required" name="updatename" /></td>
							<td><input type="password" required="required" name="pwd" /></td>
						</tr>

						<tr>
							<th><input class="inp" type="submit" value="OK" /></th>
							<th><input class="inp" type="reset" value="NO" /></th>
						</tr>
					</tbody>
				</table>
			</form>
		</fieldset>

		<!-- 修改管理员密码 -->
		<fieldset id="updataPwd">
			<legend>修改管理员密码</legend>
			<img alt="img" src="images/icon_no.png" onmouseout="ck()">
			<form action="/KaoShiXiTo/houtai/Suser?type=updateAdminPwd"
				method="post" name="frm">
				<table>
					<thead>
						<tr>
							<th>管理员</th>
							<th>旧密码</th>
							<th>新密码</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" required="required" name="name" /></td>
							<td><input type="password" required="required"
								name="updatepwd" /></td>
							<td><input type="password" required="required" name="newpwd" /></td>
						</tr>

						<tr>
							<th><input class="inp" type="submit" value="OK" /></th>
							<th><input class="inp" type="reset" value="NO" /></th>
						</tr>
					</tbody>
				</table>
			</form>
		</fieldset>
	</div>

<script type="text/javascript">

	

</script>
	<!-- 提示 -->
	<c:if test="${requestScope.tishi !=null }">
	${requestScope.tishi }
</c:if>
</body>
</html>