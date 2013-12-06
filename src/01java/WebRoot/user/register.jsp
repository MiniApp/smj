<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
<link rel="shortcut icon" href="${ctx}/favicon.ico" />
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/loginregfpswd.css" rel="stylesheet" type="text/css" />
<style type="text/css">select {margin-right:2px;height:200px;}</style>
</head>
<body>
<%@include file="/user/top.jsp" %>
<div class="toptxtnav"><span class="topregflow">注册步聚：<span class="font_col_f60">填写资料</span> -> 注册成功</span>用户<span class="font_col_f60">免费</span>注册</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainnav">
  <tr>
    <td valign="top">
        <form name="regform" id="regform" method="post" action="${ctx}/userAction.do?method=registe">
        <div class="normboxnav">
        	<div class="titnav">
            	<div class="lft">注册资料<span class="font_col_gray">（均为必填项）</span></div>
                <div class="rgt"></div>
                <div class="clr"></div>
        	</div>
            <div class="connav">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formloginregnav">
              <tr>
                <td width="110" align="right" height="40">登录账号：</td>
                <td width="200"><input name="username" id="username" type="text" onblur="onBluring('username')" size="25" maxlength="60" class="inviteipt" align="absmiddle" /></td>
                <td width="580"><span id="s_username" class="normalmsg">建议使用<span class="font_col_f60">QQ号</span>或<span class="font_col_f60">邮箱</span>等易记账号。长度6至20个字符</span></td>
              </tr>
              <tr>
                <td align="right" height="40">密　　码：</td>
                <td><input name="password" id="password" type="password" onblur="onBluring('password')" size="25" maxlength="50" class="inviteipt" align="absmiddle" /></td>
                <td><span id="s_password" class="normalmsg">最少6个字符，最长不超过20个字符。</span></td>
              </tr>
              <tr>
                <td align="right" height="40">确认密码：</td>
                <td><input name="password2" id="password2" type="password" onblur="onBluring('password2')" size="25" maxlength="50" class="inviteipt" align="absmiddle" /></td>
                <td><span id="s_password2" class="normalmsg">重复输入上面的密码。</span></td>
              </tr>
              <tr>
                <td align="right" height="40">真实姓名：</td>
                <td><input type="text" value="${name}" name="name" id="name" onblur="onBluring('name')" size="25" maxlength="10" class="inviteipt" align="absmiddle" /></td>
                <td><span id="s_name" class="normalmsg">请填写您的真实姓名，如张三、李四，以便您订购的物品顺利送达。</span></td>
              </tr>
              <tr>
                <td align="right" height="40">密保邮箱：</td>
                <td><input name="email" id="email" type="text" onblur="onBluring('email')" size="25" maxlength="50" class="inviteipt" align="absmiddle" /></td>
                <td><span id="s_email" class="normalmsg">密码找回时，系统将新密码发送到该邮箱。</span></td>
              </tr>
            </table>
            </div>
            <div class="botnav">
            	<div class="lft"></div>
                <div class="rgt"></div>
                <div class="clr"></div>
            </div>
        </div>
        <div class="normboxnav">
        	<div class="titnav">
            	<div class="lft">配送资料<span class="font_col_gray">（ <span class="font_col_red">*</span> 号为必填项目）</span></div>
                <div class="rgt"></div>
                <div class="clr"></div>
        	</div>
            <div class="connav">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formloginregnav">
              <tr>
                <td align="right" height="40" valign="top"><span class="font_col_red">*</span> 请选择配送地址：</td>
                <td colspan="2" width="750">
                <table cellspacing="0" cellpadding="0" class="formtable" border="0" width="750">
                	
					<tr>
						<td align="center">所属省</td>
						<td align="center">所属市</td>
						<td align="center">所属区</td>
					</tr>
					<tr>
						<td align="center">
						<select style="width:80px;" name="borough_no" id="borough_no" size="8" onclick="querystr();">
					    	<c:forEach var="st" items="${province}"><option value="${st.classId}">${st.name}</option></c:forEach>
				      	</select>
						</td>
						<td align="center"><select style="width:150px;" name="street_no" id="street_no" size="8" onclick="querycity();"></select></td>
						<td align="center"><select style="width:200px;" name="signs_all" id="signs_all" size="8" onclick="setAddressValue();"></select></td>
					</tr>
				</table>
                </td>
                <td></td>
              </tr>
              <tr>
                <td align="right" height="40"><span class="font_col_red">*</span> 详细地址：</td>
                <td><input name="address" id="address" onblur="onBluring('address')" type="text" size="40" maxlength="255" class="inviteipt" align="absmiddle" /></td>
                <td><span id="s_address" class="normalmsg">如：建设北路一段</span></td>
              </tr>
              <tr>
                <td align="right" height="40">座　　机：</td>
                <td><input name="telephone" id="telephone" type="text" size="25" class="inviteipt" align="absmiddle" /></td>
                <td></td>
              </tr>
              <tr>
                <td align="right" height="40"><span class="font_col_red">*</span> 手　　机：</td>
                <td colspan="2">
                	<input name="mobile" id="mobile" onblur="onBluring('mobile')" type="text" size="25" class="inviteipt" align="absmiddle" />
                	<span id="s_mobile" class="normalmsg">请正确填写您的联系方式，以便您订购的物品顺利送达。</span>
                </td>
              </tr>
              <tr>
                <td align="right" height="40">QQ　：</td>
                <td><input name="qq" id="qq" value="${qq}" type="text" size="25" class="inviteipt" align="absmiddle" /></td>
                <td></td>
              </tr>
            </table>
            <div style="margin:10px 0 0; padding:10px 0; border-top:#d2e5ef 1px solid;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formloginregnav">
              <tr>
                <td width="110" align="right" height="20">验 证 码：</td>
                <td width="200"><input name="seccode" id="seccode" type="text" size="20" class="inviteipt" align="absmiddle" /></td>
                <td width="580"><img src="${ctx}/userAction.do?method=seccode" align="absmiddle" border="0" alt="验证码" id="img_seccode"/>&nbsp;<a href="javascript:showSec();">看不清楚，换张图片</a></td>
              </tr>
            </table>
            </div>
            </div>
            <div class="botnav">
            	<div class="lft"></div>
                <div class="rgt"></div>
                <div class="clr"></div>
            </div>
        </div>
        <div style="text-align:center; font-size:14px;">
        <input name="isRead" id="isRead" value="1" type="checkbox" /> <a href="${ctx}/service.jsp" target="_blank" style="color:#000; text-decoration:underline;">点击阅读服务条款</a><br />
        <input class="regsubmit" onclick="check()" value="同意服务条款，完成注册" type="button" />
        </div>
        </form>
    </td>
  </tr>
