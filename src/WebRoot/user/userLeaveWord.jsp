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
<style type="text/css">
.mainbox {margin:0 auto 10px; width:100%;}
.mainbox .lftnav {padding-right:10px; width:210px;}
.booklistnav {margin:0 auto 10px; width:100%; border-collapse:collapse; color:#233a42; border:#d9e2e7 1px solid;}
.booklistnav .writeuser {padding:10px 20px 8px 35px; background:url(${ctx}/images/gbookarrowa.gif) #f6f6f6 20px 13px no-repeat; border-bottom:#d9e2e7 1px solid;}
.booklistnav .writeuser h4 {margin:0; font-size:12px; font-weight:normal;}
.booklistnav .writeuser span.time {float:right; color:#888;}
.booklistnav .writeuser p {color:#000;}
.booklistnav .replyuser {padding:10px 20px 8px 35px; background:url(${ctx}/images/gbookarrowb.gif) 20px 13px no-repeat;}
.booklistnav .replyuser h4 {margin:0; font-size:12px; font-weight:normal;}
.booklistnav .replyuser span.time {float:right; color:#888;}
.booklistnav .replyuser p {color:#0069b5;}
</style>
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/user/left.jsp" %>
   	<div id="mainarea">
   		<h2 class="title"><img src="${ctx}/images/space.gif" class="icon6"/>我的留言</h2>
<!--留言列表-->
<form action="${ctx}/userAction.do?method=leavewordList" method="post" name="myform">
<input type="hidden" name="type" value="Y"/>
<c:forEach var="mes" items="${leavewords}" varStatus="statu">
<div class="booklistnav">
	<div class="writeuser">
		<h4><span class="time">${mes.ask_time}</span>留言者：<span class="font_col_f60">${mes.name}</span>
		&nbsp;TO&nbsp;<span class="font_col_f60"><c:if test="${mes.store_id eq 0}">平台</c:if><c:if test="${mes.store_id > 0}">${mes.store_name}</c:if></span></h4>
        <p>${mes.ask}</p>
    </div>
    <c:if test="${mes.answer_time ne ''}">
	<div class="replyuser">
		<h4><span class="time">${mes.answer_time}</span>回复者：<span class="font_col_f60">${mes.ans_user}</span>
    	<p>${mes.answer}</p>
    </div>
    </c:if>
</div>
</c:forEach>
<div class="mainbox">${sugu:htmlPages(p_no,p_num)}</div>
</form>
   	</div>
</div>
</td></tr></table>
<%@include file="/user/footer.jsp" %>
<script type="text/javascript">
<!--
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
//-->
</script>
</body>
</html>