<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试卷管理</title>
<link href="css/public.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript" src="js/jquery.autotextarea.js"></script>
<script type="text/javascript" src="js/modernizr.min.js"></script>

<style type="text/css">
	
	.update{
		position:fixed;
		top:20px;
		left:200px;
		border: 1px green solid;
		width: 500px;
		height:500px;
	}
	
	.update img{
		margin-right:3px;
		margin-top:3px;
		float:right;
	}
	
	#okkao{
		display:none;
	}
	
	#notkao{
		display:none;
		background-color: teal;
	}
	
	#up1{
		display:none;
		background-image: url("images/sj2.jpg");
	}
	
	
	#up2{
	background-image:url("images/sj.jpg");
	display:none;
	background-color:white;
	}
	
	#fd1{
		margin-left:30px;
		margin-top:20px;
		width:400px;
		height:430px;
		text-align: center;
	}
	
	#fd2{
		margin-left:30px;
		margin-top:20px;
		width:400px;
		height:430px;
		text-align: center;
	}
	.frm table{
		width:400px;
		height:400px;
	}
	
	input[value='提交']{
		margin-left:100px;
	}
</style>

<script>

function ck(){
	document.getElementById("up1").style.display='none';
	document.getElementById("up2").style.display='none';
	document.getElementById("okkao").style.display='none';
	document.getElementById("notkao").style.display='none';
}

