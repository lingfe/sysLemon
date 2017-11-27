<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试题管理</title>
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
		top:50px;
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
		background-image: url("images/st.jpg");
	}
	
	
	#up2{
	display:none;
	background-image: url("images/st.jpg");
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

function up1show(a,b,c,d,e,f,j,k){
	document.getElementById("up1").style.display='block';
	
	document.frm1.id.value=a;
	document.frm1.sj_id.value=b;
	document.frm1.bs_name.value=c;
	document.frm1.a.value=d;
	document.frm1.b.value=e;
	document.frm1.c.value=f;
	document.frm1.d.value=j;
	document.frm1.ok.value=k;
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
				href="javascript:void(0)">出题管理</a>
		</div>
	</div>
	<!-- 当前位置 -->
	<div class="mainBox"
		style="height: auto !important; height: 550px; min-height: 550px;">
		<h3>
			<a href="javascript:void(0)" onclick="javascript:document.getElementById('up2').style.display='block';" class="actionBtn add">添加试题</a>出题管理
		</h3>
		<div class="filter">
			<form action="article.php" method="post">
				<select name="cat_id">
					<option value="0">未分类</option>
					<option value="1">公司动态</option>
					<option value="2">行业新闻</option>
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
						<th width="40" align="center"><input name='chkall'
							type='checkbox' id='chkall' onclick='selectcheckbox(this.form)'
							value='check'>ID</th>
						<th width="40"  align="center">试卷编号</th>
						<th width="150" align="center">笔试题目</th>
						<th width="100" align="center">答案A</th>
						<th width="100" align="center">答案B</th>
						<th width="100" align="center">答案C</th>
						<th width="100" align="center">答案D</th>
						<th width="100" align="center">正确答案</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${requestScope.all }" var="all">
					<tr>
						<td align="center"><input type="checkbox" name="checkbox[]"
							value="10" />${all.id }</td>
						<td align="center">${all.sj_id }</td>
						<td align="center">${all.bs_name }</td>
						<td align="center">${all.a }</td>
						<td align="center">${all.b }</td>
						<td align="center">${all.c }</td>
						<td align="center">${all.d }</td>
						<td align="center">${all.ok }</td>
						<td align="center">
							<a href="javascript:void(0)" onclick="up1show('${all.id}','${all.sj_id }','${all.bs_name }','${all.a }','${all.b }','${all.c }','${all.d }','${all.ok }')">编辑</a> | 
							<a href="/KaoShiXiTo/houtai/Sbishiti?type=deleteBishiti&id=${all.id }">删除</a>
						</td>
					</tr>
					</c:forEach>

				</table>
				<div class="action">
					<select name="action" onchange="douAction()">
						<option value="0">请选择...</option>
						<option value="del_all">删除</option>
						<option value="category_move">移动分类至</option>
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
	
	<!-- 修改学生信息 -->
	<div class="update" id="up1"  >
	<img alt="img" src="images/icon_no.png" onmouseout="ck()">
		<fieldset id="fd1"  contenteditable="false">
			<legend><b>修改笔试信息</b></legend>
		<form action="/KaoShiXiTo/houtai/Sbishiti?type=updateBishiti" method="post" class="frm" name="frm1">
		<table >
			<tr>
				<th>试题编号:</th>
				<td><input type="text" name="id" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>试卷编号:</th>
				<td><input type="text" name="sj_id"  required="required" /></td>
			</tr>
			<tr>
				<th>笔试题目:</th>
				<td><input type="text" name="bs_name"  required="required" ></td>
			</tr>
			<tr><th>答案A:</th>
				<td><input type="text" name="a"  required="required" ></td>
			</tr>
			<tr><th>答案B:</th>
				<td><input type="text" name="b"  required="required" ></td>
			</tr>
			<tr><th>答案C:</th>
				<td><input type="text" name="c"  required="required" ></td>
			</tr>
			<tr><th>答案D:</th>
				<td><input type="text" name="d"  required="required" ></td>
			</tr>
			<tr><th>正确答案:</th>
				<td><input type="text" name="ok"  required="required" ></td>
			</tr>
			<tr><th><input type="submit" value="提交"/></th>
				<td><input type="reset" value="重置" /></td>
			</tr>
		</table>
		</form>
		</fieldset>
	</div>
	
	<!-- 新增试题 -->
	<div class="update" id="up2" >
	<img alt="img" src="images/icon_no.png" onmouseout="ck()">
		<fieldset id="fd2"  contenteditable="false">
			<legend><b>添加试题信息</b></legend>
		<form action="/KaoShiXiTo/houtai/Sbishiti?type=insertBishiti" method="post" class="frm" name="frm2">

		<table >
			<tr>
				<th>试卷编号:</th>
				<td><input type="text" name="sj_id"   required="required" /></td>
			</tr>
			<tr>
				<th>笔试题目:</th>
				<td><textarea rows="6" cols="25" name="bs_name" required="required"></textarea></td>
			</tr>
			<tr><th>答案A:</th>
				<td><input type="text" name="a"  required="required" ></td>
			</tr>
			<tr><th>答案B:</th>
				<td><input type="text" name="b"  required="required" ></td>
			</tr>
			<tr><th>答案C:</th>
				<td><input type="text" name="c"  required="required" ></td>
			</tr>
			<tr><th>答案D:</th>
				<td><input type="text" name="d"  required="required" ></td>
			</tr>
			<tr><th>正确答案:</th>
				<td><input type="text" name="ok" size="5"  required="required" ></td>
			</tr>
			<tr><th><input type="submit" value="添加"/></th>
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