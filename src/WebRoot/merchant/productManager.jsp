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
	<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
	<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/merchant.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	(function($){
		$.fn.hoverForIE6=function(option){
			var s=$.extend({current:"hover",delay:10},option||{});
			$.each(this,function(){
				var timer1=null,timer2=null,flag=false;
				$(this).bind("mouseover",function(){
					if (flag){
						clearTimeout(timer2);
					}else{
						var _this=$(this);
						timer1=setTimeout(function(){
							_this.addClass(s.current);
							flag=true;
						},s.delay);
					}
				}).bind("mouseout",function(){
					if (flag){
						var _this=$(this);timer2=setTimeout(function(){
							_this.removeClass(s.current);
							flag=false;
						},s.delay);
					}else{
						clearTimeout(timer1);
					}
				});
			});
		};
	})(jQuery);
	</script>
	<script type="text/javascript">
		function jquerySubmit() {
			$('#searchForm').submit();
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

			<div class='allsort'>
				
				<div class='mt'><strong><a href="${ctx}/merchantAction.do?method=getProductAllSort">全部商品分类</a></strong><div class='extra'>&nbsp;</div></div>
				
				<div class='mc'>
					<div class='item fore'>
						<span><h3><a href="http://www.17sucai.com/">家用电器</a></h3><s></s></span>
						<div class='i-mc'>
							<div class='close' onclick="$(this).parent().parent().removeClass('hover')"></div>
							<div class='subitem'>
								<dl>
									<dt>大家电</dt>
									<dd>
										<em><a href='http://www.17sucai.com/'>平板电视</a></em>
										<em><a href='http://www.17sucai.com/'>空调</a></em>
										<em><a href='http://www.17sucai.com/'>冰箱</a></em>
										<em><a href='http://www.17sucai.com/'>洗衣机</a></em>
										<em><a href='http://www.17sucai.com/'>热水器</a></em>
									</dd>
								</dl>
								<dl class='fore'>
									<dt>生活电器</dt>
									<dd>
										<em><a href='http://www.17sucai.com/'>电风扇</a></em>
										<em><a href='http://www.17sucai.com/'>冷风扇</a></em>
										<em><a href='http://www.17sucai.com/'>饮水机</a></em>
										<em><a href='http://www.17sucai.com/'>加湿器</a></em>
										<em><a href='http://www.17sucai.com/'>吸尘器</a></em>
									</dd>
								</dl>
							</div>
						</div>
					</div>
					
					<div class='item'>
						<span><h3><a href="http://www.17sucai.com/">手机、数码</a></h3><s></s></span>
						<div class='i-mc'>
							<div class='close' onclick="$(this).parent().parent().removeClass('hover')"></div>
							<div class='subitem'>
								<dl class='fore'>
									<dt>手机通讯</dt>
									<dd>
										<em><a href='http://www.17sucai.com/'>手机</a></em>
										<em><a href='http://www.17sucai.com/'>对讲机</a></em>
									</dd>
								</dl>
								<dl>
									<dt>运营商</dt>
									<dd>
										<em><a href='http://www.17sucai.com/'>购机送费</a></em>
										<em><a href='http://www.17sucai.com/'>0元购机</a></em>
										<em><a href='http://www.17sucai.com/'>选号入网</a></em>
									</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div><!--allsort end-->
			<div class="searcbox">
				<form id="searchForm" action="${ctx}/merchantAction.do?method=queryProduct" method="post">
					<input type="text" name="searchProduct" class="searcboxContent"/>
					<a class="searchButton" herf="javascript:jquerySubmit()"></a>
				</form>
			</div>
			<div class="addProductBox">
				<a class="addProduct" herf="javascript:jquerySubmit()">添加商品</a>
			</div>
		</div>	
		<div class="productList">
			<div class="productInfo">
				<div class="productImg"></div>
				<div class="productOperation">
					<a href="${ctx}/merchantAction.do?method=updateProduct&productId=1">修改</a>
					<a href="${ctx}/merchantAction.do?method=deleteProduct&productId=1">删除</a>
				</div>
			</div>
			<div class="productInfo">
				<div class="productImg"></div>
				<div class="productOperation">
					<a href="${ctx}/merchantAction.do?method=updateProduct&productId=1">修改</a>
					<a href="${ctx}/merchantAction.do?method=deleteProduct&productId=1">删除</a>
				</div>
			</div>
			<div class="productInfo">
				<div class="productImg"></div>
				<div class="productOperation">
					<a href="${ctx}/merchantAction.do?method=updateProduct&productId=1">修改</a>
					<a href="${ctx}/merchantAction.do?method=deleteProduct&productId=1">删除</a>
				</div>
			</div>
			<div class="productInfo">
				<div class="productImg"></div>
				<div class="productOperation">
					<a href="${ctx}/merchantAction.do?method=updateProduct&productId=1">修改</a>
					<a href="${ctx}/merchantAction.do?method=deleteProduct&productId=1">删除</a>
				</div>
			</div>
			<div class="productInfo">
				<div class="productImg"></div>
				<div class="productOperation">
					<a href="${ctx}/merchantAction.do?method=updateProduct&productId=1">修改</a>
					<a href="${ctx}/merchantAction.do?method=deleteProduct&productId=1">删除</a>
				</div>
			</div>
			<div class="productInfo">
				<div class="productImg"></div>
				<div class="productOperation">
					<a href="${ctx}/merchantAction.do?method=updateProduct&productId=1">修改</a>
					<a href="${ctx}/merchantAction.do?method=deleteProduct&productId=1">删除</a>
				</div>
			</div>
			<div class="productInfo">
				<div class="productImg"></div>
				<div class="productOperation">
					<a href="${ctx}/merchantAction.do?method=updateProduct&productId=1">修改</a>
					<a href="${ctx}/merchantAction.do?method=deleteProduct&productId=1">删除</a>
				</div>
			</div>
			<div class="productInfo">
				<div class="productImg"></div>
				<div class="productOperation">
					<a href="${ctx}/merchantAction.do?method=updateProduct&productId=1">修改</a>
					<a href="${ctx}/merchantAction.do?method=deleteProduct&productId=1">删除</a>
				</div>
			</div>
			<div class="productInfo">
				<div class="productImg"></div>
				<div class="productOperation">
					<a href="${ctx}/merchantAction.do?method=updateProduct&productId=1">修改</a>
					<a href="${ctx}/merchantAction.do?method=deleteProduct&productId=1">删除</a>
				</div>
			</div>
			<div class="productInfo">
				<div class="productImg"></div>
				<div class="productOperation">
					<a href="${ctx}/merchantAction.do?method=updateProduct&productId=1">修改</a>
					<a href="${ctx}/merchantAction.do?method=deleteProduct&productId=1">删除</a>
				</div>
			</div>
			<div class="productInfo">
				<div class="productImg"></div>
				<div class="productOperation">
					<a href="${ctx}/merchantAction.do?method=updateProduct&productId=1">修改</a>
					<a href="${ctx}/merchantAction.do?method=deleteProduct&productId=1">删除</a>
				</div>
			</div>
		</div>
		<script type="text/javascript"> 
		$(".allsort").hoverForIE6({current:"allsorthover",delay:200});
		$(".allsort .item").hoverForIE6({delay:150});
		</script>
   	</div>
</div>
</td></tr></table>
<%@include file="footer.jsp" %>
</body>

</html>