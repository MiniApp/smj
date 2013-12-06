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
	<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/js/thickbox-compressed.js" ></script>
	<link href="css/thickbox.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<link href="css/merchant.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/merchant/left.jsp" %>
   	<div id="mainarea">
   		<h2 class="title"><img src="${ctx}/images/space.gif" class="icon6"/>留言管理</h2>
   		<div class="orderSearch">
   			<form action="${ctx}/merchantAction.do?method=orderSearch" method="post">
   				<div class="searchTime"><span>开始日期：</span><input type="text" class="Wdate" onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" /></div>
   				<div class="searchTime"><span>结束日期：</span><input type="text" class="Wdate" onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" /></div>
   				<div class="searchCusOrOrderNum"><span>顾客姓名/订单号：</span><input type="text" /></div>
   				<div class="searchSubmitBtn"><input class="searchSubmitBtnIn" type="submit" value=" 查 询  "/></div>
   			</form>
   		</div>
		<div class="userAppList">
			<form action="${ctx}/merchantAction.do?method=leaveWord" method="post" name="myform">
			   	<input type="hidden" name="state" value="${state}"/>
				<table cellspacing="0" cellpadding="0" class="listtable">
					<thead>
						<tr class="title">
							<td>用户姓名</td>
							<td align="center">留言内容</td>
							<td align="center">留言时间</td>
							<td align="center">操作</td>
						</tr>
					</thead>
					<tr class=line>
						<td>${leave.name}</td>
						<td>${smj:disposeLongStr(30,leave.ask)}</td>
						<td align="center">${leave.ask_time}</td>
						<td align="center">【<a href="${ctx}/merchantAction.do?method=leaveWord&state=B&id=${leave.id}" target="_black"><c:choose><c:when test="${leave.ans_user eq ''}">回复</c:when><c:otherwise>详细</c:otherwise></c:choose></a>】</td>
					</tr>
					<tr><td colspan="4">${smj:htmlPages(p_no,p_num)}</td></tr>
				</table>
			</form>
		</div>
   	</div>
</div>
</td></tr></table>
<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	 $(document).ready(function(){
	 	$(".userAppInfo").mouseover(function(){
			$(this).addClass("hightLight");
		}).mouseout(function(){
			$(this).removeClass("hightLight");
		}); 
	});
	
</script>
</html>