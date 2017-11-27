<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息管理</title>
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
		height:520px;
	}
	
	.update img{
		margin-right:3px;
		margin-top:3px;
		float:right;
	}
	
	#up1{
		display:none;
		background-color: olive;
		height:550px;
	}
	
	
	#up2{
	color:#fff;
	display:none;
	background-image: url("images/xs.jpg");
	}
	
	#fd1{
		margin-left:30px;
		margin-top:20px;
		width:400px;
		height:500px;
		text-align: center;
	}
	
	#fd2{
	    color:#fff;
		margin-left:30px;
		margin-top:20px;
		width:400px;
		height:430px;
		text-align: center;
	}
	.frm table{
	    color:#fff;
		width:400px;
		height:420px;
	}
	
	input[value='提交']{
		margin-top:5px;
		margin-left:100px;
	}
	input[value='重置']{
		margin-top:5px;
		margin-left:80px;
	}
	
</style>

<script>

function ck(){
	document.getElementById("up1").style.display='none';
	document.getElementById("up2").style.display='none';
}


function up1show(id,name,sex,birthday,nation,birthPlace,idCard,marjor,grade,className,password_,remark){
	
	document.getElementById("up1").style.display='block';
	
	document.frm1.stuId.value=id;
	document.frm1.stuName.value=name;
	document.frm1.sex.value=sex;
	document.frm1.birthday.value=birthday;
	document.frm1.nation.value=nation;
	document.frm1.birthPlace.value=birthPlace;
	document.frm1.idCard.value=idCard;
	document.frm1.marjor.value=marjor;
	document.frm1.grade.value=grade;
	document.frm1.className.value=className;
	document.frm1.jiupassword_.value=password_;
	document.frm1.remark.value=remark;
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
				href="javascript:void(0)">学生管理</a>
		</div>
	</div>
	<div class="mainBox"
		style="height: auto !important; height: 550px; min-height: 550px;">
		<h3>
			<a href="#"  class="actionBtn">导入学生</a>学生信息列表
		</h3>
		<div class="filter">
			<form action="" method="post">
				<select name="cat_id">

					<option value="0">未分类</option>
					<option value="1">按班级分</option>
					<option value="2">按专业分</option>
				</select> <input name="keyword" type="text" class="inpMain" value=""
					size="20" /> <input name="submit" class="btnGray" type="submit"
					value="筛选" />
			</form>
		</div>
		<div id="list">
			<form name="action" method="post" action="article.php?rec=action">
				<table width="100%" border="0" cellpadding="8" cellspacing="0"
					class="tableBasic">
					<tr>
						<th width="22" align="center"><input name='chkall'
							type='checkbox' id='chkall' onclick='selectcheckbox(this.form)'
							value='check'></th>
						<th width="60" align="center">学号</th>
						<th width="100" align="center">班级名称</th>
						<th width="100" align="center">学生姓名</th>
						<th width="80" align="center">专业</th>
						<th width="60" align="center">性别</th>
						<th width="120" align="center">出生日期</th>
						<th width="60" align="center">民族</th>
						<th width="120" align="center">出生地</th>
						<th width="100" align="center">操作</th>
					</tr>

					<c:forEach items="${requestScope.stu }" var="stu">
						<tr>
							<td align="center"><input type="checkbox" name="checkbox[]"
								value="10" /></td>
							<td align="center">${stu.stuId }</td>
							<td align="center">${stu.className}</td>
							<td align="center">${stu.stuName }</td>
							<td align="center">${stu.marjor }</td>
							<td align="center">${stu.sex }</td>
							<td align="center">${stu.birthday }</td>
							<td align="center">${stu.nation }</td>
							<td align="center">${stu.birthPlace }</td>
							<td align="center">
								<a href="javascript:void(0)" onclick="up1show('${stu.stuId}','${stu.stuName }','${stu.sex }','${stu.birthday }','${stu.nation }','${stu.birthPlace }','${stu.idCard }','${stu.marjor }','${stu.grade }','${stu.className }','${stu.password_ }','${stu.remark }')">编辑</a> | 
								<a href="/KaoShiXiTo/houtai/Sstudentinfo?type=deleteStuno&stuid=${stu.stuId }">删除</a>|
								<a href="javascript:void(0)" onclick="javascript:document.getElementById('up2').style.display='block';">新增</a>
							    <br />
							    <a href="/KaoShiXiTo/houtai/Sstudentinfo?type=selectStuid&stuid=${stu.stuId }">查看详细</a>
						   </td>
						</tr>
					</c:forEach>


				</table>
				<div class="action">
					<select name="action" onchange="douAction()">
						<option value="0">请选择...</option>
						<option value="del_all">删除</option>
						<option value="category_move">导入到..</option>
					</select> <select name="new_cat_id" style="display: none">
						<option value="0">未分类</option>
						<option value="1">公司动态</option>
						<option value="2">行业新闻</option>
					</select> <input name="submit" class="btn" type="submit" value="执行" />
				</div>
			</form>
		</div>
		<div class="clear"></div>
		<div class="pager">
			总计 10 个记录，共 1 页，当前第 1 页 | <a href="article.php?page=1">第一页</a> 上一页
			下一页 <a href="article.php?page=1">最末页</a>
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
	
	<!-- 修改学生信息 -->
	<div class="update" id="up1" >
	<img alt="img" src="images/icon_no.png" onmouseout="ck()">
		<fieldset id="fd1"  contenteditable="false">
			<legend><b>修改学生信息</b></legend>
		<form action="/KaoShiXiTo/houtai/Sstudentinfo?type=updateStu" method="post" class="frm" name="frm1">

		<table >
			<tr>
				<th>学号:</th>
				<td><input type="text" name="stuId" readonly="readonly"  required="required" /></td>
			</tr>
			<tr>
				<th>学生姓名:</th>
				<td><input type="text" name="stuName"  required="required" ></td>
			</tr>
			<tr><th>性别:</th>
				<td><label><input type="radio" name="sex" checked="checked" title="男" value="男"  required="required" />男</label>
					&emsp;&emsp;
					<label><input type="radio" name="sex" title="女" value="女"   required="required" />女</label>
				</td>
			</tr>
			<tr><th>出生日期:</th>
				<td><input type="datetime-local" name="birthday"  required="required"/></td>
			</tr>
			<tr><th>民&emsp;族:</th>
				<td><input type="text" name="nation" step="1" required="required"/></td>
			</tr>
			<tr><th>出生地址:</th>
				<td><input type="text" value="重庆.." name="birthPlace" required="required"/></td>
			</tr>
			<tr><th>身份证号:</th>
				<td><input type="tel" value="" name="idCard" required="required"/></td>
			</tr>
			<tr><th>专业:</th>
				<td><input type="search" value="" list="zy" name="marjor" required="required"/></td>
			</tr>
			<tr><th>年级:</th>
				<td><input type="search" value="" list="nj" name="grade" required="required"/></td>
			</tr>
			<tr><th>班级名称:</th>
				<td><input type="text" value="" name="className" required="required"/></td>
			</tr>
			<tr><th>旧密码:</th>
				<td><input type="text" value="" name="jiupassword_" required="required"/></td>
			</tr>
			<tr><th>新密码:</th>
				<td><input type="password" value="" name="password_" required="required"/></td>
			</tr>
			<tr><th>备注:</th>
				<td><textarea rows="5" cols="25" required="required" name="remark" ></textarea></td>
			</tr>
			<tr><th><input type="submit" value="提交"/></th>
				<td><input type="reset" value="重置" /></td>
			</tr>
		</table>
		</form>
		</fieldset>
	</div>
	
	<!-- 新增学生 -->
	<div class="update" id="up2" >
	<img alt="img" src="images/icon_no.png" onmouseout="ck()">
		<fieldset id="fd2"  contenteditable="false">
			<legend><b>添加学生信息</b></legend>
		<form action="/KaoShiXiTo/houtai/Sstudentinfo?type=insertStu" method="post" class="frm" name="frm2">

		<table >
			<tr>
				<th>学号:</th>
				<td><input type="text" name="stuId"  required="required" /></td>
			</tr>
			<tr>
				<th>学生姓名:</th>
				<td><input type="text" name="stuName"  required="required" ></td>
			</tr>
			<tr><th>性别:</th>
				<td><label><input type="radio" name="sex" checked="checked" title="男" value="男"  required="required" />男</label>
					&emsp;&emsp;
					<label><input type="radio" name="sex" title="女" value="女"   required="required" />女</label>
				</td>
			</tr>
			<tr><th>出生日期:</th>
				<td><input type="datetime-local" name="birthday"  required="required"/></td>
			</tr>
			<tr><th>民&emsp;族:</th>
				<td><input type="text" name="nation" step="1" required="required"/></td>
			</tr>
			<tr><th>出生地址:</th>
				<td><input type="text" value="重庆.." name="birthPlace" required="required"/></td>
			</tr>
			<tr><th>身份证号:</th>
				<td><input type="tel" value="" name="idCard" required="required"/></td>
			</tr>
			<tr><th>专业:</th>
				<td><input type="search" value="" list="zy" name="marjor" required="required"/></td>
			</tr>
			<tr><th>年级:</th>
				<td><input type="search" value="" list="nj" name="grade" required="required"/></td>
			</tr>
			<tr><th>班级名称:</th>
				<td><input type="text" value="" name="className" required="required"/></td>
			</tr>
			<tr><th>登陆密码:</th>
				<td><input type="password" value="" name="password_" required="required"/></td>
			</tr>
			<tr><th>备注:</th>
				<td><textarea rows="5" cols="25" required="required" name="remark" ></textarea></td>
			</tr>
			<tr><th><input type="submit" value="提交"/></th>
				<td><input type="reset" value="重置" /></td>
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