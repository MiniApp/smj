<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
<link rel="shortcut icon" href="favicon.ico" />
<link href="../css/global.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
	img{border:0 none;}
	#atricle_left{float:left;width:680px;}
	#atricle_right{float:left;width:220px;margin-left:5px;padding:5px;border:1px solid #EBE6C9;}
-->
</style>
</head>
<body>
<%@include file="/user/top1.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<div id="atricle_left">
	<form action="${ctx}/publicAction.do" name="myform" method="post">
	<input type="hidden" name="method" value="sysmesList" />
	<table cellspacing="0" cellpadding="0" class="listtable">
		<caption><h2 class="title"><img src="${ctx}/images/space.gif" class="icon10"/>消息提醒</h2></caption>
		<thead>
		<tr class="title">
			<td width="400px">标题</td>
			<td width="50px" align="center">类别</td>
			<td width="180px" align="center">日期</td>
			<td></td>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${!empty sysmeses}">
				<c:forEach items="${sysmeses}" var="sysmes">
					<tr class=line>
						<td><a href="${ctx}/publicAction.do?method=sysmes&id=${sysmes.id}" target="_blank">${sysmes.title}</a><c:if test="${sysmes.state eq 'N'}"><img src="${ctx}/images/space.gif" class="icon11"/></c:if></td>
						<td align="center"><c:choose><c:when test="${sysmes.type eq 1}">订单提醒</c:when><c:when test="${sysmes.type eq 2}">留言提醒</c:when><c:when test="${sysmes.type eq 3}">评价提醒</c:when><c:when test="${sysmes.type eq 4}">积分提醒</c:when></c:choose></td>
						<td align="center">${sysmes.date}</td>
						<td><a href="${ctx}/publicAction.do?method=sysmesdel&id=${sysmes.id}"><img src=${ctx}/images/del.gif align=absmiddle border=0/></a></td>
					</tr>
				</c:forEach>
				<tr><td colspan="4">${sugu:htmlPages(p_no,p_num)}</td></tr>
			</c:when>
			<c:otherwise><tr><td colspan="4">没有查到任何记录</td></tr></c:otherwise>
		</c:choose>
	</table>
	</form>
	</div>
	<div id="atricle_right"><a href="#" target="_blank"><img src="${ctx}/ad/ad_xiaoxi.gif" width="220" height="150" alt=""/></a></div>
</div>
</td></tr></table>
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript">
<!--
	function page_check(tno){
		var reg = /^\d+$/;
		var p_no;
		if(tno) p_no=tno;
		else p_no = document.getElementById("p_no").value;
		if(!reg.test(p_no)){
       		alert("请输入有效页数字!");
       		document.getElementById("p_no").value="";
       		return;
       	}
		document.myform.submit();
	}
//-->
</script>
</body>
</html>