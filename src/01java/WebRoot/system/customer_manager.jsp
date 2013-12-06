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
<script type="text/javascript" src="${ctx}/system/customer_manager.js"></script>
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
		   	<h2 class="title"><img src="${ctx}/images/space.gif" class="icon1"/>顾客管理</h2>
		   	<div class="queryForm">
		   		<table style="width:750px;" cellpadding="0" cellspacing="0">
		   			<tr>
		   				<td style="width:22%;"><span>用户名:</span></td>
		   				<td style="width:35%;"><input id="nameSearch" type="text"/></td>
		   				<td style="width:22%;"><span>昵称:</span></td>
		   				<td style="width:35%;"><input id="nickNameSearch" type="text"/></td>
		   			</tr>
		   			<tr>
		   				<td><span>积分:</span></td>
		   				<td>
		   					<select id="accuCondition">
		   						<option value="gt" selected="selected">大于</option>
		   						<option value="lt">小于</option>
		   						<option value="eq">等于</option>
		   					</select>
		   					<input id="accuSearch" type="text"/>
		   				</td>
		   				<td><span>注册日期:</span></td>
		   				<td>
		   					<select id="regDateCondition">
		   						<option value="gt" selected="selected">大于</option>
		   						<option value="lt">小于</option>
		   						<option value="eq">等于</option>
		   					</select>
		   					<input type="text" id="regDateSearch" />
		   				</td>
		   			</tr>
		   			<tr>
		   				<td></td>
		   				<td></td>
		   				<td></td>
		   				<td align="right">
		   					<div id="query" class="actionBtn">查询</div>
		   					<div id="reset" class="actionBtn">重置</div>
		   				</td>
		   			</tr>
		   		</table>
			</div>
		   	<div id="customerList">
		   		<table id="flex" style="display:none"></table>
		   	</div> 
			<div class="jqmWindow" id="cusInfo">
				<div class="drag">
					<span id="infoTitle">顾客信息</span>
					<div class="close"></div>
				</div>
				<form id="cusInfoForm" method="post">
					<table width=100% align="center" border="0" align="center"
						cellpadding="0" cellspacing="0">
						<tr>
							<td style="widht:25%;">用户名：</td>
							<td style="widht:25%;"><input type="text" name="name" ></td>
							<td style="widht:25%;">昵称：</td>
							<td style="widht:25%;"><input type="text" name="nickName"></td>
						</tr>
						<tr>
							<td>手机：</td>
							<td><input type="text" name="mobile"></td>
							<td>是否认证：</td>
							<td><input type="text" name="isCert"></td>
						</tr>
						<tr>
							<td>QQ：</td>
							<td><input type="text" name="qq"></td>
							<td>email：</td>
							<td><input type="text" name="email"></td>
						</tr>
						<tr>
							<td>用户积分：</td>
							<td><input type="text" name="accu"></td>
							<td>是否验证：</td>
							<td><input type="text" name="isValidate"></td>
						</tr>
						<tr>
							<td>用户诚信：</td>
							<td><input type="text" name="userRank"></td>
							<td>注册日期：</td>
							<td><input type="text" name="regDate" /></td>
						</tr>
						<tr>
							<td>用户状态：</td>
							<td><input type="text" name="userState"></td>
							<td></td>
							<td><input type="hidden" name="id"></td>
						</tr>
					</table>
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