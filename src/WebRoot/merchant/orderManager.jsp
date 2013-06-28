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
   		<h2 class="title"><img src="${ctx}/images/space.gif" class="icon7"/>订单管理</h2>
   		<div class="orderSearch">
   			<form action="${ctx}/merchantAction.do?method=orderSearch" method="post">
   				<div class="searchTime"><span>开始日期：</span><input type="text" class="Wdate" onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" /></div>
   				<div class="searchTime"><span>结束日期：</span><input type="text" class="Wdate" onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" /></div>
   				<div class="searchCusOrOrderNum"><span>顾客姓名/订单号：</span><input type="text" /></div>
   				<div class="searchSubmitBtn"><input class="searchSubmitBtnIn" type="submit" value=" 查 询  "/></div>
   			</form>
   		</div>
		<div class="orderList">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="orderTd">订单编号</td>
					<td class="orderTd">送货人</td>
					<td class="orderTd">送货地址</td>
					<td class="orderTd">联系电话</td>
					<td class="orderTd">交易日期</td>
					<td class="orderTdAct">操作</td>
				</tr>
				<tr class="orderInfo">
					<td class="orderTbBorder">12324</td>
					<td class="orderTbBorder">张三</td>
					<td class="orderTbBorder">${test.cityname }</td>
					<td class="orderTbBorder">110</td>
					<td class="orderTbBorder">2013-06-26</td>
					<td class="orderTbBorder">
						<a class="orderDetailBtn thickbox" name="name1" type="button" title="订单详细信息" href="#TB_inline?height=400&width=600&inlineId=orderDetailBox">详&nbsp;&nbsp;细</a>
					</td>
				</tr>
				<tr class="orderInfo">
					<td class="orderTbBorder">12324</td>
					<td class="orderTbBorder">张三</td>
					<td class="orderTbBorder">${test.cityname }</td>
					<td class="orderTbBorder">110</td>
					<td class="orderTbBorder">2013-06-26</td>
					<td class="orderTbBorder">
						<a class="orderDetailBtn thickbox" name="name2" type="button" title="订单详细信息" href="#TB_inline?height=400&width=600&inlineId=orderDetailBox">详&nbsp;&nbsp;细</a>
					</td>
				</tr>
				<tr class="orderInfo">
					<td class="orderTbBorder">12324</td>
					<td class="orderTbBorder">张三</td>
					<td class="orderTbBorder">${test.cityname }</td>
					<td class="orderTbBorder">110</td>
					<td class="orderTbBorder">2013-06-26</td>
					<td class="orderTbBorder">
						<a class="orderDetailBtn thickbox" name="123" type="button" title="订单详细信息" href="#TB_inline?height=400&width=600&inlineId=orderDetailBox">详&nbsp;&nbsp;细</a>
					</td>
				</tr>
				<tr class="orderInfo">
					<td class="orderTbBorder">12324</td>
					<td class="orderTbBorder">张三</td>
					<td class="orderTbBorder">${test.cityname }</td>
					<td class="orderTbBorder">110</td>
					<td class="orderTbBorder">2013-06-26</td>
					<td class="orderTbBorder">
						<a class="orderDetailBtn thickbox" name="name12" type="button" title="订单详细信息" href="#TB_inline?height=400&width=600&inlineId=orderDetailBox">详&nbsp;&nbsp;细</a>
					</td>
				</tr>
				<tr><td colspan="6">${sugu:htmlPages(p_no,p_num)}</td></tr>
			</table>
		</div>
		<div id="orderDetailBox" style="display:none;">
			<table border="0" cellspacing="0" cellpadding="0" class="orderDetailTable">
				<tr>
					<td>订单号：</td>
					<td>
						<input type="text" class="addr" readonly="readonly"/>
					</td>
					<td>交易日期：</td>
					<td>
						<input type="text" class="addr" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>顾客姓名：</td>
					<td>
						<input type="text" class="addr" readonly="readonly"/>
					</td>
					<td>联系电话：</td>
					<td>
						<input type="text" class="addr" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>总金额：</td>
					<td>
						<input type="text" class="addr" readonly="readonly"/>
					</td>
					<td>积分：</td>
					<td>
						<input type="text" class="addr" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>是否开发票：</td>
					<td>
						<input type="checkbox" class="addr" readonly="readonly"/>
					</td>
					<td>订单状态：</td>
					<td>
						<input type="text" class="addr" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>送货地址：</td>
					<td colspan="3">
						<input type="text" class="addr" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>商品名称</td>
					<td>商品单价</td>
					<td>购买数量</td>
					<td>金额</td>
				</tr>
				<tr>
					<td>牙刷</td>
					<td>12.5</td>
					<td>2</td>
					<td>25</td>
				</tr>
				<tr>
					<td>牙膏</td>
					<td>20.5</td>
					<td>1</td>
					<td>20.5</td>
				</tr>
			</table>
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td style="width:300px; height:40px;">总金额：40.5</td>
					<td style="width:300px;height:40px;">
						<a class="orderVerify" style="color:#FFF;" href="#">审核</a>
						<input type="hidden" class="hiddenOrderId" name="hiddenOrderId" />
					</td>
				</tr>
			</table>
		</div>
   	</div>
</div>
</td></tr></table>
<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	 $(document).ready(function(){
	 	$(".orderInfo").mouseover(function(){
			$(this).addClass("hightLight");
		}).mouseout(function(){
			$(this).removeClass("hightLight");
		});
		
	 	$(".orderDetailBtn").click(function(){
	        var jsonTest = {  
	            orderId:$(this).attr("name")
        	}; 
        	$(".hiddenOrderId").val($(this).attr("name")); 
	        $.ajax({  
	            type: "POST",  
	            url: "${ctx}/merchantAction.do?method=getOrderDetail",  
	            data:jsonTest,  
	            dataType:"json",  
	            success:function(data) {  
                	 $(".addr").val(""+data.userAdd+"");
                }
	        });  
    	}); 
    	$(".orderVerify").click(function(){
	        var jsonTest = {  
	            orderId:$(".hiddenOrderId").val()
        	};  
	        $.ajax({  
	            type: "POST",  
	            url: "${ctx}/merchantAction.do?method=orderVerify",  
	            data:jsonTest,  
	            dataType:"json",  
	            success:function(data) {  
                	alert("订单审核成功！");
                }
	        });  
    	});  
	});
	
</script>
</html>