<%@ page contentType="text/html;charset=UTF-8"%>
<h2 class="title"><img src="${ctx}/images/space.gif" class="icon1"/>个人资料</h2>
<div class="tabs_header">
	<ul class="tabs">
		<li<c:if test="${tag eq 'user'}"> class="active"</c:if>><a href="${ctx}/userAction.do?method=user"><span>个人资料</span></a></li>
		<!--<li<c:if test="${tag eq 'integral'}"> class="active"</c:if>><a href="${ctx}/userAction.do?method=integral"><span>我的积分</span></a></li>
		<li<c:if test="${tag eq 'rank'}"> class="active"</c:if>><a href="${ctx}/userAction.do?method=turnto&sign=2"><span>诚信等级</span></a></li>  -->
	</ul>
</div>