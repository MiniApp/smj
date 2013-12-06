<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>系统控制台</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${ctx}/css/flexigrid/css/flexigrid_blue.css"  type="text/css" />  
<link href="css/thickbox.css" media="screen" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/jqModal/jqModal_blue.css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.3.2.min.js"></script>  
<script type="text/javascript" src="${ctx}/js/flexigrid.js"></script>
<script type="text/javascript" src="${ctx}/js/thickbox-compressed.js" ></script>
<script type="text/javascript" src="${ctx}/js/jqModal/dimensions.js"></script>
<script type="text/javascript" src="${ctx}/js/jqModal/jqDnR.js"></script>
<script type="text/javascript" src="${ctx}/js/jqModal/jqModal.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/system/merchant_manager.js"></script>
<style type="text/css">
.queryForm{width:100%; border:1px solid #CCC;margin-bottom:5px;}
.jqmWindow table tr td>input{width:160px;height:20px;}
.jqmWindow tr{height:26px;}
.queryForm tr{height:26px;}
.queryForm input[type="text"]{width:160px;height:20px;}
.queryForm table{padding:5px;}
select{width:60px;height:22px;margin:0;padding:0;}
#accuSearch{width:96px;margin:0;padding:0;}
#regDateSearch{width:96px;margin:0;padding:0;}
.actionBtn{cursor:pointer;width:40px; height:20px;border:1px solid #FB6; float:right;line-height:20px;text-align:center;margin-left:10px;background-color:#FB6; color:#855;-moz-border-radius:5px;-webkit-border-radius:5px;khtml-border-radius: 5px;border-radius: 5px;}
</style>
</head>
<body>
<%@include file="top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="left.jsp" %>
   	<div id="mainarea">
   	<h2 class="title"><img src="../images/space.gif" class="icon1"/>商户管理</h2>
   		<!-- 查询面板 -->
   		<div class="queryForm">
   			<table style="width:750px;" cellpadding="0" cellspacing="0">
		   			<tr>
		   				<td style="width:22%;"><span>公司名称:</span></td>
		   				<td style="width:35%;"><input id="nameSearch" type="text"/></td>
		   				<td></td>
		   				<td></td>
		   			</tr>
		   			<tr>
		   			<td align="right">
		   				<td></td>
		   				<td></td>
		   				<td></td>
		   				<td>
		   					<div id="query" class="actionBtn">查询</div>
		   					<div id="reset" class="actionBtn">重置</div>
		   				</td>
		   					
		   		
		   			</tr>	
		   	</table>		
   		</div>
   		<!-- 查询列表 -->
		<div id="merchant_managerlist">
			<table id="flex" style="display:none"></table>
		</div>
		<!-- 详细信息窗口 -->
		<div class="jqmWindow" id="merchant_managerInfo">
			<!-- 标头 -->
			<div class="drag">
					<span id="infoTitle">商户信息</span>
					<div class="close" id="divclose"></div>
			</div>
				<!-- 信息面板 -->
				<form id="merchantInfoForm" method="post">
					<table width=100% align="center" border="0" align="center"
						cellpadding="0" cellspacing="0" id="ctable">
						<tr>
							<td style="widht:25%;">公司名称：</td>
							<td style="widht:25%;"><input type="text" name="enterName" ></td>
							<td style="widht:25%;">法人身份证件号：</td>
							<td style="widht:25%;"><input type="text" name="legalReprId"></td>
						</tr>
						<tr>
							<td style="widht:25%;">法人代表：</td>
							<td style="widht:25%;"><input type="text" name="legalReprName" ></td>
							<td style="widht:25%;">证件类型：</td>
							<td style="widht:25%;"><input type="text" name="certType"></td>
						</tr>
						<tr>
							<td style="widht:25%;">证件号：</td>
							<td style="widht:25%;"><input type="text" name="certId" ></td>
							<td style="widht:25%;">营业执照文件：</td>
							<td style="widht:25%;"><input type="text" name="enterBussLicenImg" ></td>
							
						</tr>
						<tr>
							<td style="widht:25%;">注册日期：</td>
							<td style="widht:25%;"><input type="text" name="regDate" ></td>
							<td style="widht:25%;">公司地址：</td>
							<td style="widht:25%;"><input type="text" name="enterAddr"></td>
						</tr>
						<tr>
							<td style="widht:25%;">负责人：</td>
							<td style="widht:25%;"><input type="text" name="respbPerson" ></td>
							<td style="widht:25%;">联系电话：</td>
							<td style="widht:25%;"><input type="text" name="telNo"></td>
						</tr>
						<tr>
							<td style="widht:25%;">公司状态：</td>
							<td style="widht:25%;"><input type="text" name="enterState" ></td>
							<td style="widht:25%;">营业执照号：</td>
							<td style="widht:25%;"><input type="text" name="enterBussLicen"></td>
						</tr>
						<tr>
							<td>ddd</td>
							<td><input type="hidden" name="id"></td>
						</tr>
					</table>
					<!-- 按钮 -->
					<div align="center" id="btnDiv">
						<input type="button" id="submit" class="input-button" value="提交" />&nbsp;
						<input type="reset" id="reset" class="input-button" value="重置" />
					</div>
				</form>
		</div>
	</div>
</div>
</td></tr></table>
</body>
</html>