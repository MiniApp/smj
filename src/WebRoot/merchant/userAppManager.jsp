<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>尚佰味网 - 天津外卖|网上订餐|快餐网|盒饭便当配送</title>
	<meta name="Description" content="尚佰味网为您提供丰富的外卖,盒饭菜谱，您可以通过网上订餐，电话订餐等方式订到喜欢的饭菜。为您奉献天津24小时送餐业务。使您随时随地能吃上可口的饭菜。" />
	<meta name="Keywords" content="sunbyway,天津快餐,天津外卖,天津订餐,天津送餐,天津美食,天津小吃,外卖网,送餐网,快餐,盒饭,网上订餐,天津24小时外卖,外卖电话,盒饭配送,快餐外卖,快餐送餐,尚佰味网,尚佰味" />
	<link rel="shortcut icon" href="${ctx}/favicon.ico">
	<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/js/thickbox-compressed.js" ></script>
	<link href="${ctx}/css/thickbox.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/merchant.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/merchant/left.jsp" %>
   	<div id="mainarea">
   		<h2 class="title"><img src="${ctx}/images/space.gif" class="icon7"/>评价管理</h2>
   		<div class="orderSearch">
   			<form action="${ctx}/merchantAction.do?method=orderSearch" method="post">
   				<div class="searchTime"><span>开始日期：</span><input type="text" class="Wdate" onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" /></div>
   				<div class="searchTime"><span>结束日期：</span><input type="text" class="Wdate" onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" /></div>
   				<div class="searchCusOrOrderNum"><span>顾客姓名/订单号：</span><input type="text" /></div>
   				<div class="searchSubmitBtn"><input class="searchSubmitBtnIn" type="submit" value=" 查 询  "/></div>
   			</form>
   		</div>
		<div class="userAppList">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="userAppTd">发货速度</td>
					<td class="userAppTd">诚信</td>
					<td class="userAppTd">服务态度</td>
					<td class="userAppTd">评价内容</td>
					<td class="userAppTd">评价日期</td>
					<td class="userAppTd">评价人</td>
				</tr>
				<tr class="userAppInfo">
					<td class="userAppTbBorder">12324</td>
					<td class="userAppTbBorder">张三</td>
					<td class="userAppTbBorder">${test.cityname }</td>
					<td class="userAppTbBorder">110</td>
					<td class="userAppTbBorder">2013-06-26</td>
					<td class="userAppTbBorder">
						王四
					</td>
				</tr>
				<tr class="userAppInfo">
					<td class="userAppTbBorder">12324</td>
					<td class="userAppTbBorder">张三</td>
					<td class="userAppTbBorder">${test.cityname }</td>
					<td class="userAppTbBorder">110</td>
					<td class="userAppTbBorder">2013-06-26</td>
					<td class="userAppTbBorder">
						王四
					</td>
				</tr>
				<tr class="userAppInfo">
					<td class="userAppTbBorder">12324</td>
					<td class="userAppTbBorder">张三</td>
					<td class="userAppTbBorder">${test.cityname }</td>
					<td class="userAppTbBorder">110</td>
					<td class="userAppTbBorder">2013-06-26</td>
					<td class="userAppTbBorder">
						王四
					</td>
				</tr>
				<tr class="userAppInfo">
					<td class="userAppTbBorder">12324</td>
					<td class="userAppTbBorder">张三</td>
					<td class="userAppTbBorder">${test.cityname }</td>
					<td class="userAppTbBorder">110</td>
					<td class="userAppTbBorder">2013-06-26</td>
					<td class="userAppTbBorder">
						王四
					</td>
				</tr>
				<tr><td colspan="6">${sugu:htmlPages(p_no,p_num)}</td></tr>
			</table>
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