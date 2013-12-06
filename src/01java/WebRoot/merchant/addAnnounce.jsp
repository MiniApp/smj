<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" /><link rel="shortcut icon" href="${ctx}/favicon.ico" />
	<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/merchant.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
select {
	margin-right: 2px;
	height: 268px;
}
</style>
		<script type="text/javascript" src="${ctx}/ckeditor/ckeditor.js"></script>
		<script type="text/javascript">
function check(){
	var title = document.getElementById("title").value;
	var message = document.getElementById("editor1").value;
	if(title.length<=0){
		alert("公告标题未填写！");
		return;
	}
	if(message == "")
	{
	     alert("公告内容未填写!");
	     return;
	}
	document.userform.submit();
}
</script>
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
								公告发布
							</h2>
							<form action="${ctx}/merchantAction.do?method=addAnnounce&action=save"
								method="post" class="c_form" name="userform">
								<table cellspacing="0" cellpadding="0" class="formtable">
									<tr>
										<th style="width: 10em;">
											公告标题:
										</th>
										<td>
											<input type="text" name="title" id="title" maxlength="50"
												size="50" class="t_input" />
										</td>
										<td></td>
									</tr>
									<tr>
										<td colspan="2" align="center">
											<textarea cols="60" id="editor1" name="editor1" rows="10"></textarea>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<input type="button" name="button" onclick="check();"
												value=" 保 存 " class="submit" />
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<%@include file="footer.jsp"%>
	</body>
</html>