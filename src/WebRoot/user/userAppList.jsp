<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>宋美佳 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="宋美佳为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
	<link rel="shortcut icon" href="${ctx}/favicon.ico" />
	<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/user.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/user/left.jsp" %>
   	<div id="mainarea">
   		<h2 class="title"><img src="${ctx}/images/space.gif" class="icon5"/>我的评价</h2>
   		<table cellspacing="0" cellpadding="0" class="formtable">
			<tr>
				<th width="150">诚信值:</th>
				<td><span style="color: red; font-size: 14px;">${sGlobal.sugu_rank}</span>&nbsp;
				<img src="${ctx}${sugu:rankPic(sGlobal.sugu_rank,'U')}" alt="" border="0"/>&nbsp;
				(<a href="${ctx}/userAction.do?method=turnto&sign=2">诚信规则</a>)</td>
			</tr>
		</table>
		<br>
		<form action="${ctx}/userAction.do?method=rank" method="post" name="myform">
		<table cellspacing="0" cellpadding="0" class="listtable">
			<caption>
				<h2>我的互评记录</h2>
			</caption>
			<c:choose>
	  		<c:when test="${!empty userapps}">
			<thead>
				<tr class="title">
					<td>店铺名称</td>
					<td align="center">速度</td>
					<td align="center">诚信</td>
					<td align="center">用户</td>
					<td align="center">是否核实</td>
					<td align="center">日期</td>
					<td align="center"></td>
				</tr>
			</thead>
			<c:forEach items="${userapps}" var="userapp">
			<tr class=line>
				<td><a href="${ctx}/userAction.do?method=dishList&id=${userapp.did}">${userapp.dname}</a></td>
				<td align="center">
					<c:if test="${userapp.sd eq 0}"><img alt="好评" src="${ctx}/images/icon_aa.gif"/></c:if>
					<c:if test="${userapp.sd eq 1}"><img alt="中评" src="${ctx}/images/icon_bb.gif"/></c:if>
					<c:if test="${userapp.sd eq 2}"><img alt="差评" src="${ctx}/images/icon_cc.gif"/></c:if>
				</td>
				<td align="center">
					<c:if test="${userapp.wd eq 0}"><img alt="好评" src="${ctx}/images/icon_aa.gif"/></c:if>
					<c:if test="${userapp.wd eq 1}"><img alt="中评" src="${ctx}/images/icon_bb.gif"/></c:if>
					<c:if test="${userapp.wd eq 2}"><img alt="差评" src="${ctx}/images/icon_cc.gif"/></c:if>
				</td>
				<td align="center">
					<c:if test="${userapp.ws eq 0}"><img alt="好评" src="${ctx}/images/icon_aa.gif"/></c:if>
					<c:if test="${userapp.ws eq 1}"><img alt="中评" src="${ctx}/images/icon_bb.gif"/></c:if>
					<c:if test="${userapp.ws eq 2}"><img alt="差评" src="${ctx}/images/icon_cc.gif"/></c:if>
				</td>
				<td align="center">
				<c:choose>
					<c:when test="${userapp.isask eq 'N'}">未评价</c:when>
					<c:otherwise>
					<c:if test="${userapp.yh eq 0}"><img alt="" src="${ctx}/images/icon_aa.gif"/></c:if>
					<c:if test="${userapp.yh eq 1}"><img alt="" src="${ctx}/images/icon_bb.gif"/></c:if>
					<c:if test="${userapp.yh eq 2}"><img alt="" src="${ctx}/images/icon_cc.gif"/></c:if>
					</c:otherwise>
				</c:choose>
				</td>
				<td align="center">
				<c:if test="${userapp.istrue eq 'Y'}">已核实</c:if>
				<c:if test="${userapp.istrue eq 'N'}">未核实</c:if>
				</td>
				<td align="center">${userapp.date}</td>
				<td align="center"><a href="${ctx}/userAction.do?method=rank&type=M&id=${userapp.id}" target="_blank">详细</a></td>
			</tr>
			<tr><td colspan="8">我的评价：${userapp.mes}<br/>商户评价：${userapp.ask}</td></tr>
			</c:forEach>
			<tr><td colspan="8">${sugu:htmlPages(p_no,p_num)}</td></tr>
			</c:when>
			<c:otherwise><tr><td colspan="8">未找到任何评价记录</td></tr></c:otherwise>
	  		</c:choose>
		</table>
		</form>
	</div>
</div>
</td></tr></table>
<%@include file="/user/footer.jsp" %>
<script type="text/javascript">
	setTimeout("loadsysmes()",5000);
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
       	document.getElementById("p_no").value=p_no;
		document.myform.submit();
	}
</script>
</body>
</html>