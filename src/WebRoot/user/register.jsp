<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>尚佰味网 - 天津外卖|网上订餐|快餐网|盒饭便当配送</title>
		<meta name="Description"
			content="尚佰味网为您提供丰富的外卖,盒饭菜谱，您可以通过网上订餐，电话订餐等方式订到喜欢的饭菜。为您奉献天津24小时送餐业务。使您随时随地能吃上可口的饭菜。" />
		<meta name="Keywords"
			content="sunbyway,天津快餐,天津外卖,天津订餐,天津送餐,天津美食,天津小吃,外卖网,送餐网,快餐,盒饭,网上订餐,天津24小时外卖,外卖电话,盒饭配送,快餐外卖,快餐送餐,尚佰味网,尚佰味" />
		<link rel="shortcut icon" href="${ctx}/favicon.ico" />
		<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/css/loginregfpswd.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
	 
 
	</head>
	<body>
		<%@include file="/user/top.jsp"%>
		<div class="toptxtnav">
			<span class="topregflow">注册步聚：<span class="font_col_f60">填写资料</span>
				-> 注册成功</span>用户
			<span class="font_col_f60">免费</span>注册
		</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="mainnav">
			<tr>
				<td valign="top">
					<form name="regform" id="regform" method="post"
						action="${ctx}/registerAction.do?method=register">
						<input type="hidden" id="token" name="token" value="${token}" />
						<div class="normboxnav">
							<div class="titnav">
								<div class="lft">
									注册资料
									<span class="font_col_gray">（均为必填项）</span>
								</div>
								<div class="rgt"></div>
								<div class="clr"></div>
							</div>
							<div class="connav">
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="formloginregnav">
									<tr>
										<td width="110" align="right" height="40">
											登录账号：
										</td>
										<td width="200">
											<input name="username" id="username" 
												type="text" onblur="onBluring('username')" size="25"
												maxlength="60" class="inviteipt" align="absmiddle" />
										</td>
										<td width="580">
											<span id="s_username" class="normalmsg">建议使用<span
												class="font_col_f60">QQ号</span>或<span class="font_col_f60">邮箱</span>等易记账号。长度6至20个字符</span>
										</td>
									</tr>
									<tr>
										<td align="right" height="40">
											密 码：
										</td>
										<td>
											<input name="password" id="password" type="password"
												onblur="onBluring('password')" size="25" maxlength="50"
												class="inviteipt" align="absmiddle" />
										</td>
										<td>
											<span id="s_password" class="normalmsg">最少6个字符，最长不超过20个字符。</span>
										</td>
									</tr>
									<tr>
										<td align="right" height="40">
											确认密码：
										</td>
										<td>
											<input name="password2" id="password2" type="password"
												onblur="onBluring('password2')" size="25" maxlength="50"
												class="inviteipt" align="absmiddle" />
										</td>
										<td>
											<span id="s_password2" class="normalmsg">重复输入上面的密码。</span>
										</td>
									</tr>
									<tr>
										<td align="right" height="40">
											真实姓名：
										</td>
										<td>
											<input type="text" name="name" id="name"
												onblur="onBluring('name')" size="25" maxlength="10"
												class="inviteipt" align="absmiddle" />
										</td>
										<td>
											<span id="s_name" class="normalmsg">请填写您的真实姓名，如张三、李四，以便您订购的物品顺利送达。</span>
										</td>
									</tr>
									<tr>
										<td align="right" height="40">
											密保邮箱：
										</td>
										<td>
											<input name="email" id="email" value="${email}" type="text"
												onblur="onBluring('email')" size="25" maxlength="50"
												class="inviteipt" align="absmiddle" />
										</td>
										<td>
											<span id="s_email" class="normalmsg">密码找回时，系统将新密码发送到该邮箱。</span>
										</td>
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
								<div class="lft">
									订餐配送资料
									<span class="font_col_gray">（ <span class="font_col_red">*</span>
										号为必填项目）</span>
								</div>
								<div class="rgt"></div>
								<div class="clr"></div>
							</div>
							<div class="connav">
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="formloginregnav">
									<tr>
										<td width="110" align="right" height="40">
											<span class="font_col_red">*</span> 地址类型：
										</td>
										<td width="200">
											<input name="type" type="radio" value="0" checked="checked" />
											&nbsp;公司
											<input name="type" value="1" type="radio" />
											&nbsp;家里
										</td>
										<td width="580"></td>
									</tr>
									<tr>
										<td align="right" height="40" valign="top">
											<span class="font_col_red">*</span> 楼宇/小区：
										</td>
										<td colspan="2" width="750">
											（如未找到您所在楼宇/小区，可选择离您最近的楼宇/小区）
											<table cellspacing="0" cellpadding="0"  
												border="0" width="750">
												<tr>
													<td colspan="3" align="left">
														<input type="hidden" id="pyid" name="pyidv"/>
															<ul class="sugu_ul">
																<li>
																	<a href="javascript:pyclick(0)" id="bx" class="current">不限</a>
																</li>
																<c:forEach items="${py}" var="py">
																	<li>
																		<a href="javascript:pyclick(${py.key})" id="${py.key}">${py.value}</a>
																	</li>
																</c:forEach>
															</ul>
													</td>
												</tr>
												<tr>
													<td align="center">
														所属省
													</td>
													<td align="center">
														所属市
													</td>
													<td align="center">
														所属区
													</td>
												</tr>
												<tr>
													<td align="center">
														<select  style="width: 150px;" id="province_id" name="province_id" 
															onchange="queryCity()">
															<option>--请选择--</option>
															<c:forEach var="st" items="${province}">
																<option value="${st.classId}">
																	${st.name}
																</option>
															</c:forEach>
														</select>
													<input type="hidden" id="provincename" name="provincename"/>
													</td>
													<td align="center">
														<select style="width: 150px;" name="city_id" id="city_id"
															 onchange="queryRegion()">
															 <option>--请选择--</option>
														</select>
															<input type="hidden" id="cityname" name="cityname"/>
													</td>
													<td align="center">
														<select style="width: 150px;" name="regionid"
															id="regionid" onchange="findcityall()">
															<option>--请选择--</option>
															</select>
																<input type="hidden" id="regionname" name="regionname"/>
													</td>
												</tr>
											</table>
										</td>
										<td></td>
									</tr>
									<tr>
										<td align="right" height="40">
											<span class="font_col_red">*</span> 详细地址：
										</td>
										<td>
											<input name="address" id="address" 
												onblur="onBluring('address')" type="text" size="40"
												maxlength="255" class="inviteipt" align="absmiddle" />
										</td>
										<td>
											<span id="s_address" class="normalmsg">如：和平区卫津路佳怡国际D栋2门1305。</span>
										</td>
									</tr>
									<tr>
										<td align="right" height="40">
											座 机：
										</td>
										<td>
											<input name="telephone" id="telephone" value="${telephone}"
												type="text" size="25" class="inviteipt" align="absmiddle" />
										</td>
										<td></td>
									</tr>
									<tr>
										<td align="right" height="40">
											<span class="font_col_red">*</span> 手 机：
										</td>
										<td colspan="2">
											<input name="mobile" id="mobile" value="${mobile}"
												onblur="onBluring('mobile')" type="text" size="25"
												class="inviteipt" align="absmiddle" />
											<span id="s_mobile" class="normalmsg">请正确填写您的联系方式，以便您订购的物品顺利送达。</span>
										</td>
									</tr>
									<tr>
										<td align="right" height="40">
											QQ ：
										</td>
										<td>
											<input name="qq" id="qq" value="${qq}" type="text" size="25"
												class="inviteipt" align="absmiddle" />
										</td>
										<td></td>
									</tr>
								</table>
								<div
									style="margin: 10px 0 0; padding: 10px 0; border-top: #d2e5ef 1px solid;">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										class="formloginregnav">
										<tr>
											<td width="110" align="right" height="20">
												验 证 码：
											</td>
											<td width="240">
												<input name="seccode" id="seccode" type="text" size="20"
													class="inviteipt" align="absmiddle" onblur="onBluring('seccode')" />
													<span id="s_seccode" class="normalmsg"></span>
											</td>
											<td width="580">
												<img src="${ctx}/registerAction.do?method=seccode"
													align="absmiddle" border="0" alt="验证码" id="img_seccode" />
												&nbsp;
												<a href="javascript:showSec();">看不清楚，换张图片</a>
											</td>
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
						<div style="text-align: center; font-size: 14px;">
							<input name="isRead" id="isRead" value="1" type="checkbox" />
							<a href="${ctx}/service.jsp" target="_blank"
								style="color: #000; text-decoration: underline;">点击阅读服务条款</a>
							<br />
							<input class="regsubmit" onclick="check()" value="同意服务条款，完成注册"
								type="button" />
						</div>
					</form>
				</td>
			</tr>
		</table>
		<%@include file="/commons/footer.jsp"%>
		<script type="text/javascript">
	var isok_username = false;//用户名是否校验
	 
	function queryRegion(){
		var pyid = document.getElementById("pyid");
		var fid = document.getElementById("city_id").value;
		 var obj = document.getElementById('city_id');   
		   var m=obj.options[obj.selectedIndex].text  ;
         
	   document.getElementById("cityname").value=m;
 		ajaxRegion('city_id', 'method=queryRegion&fid='+encodeURIComponent(fid));
		 
	}
	
	function ajaxRegion(objname, data) {
		var ajax = new Ajax(objname,'${ctx}');
		ajax.getSend('${ctx}/registerAction.do?'+data,function(s){
			var xml = new Xml(s);
			var items = xml.getElements("street");
			document.getElementById("regionid").options.length = 0;
			var varItem = new Option("--请选择--", "0");      
			document.getElementById("regionid").options.add(varItem);
			for(i=0;i<items.length;i++){
				var varItem = new Option(items[i].childNodes[0].nodeValue, items[i].attributes[0].nodeValue);      
        		document.getElementById("regionid").options.add(varItem);
			}
		});
	}
	/* 查街道列表 */
	function queryCity(){
		var fid = document.getElementById("province_id").value;
		var obj = document.getElementById('province_id');   
		var m=obj.options[obj.selectedIndex].text  ;
         
		document.getElementById("provincename").value=m;
		document.getElementById("cityname").value="";
		document.getElementById("regionname").value="";
  		document.getElementById("regionid").options.length = 0;
		document.getElementById("city_id").options.length = 0;
		var varItem = new Option("--请选择--", "0");      
		var varItem2 = new Option("--请选择--", "0");     
		document.getElementById("city_id").options.add(varItem);
		document.getElementById("regionid").options.add(varItem2);
		ajaxCity('city_id', 'method=queryRegion&fid='+encodeURIComponent(fid));
	}
	function ajaxCity(objname, data) {
		
		var ajax = new Ajax(objname,'${ctx}');
		ajax.postSend('${ctx}/registerAction.do',data,function(s){
			var xml = new Xml(s);
			var items = xml.getElements("street");

			for(i=0;i<items.length;i++){			
				var varItem = new Option(items[i].childNodes[0].nodeValue, items[i].attributes[0].nodeValue);      
        		document.getElementById("city_id").options.add(varItem);
			}
		});
	}
		function findcityall()
	{
	    var city_all = document.getElementById('regionid').value;
	    if(city_all == "")
	    return;
	     var obj = document.getElementById('regionid');   
         var m=obj.options[obj.selectedIndex].text  ;
         
	   document.getElementById("regionname").value=m;
	}
	
	function pyclick(obj){
		var street_no = document.getElementById("street_no").value;
		if(obj == 0){
			var bx = document.getElementById("bx");
			bx.className = "current";
			for (i = 1; i< 27; i ++){
				var pyid = document.getElementById(i);
				pyid.className = "";
			}
		}else{
			for (i = 1; i< 27; i ++){
				if(i == obj){
					var pyid = document.getElementById(i);
					var bx = document.getElementById("bx");
					bx.className = "";
					pyid.className = "current";
				}else{
					var pyid = document.getElementById(i);
					pyid.className = "";
				}
			}
		}
		var pyid = document.getElementById("pyid");
		pyid.value = obj;
		if(street_no != ""){
			querysign();
		}
	}
	
	 $.ajax({  
	         type: "POST",  
	         url: "${ctx}/registerAction.do?method=register",  
	         data: para,  
	         dataType : "json",  
	         error: function(data,transport){   
	             alert("获取数据失败，请联系管理员!");  
	         },  
	         success: function(data){  
	         	//var data = eval('('+data+')');
	             if(data.value=="success"){
		             alert("注册成功！");
		             window.location = "userAction.do?method=index";
	             }else {
	                alert(data.text);
	             }
	         }  
		    });
	/* 检查用户名是否被占用 */
	function checkUserName(username){
		ajaxCheckName('s_username', 'method=checkusername&username='+encodeURIComponent(username));
	}
	function ajaxCheckName(objname, data) {
		var ajax = new Ajax(objname,'${ctx}');
		ajax.postSend('${ctx}/registerAction.do',data,function(s){
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
		var borough_no = document.getElementById('province_id').value;
		var street_no = document.getElementById('city_id').value;
		var signs_all = document.getElementById("regionid").value;
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
		 var para = $('#regform').serialize();
		 $.ajax({  
	         type: "POST",  
	         url: "${ctx}/registerAction.do?method=register",  
	         data: para,  
	         dataType : "json",  
	         error: function(data,transport){   
	             alert("获取数据失败，请联系管理员!");  
	         },  
	         success: function(data){  
	         	//var data = eval('('+data+')');
	             if(data.value=="success"){
		             alert("注册成功！");
		             window.location = "userAction.do?method=index";
	             }else {
	                alert(data.text);
	             }
	         }  
		    });
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
			var reg = /\S+/;
			var password = document.getElementById('password').value;
			var password2 = document.getElementById('password2').value;
			if(password2.length < 6 || password2.length > 20 || !reg.test(password2)){
		
				document.getElementById("s_password2").className = "errmsg";
				document.getElementById("s_password2").innerHTML = "最少6个字符，最长不超过20个字符（字符由数字、字母构成)。";		
			}else{
				if(password != password2){
					document.getElementById("s_password2").className = "errmsg";
					document.getElementById("s_password2").innerHTML = "两次输入的密码不一致!";
				}else{
					
					document.getElementById("s_password2").className = "normalmsg";
					document.getElementById("s_password2").innerHTML = "<img src=images/right.gif align=absmiddle border=0 alt=通过 />";
				}
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
		}else if(theId=='seccode'){
			var seccode = document.getElementById("seccode").value;
			if(""==seccode){
				document.getElementById("s_seccode").className = "errmsg";
				document.getElementById("s_seccode").innerHTML = "请正确填写验证码";
			}else{
			ajaxSeccode(theId);
			}
			
		}
	}


	 
	function ajaxSeccode(objname) {
		var data = 'method=querySeccode';
		var ajax = new Ajax(objname,'${ctx}');
		var seccode = document.getElementById("seccode").value;
		ajax.postSend('${ctx}/registerAction.do',data,function(s){
			if(s!=seccode){
				document.getElementById("s_seccode").className = "errmsg";
				document.getElementById("s_seccode").innerHTML = "请正确填写验证码";
			}else if(s==seccode){
				document.getElementById("s_seccode").className = "normalmsg";
				document.getElementById("s_seccode").innerHTML = "<img src=images/right.gif align=absmiddle border=0 alt=通过 />";
			}
		});
	}
function showSec(){
	document.getElementById("img_seccode").src='${ctx}/registerAction.do?method=seccode&'+Math.random();
}
</script>
	</body>
</html>