<%@ page contentType="text/html;charset=UTF-8" %>
<div id="main">
   	<div id="app_sidebar">
   	<ul class="app_list">
   		<li><img src="${ctx}/images/space.gif" class="icon8"/><a href="${ctx}/merchantAction.do?method=orderManager">订单管理</a></li>
    	<li><img src="${ctx}/images/space.gif" class="icon2"/><a href="${ctx}/merchantAction.do?method=getAnnounceList">公告管理</a></li>
    	<li><img src="${ctx}/images/space.gif" class="icon4"/><a href="${ctx}/merchantAction.do?method=productManager">商品管理</a></li>
    	<li><img src="${ctx}/images/space.gif" class="icon5"/><a href="${ctx}/merchantAction.do?method=appManager">评价管理</a></li>
     	<li><img src="${ctx}/images/space.gif" class="icon6"/><a href="${ctx}/merchantAction.do?method=leaveWordManager">留言管理</a></li>
    </ul>
    <ul class="app_list topline">
    	<li><img src="${ctx}/images/space.gif" class="icon7"/><a href="${ctx}/merchantAction.do?method=addStore">开通店铺</a></li>
    	<li><img src="${ctx}/images/space.gif" class="icon3"/><a href="${ctx}/merchantAction.do?method=getStoreInfo">店铺信息</a></li>
    	<li><img src="${ctx}/images/space.gif" class="icon1"/><a href="${ctx}/merchantAction.do?method=getMerchantInfo">商户信息</a></li>
    	<li><img src="${ctx}/images/space.gif" class="icon6"/><a href="${ctx}/merchantAction.do?method=getPassword">更改密码</a></li>
    	<li><img src="${ctx}/images/space.gif" class="icon9"/><a href="#" onclick="closePage()">退出系统</a></li>
    </ul>
    </div>
</div>
<script>
function closePage(){
      if(confirm("确认退出商户管理页面")){
         window.location.href="${ctx}/merchantAction.do?method=logout";
      }
}
</script>