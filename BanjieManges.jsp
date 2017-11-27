<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班级管理</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

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
	
	#up1{
		display:none;
		background-color: olive;
		background-image: url("images/bj3.jpg");
	}
	
	
	#up2{
	display:none;
	background-image: url("images/bj.jpg");
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
}

function up1show(a,b,c,d,e,f){
	document.getElementById("up1").style.display='block';
	
	document.frm1.bname.value=a;
	document.frm1.bzhuangye.value=b;
	document.frm1.bnianji.value=c;
	document.frm1.blaoshi.value=d;
	document.frm1.bnum.value=e;
	document.frm1.btime.value=f;
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
	<!--/sidebar-->
	<div class="main-wrap" style="border: 0px red solid; margin-left: 0px;">
		<div class="crumb-wrap">
			<div class="crumb-list">
				<i class="icon-font"></i><a href="/KaoShiXiTo/houtai/Home.jsp" target="_blank">首页</a><span
					class="crumb-step">&gt;</span><span class="crumb-name">班级管理</span>
			</div>
		</div>
		<div class="search-wrap" style="border: 0px blue solid;">
			<div class="search-content">
				<form action="/KaoShiXiTo/houtai/Sbanjie?type=selectBj" method="post">
					<table class="search-tab">
						<tr>
							<th width="120">选择班级:</th>
							<td>
								 <select  class="common-text" name="search-sort" id="">
								 	<option value="all">全部</option>
									<c:forEach items="${requestScope.banjie }" var="bj">
										<option value="${bj.bname }">${bj.bname }</option>
									</c:forEach>
							</select></td>
							<th width="70">关键字:</th>
							<td>
								
							 <datalist id="list">
									<c:forEach items="${requestScope.banjie }" var="bj">
										<option value="${bj.bname }">${bj.bname }</option>

									</c:forEach>

								</datalist>
							<input class="common-text" placeholder="关键字" name="keywords" value="" id="" list="list" type="search" /></td>
							<td><input class="btn btn-primary btn2" name="sub"
								value="查询" type="submit"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<div class="result-wrap">
			
			<form name="myform" id="myform" method="post">
				<div class="result-title">
					<div class="result-list">
						<a href="javascript:void(0)" onclick="javascript:document.getElementById('up2').style.display='block';"><i class="icon-font"></i>新增班级</a> <a
							id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>全选</a>
						<a id="updateOrd" href="javascript:void(0)"><i
							class="icon-font"></i>更新排序</a>
					</div>
				</div>
				<div class="result-content">
					<table class="result-tab" width="100%">
						<tr>
							<th class="tc" width="5%"></th>
							<th>班级编号</th>
							<th>班级名称</th>
							<th>班级专业</th>
							<th>班级年级</th>
							<th>班级老师</th>
							<th>班级人数</th>
							<th>开班时间</th>
							<th>操作</th>
						</tr>

						<c:forEach items="${requestScope.banjie }" var="bj">
							<tr>
								<td class="tc"><input name="id[]" value="" type="checkbox"></td>
								<td>${bj.id }</td>
								<td>${bj.bname }</td>
								<td>${bj.zhuanye }</td>
								<td>${bj.nianji }</td>
								<td>${bj.banzhuren }</td>
								<td>${bj.xsnum }</td>
								<td>${bj.kaibanTime }</td>
								<td><a href="/KaoShiXiTo/houtai/Sbanjie?type=delete&id=${bj.bname }">删除</a><b>/</b>
								<a href="javascript:void(0)"  onclick="up1show('${bj.bname }','${bj.zhuanye }','${bj.nianji }','${bj.banzhuren }',${bj.xsnum },'${bj.kaibanTime }')"   >修改</a>
								<b>/</b><a href="javascript:void(0)" onclick="javascript:document.getElementById('up2').style.display='block';">添加</a>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div class="list-page">2 条 1/1 页</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 专业数据 -->
	<datalist id="zy">
		<option value="java">java</option>
		<option value=".net">.NET</option>
		<option value="ios">IOS</option>
		<option value="php">php</option>
	</datalist>
	<!-- 年级数据 -->
	<datalist id="nj">
		<option value="s1">s1</option>
		<option value="s2">s2</option>
		<option value="s3">s3</option> 
	</datalist>
	
	<!-- 修改班级 -->
	<div class="update" id="up1">
	<img alt="img" src="images/icon_no.png" onmouseout="ck()">
		<fieldset id="fd1">
			<legend>修改班级信息</legend>
		<form action="/KaoShiXiTo/houtai/Sbanjie?type=update" method="post" class="frm" name="frm1">

		<table>
			<tr>
				<th>班级名称:</th>
				<td>
				<input type="text" class="common-text"  name="bname" readonly="readonly"  required="required" /></td>
			</tr>
			<tr>
				<th>班级专业:</th>
				<td><input type="search" class="common-text" name="bzhuangye" list="zy"  required="required" ></td>
			</tr>
			<tr><th>班级年级:</th>
				<td><input type="search" class="common-text" name="bnianji" list="nj"  required="required" /></td>
			</tr>
			<tr><th>班级老师:</th>
				<td><input type="search" class="common-text" name="blaoshi"  required="required"/></td>
			</tr>
			<tr><th>班级人数:</th>
				<td><input type="number" class="common-text" name="bnum" step="5" required="required"/></td>
			</tr>
			<tr><th>开班时间:</th>
				<td><input type="date" value="未开班" class="common-text" name="btime" required="required"/></td>
			</tr>
			<tr><th><input type="submit" value="提交"/></th>
				<td><input type="reset" /></td>
			</tr>
		</table>
		</form>
		</fieldset>
	</div>
	
	<!-- 新增班级 -->
	<div class="update common-text" id="up2"  >
	<img alt="img" src="images/icon_no.png" onmouseout="ck()">
		<fieldset id="fd2"  contenteditable="false"  class="common-text" >
			<legend><b>添加班级信息</b></legend>
		<form action="/KaoShiXiTo/houtai/Sbanjie?type=insert" method="post" class="frm" name="frm2">

		<table>
			<tr>
				<th>班级名称:</th>
				<td><input type="text" class="common-text" name="bname"  required="required" /></td>
			</tr>
			<tr>
				<th>班级专业:</th>
				<td><input type="search" class="common-text" name="bzhuangye" list="zy"  required="required" ></td>
			</tr>
			<tr><th>班级年级:</th>
				<td><input type="search" class="common-text" name="bnianji" list="nj"  required="required" /></td>
			</tr>
			<tr><th>班级老师:</th>
				<td><input type="search" class="common-text" name="blaoshi"  required="required"/></td>
			</tr>
			<tr><th>班级人数:</th>
				<td><input type="number" class="common-text" name="bnum" step="1" required="required"/></td>
			</tr>
			<tr><th>开班时间:</th>
				<td><input type="date" class="common-text" value="未开班" name="btime" required="required"/></td>
			</tr>
			<tr><th><input type="submit" class="common-text" value="提交"/></th>
				<td><input type="reset" class="common-text" /></td>
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