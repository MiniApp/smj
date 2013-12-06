<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>系统控制台</title>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<link href="css/merchant.css" rel="stylesheet" type="text/css" />
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
<%@include file="top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="left.jsp" %>
   	<div id="mainarea">
   	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr><td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"><img src="../images/R_T_l.png" width="15" height="25"/></td>
            <td width="25" align="right" background="../images/R_T_Bg2.png"><img src="../images/R_T_3.png" width="16" height="25"/></td>
            <td width="3"><img src="../images/R_T_2.png" width="3" height="25" /></td>
            <td background="../images/R_T_Bg.png" width="560"></td>
            <td width="3"><img src="../images/R_T_R.png" width="3" height="25" /></td>
          </tr>
        </table>
      </td></tr>
      <tr>
        <td height="340" valign="top" class="td_2">
        送每家系统设置主页面
        </td>
      </tr>
    </table>
   	</div>
</div>
</td></tr></table>
<script type="text/javascript">setTimeout("loadsysmes()",5000);</script>
</body>
</html>