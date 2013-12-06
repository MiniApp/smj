<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" /><link rel="shortcut icon" href="${ctx}/favicon.ico"/>
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<link href="css/merchant.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/merchant/left.jsp" %>
   	<div id="mainarea">
   	<h2 class="title"><img src="${ctx}/images/space.gif" class="icon7"/>店铺信息</h2>
    <select name="store_name" id="store_name">     
    <c:forEach var="st" items="${storeinfo}"><option value="${st.storeId}">${st.storeName}</option></c:forEach>
    </select>
    <input type="button" id="find" value="查询" onclick="ajaxresponse()" />
   	<form method="post" action="${ctx}/merchantAction.do?method=updateStoreInfo" class="c_form" name="myform">
   		<input type="hidden" id="token" name="token" value="${token}"/>
   		<table cellspacing="0" cellpadding="0" class="formtable">
			<tr>
				<th style="width: 10em;">店铺LOGO:</th>
				<td><img src="${store.storeLogo}" alt=""/>&nbsp;&nbsp;<input type="text" id="logopath" name="logopath" value="${store.storeLogo}" style="visibility:hidden" /></td>
				<td></td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺名称:</th>
				<td><input type="text" id="store_name" name="store_name" value="${smj:htmlSpecialChars(store.storeName)}" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺类型:</th>
				<td><input type="text" id="issend" name="issend" value="<c:if test="${store.storeType eq 10}">餐饮</c:if><c:if test="${store.storeType eq 11}">超市</c:if>"  readonly=true style="border:0px solid #000000"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺级别:</th>
				<td><input type="text" id="level" name="level" value="<c:if test="${store.storeLevel eq '12'}">普通店</c:if><c:if test="${store.storeLevel eq '13'}">直营店</c:if><c:if test="${store.storeLevel eq '14'}">加盟店</c:if>" readonly=true style="border:0px solid #000000"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺积分:</th>
				<td><input type="text" id="rankaccu" name="rankaccu" value="${store.storeRankAccu}" readonly=true style="border:0px solid #000000"/> <font color="#FF0000">（积分用于出售商品附送）</font></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">诚信保证:</th>
				<td>${smj:sysDictionary("STORE_CREDIT_",store.storeCredit)}（加入后店铺显示<img src="${ctx}/images/cxbz.gif" alt=""/>图标）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺开关:</th>
				<td>
				<input type="radio" name="onoff" value="8" <c:if test="${store.storeState eq 8}">checked="checked"</c:if>/>营业
			    <input type="radio" name="onoff" value="9" <c:if test="${store.storeState eq 9}">checked="checked"</c:if>/>休息
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">起送金额:</th>
				<td><input class="t_input" type="text" id="beginprice" name="beginprice" value="${store.deliverPrice}" size="5" maxlength="4"/>元&nbsp;（<font color="#FF0000">* 填写整数</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">响应时间:</th>
				<td><input class="t_input" type="text" id="minutes" name="minutes" value="${store.respTime}" size="5" maxlength="4"/>分钟&nbsp;（<font color="#FF0000">* 填写整数</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">配送费用:</th>
				<td><input type="text" name="sendprice" id="sendprice" value="${store.shippingFee}" size="5" maxlength="4" class="t_input"/>元&nbsp;（<font color="#FF0000">* 填写整数</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<!--  
			<tr>
				<th style="width: 10em;">所属片区:</th>
				<td>
				<select name="borough_no" id="borough_no" onchange="">
			    	<option value="0">---请选择所属区---</option>
			      	<c:forEach var="st" items="${streets}">
			      		<option value="${st.id}" <c:if test="${store.sendprice eq st.id}">selected="selected"</c:if>>${st.name}</option>
			      	</c:forEach>
		      	</select>
				</td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<th style="width: 10em;">所在街道:</th>
				<td><select name="street_no" id="street_no"></select></td>
				<td>&nbsp;</td>
			</tr>
			-->
			<tr>
				<th style="width: 10em;">联&nbsp;系&nbsp;人:</th>
				<td><input type="text" id="username" name="username" value="${smj:htmlSpecialChars(store.contPerson)}" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">客服电话:</th>
				<td>
				<input type="text" id="telephone" name="telephone" value="${store.contTel}" class="t_input"/>
				<c:if test="${store.contTel eq 'N'}">未公开</c:if>
			    <c:if test="${store.contTel}">已公开</c:if>