</table>
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
<!--
	var isok_username = false;//用户名是否校验
	/* 根据市查询所属区 */
	function querycity(){
		var fid = document.getElementById("street_no").value;
		 var address = document.getElementById('address');	    
		var  getValue = $('#street_no option:selected').text();
		if(fid == "")
		{
			alert("未选中所选条件，请重新选择!");
		    return;
		}
		else
		{
		    ajaxresponse1('borough_no', 'method=queryRegion&fid='+encodeURIComponent(fid));
		    if(address.value.indexOf(getValue) == -1){
			   address.value = address.value.substr(0,address.value.indexOf("省")+1) + getValue;
			}
			else{
			    alert("请不要重复选择相同的条件！");
			}
	    }
	}
	function ajaxresponse1(objname, data) {
		var ajax = new Ajax(objname,'${ctx}');
		ajax.getSend('${ctx}/registerAction.do?'+data,function(s){
			var xml = new Xml(s);
			var items = xml.getElements("street");
			document.getElementById("signs_all").options.length = 0;
			for(i=0;i<items.length;i++){
				var varItem = new Option(items[i].childNodes[0].nodeValue, items[i].attributes[0].nodeValue);      
        		document.getElementById("signs_all").options.add(varItem);
			}
		});
	}
	/* 根据省查询所属市 */
	function querystr(){
		var fid = document.getElementById("borough_no").value;
		var  getValue = $('#borough_no option:selected').text();
		var address = document.getElementById('address');	    
		if(fid == ""){
		     alert("未选中所选条件，请重新选择!");
		     return;
		}
		else{
	           ajaxresponse('borough_no', 'method=queryRegion&fid='+encodeURIComponent(fid));
	           address.value= getValue + "省";
		}
	}
	function ajaxresponse(objname, data) {
		var ajax = new Ajax(objname,'${ctx}');
		ajax.getSend('${ctx}/registerAction.do?'+data,function(s){
			var xml = new Xml(s);
			var items = xml.getElements("street");
			document.getElementById("street_no").options.length = 0;
			for(i=0;i<items.length;i++){
				var varItem = new Option(items[i].childNodes[0].nodeValue, items[i].attributes[0].nodeValue);      
        		document.getElementById("street_no").options.add(varItem);
			}
		});
	}

	function setAddressValue(){
	   var address = document.getElementById('address');
	   var  getValue = $('#signs_all option:selected').text();	
       
       if(getValue == ""){
           alert("非法选择，请重新选择");
           return;
       }
       else{          
		   if(address.value.indexOf("区") > 0){
		       address.value = address.value.substr(0,address.value.indexOf("区")+1) + getValue;
		   }
		   else if(address.value.indexOf("县") > 0){
		       address.value = address.value.substr(0,address.value.indexOf("县")+1) + getValue;
		   }
		   if(address.value.indexOf("市") > 0){
		       address.value = address.value.substr(0,address.value.indexOf("市")+1) + getValue;
		   }
		   if(address.value.indexOf("盟") > 0){
		        address.value = address.value.substr(0,address.value.indexOf("盟")+1) + getValue;
		   }
		   if(address.value.indexOf("州") > 0){
		        address.value = address.value.substr(0,address.value.indexOf("州")+1) + getValue;
		   }
		   if(address.value.indexOf("位") > 0){
		         address.value = address.value.substr(0,address.value.indexOf("位")+1) + getValue;
		   }
	   }
	}
	
	
	/* 检查用户名是否被占用 */
	function checkUserName(username){
		ajaxresponse2('s_username', 'method=checkusername&username='+encodeURIComponent(username));
	}
	function ajaxresponse2(objname, data) {
		var ajax = new Ajax(objname,'${ctx}');
		ajax.postSend('${ctx}/userAction.do',data,function(s){
			var xml = new Xml(s);
			var items = xml.getElements("result");
			var result = items[0].attributes[0].nodeValue;
			if(result=="YES"){
				document.getElementById("s_username").className = "normalmsg";
             	document.getElementById("s_username").innerHTML = "<img src=images/right.gif align=absmiddle border=0 alt=通过 />";
             	isok_username = true;
			}else if(result=="NO"){
				document.getElementById("s_username").className = "errmsg";
             	document.getElementById("s_username").innerHTML = "该登录账号已被占用!";
             	isok_username = false;
			}else if(result=="ERR"){
				document.getElementById("s_username").className = "errmsg";
             	document.getElementById("s_username").innerHTML = "登录账号未填写!";
             	isok_username = false;
			}
		});
	}
