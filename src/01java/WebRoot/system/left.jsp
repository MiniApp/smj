<%@ page contentType="text/html;charset=UTF-8" %>
<div id="main">
   	<div id="app_sidebar">
   	<ul class="app_list">
		<li><img src="${ctx}//images/space.gif" class="icon3"/><a href="systemAction.do?method=merchant_manager">商户管理</a></li>
		<li><img src="${ctx}//images/space.gif" class="icon2"/><a href="systemAction.do?method=cateory_manager">商品种类管理</a></li>
	   	<li><img src="${ctx}//images/space.gif" class="icon7"/><a href="systemAction.do?method=customer_manager">顾客管理</a></li>
	   	<li><img src="${ctx}//images/space.gif" class="icon4"/><a href="systemAction.do?method=find_bill">订单查询</a></li>
    </ul>
    <ul class="app_list topline">
    	<li><img src="${ctx}//images/space.gif" class="icon9"/><a href="systemAction.do?method=logout">退出系统</a></li>
    </ul>
    </div>
</div>