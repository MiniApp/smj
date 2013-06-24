<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>尚佰味网 - 天津外卖|网上订餐|快餐网|盒饭便当配送</title>
<meta name="Description" content="尚佰味网为您提供丰富的外卖,盒饭菜谱，您可以通过网上订餐，电话订餐等方式订到喜欢的饭菜。为您奉献天津24小时送餐业务。使您随时随地能吃上可口的饭菜。" />
<meta name="Keywords" content="sunbyway,天津快餐,天津外卖,天津订餐,天津送餐,天津美食,天津小吃,外卖网,送餐网,快餐,盒饭,网上订餐,天津24小时外卖,外卖电话,盒饭配送,快餐外卖,快餐送餐,尚佰味网,尚佰味" />
<link rel="shortcut icon" href="${ctx}/favicon.ico"/>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/commonStore.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/addStore.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="top.jsp" %>
<div id="wrap">
	<%@include file="left.jsp" %>
   	<div id="mainarea">
   		<div id="addStore">
   			<span class="openStore icon7">开通店铺</span>
   			<form action="" method="post">
   				<ul>
   					<li>
   						<span class="addStoreInfoName">店铺LOGO：</span>
   						<input class="inputStyle"  type="file" name="" />
   					</li>
   					<li>
   						<span class="addStoreInfoName">店铺名称：</span>
   						<input class="inputStyle"  type="text" name="" />
   					</li>
   					<li>
   						<span class="addStoreInfoName">店铺类型：</span>
   						<input type="radio" name="" />超市
   						<input type="radio" name="" />餐饮
   					</li>
   					<li>
   						<span class="addStoreInfoName">店铺开关：</span>
   						<input type="radio" name="" />营业
   						<input type="radio" name="" />休息
   					</li>
   					<li>
   						<span class="addStoreInfoName">起送金额：</span>
   						<input class="inputStyle"  type="text" name="" />
   					</li>
   					<li>
   						<span class="addStoreInfoName">配送费用：</span>
   						<input class="inputStyle"  type="text" name="" />
   					</li>
   					<li>
   						<span class="addStoreInfoName">联系人：</span>
   						<input class="inputStyle"  type="text" name="" />
   					</li>
   					<li>
   						<span class="addStoreInfoName">客服电话：</span>
   						<input class="inputStyle"  type="text" name="" />
   					</li>
   					<li>
   						<span class="addStoreInfoName">客服QQ：</span>
   						<input class="inputStyle"  type="text" name="" />
   					</li>
   					
   				</ul>
   			</form>
   		</div>
   	</div>
</div>
<%@include file="footer.jsp" %>
<script type="text/javascript">
	setTimeout("loadsysmes()",5000);
	function check(){
		var mobile = document.getElementById("mobile").value;
		 
		var name = document.getElementById("name").value;
		if(name.length<2 || name.length>10){
			alert("真实姓名非法！");
			return;
		}
		 
		if(mobile.length<11){
			alert("手机号码非法！");
			return;
		}
		document.userform.submit();
	}
</script>
</body>
</html>