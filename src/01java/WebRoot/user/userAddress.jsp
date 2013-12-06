<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
	<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
	<link rel="shortcut icon" href="${ctx}/favicon.ico" />
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<link href="css/store.css" rel="stylesheet" type="text/css" />
	<link href="css/user.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top1.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/user/left.jsp" %>
   	<div id="mainarea">
   	<h2 class="title"><img src="images/space.gif" class="icon3"/>我的订单</h2>
<form action="userAction.do?method=getUserOrderList" method="post" name="myform">
<div class="billnav">
	<a class="addUserAddress" href="userAction.do?method=addUserAddress">增加</a>
</div>
<div>
    <table id="bill_table" width="100%" border="1" bordercolor="#cccccc" cellspacing="0" cellpadding="0" class="caicardetail">
      <thead>
      <tr>
        <td class="tot" width="8%" align="center"></td>
        <td class="tit" width="72%" align="center">地址</td>
        <td class="tit" width="20%" align="center">操作</td>
      </tr>
      </thead>
      <c:forEach items="${address}" var="add">
      <tr>
        <td><input type="text" id="address" name="address" value="${add.id},${add.custId}" style="visibility:hidden"/></td>
      	<td>${add.userAdd}</td>
      	<td>
      	<input type="radio" name="address" <c:if test="${add.isDefault eq 'Y'}">checked="checked"</c:if> onclick="changeDefaultAddress(${add.id},${add.custId})"/>设为默认地址
      	</td>
      </tr>
      </c:forEach>
    </table>
</div>
</form>
   	</div>
</div>
</td></tr></table>
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	setTimeout("loadsysmes()",5000);
	
	function changeDefaultAddress(id,custid){
	    var addr = id;
	    var cust_id = custid;
         
        $(function() {
	    $.ajax({
	     async:false,
	     cache:false,
	     type:'POST',
	     dataType:"json",
	     data:{addrid:parseInt(addr),cust_id:parseInt(cust_id)},
	     url : "userAction.do?method=setDefaultAddress",
	     success:function(){
	          alert("设置成功!");
	     } 
	   });
	   });
	}
	
</script>
</body>
</html>