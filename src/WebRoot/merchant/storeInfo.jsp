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
	<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/merchant.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/merchant/left.jsp" %>
   	<div id="mainarea">
   	<h2 class="title"><img src="${ctx}/images/space.gif" class="icon7"/>店铺信息</h2>
   	<form method="post" action="${ctx}/merchantAction.do?method=updateStoreInfo" class="c_form" name="myform">
   		<input type="hidden" id="token" name="token" value="${token}"/>
   		<table cellspacing="0" cellpadding="0" class="formtable">
			<tr>
				<th style="width: 10em;">店铺LOGO:</th>
				<td><img src="${picUrl}${store.logopath}" alt=""/>&nbsp;&nbsp;<a href="#">修改</a></td>
				<td></td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺名称:</th>
				<td><input type="text" id="store_name" name="store_name" value="${sugu:htmlSpecialChars(store.store_name)}" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺类型:</th>
				<td><c:if test="${store.issend eq 'Y'}">餐饮店</c:if><c:if test="${store.issend eq 'N'}">零食店</c:if></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺级别:</th>
				<td><c:if test="${store.store_type eq '0'}">普通店铺</c:if><c:if test="${store.store_type eq '1'}">高级店铺</c:if><c:if test="${store.store_type eq '3'}">托管店铺</c:if></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺积分:</th>
				<td><font color="#FF0000">${store.integral}</font>分（积分用于出售商品附送）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">诚信保证:</th>
				<td>${sugu:sysDictionary("STORE_CREDIT_",store.credit)}（加入后店铺显示<img src="${ctx}/images/cxbz.gif" alt=""/>图标）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺开关:</th>
				<td>
				<input type="radio" name="onoff" value="Y" <c:if test="${store.onoff eq 'Y'}">checked="checked"</c:if>/>营业
			    <input type="radio" name="onoff" value="N" <c:if test="${store.onoff eq 'N'}">checked="checked"</c:if>/>休息
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">起送金额:</th>
				<td><input class="t_input" type="text" id="beginprice" name="beginprice" value="${store.beginprice}" size="5" maxlength="4"/>元&nbsp;（<font color="#FF0000">* 填写整数</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">响应时间:</th>
				<td><input class="t_input" type="text" id="minutes" name="minutes" value="${store.minutes}" size="5" maxlength="4"/>分钟&nbsp;（<font color="#FF0000">* 填写整数</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">配送费用:</th>
				<td><input type="text" name="sendprice" id="sendprice" value="${store.sendprice}" size="5" maxlength="4" class="t_input"/>元&nbsp;（<font color="#FF0000">* 填写整数</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">所属片区:</th>
				<td>
				<select name="borough_no" id="borough_no" onchange="querystr();">
			    	<option value="0">---请选择所属区---</option>
			      	<c:forEach var="st" items="${streets}">
			      		<option value="${st.id}" <c:if test="${store.borough_no eq st.id}">selected="selected"</c:if>>${st.name}</option>
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
			<tr>
				<th style="width: 10em;">联&nbsp;系&nbsp;人:</th>
				<td><input type="text" id="username" name="username" value="${sugu:htmlSpecialChars(store.username)}" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">客服电话:</th>
				<td>
				<input type="text" id="telephone" name="telephone" value="${store.telephone}" class="t_input"/>
				<c:if test="${store.telstate eq 'N'}">未公开</c:if>
			  	<c:if test="${store.telstate eq 'Y'}">已公开（有效期至${store.teldate}）</c:if>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">客服 QQ:</th>
				<td>
				<input type="text" id="qq" name="qq" value="${store.qq}" class="t_input"/>
				<c:if test="${store.qqstate eq 'N'}">未公开</c:if>
			  	<c:if test="${store.qqstate eq 'Y'}">已公开（有效期至${store.qqdate}）</c:if>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">营业时间:</th>
				<td><input type="text" name="bewrite" id="bewrite" value="${store.bewrite}" class="t_input" maxlength="11"/>&nbsp;如：09:00-21:00</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺地址:</th>
				<td><textarea name="address" id="address" cols="60" rows="2" class="t_input">${sugu:htmlSpecialChars(store.address)}</textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">服务承诺:</th>
				<td><textarea name="serve" id="serve" cols="60" rows="2" class="t_input">${sugu:htmlSpecialChars(store.serve)}</textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">配送范围:</th>
				<td><textarea name="deliverRange" id="deliverRange" cols="60" rows="2" class="t_input">${sugu:htmlSpecialChars(store.deliverRange)}</textarea></td>
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
<script type="text/javascript">
<!--
	setTimeout("loadsysmes()",5000);
	function querystr(){
		var fid = document.getElementById("borough_no").value;
		if(fid=='0'){
			document.getElementById("street_no").options.length = 0;
			var varItem = new Option("---请选择所属区---","0");      
        	document.getElementById("street_no").options.add(varItem);
		}else{
			ajaxresponse('borough_no', 'method=queryStreet&fid='+encodeURIComponent(fid));
		}
	}
	function ajaxresponse(objname, data) {
		var ajax = new Ajax(objname,'${ctx}');
		ajax.getSend('${ctx}/merchantAction.do?'+data,function(s){
			var xml = new Xml(s);
			var items = xml.getElements("street");
			document.getElementById("street_no").options.length = 0;
			var vi = new Option("---请选择所属街道---", "0");      
        	document.getElementById("street_no").options.add(vi);
			for(i=0;i<items.length;i++){
				var varItem = new Option(items[i].childNodes[0].nodeValue, items[i].attributes[0].nodeValue);      
        		document.getElementById("street_no").options.add(varItem);
        		if(items[i].attributes[0].nodeValue=="${store.street_no}"){
        			document.getElementById("street_no").value=items[i].attributes[0].nodeValue;
        		}
			}
		});
	}
	function check(){
		/*var store_name = document.getElementById('store_name').value;
		if(store_name==""){
			alert("店铺名称未填写！");
			return;
		}
		var borough_no = document.getElementById('borough_no').value;
		if(borough_no=="0"){
			alert("店铺所属区未选择！");
			return;
		}
		var street_no = document.getElementById('street_no').value;
		if(street_no=="0"){
			alert("店铺所属街道未选择！");
			return;
		}
		var username = document.getElementById('username').value;
		if(street_no==""){
			alert("店铺负责人未填写！");
			return;
		}
		var telephone = document.getElementById('telephone').value;
		if(telephone==""){
			alert("客服电话未填写！");
			return;
		}
		<c:if test="${store.issend eq 'Y'}">
		var beginprice = document.getElementById('beginprice').value;
		if(beginprice==""){
			alert("起送金额未设置！");
			return;
		}
		var minutes = document.getElementById('minutes').value;
		if(minutes==""){
			alert("响应时间未设置！");
			return;
		}
		</c:if>
		var bewrite = document.getElementById('bewrite').value;
		var reg =/^\d{2}:\d{2}-\d{2}:\d{2}$/;
		if(!reg.test(bewrite)){
			alert("营业时间不符合规则！");
			return;
		}
		var sendprice = document.getElementById('bewrite').value;
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
		}*/
		document.myform.submit();
	}
	querystr();
//-->
</script>
</body>
</html>