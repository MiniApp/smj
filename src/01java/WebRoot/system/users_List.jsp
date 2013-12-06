<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="x-ua-compatible" content="ie=7">
<title>系统控制台</title>
<link href="css/merchant.css" rel="stylesheet" type="text/css" />
<link href="css/global.css" rel="stylesheet" type="text/css" />
<link href="css/extremecomponents.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="left.jsp" %>
   	<div id="mainarea">
   	<h2 class="title"><img src="../images/space.gif" class="icon1"/>用户管理</h2>
	<div class="tabs_header">
		<ul class="tabs">
			<li<c:if test="${st eq 'Users'}"> class="active"</c:if>><a href="systemAction.do?method=Users"><span>用户列表</span></a></li>
			<li<c:if test="${st eq 'allN'}"> class="active"</c:if>><a href="systemAction.do?method=Users&st=allN"><span>未认证用户</span></a></li>
		</ul>
	</div>
	<form action="systemAction.do?method=Users" method="post" name="myform">
	   	<input type="hidden" name="st" value="${st}"/>
	   	<table cellspacing="0" cellpadding="0" class="formtable">
	   		<tr><th style="width: 10em;">客 户 名:</th><td><input type="text" id="name" name="name" value="${name}" size="30" class="t_input"/></td>
	   		 	<th style="width: 10em;">客户帐号:</th><td><input type="text" id="username" name="username" value="${username}" size="30" class="t_input"/></td></tr>
	   		<tr><th style="width: 10em;">邮    箱:</th><td><input type="text" id="email" name="email" value="${email}" size="30" class="t_input"/></td>
	   			<th></th><td>&nbsp;<input type="submit" value=" 搜 索 " class="submit" /></td>
	   		</tr>
	   	</table>
   	</form>
	<ec:table var="ssForm" items="userl" action="systemAction.do" imagePath="../ecimages/*.gif" showStatusBar="true" sortable="true" filterable="false" rowsDisplayed="15">
		<ec:row>
			<ec:column property="name" title="客户名" sortable="false">
				${ssForm.name}
			</ec:column>
			<ec:column property="username" title="客户帐号" sortable="false"></ec:column>
			<ec:column property="email" title="邮箱" sortable="false"></ec:column>
			<ec:column property="integral" title="个人积分" sortable="false"></ec:column>
			<ec:column property="rank" title="信誉度" sortable="false"></ec:column>
			<ec:column property="date" title="注册日期" sortable="false" width="80"></ec:column>
			<ec:column property="null" title="操作" sortable="false">
				<a href="systemAction.do?method=Users&st=usermore&id=${ssForm.id}" target="_blank">详细</a>&nbsp;|&nbsp;
				<a href="systemAction.do?method=Vint&st=sendok&id=${ssForm.id}" target="_blank">积分记录</a>&nbsp;|&nbsp;
				<a href="systemAction.do?method=address&id=${ssForm.id}" target="_blank">用户地址</a>
			</ec:column>
		</ec:row>
	</ec:table>
	</div>
</div>
</td></tr></table>
</body>
</html>