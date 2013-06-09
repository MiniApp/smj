<%@ page contentType="text/html;charset=UTF-8" %>
<div id="main">
   	<div id="app_sidebar">
   	<ul class="app_list">
   		<c:if test="${sGlobal.smj_userid>0}">
    	<li><img src="${ctx}/images/space.gif" class="icon1"/><a href="${ctx}/userAction.do?method=user">个人资料</a></li>
     	<li><img src="${ctx}/images/space.gif" class="icon2"/><a href="${ctx}/userAction.do?method=allAddress&type=Y">收货地址</a></li>
     	<li><img src="${ctx}/images/space.gif" class="icon3"/><a href="${ctx}/userAction.do?method=billList">我的订单</a></li>
     	<li><img src="${ctx}/images/space.gif" class="icon4"/><a href="${ctx}/userAction.do?method=favorite">我的收藏</a></li>
     	<li><img src="${ctx}/images/space.gif" class="icon5"/><a href="${ctx}/userAction.do?method=rank">我的评价</a></li>
     	<li><img src="${ctx}/images/space.gif" class="icon6"/><a href="${ctx}/userAction.do?method=leavewordList&type=Y">我的留言</a></li>
     	<li><img src="${ctx}/images/space.gif" class="icon7"/><a href="${ctx}/userAction.do?method=changeList">兑换记录</a></li>
     	</c:if>
    </ul>
    <ul class="app_list topline"></ul>
    </div>
</div>