function up1show(a,b,c,d,e,f){
	document.getElementById("up1").style.display='block';
	
	document.frm1.sj_id.value=a;
	document.frm1.kecheng.value=b;
	document.frm1.stype.value=c;
	document.frm1.biaoti.value=d;
	document.frm1.chutiren.value=e;
	document.frm1.chutitime.value=f;
	//name.value=a;
	//alert(name.value);
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

<div class="crumb-wrap">
		<div class="crumb-list">
			<i class="icon-font"></i><a href="/KaoShiXiTo/houtai/Home.jsp" target="_blank">首页</a><span
				class="crumb-step">&gt;</span><a class="crumb-name"
				href="javascript:void(0)">组卷管理</a>
		</div>
</div>
		<div class="mainBox"
			style="height: auto !important; height: 550px; min-height: 550px;">
			
			<h3>
				<a href="javascript:void(0)" onclick="javascript:document.getElementById('notkao').style.display='block';"  class="actionBtn">取消考试</a>
				<a href="javascript:void(0)" onclick="javascript:document.getElementById('okkao').style.display='block';"  class="actionBtn">设置考试</a>
				<a href="javascript:void(0)" onclick="javascript:document.getElementById('up2').style.display='block';" class="actionBtn">生成试卷</a>试卷信息
			</h3>
			
			<div class="page">
				<c:forEach items="${requestScope.all }" var="all">
					<dl class="child1">
						<dt>
						 <marquee><strong>${all.biaoti }</strong></marquee>
						</dt>
						<dd>
						<a href="javascript:void(0)" onclick="up1show(${all.sj_id},'${all.kecheng }','${all.stype }','${all.biaoti }','${all.chutiren }','${all.chutitime }')" >编辑</a> | 
						<a href="/KaoShiXiTo/houtai/Sshijuan?type=delete&sj_id=${all.sj_id }">删除</a>
						</dd>
					</dl>
				</c:forEach>
			</div>
		</div>
		
		<!-- 专业数据 -->
	<datalist id="zy">
		<option value="java">java</option>
		<option value=".net">.NET</option>
		<option value="ios">IOS</option>
		<option value="php">php</option>
	</datalist>
		
		<!-- 修改试卷 -->
	<div class="update" id="up1">
	<img alt="img" src="images/icon_no.png" onmouseout="ck()">
		<fieldset id="fd1">
			<legend>修改试卷信息</legend>
		<form action="/KaoShiXiTo/houtai/Sshijuan?type=update" method="post" class="frm" name="frm1">

		<table>
			<tr>
				<th>试卷编号:</th>
				<td>
				<input type="text" class="common-text"  name="sj_id" readonly="readonly"  required="required" /></td>
			</tr>
			<tr>
				<th>课程类型:</th>
				<td><input type="search" class="common-text" name="kecheng" list="zy"  required="required" ></td>
			</tr>
			<tr><th>试卷类型:</th>
				<td><input type="search" class="common-text" name="stype" list="nj"  required="required" /></td>
			</tr>
			<tr><th>试卷标题:</th>
				<td><input type="search" class="common-text" name="biaoti"  required="required"/></td>
			</tr>
			<tr><th>出题人:</th>
				<td><input type="text" class="common-text" name="chutiren" step="5" required="required"/></td>
			</tr>
			<tr><th>出题时间:</th>
				<td><input type="date" class="common-text" name="chutitime" required="required"/></td>
			</tr>
			<tr><th><input type="submit" value="提交"/></th>
				<td><input type="reset" /></td>
			</tr>
		</table>
		</form>
		</fieldset>
	</div>
	
	<!-- 新增试卷 -->
	<div class="update" id="up2"  >
	<img alt="img" src="images/icon_no.png" onmouseout="ck()">
		<fieldset id="fd2">
			<legend>添加试卷信息</legend>
		<form action="/KaoShiXiTo/houtai/Sshijuan?type=insert" method="post" class="frm" name="frm2">

		<table>
			<tr>
				<th>课程类型:</th>
				<td><input type="search" class="common-text" name="kecheng" list="zy"  required="required" ></td>
			</tr>
			<tr><th>试卷类型:</th>
				<td><input type="search" class="common-text" name="stype" list="nj"  required="required" /></td>
			</tr>
			<tr><th>试卷标题:</th>
				<td><input type="search" class="common-text" name="biaoti"  required="required"/></td>
			</tr>
			<tr><th>出题人:</th>
				<td><input type="text" class="common-text" name="chutiren" step="5" required="required"/></td>
			</tr>
			<tr><th>出题时间:</th>
				<td><input type="date" class="common-text" name="chutitime" required="required"/></td>
			</tr>
			<tr><th><input type="submit" value="提交"/></th>
				<td><input type="reset" /></td>
			</tr>
		</table>
		</form>
		</fieldset>
	</div>
	
	<!-- 设置考试 -->
	<div class="update" id="okkao"  style="background-image: url('images/b3.gif');">
	<img alt="img" src="images/icon_no.png" onmouseout="ck()">
		<fieldset id="fd2">
			<legend>设置考试</legend>
		<form action="/KaoShiXiTo/houtai/Sshijuan?type=okkao" method="post" class="frm" name="frm2">

		<table>
			<tr>
				<th>试卷编号:</th>
				<td><input type="search" class="common-text" name="sj_id" list="zy"  required="required" ></td>
			</tr>
			<tr><th>班级名称:</th>
				<td><input type="search" class="common-text" name="bname" list="nj"  required="required" /></td>
			</tr>
			<tr><th>考试标题:</th>
				<td><input type="search" class="common-text" name="ktype"  required="required"/></td>
			</tr>
			<tr><th>考试课程:</th>
				<td><input type="text" class="common-text" name="kecheng"  required="required"/></td>
			</tr>
			<tr><th>考试时间 (h):</th>
				<td><input type="number" step="1" max="2"  class="common-text" name="datatime" required="required"/></td>
			</tr>
			<tr><th>试题量:</th>
				<td><input type="number" step="1" min="20"  class="common-text" name="shiti" required="required"/></td>
			</tr>
			<tr><th><input type="submit" value="提交"/></th>
				<td><input type="reset" /></td>
			</tr>
		</table>
		</form>
		</fieldset>
	</div>
	
	<!-- 取消考试 -->
	<div class="update" id="notkao"  style="top:100px;height:380px; background-image: url('images/sj1.jpg');"  >
	<img alt="img" src="images/icon_no.png" onmouseout="ck()">
		<fieldset id="fd2"  style="height:300px; ">
			<legend style="color: widows;">取消考试</legend>
		<form action="/KaoShiXiTo/houtai/Sshijuan?type=notkao" method="post" class="frm" name="frm2">

		<table style="height:300px;">
			<tr><th>班级名称:</th>
				<td><input type="search" class="common-text" name="bname" list="nj"  required="required" /></td>
			</tr>
			<tr><th><input type="submit" value="提交"/></th>
				<td><input type="reset" /></td>
			</tr>
		</table>
		</form>
		</fieldset>
	</div>
<c:if test="${requestScope.tishi !=null }">
	${requestScope.tishi }
</c:if>
</body>
</html>