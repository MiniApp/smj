<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>宋美佳 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="宋美佳为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
	<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
	<link rel="shortcut icon" href="${ctx}/favicon.ico" />
	<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/store.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/user.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/user/left.jsp" %>
   	<div id="mainarea">
   	<h2 class="title"><img src="${ctx}/images/space.gif" class="icon3"/>我的订单</h2>
<form action="${ctx}/userAction.do?method=getUserOrderList" method="post" name="myform">
<div class="billnav">
	<div class="searchTime"><span>开始日期：</span><input type="text" class="Wdate" onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" /></div>
   	<div class="searchTime"><span>结束日期：</span><input type="text" class="Wdate" onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" /></div>
	<div class="orderStatus">
		订单状态：
		<select id="flow" name="flow">
			<option value="">全部</option>
			<option value="0"<c:if test="${flow eq 0}"> selected="selected"</c:if>>待处理</option>
			<option value="1"<c:if test="${flow eq 1}"> selected="selected"</c:if>>配送中</option>
			<option value="2"<c:if test="${flow eq 2}"> selected="selected"</c:if>>已确认收货</option>
			<option value="3"<c:if test="${flow eq 3}"> selected="selected"</c:if>>交易成功</option>
			<option value="4"<c:if test="${flow eq 4}"> selected="selected"</c:if>>用户取消</option>
			<option value="5"<c:if test="${flow eq 5}"> selected="selected"</c:if>>无效单</option>
			<option value="8"<c:if test="${flow eq 8}"> selected="selected"</c:if>>已投诉</option>
			<option value="9"<c:if test="${flow eq 9}"> selected="selected"</c:if>>客服结单</option>
		</select>
	</div>
	
	<input class="submit" type="submit" value=" 搜 索 "/>
