<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
	<link rel="shortcut icon" href="favicon.ico"/>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<link href="css/store.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<div class="writebooknav">
	<div class="tablebox">
	<form name="formPost" method="post" action="userAction.do?method=addUserLeave">
	<input type="hidden" id="token" name="token" value="${token}"/>
	<div class="td">
	<c:if test="${sGlobal.sugu_uid<=0}">
        您还未登录，请先<a href="${ctx}/user/login.jsp" class="reglink">登录</a>！　　
        <span style="color:#666;">欢迎<a href="uregister.jsp" class="reglink">免费注册</a>成为会员</span>
    </c:if>
	</div>
	<div class="td">
		给&nbsp;<span class="font_col_f60"><c:choose>
		<c:when test="${!empty store_name}">
		${store_name}
		<input type="hidden" name="store_id" value="${store_id}"/>
		<input type="hidden" name="store_name" value="${store_name}"/>
		</c:when>
		<c:otherwise>客服</c:otherwise>
		</c:choose></span>&nbsp;留言<br/>
		<textarea name="ask" id="ask" class="invitetarea"></textarea>
	</div>
	<div class="td" align="center">
        验证码：<input name="seccode" id="seccode" type="text" size="10" class="inviteipt" align="absmiddle" />
        <span id="img_seccode" class="normalmsg"></span>&nbsp;<a href="javascript:showSec();">看不清？换一张</a>&nbsp;
        <input class="invitesubmit" onclick="leaveword();" value="留言" type="button" />
	</div>
	</form>
	</div>
</div>
<div class="normgraybox mainbox">
    <div class="titnav">
        <div class="lft"></div>
        <div class="tit">用户留言</div>
        <div class="rgt"></div>
        <div class="clr"></div>
    </div>
</div>
<!--留言列表-->
<form action="#" method="post" name="queryform">
<c:forEach var="mes" items="${leavewords}" varStatus="statu">
<div class="booklistnav">
	<div class="writeuser">
		<h4><span class="time">${mes.leavTime}</span>留言者：<span class="font_col_f60">${mes.custName}</span>
		&nbsp;TO&nbsp;<span class="font_col_f60"><c:if test="${mes.storeId eq 0}">客服</c:if></span></h4>
        <p>${mes.leavContent}</p>
    </div>
    <c:if test="${mes.ansTime ne ''}">
	<div class="replyuser">
		<h4><span class="time">${mes.ansTime}</span>回复者：<span class="font_col_f60">客服&nbsp;<c:if test="${mes.ansUser ne 0}"><a href="#" onclick="addShContent(${mes.leavId})">回复</a></c:if> </span></h4>
    	<p>${mes.ansContent}&nbsp;</p>
    </div>
    </c:if>
    <div id="b${mes.leavId}" class="snContent"></div>    
</div>
</c:forEach>
<div class="mainbox">${smj:htmlPages(p_no,p_num)}</div>
</form>
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script> 
<script type="text/javascript">
<!--
	setTimeout("loadsysmes()",5000);
	function showSec(){
		document.getElementById("img_seccode").innerHTML='<img src="userAction.do?method=seccode" align="absmiddle" border="0" alt="验证码" />';
	}
	function leaveword(){
		<c:if test="${sGlobal.sugu_uid<=0}">
		alert("您还未登录，请先登录！");
		return;
		</c:if>
		var ask = document.getElementById("ask").value.length;
		if(ask<10 || ask>255){
			alert("留言内容请控制在10到255个字符以内！");
			document.getElementById("ask").focus();
			return;
		}
		var seccode = document.getElementById("seccode").value.length;
		if(seccode!=4){
			alert("请认真填写验证码！");
			document.getElementById("seccode").focus();
			return;
		}
		document.formPost.submit();
	}
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
		document.queryform.submit();
	}
	showSec();
	
	function addShContent(id){
        var  shid = "b" + id;
        var sh = document.getElementById(shid);
	    
	    var newDiv  = document.createElement("TEXTAREA");
		newDiv.name = "txt" + id;
		newDiv.id = "txt" + id;
		newDiv.width = "200px";
		newDiv.height = "80px";
		sh.insertBefore(newDiv);
		
		var newBut = document.createElement("INPUT");
        newBut.setAttribute("TYPE","button");
		newBut.setAttribute("value","回复");
		newBut.onclick = function(){
			test(id);
		}
		sh.insertBefore(newBut);
		
		sh.style.display = "block";  
	}
	
	function test(levelId){
	    var id = "txt" + levelId;
	    var replyTxt = document.getElementById(id).value;
	    if(replyTxt == ""){
	         alert("回复内容不能为空！");
	         return;
	    }
	    else if(replyTxt.length < 10 || replyTxt.length > 255){
	         alert("回复内容请控制在10到255个字符以内!");
	         return;
	    }
	    
	    alert(replyTxt);
	    
	    $(function() {
			   $.ajax({
			     async:false,
			     cache:false,
			     type:'POST',
			     dataType:'json',
			     data:{levelId:parseInt(levelId),replyTxt:replyTxt},
			     url : "userAction.do?method=replayUserLevel",
			     success:function(){
			         document.getElementById(shid).innerHTML = "";
			     } 
			   });
			   });
			   
			   window.location.reload(); 
	}
	
//-->
</script>
</body>
</html>