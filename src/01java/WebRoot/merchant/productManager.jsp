<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
<link rel="shortcut icon" href="${ctx}/favicon.ico"/>
	<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<link href="css/merchant.css" rel="stylesheet" type="text/css" />	
	<link rel="stylesheet" href="public/plugin/listUI/listUI.css" type="text/css" />
	<style type="text/css">
		.add{width:500px;height:200px; border:2px solid #CCC;}
		.remove{width:500px;height:200px; border:1px solid RED;}
	</style>
	 <script type="text/javascript" src="${ctx}/public/js/jquery-1.10.2.js"></script>
 <script type="text/javascript" src="${ctx}/public/plugin/listUI/comminfolistUI.js"></script>
 <script type="text/javascript">
 window.onload = init();
 
    function init(){
    $(document).ready(function () { 
			$("#commdInfo").listUI({
				title : "商品列表",// 是否包含标题
				url : '${ctx}/merchantAction.do?method=queryCommInfo', // ajax方式对应的url地址
				method : 'POST', // 数据发送方式
				dataType : 'json', // 数据加载的类型
				width : '800px',
				pageSize : 20,
				editMode : true,
				showSort : [{
					name : '商品名称',
					sortName : 'commdName',
					sortDes : 'desc'
				    }, {
					name: '价格',
					sortName:'salePrice',
					sortDes : 'desc'
				}]
			});
		}); 
     }
     
     function findCommInfo(){
     
     var onedimension = document.getElementById('searchProduct').value;
     
     if(onedimension == ""){
          init();
     }
     else{     
          $(document).ready(function () { 
			$("#commdInfo").listUI({
				title : "商品列表",// 是否包含标题
				url : '${ctx}/merchantAction.do?method=queryCommInfo&onedimension='+onedimension, // ajax方式对应的url地址
				method : 'POST', // 数据发送方式
				dataType : 'json', // 数据加载的类型
				width : '800px',
				pageSize : 20,
				editMode : true,
				showSort : [{
					name : '商品名称',
					sortName : 'commdName',
					sortDes : 'desc'
				    }, {
					name: '价格',
					sortName:'salePrice',
					sortDes : 'desc'
				}]
			});
		});
	  } 
    }
     
    function  clrInputValue(){
        var onedimension = document.getElementById('searchProduct');
        onedimension.value = "";
    }
     
 </script>
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/merchant/left.jsp" %>
   	<div id="mainarea">
   		<h2 class="title"><img src="${ctx}/images/space.gif" class="icon7"/>商品管理</h2>
   		<div class="navsort">

			<!--allsort end-->
			<div class="searcbox">
				<form id="searchForm" action="${ctx}/merchantAction.do?method=queryProduct" method="post">
										<input type="text" name="searchProduct" id="searchProduct"
											class="searcboxContent" value="请输入商品条码" onclick="clrInputValue()"/>
										<a class="searchButton" href="javascript:findCommInfo()"></a>
				</form>
			</div>
			<div class="addProductBox">
				<a class="addProduct" href="${ctx}/merchantAction.do?method=addProduct">添加商品</a>
			</div>
		</div>
		<div id="commdInfo"></div> 
		
   	</div>
</div>
</td></tr></table>
<%@include file="footer.jsp" %>
</body>
</html>