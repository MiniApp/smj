<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
	<meta name="Description" content=" " />
	<meta name="Keywords" content="songmeijia,  "/>
	<link rel="shortcut icon" href="favicon.ico"/> 
		<link href="css/global.css" rel="stylesheet" type="text/css" />
		<link href="css/main.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
<%@include file="/user/top1.jsp" %>
<div class="content">

<div class="main_con1">
<div class="bill_addr">
<ul>
<li>送货地址</li>
<li>
    <div id="addr1" class="addr">
       <ul>
           <li>陈文磊（收） 默认地址</li>
           <li>地址</li>
           <li><input type="checkbox" /></li>
       </ul>
    </div>
    <div id="addr2" class="addr"><ul>
           <li>陈文磊（收） 默认地址</li>
           <li>地址</li>
           <li><input type="checkbox" /></li>
       </ul></div>
    <div id="addr3" class="addr"><ul>
           <li>陈文磊（收） 默认地址</li>
           <li>地址</li>
           <li><input type="checkbox" /></li>
       </ul></div>
</li>
</ul>
</div>
</div>

<div class="main_con1">
<input type="button" value="增加新地址" onclick="" />
<div class="add_newadd">
<ul>
<li>*省 市  区</li>
<li>街道地址：*<input type="text" height="30" /></li>
<li>收货人姓名：*<input type="text" /></li>
<li>送货时间:*<input type="text" /></li>
<li>联系电话：*<input type="text" /></li>
<li><input type="button" value="确定" /><input type="button" value="取消" /></li>
</ul>
</div>
</div>

<div class="main_con1">
<div class="bill_style">
<ul>
     <li>确认订单信息</li>
     <li>店铺：XXX&nbsp;&nbsp;送货范围:XXX&nbsp;&nbsp;起送金额：XXX&nbsp;&nbsp;&nbsp;</li>
     <li>
          <ul>
          <li>动态生成数据</li>
           <li>商品名称&nbsp;商品规格&nbsp;商品尺寸&nbsp;单据(元)&nbsp;商品数量&nbsp;附加费&nbsp;小计&nbsp;送货时间</li>
           <li>燕京啤酒&nbsp;650M&nbsp;瓶&nbsp;￥5.00&nbsp;<input type="text" value="1" size="2"/>+&nbsp;￥9.00&nbsp;￥5.00&nbsp;2013年7月1日</li>
           </ul>
     </li>
     <li>补充说明<input type="text" size="20" />&nbsp;&nbsp;支付方式：货到付款</li>
     <li style="text-align:center;">实付金额：0.00&nbsp;&nbsp;所获积分:19</li>
     <li style="text-align:right;"><input type="button" value="生成订单"/></li>
</ul>
</div>
</div>

</div>
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script> 
<script type="text/javascript" src="js/jquery.tabs.js"></script> 

</body>
</html>