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
<script type="text/javascript" src="${ctx}/system/billInfo.js"></script>
<style type="text/css">
.queryForm{width:100%; border:1px solid #CCC;margin-bottom:5px;}
.jqmWindow table tr td>input{width:160px;height:20px;}
.jqmWindow tr{height:26px;}
.queryForm tr{height:26px;}
.queryForm input[type="text"]{width:160px;height:20px;}
.queryForm table{padding:5px;}
select{width:165px;height:24px;margin:0;padding:0;}
.actionBtn{cursor:pointer;width:40px; height:20px;border:1px solid #FB6; float:right;line-height:20px;text-align:center;margin-left:10px;background-color:#FB6; color:#855;-moz-border-radius:5px;-webkit-border-radius:5px;khtml-border-radius: 5px;border-radius: 5px;}
</style>
</head>
<body>
<%@include file="top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
	<div id="wrap">
		<%@include file="left.jsp" %>
	   	<div id="mainarea">
	   		<h2 class="title"><img src="../images/space.gif" class="icon3"/>我的订单</h2>
			<div class="queryForm">
		   		<table style="width:750px;" cellpadding="0" cellspacing="0">
		   			<tr>
		   				<td style="width:22%;"><span>开始时间:</span></td>
		   				<td style="width:35%;"><input id="billDateBegin" type="text"/></td>
		   				<td style="width:22%;"><span>结束时间:</span></td>
		   				<td style="width:35%;"><input id="billDateEnd" type="text"/></td>
		   			</tr>
		   			<tr>
		   				<td><span>订单状态:</span></td>
		   				<td>
		   					<select id="billState">
		   						<option value="default">请选择</option>
		   						<option value="1">已审核</option>
		   						<option value="2">送货中</option>
		   						<option value="3">交易成功</option>
		   					</select>
		   				</td>
		   				<td></td>
		   				<td></td>
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
		   	<div id="billList">
		   		<table id="flex" style="display:none"></table>
		   	</div> 
			<div class="jqmWindow" id="billInfo">
				<div class="drag">
					<span id="infoTitle">订单信息</span>
					<div class="close"></div>
				</div>
				<form id="billInfoForm" method="post">
					<table width=100% align="center" border="0" align="center"
						cellpadding="0" cellspacing="0">
						<tr>
							<td style="widht:25%;">顾客姓名：</td>
							<td style="widht:25%;"><input type="text" name="custName" ></td>
							<td style="widht:25%;">联系电话：</td>
							<td style="widht:25%;"><input type="text" name="custTel"></td>
						</tr>
						<tr>
							<td>订单编号：</td>
							<td><input type="text" name="billId"></td>
							<td>交易日期：</td>
							<td><input type="text" name="billDate"></td>
						</tr>
						<tr>
							<td>单据类型：</td>
							<td><input type="text" name="billType"></td>
							<td>顾客地址：</td>
							<td><input type="text" name="custAddr"></td>
						</tr>
						<tr>
							<td>积分：</td>
							<td><input type="text" name="accu"></td>
							<td>是否开发票：</td>
							<td><input type="text" name="isInvoice"></td>
						</tr>
						<tr>
							<td>送积分标志：</td>
							<td><input type="text" name="isVintegral"></td>
							<td>总金额：</td>
							<td><input type="text" name="amt" /></td>
						</tr>
						<tr>
							<td>单据状态：</td>
							<td><input type="text" name="billState"></td>
							<td>支付方式：</td>
							<td><input type="text" name="payType"></td>
						</tr>
						<tr>
							<td>退单标志：</td>
							<td><input type="text" name="rejectFlg"></td>
							<td>退单原因：</td>
							<td><input type="text" name="rejectCause"></td>
						</tr>
						<tr>
							<td>退单时间：</td>
							<td><input type="text" name="rejectTime"></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>外送费用：</td>
							<td><input type="text" name="deliverFee"></td>
							<td>送货时间：</td>
							<td><input type="text" name="deliverTime"></td>
						</tr>
						<tr>
							<td>评价人：</td>
							<td><input type="text" name="userAppr"></td>
							<td>评价日期：</td>
							<td><input type="text" name="apprTime"></td>
						</tr>
						<tr>
							<td>评价内容：</td>
							<td colspan="3"><input type="text" name="billAppr"></td>
						</tr>
						<tr>
							<td>备注：</td>
							<td><input type="text" name="memo"></td>
							<td></td>
							<td><input type="hidden" name="id"></td>
						</tr>
					</table>
				</form>
			</div>
	   	</div>
	</div>
</td></tr></table>
<script type="text/javascript">
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
</script>
</body>
</html>