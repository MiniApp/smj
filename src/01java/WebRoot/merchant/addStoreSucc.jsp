<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" /><link rel="shortcut icon" href="favicon.ico" />
<link href="css/global.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
	.title {font-size: 12px;color: #333;font-weight: bold;}
	.time_txt {color: #CCC;}
	.td_2 {
		background-color: #f6f6f6;
		border-right-width: 1px;
		border-bottom-width: 1px;
		border-left-width: 1px;
		border-right-style: solid;
		border-bottom-style: solid;
		border-left-style: solid;
		border-right-color: #9db0bc;
		border-bottom-color: #9db0bc;
		border-left-color: #9db0bc;
	}
-->
</style>
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/merchant/left.jsp" %>
   	<div id="mainarea">
   	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="340" valign="top" class="td_2">
        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr><td height="10" width="11%"></td><td></td><td></td></tr>
          <tr>
            <td height="25"><font color="#0066FF"></font></td>
            <td>店铺开通成功</td>
            <td class="time_txt" width="15%" align="right"></td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
   	</div>
</div>
</td></tr></table>
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript">setTimeout("loadsysmes()",5000);</script>
</body>
</html>