function check(){
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
	var password2 = document.getElementById('password2').value;
	var name = document.getElementById('name').value;
	var email = document.getElementById('email').value;
	var borough_no = document.getElementById('borough_no').value;
	var street_no = document.getElementById('street_no').value;
	var signs_all = document.getElementById('signs_all').value;
	var address = document.getElementById('address').value;
	var mobile = document.getElementById('mobile').value;
	var seccode = document.getElementById('seccode').value;
	var isRead = document.getElementById('isRead').checked;
	if(username == ""){
		alert("登录账号未填写!");
		return;
	}
	if(!isok_username){
		alert("登录账号校验未通过!");
		return;
	}
	if(password == ""){
		alert("密码未填写!");
		return;
	}
	if(password2 != password){
		alert("两次输入的密码不一致!");
		return;
	}
	if(name == ""){
		alert("真实姓名未填写!");
		return;
	}
	if(email==""){
		alert("保密邮箱未填写!");
		return;
	}else{
		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
       	if(!reg.test(email)){
       		alert("请输入有效的邮箱地址!");
       		return;
       	}
	}
	if(borough_no==""){
		alert("所属区未选择!");
		return;
	}
	if(street_no==""){
		alert("所属街道未选择!");
		return;
	}
	if(signs_all==""){
		alert("所属楼宇未选择!");
		return;
	}
	if(address == ""){
		alert("详细地址未填写!");
		return;
	}
	if(mobile == ""){
		alert("联系手机未填写!");
		return;
	}
	if(seccode == ""){
		alert("请填写验证码！");
		return;
	}
	if(!isRead){
		alert("注册前请仔细阅读服务条款！");
		return;
	}
	document.regform.submit();
}
function onBluring(theId){//失去焦点
	if(theId=='username'){
		var username = document.getElementById('username').value;
		var reg = /\S+/;
		if(username == "" || username.length<6 || username.length>50 || !reg.test(username)){
			document.getElementById("s_username").className = "errmsg";
			document.getElementById("s_username").innerHTML = "登录账号最少6个字符，最长不超过20个字符!";
		}else{
			checkUserName(username);
		}
	}else if(theId=='password'){
		var password = document.getElementById('password').value;
		var reg = /\S+/;
		if(password.length < 6 || password.length > 20 || !reg.test(password)){
			document.getElementById("s_password").className = "errmsg";
			document.getElementById("s_password").innerHTML = "最少6个字符，最长不超过20个字符（字符由数字、字母构成)。";
		}else{
			document.getElementById("s_password").className = "normalmsg";
			document.getElementById("s_password").innerHTML = "<img src=images/right.gif align=absmiddle border=0 alt=通过 />";
		}
	}else if(theId=='password2'){
		var password = document.getElementById('password').value;
		var password2 = document.getElementById('password2').value;
		if(password != password2){
			document.getElementById("s_password2").className = "errmsg";
			document.getElementById("s_password2").innerHTML = "两次输入的密码不一致!";
		}else{
			document.getElementById("s_password2").className = "normalmsg";
			document.getElementById("s_password2").innerHTML = "<img src=images/right.gif align=absmiddle border=0 alt=通过 />";
		}
	}else if(theId=='name'){
		var name = document.getElementById('name').value;
		var reg = /\S+/;
		if(name == "" || !reg.test(password)){
			document.getElementById("s_name").className = "errmsg";
			document.getElementById("s_name").innerHTML = "请填写您的真实姓名，如张三、李四，以便您订购的物品顺利送达。";
		}else{
			document.getElementById("s_name").className = "normalmsg";
			document.getElementById("s_name").innerHTML = "<img src=images/right.gif align=absmiddle border=0 alt=通过 />";
		}
	}else if(theId=='email'){
		var email = document.getElementById('email').value;
		if(email == ""){
			document.getElementById("s_email").className = "errmsg";
			document.getElementById("s_email").innerHTML = "密码找回时，系统将新密码发送到该邮箱。";
		}else{
			var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
       		if(reg.test(email)){
       			document.getElementById("s_email").className = "normalmsg";
				document.getElementById("s_email").innerHTML = "<img src=images/right.gif align=absmiddle border=0 alt=通过 />";
       		}else{
       			document.getElementById("s_email").className = "errmsg";
				document.getElementById("s_email").innerHTML = "请输入有效的邮箱地址!";
       		}
		}
	}else if(theId=='address'){
		var address = document.getElementById('address').value;
		if(address == ""){
			document.getElementById("s_address").className = "errmsg";
			document.getElementById("s_address").innerHTML = "如：和平区卫津路佳怡国际D栋2门1305。";
		}else{
			document.getElementById("s_address").className = "normalmsg";
			document.getElementById("s_address").innerHTML = "<img src=images/right.gif align=absmiddle border=0 alt=通过 />";
		}
	}else if(theId=='mobile'){
		var mobile = document.getElementById('mobile').value;
		if(mobile == ""){
			document.getElementById("s_mobile").className = "errmsg";
			document.getElementById("s_mobile").innerHTML = "请正确填写您的联系方式，以便您订购的物品顺利送达。";
		}else{
			document.getElementById("s_mobile").className = "normalmsg";
			document.getElementById("s_mobile").innerHTML = "<img src=images/right.gif align=absmiddle border=0 alt=通过 />";
		}
	}
}
function showSec(){
	document.getElementById("img_seccode").src='${ctx}/userAction.do?method=seccode&'+Math.random();
}
//-->
</script>
</body>
</html>