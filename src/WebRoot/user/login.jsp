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
	<link href="${ctx}/css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
 
<form id="loginform" name="loginform" action="${ctx}/userAction.do?method=login" method="post" class="c_form">
	<table cellpadding="0" cellspacing="0" class="formtable">
		<caption>
			<h2>请登录</h2>
			<p>如果您在本站已拥有帐号，请使用已有的帐号信息直接进行登录即可，不需重复注册。</p>
		</caption>
		<tbody>
			<tr>
				<th width="100"><label for="username">用户名</label></th>
				<td><input type="text" name="username" id="username" class="t_input" tabindex="2" value="${username}" /></td>
			</tr>
			<tr>
				<th width="100"><label for="password">密　码</label></th>
				<td><input type="password" name="password" id="password" class="t_input" tabindex="3" value="${password}" /></td>
			</tr>
			<tr>
				<th width="100">&nbsp;</th>
				<td><input type="checkbox" id="cookietime" name="cookietime" value="315360000" checked="checked" style="margin-bottom: -2px;"><label for="cookietime">下次自动登录</label></td>
			</tr>
		</tbody>
		<tr>
			<th width="100">&nbsp;</th>
			<td>
				<input type="hidden" name="refer" value="${refer}" />
				<input type="submit" id="loginsubmit" name="loginsubmit" value="登录" class="submit" tabindex="5" />
				<a href="${ctx}/userAction.do?method=turnto&sign=3" target="_blank">忘记密码?</a>
			</td>
		</tr>
	</table>
</form>
<div class="c_form">
	<table cellpadding="0" cellspacing="0" class="formtable">
		<caption>
			<h2>还没有注册吗？</h2>
			<p>如果还没有本站的通行帐号，请先注册一个属于自己的帐号吧。</p>
		</caption>
		<tr>
			<td><a href="${ctx}/uregister.jsp" style="display: block; margin: 0 110px 2em; width: 100px; border: 1px solid #486B26; background: #76A14F; line-height: 30px; font-size: 14px; text-align: center; text-decoration: none;"><strong style="display: block; border-top: 1px solid #9EBC84; color: #FFF; padding: 0 0.5em;">立即注册</strong></a></td>
		</tr>
	</table>
</div>
<%@include file="/commons/footer.jsp" %>
</body>
</html>