</td>
 				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">客服 QQ:</th>
				<td>
				<input type="text" id="qq" name="qq" value="${store.contQq}" class="t_input"/>
				<c:if test="${store.contQq eq 'N'}">未公开</c:if>
			  	<c:if test="${store.contQq eq 'Y'}">已公开（有效期至${store.contQq}）</c:if>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">营业时间:</th>
				<td><input type="text" name="bewrite" id="bewrite" value="${store.busiStartHour}-${store.busiEndHour}" class="t_input" maxlength="11"/>&nbsp;（<font color="#FF0000">如：09:00-21:00</font>)</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺地址:</th>
				<td><textarea name="address" id="address" cols="60" rows="2" class="t_input">${smj:htmlSpecialChars(store.storeAddr)}</textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">服务承诺:</th>
				<td><textarea name="serve" id="serve" cols="60" rows="2" class="t_input">${smj:htmlSpecialChars(store.service)}</textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">配送范围:</th>
				<td><textarea name="deliverRange" id="deliverRange" cols="60" rows="2" class="t_input">${smj:htmlSpecialChars(store.deliverRange)}</textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
			    <th style="width: 10em;"></th>
			    <td><input type="text" id="redDate" name="regDate" value="${store.regDate}" class="t_input" style="visibility:hidden"/></td>
				<td>&nbsp;</td>
			    
			</tr>
			<tr>
				<th style="width: 10em;">&nbsp;</th>
				<td>
					<input type="button" name="button" onclick="check();" value=" 保 存 " class="submit" />
				</td>
				<td>&nbsp;</td>
			</tr>
		</table>
   	</form>
   	</div>
</div>
</td></tr></table>
<%@include file="footer.jsp" %>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">

	setTimeout("loadsysmes()",5000);
	function getSelectNodeValue(){
	       var store = document.getElementsByName('store_name');
      for(var i=0;i<store.length;i++){
		     return store[i].value;
	   }
	}
	
	function ajaxresponse() {
	    $(function() {
			   $.ajax({
			     async:false,
			     cache:false,
			     type:'POST',
			     dataType:'HTML',
			     data:{storesid:getSelectNodeValue()},
			     url : "merchantAction.do?method=findStoreinfo",
			     success:function(){
			         window.location.reload();
			     } 
			   });
			   });
	}
	
	function check(){
		var store_name = document.getElementById('store_name').value;
		if(store_name==""){
			alert("店铺名称未填写！");
			return;
		}	
		var username = document.getElementById('username').value;
		if(username==""){
			alert("店铺负责人未填写！");
			return;
		}
		var telephone = document.getElementById('telephone').value;
		if(telephone==""){
			alert("客服电话未填写！");
			return;
		}
		var onoff  = document.getElementsByName('onoff');
			for(var i=0;i<onoff.length;i++){
			if(onoff[i].checked){
			 var onoffs = onoff[i].value;
			}
		}
		
		var qq  = document.getElementById('qq').value;
		if(qq==""){
			alert("客服QQ未设置！");
			return;
		}
		
		var bewrite = document.getElementById('bewrite').value;
		var reg =/^\d{2}:\d{2}:\d{2}-\d{2}:\d{2}:\d{2}$/;
		if(!reg.test(bewrite)){
			alert("营业时间不符合规则！");
			return;
		}
		
		var beginprice = document.getElementById('beginprice').value;
		if(beginprice==""){
			alert("起送金额未设置！");
			return;
		}
		
		var resptime = document.getElementById('minutes').value;
		if(resptime==""){
			alert("响应时间未设置！");
			return;
		}
		
		var sendprice = document.getElementById('sendprice').value;
		if(sendprice==""){
			alert("配送费用未设置！");
			return;
		}
		var address = document.getElementById('address').value;
		if(address.length>50||address.length<2){
			alert("详细地址请控制在2到50字以内！");
			return;
		}
		var serve = document.getElementById('serve').value;
		if(serve.length>100||serve.length<2){
			alert("服务承诺请控制在2到100字以内！");
			return;
		}	
		var range = document.getElementById('deliverRange').value;
		if(range.length>100||range.length<2){
			alert("配送范围请控制在2到100字以内！");
			return;
		}	
		
		document.myform.submit();
	}
</script>

</body>
</html>