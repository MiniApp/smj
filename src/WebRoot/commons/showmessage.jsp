<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>尚佰味网 - 天津外卖|网上订餐|快餐网|盒饭便当配送</title>
	<meta name="Description" content="尚佰味网为您提供丰富的外卖,盒饭菜谱，您可以通过网上订餐，电话订餐等方式订到喜欢的饭菜。为您奉献天津24小时送餐业务。使您随时随地能吃上可口的饭菜。" />
	<meta name="Keywords" content="sunbyway,天津快餐,天津外卖,天津订餐,天津送餐,天津美食,天津小吃,外卖网,送餐网,快餐,盒饭,网上订餐,天津24小时外卖,外卖电话,盒饭配送,快餐外卖,快餐送餐,尚佰味网,尚佰味" />
	<link rel="shortcut icon" href="${ctx}/favicon.ico">
	<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<div class="showmessage">
	<div class="ye_l_b">
		<caption><h2>信息提示</h2></caption>
		<p>${message}</p>
		<p class="op"><c:choose>
			<c:when test="${not empty url_forward}">
			<script type="text/javascript">setTimeout("window.location.href ='${ctx}${url_forward}';",2000);</script>
			<a href="${ctx}${url_forward}">页面跳转中...</a>
			</c:when>
			<c:otherwise><a href="javascript:history.go(-1);">返回上一页</a> | <a href="${ctx}/index.jsp">返回首页</a></c:otherwise>
		</c:choose></p>
	</div>
</div>
<%@include file="/commons/footer.jsp" %>
</body>
</html>