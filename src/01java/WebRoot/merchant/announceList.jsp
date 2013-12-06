<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" /><link rel="shortcut icon" href="${ctx}/favicon.ico">
	<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/merchant.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<%@include file="/user/top.jsp"%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="mainbox">
			<tr>
				<td>
					<div id="wrap">
						<%@include file="/merchant/left.jsp"%>
						<div id="mainarea">
							<h2 class="title">
								<img src="${ctx}/images/space.gif" class="icon2" />
								公告管理
							</h2>
							<form action="${ctx}/merchantAction.do?method=addAnnounce" method="post"
								name="myform">
								<table cellspacing="0" cellpadding="0" class="listtable">
									<caption>
										<h2>
											公告列表&nbsp;
											<input type="button" class="submit" onclick="set_sign();"
												value="发布公告" />
										</h2>
									</caption>
									<c:choose>
										<c:when test="${!empty affl}">
											<thead>
												<tr class="title">
													<td>
														标题
													</td>
													<td>
														内容
													</td>
													<td align="center">
														发布日期
													</td>
													<td align="center">
														操作
													</td>
												</tr>
											</thead>
											<c:forEach items="${affl}" var="aff">
												<tr class=line>
													<td>
														${aff.title}
													</td>
													<td>
														${aff.content}
													</td>
													<td align="center">
														${aff.date}
													</td>
													<td align="center">
														【
														<a
															href="${ctx}/merchantAction.do?method=operaf&st=del&id=${aff.affiId}">删除</a>】
													</td>
												</tr>
											</c:forEach>
											<tr>
												<td colspan="3">
													${smj:htmlPages(p_no,p_num)}
												</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="3">
													未找到任何记录
												</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
							</form>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<%@include file="footer.jsp"%>
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
	function set_sign(){
		document.location.href="${ctx}/merchantAction.do?method=addAnnounce1";
	}
</script>
	</body>
</html>