</div>
<div>
    <table id="bill_table" width="100%" border="1" bordercolor="#cccccc" cellspacing="0" cellpadding="0" class="caicardetail">
      <thead>
      <tr>
        <td class="tit" width="30%" align="center">订单号</td>
        <td class="tit" width="6%" align="center">积分</td>
        <td class="tit" width="8%" align="center">单价(元)</td>
        <td class="tit" width="6%" align="center">数量</td>
        <td class="tit" width="8%" align="center">总金额(元)</td>
        <td class="tit" width="10%" align="center">状态</td>
        <td class="tit" width="10%" align="center">操作</td>
      </tr>
      </thead>
      <c:choose>
	  <c:when test="${!empty indentms}">
      <c:forEach items="${indentms}" var="indentm">
      <c:set var="tagv" value="N"></c:set>
      <tr><td colspan="7" class="bill">
      	订单编号：<a href="${ctx}/userAction.do?method=billList&type=M&mid=${indentm.id}" target="_blank"><font class="font_col_f60">${indentm.bno}</font></a>
      	&nbsp;&nbsp;<img src="${ctx}/images/phone.gif" alt="" title="电话客服"/>${indentm.store_tel}
      	&nbsp;&nbsp;【<a href="${ctx}/userAction.do?method=getUserOrderList&id=${indentm.sid}">进入店铺</a>】
      	<p align="right" style="float:right;">订单时间：${indentm.billdate}</p>
      </td></tr>
      <c:forEach items="${indents}" var="indent">
      <c:if test="${indentm.id eq indent.bid}">
      <tr>
      	<td>${indent.dname}</td>
      	<td align="center">${indent.integral}</td>
      	<td align="center">${indent.dprice}</td>
      	<td align="center">${indent.dnum}</td>
      	<c:if test="${tagv eq 'N'}">
      	<td valign="top" align="center" rowspan="${indentm.num}"><font class="font_col_f60">${indentm.allprice}</font><br/>(含配送费<br/>${indentm.send_price}元)</td>
      	<td valign="top" align="center" class="gray" rowspan="${indentm.num}">
      		<c:if test="${indentm.flow eq 0}">待处理</c:if>
      		<c:if test="${indentm.flow eq 1}">配送中</c:if>
      		<c:if test="${indentm.flow eq 2}">确认收货</c:if>
      		<c:if test="${indentm.flow eq 3}">交易成功
      			<c:if test="${indentm.isapp eq 'N'}"><br/>待评价</c:if>
      			<c:if test="${indentm.isapp eq 'Y'}"><br/>已评价</c:if>
      			<c:if test="${indentm.isvintegral eq 'N'}"><br/>积分未核实</c:if>
      			<c:if test="${indentm.isvintegral eq 'Y'}"><br/>积分已核实</c:if>
      		</c:if>
      		<c:if test="${indentm.flow eq 4}">用户取消</c:if>
      		<c:if test="${indentm.flow eq 5}">无效订单<br/><input type="button" onclick="update_bill('${indentm.id}');" value="修改订单" class="submit" /></c:if>
      		<c:if test="${indentm.flow eq 8}">用户投诉</c:if>
      		<c:if test="${indentm.flow eq 9}">客服结单</c:if>
      	</td>
      	<td valign="top" align="center" rowspan="${indentm.num}">
      		<c:if test="${sGlobal.sugu_uid>0}">
      		<a href="${ctx}/userAction.do?method=billList&type=M&mid=${indentm.id}" target="_blank">订单详情</a><br/>
      		<c:if test="${indentm.flow eq 0}">
      			<a href="#" onclick="cui_bill('${indentm.id}');"><font class="font_col_f60">我要催单</font></a><br/>
      			<a href="javascript:if(confirm('你确定要取消该订单吗?'))location='${ctx}/userAction.do?method=userIndentm&type=N&id=${indentm.id}'">取消订单</a><br/>
      			<a href="javascript:if(confirm('你确定要删除该订单吗?'))location='${ctx}/userAction.do?method=userIndentm&type=D&id=${indentm.id}'">删除订单</a>
      		</c:if>
      		<c:if test="${indentm.flow eq 1}">
      			<a href="#" onclick="cui_bill('${indentm.id}');"><font class="font_col_f60">我要催单</font></a><br/>
      			<a href="javascript:if(confirm('您确认已收到物品?'))location='${ctx}/userAction.do?method=userIndentm&type=Y&id=${indentm.id}'">确认收货</a><br/>
      			<a href="javascript:if(confirm('您确认要客服介入处理该订单吗?'))location='${ctx}/userAction.do?method=userIndentm&type=T&id=${indentm.id}'">我要投诉</a>
      		</c:if>
      		<c:if test="${indentm.flow eq 3 and indentm.isapp eq 'N'}"><a href="${ctx}/userAction.do?method=userapp&tag=1&id=${indentm.id}" target="_blank">评价商户</a><br/></c:if>
      		<c:if test="${indentm.flow eq 4 || indentm.flow eq 5}"><a href="javascript:if(confirm('你确定要删除该订单吗?'))location='${ctx}/userAction.do?method=userIndentm&type=D&id=${indentm.id}'">删除订单</a></c:if>
      		</c:if>
      	</td>
      	</c:if>
      	<c:set var="tagv" value="Y"></c:set>
      </tr>
      </c:if>
      </c:forEach>
      </c:forEach>
      <tr>
        <td colspan="7">${sugu:htmlPages(p_no,p_num)}</td>
      </tr>
      </c:when>
	  <c:otherwise><tr><td colspan="7">未找到任何订单</td></tr></c:otherwise>
	  </c:choose>
    </table>
</div>
</form>
   	</div>
</div>
</td></tr></table>
<%@include file="/user/footer.jsp" %>
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
	function cui_bill(id){
		if(id=="")return;
		var ajax = new Ajax('sysid','${ctx}');
		ajax.getSend('${ctx}/userAction.do?method=cuiBill&id='+id,function(s){
			var xml = new Xml(s);
			var result = xml.getElements("result");
			if(result[0].attributes[0].nodeValue=="C"){
				alert("催单间隔未满5分钟！");
			}else if(result[0].attributes[0].nodeValue=="B"){
				alert("下单未满20分钟！");
			}else if(result[0].attributes[0].nodeValue=="Y"){
				alert("催单成功！");
			}else if(result[0].attributes[0].nodeValue=="N"){
				alert("催单失败，请重试 或 电话催单！");
			}else if(result[0].attributes[0].nodeValue=="A"){
				alert("该订单不可催单，请检查订单信息！");
			}
		});
	}
	function update_bill(id){document.location="${ctx}/userAction.do?method=getUserOrderList&type=U&id="+id;}
</script>
</body>
</html>