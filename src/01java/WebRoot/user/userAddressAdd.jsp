<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" /><link rel="shortcut icon" href="${ctx}/favicon.ico" />
		<link href="css/global.css" rel="stylesheet" type="text/css" />
		<link href="css/user.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
.billnav {
	margin: 0 auto 10px;
	width: 750px;
	height: 385px;
	line-height: 40px;
	padding: 0 5px;
	background: #fffdd7;
	border: #fad66d 1px solid;
	color: #000;
}

.add_tab {
	margin: 0px auto;
	width: 100%;
	border: #b8d6e7 1px solid;
	border-bottom-width: 0px;
}

.add_tab td {
	border-bottom: #b8d6e7 1px solid;
	line-height: 30px;
	padding-left: 10px;
	font-size: 12px;
}

.add_tr {
	background: #FFF;
}

.add_tr_on {
	background: #f2fafd;
}
</style>
	</head>
	<body>
		<%@include file="/user/top1.jsp"%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="mainbox">
			<tr>
				<td>
					<div id="wrap">
						<%@include file="/user/left.jsp"%>
						<div id="mainarea">
							<h2 class="title">
								<img src="../images/space.gif" class="icon2" />
								收货地址
							</h2>
							<div class="billnav">
								<form action="#"  method="post" name="addform">
									<table cellspacing="0" cellpadding="0" class="formtable">
										<tr>
											<td width="60px" valign="top">
												请选择配送地址:
											</td>
											<td colspan="3">
											</td>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td width="60px">
												&nbsp;
											</td>
											<td align="center">
												所属省
											</td>
											<td align="center">
												所属市
											</td>
											<td align="center">
												所属区
											</td>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td width="60px">
												&nbsp;
											</td>
											<td align="center">
												<select style="width: 80px;" name="borough_no"
													id="borough_no" size="8" onclick="querystr();">
													<c:forEach var="st" items="${province}">
														<option value="${st.classId}">
															${st.name}
														</option>
													</c:forEach>
												</select>
											</td>
											<td align="center">
												<select style="width: 150px;" name="street_no"
													id="street_no" size="8" onclick="querycity();"></select>
											</td>
											<td align="center">
												<select style="width: 200px;" name="signs_all"
													id="signs_all" size="8" onclick="setAddressValue();"></select>
											</td>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td width="60px">
												详细地址：
											</td>
											<td colspan="3">
												<input name="address" id="address" type="text" size="40"
													maxlength="255" class="t_input" />
												*50字以内
											</td>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td width="60px">
												设为默认：
											</td>
											<td colspan="3">
												<input type="radio" name="isdefault" value="Y" />
												&nbsp;是
												<input type="radio" name="isdefault" value="N" 
													checked="checked" />
												&nbsp;否
											</td>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td width="60px"></td>
											<td colspan="3">
												<input type="button" onclick="check();" name="pwdsubmit"
													value="保存地址" class="submit" />
											</td>
											<td>
												&nbsp;
											</td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<%@include file="/commons/footer.jsp"%>
		<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript">
	setTimeout("loadsysmes()",5000);
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
	
	function check(){
		var address = document.getElementById('address').value;
		if(address == ""){
		    alert("请输入配送地址");
		}
		
		var defaults = document.getElementsByName('isdefault');
		for(var i=0;i<defaults.length;i++){
			if(defaults[i].checked){
			 var v = defaults[i].value;
			}
		}
	
			   $(function(){
			   $.ajax({
			     async:false,
			     cache:false,
			     type:'POST',
			     dataType:"json",
			     data:{address:address,isdefault:v},
			     url :"${ctx}/userAction.do?method=addAddresss",
			     success:function(){
			           //把后台封装好的简单Json格式赋给treeNodes
			           alert("添加新地址成功!");
			           window.location.href ="userAction.do?method=userAddress";
			     } 
			   });
			   });
			
	}
</script>
	</body>
</html>