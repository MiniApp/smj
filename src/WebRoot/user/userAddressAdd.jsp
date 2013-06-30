<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>宋美佳 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="宋美佳为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
	<link rel="shortcut icon" href="${ctx}/favicon.ico" />
		<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/css/user.css" rel="stylesheet" type="text/css" />
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
		<%@include file="/user/top.jsp"%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="mainbox">
			<tr>
				<td>
					<div id="wrap">
						<%@include file="/user/left.jsp"%>
						<div id="mainarea">
							<h2 class="title">
								<img src="${ctx}/images/space.gif" class="icon2" />
								收货地址
							</h2>
							<div class="billnav">
								<form action="${ctx}/userAction.do?method=addAddress"
									method="post" name="addform">
									<input type="hidden" name="token" value="${token}" />
									<table cellspacing="0" cellpadding="0" class="formtable">
										<tr>
											<td width="60px">
												地址类型：
											</td>
											<td colspan="3">
												<input name="type" type="radio" value="0" checked="checked" />
												&nbsp;公司
												<input name="type" value="1" type="radio" />
												&nbsp;家里
											</td>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td width="60px" valign="top">
												所在楼宇：
											</td>
											<td colspan="3">
												<span class="font_col_red">*&nbsp;&nbsp;如果您所在楼宇不在楼宇列表内，可以选择离您最近的商业楼宇！</span>
												<input type="hidden" id="pyid" name="pyidv"/>	
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
												<select style="width: 80px;" name="province_id"
													id="province_id" size="8" onclick="findregion();">
													<c:forEach var="st" items="${region}">
														<option value="${st.id}">
															${st.name}
														</option>
													</c:forEach>
												</select>
											</td>
											<td align="center">
												<select style="width: 150px;" name="city_id"
													id="city_id" size="8" onclick="querycity();"></select>
											</td>
											<td align="center">
												<select style="width: 200px;" name="city_all"
													id="city_all" size="8" onclick="findcityall();"></select>
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
												<input name="isdefault" type="radio" value="Y" />
												&nbsp;是
												<input name="isdefault" value="N" type="radio"
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
							<div class="normgraybox">
								<div class="titnav">
									<div class="lft"></div>
									<div class="tit">
										有效地址
									</div>
									<div class="rgt"></div>
									<div class="clr"></div>
								</div>
								<div class="connav">
									<table cellspacing="0" cellpadding="0" class="add_tab">
								
										<c:choose>
											<c:when test="${!empty addresses}">
												<c:forEach items="${addresses}" var="address">
													<c:if test="${address.isdefault eq 'Y'}">
														<tr class="add_tr_on">
													</c:if>
													<c:if test="${address.isdefault eq 'N'}">
														<tr class="add_tr"
															onmouseover="this.className='add_tr_on';"
															onmouseout="this.className='add_tr';">
													</c:if>
													<td width="50%">
														${address.address}
													</td>
													<td width="15%">
														<c:if test="${address.type eq 0}">公司地址</c:if>
														<c:if test="${address.type eq 1}">家庭地址</c:if>
													</td>
													<td width="15%">
														<c:if test="${address.isdefault eq 'Y'}">默认地址</c:if>
													</td>
													<td width="20%">
														<c:if test="${address.isdefault eq 'N'}">
															<a
																href="${ctx}/userAction.do?method=changDftAdd&type=Y&id=${address.id}">设为默认</a> | <a
																href="${ctx}/userAction.do?method=delAddress&id=${address.id}">删除</a>
														</c:if>
													</td>
												</c:forEach>
											</c:when>
											<c:otherwise>
								
												<tr>
													<td>
														未找到有效收货地址
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</table>
								</div>
								<div class="botnav">
									<div class="lft"></div>
									<div class="rgt"></div>
									<div class="clr"></div>
								</div>
							</div>

						</div>
					</div>
				</td>
			</tr>
		</table>
		<%@include file="/user/footer.jsp"%>
		<script type="text/javascript">
	setTimeout("loadsysmes()",5000);
function findregion()
	{
	   var province_id = document.getElementById("province_id").value;
	   ajaxresponse1('province_id','method=queryregion&p_classid=' + encodeURIComponent(province_id));
	   ajaxresponseregionname('province_id','method=queryregionname&p_classid='+ encodeURIComponent(province_id),1);
	}
	
    function ajaxresponse1(objname, data) {
		var ajax = new Ajax(objname,'${ctx}');
		
		ajax.getSend('${ctx}/merchantAction.do?'+data,function(s){
			var xml = new Xml(s);
			var items = xml.getElements("region");
			document.getElementById("city_id").options.length = 0;
			for(i=0;i<items.length;i++){
				var varItem = new Option(items[i].childNodes[0].nodeValue, items[i].attributes[0].nodeValue);      
        		document.getElementById("city_id").options.add(varItem);
			}
		});
	}
	
	function querycity()
	{
	   var city_id = document.getElementById("city_id").value;
	   ajaxresponse11('province_id','method=queryregion&p_classid=' + encodeURIComponent(city_id));
	   ajaxresponseregionname('province_id','method=queryregionname&p_classid='+ encodeURIComponent(city_id),2);
	}
	
	function ajaxresponse11(objname, data) {
		var ajax = new Ajax(objname,'${ctx}');
		
		ajax.getSend('${ctx}/merchantAction.do?'+data,function(s){
			var xml = new Xml(s);
			var items = xml.getElements("region");
			document.getElementById("city_all").options.length = 0;
			for(i=0;i<items.length;i++){
				var varItem = new Option(items[i].childNodes[0].nodeValue, items[i].attributes[0].nodeValue);      
        		document.getElementById("city_all").options.add(varItem);
			}
		});
	}
	
	function findcityall()
	{
	    var city_all = document.getElementById('city_all').value;
	    ajaxresponseregionname('province_id','method=queryregionname&p_classid='+ encodeURIComponent(city_all),2);
	}
	
	function ajaxresponseregionname(objname, data,param) {
		var ajax = new Ajax(objname,'${ctx}');
		
		ajax.getSend('${ctx}/merchantAction.do?'+data,function(s){
			var xml = new Xml(s);
			var items = xml.getElements("regionname");
			    for(i = 0;i<items.length;i++)
			    {
			        if(param == 1)
			        {
			             document.getElementById('address').value = items[i].attributes[0].nodeValue;
			        }
			        else if(param == 2)
			        {
			             document.getElementById('address').value += items[i].attributes[0].nodeValue;
			        }
			    }
		});
	   }
	
	function check(){
		var province_id = document.getElementById('province_id').value;
		var city_id = document.getElementById('city_id').value;
		var city_all = document.getElementById("city_all").value;
		if(province_id==""){
			alert("所属省未选择!");
			return;
		}
		if(city_id ==""){
			alert("所属市未选择!");
			return;
		}
		if(city_all==""){
			alert("所属区未选择!");
			return;
		}
		document.addform.submit();
	}
</script>
	</body>
</html>