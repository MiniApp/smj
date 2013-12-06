<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户服务协议 - 尚佰味网</title>
<meta name="Description" content="尚佰味网为您提供丰富的外卖,盒饭菜谱，您可以通过网上订餐，电话订餐等方式订到喜欢的饭菜。为您奉献天津24小时送餐业务。使您随时随地能吃上可口的饭菜。" />
<meta name="Keywords" content="sunbyway,天津快餐,天津外卖,天津订餐,天津送餐,天津美食,天津小吃,外卖网,送餐网,快餐,盒饭,网上订餐,天津24小时外卖,外卖电话,盒饭配送,快餐外卖,快餐送餐,尚佰味网,尚佰味" />
<link rel="shortcut icon" href="favicon.ico" />
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
	#showm{width:720px;margin: 0 auto;}
	#tt{width: 720px;}
	#tt1{float:left;height:30px;font-size:14px;font-weight:bold;text-align:center;line-height:30px;margin-left:20px;display:inline;}
	#tt2{float:right;margin-right:20px;margin-top:15px;display:inline;}
	#showm .oldtright{color:#999;font-size:12px;}
-->
</style>
</head>

<body>
<%@include file="/user/top.jsp" %>
<input type="text" id="labmessage" name="labmessage" readonly=true style="border:0px solid #000000" maxlength=200 value=${errorMsg}/>
</body>
</html>