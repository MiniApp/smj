<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>宋美佳 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="宋美佳为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
	<link rel="shortcut icon" href="${ctx}/favicon.ico" />
	<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/user.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.add_tab{margin:0px auto;width:100%;border:#b8d6e7 1px solid;border-bottom-width:0px;}
.add_tab td{border-bottom:#b8d6e7 1px solid;line-height:30px;padding-left:10px;font-size:12px;}
.add_tr{background:#FFF;}
.add_tr_on{background:#f2fafd;}
</style>
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/user/left.jsp" %>
   	<div id="mainarea">
   		<h2 class="title"><img src="${ctx}/images/space.gif" class="icon4"/>我的收藏</h2>
		<div class="normgraybox">
        	<div class="titnav">
            	<div class="lft"></div>
                <div class="tit">收藏的店铺</div>
                <div class="rgt"></div>
                <div class="clr"></div>
        	</div>
        	<div class="connav">
        	<table cellspacing="0" cellpadding="0" class="add_tab">
        	<c:choose>
			<c:when test="${!empty favorites}">
			<c:forEach items="${favorites}" var="favorite">
			<tr class="add_tr" onmouseover="this.className='add_tr_on';" onmouseout="this.className='add_tr';">
				<td width="180px">
					<c:if test="${favorite.onoff eq 'N'}"><img src="${ctx}/images/storeoff.gif" border="0" alt="" title="休息中" align="absmiddle" style="margin-top:-2px;" /></c:if>
        			<c:if test="${favorite.onoff eq 'Y'}"><img src="${ctx}/images/storeon.gif" border="0" alt="" title="营业中" align="absmiddle" style="margin-top:-2px;" /></c:if>
					<c:if test="${favorite.store_state eq 'Y'}"><a href="${ctx}/userAction.do?method=dishList&id=${favorite.id}">${sugu:disposeLongStr(10,favorite.store_name)}</a></c:if>
					<c:if test="${favorite.store_state eq 'N'}">${sugu:disposeLongStr(10,favorite.store_name)}</c:if>
				</td>
				<td width="150px">
					<c:if test="${favorite.credit eq 'Y'}"><img src="${ctx}/images/cxbz.gif" alt="" title="诚信保证" /></c:if>
        			<c:if test="${favorite.integral>0}"><img src="${ctx}/images/jifen.gif" alt="" title="积分赠送" /></c:if>
					<img src="${ctx}${sugu:rankPic(favorite.rank,'S')}" alt="" title="${favorite.rank}诚信积分" border="0">
				</td>
				<td>${sugu:disposeLongStr(20,favorite.address)}</td>
				<td width="30px">
				<c:if test="${favorite.store_state eq 'Y'}">正常</c:if>
				<c:if test="${favorite.store_state eq 'N'}">停业</c:if>
				</td>
				<td width="90px">
				<c:if test="${favorite.store_state eq 'Y'}"><a href="${ctx}/userAction.do?method=dishList&id=${favorite.id}">进入店铺</a> | </c:if>
				<a href="${ctx}/userAction.do?method=delFavorite&id=${favorite.favoriteid}">删除</a>
				</td>
			</tr>
			</c:forEach>
			</c:when>
			<c:otherwise><tr><td>未找到任何收藏店铺！</td></tr></c:otherwise>
			</c:choose>
			</table>
			</div>
            <div class="botnav">
            	<div class="lft"></div>
                <div class="rgt"></div>
                <div class="clr"></div>
            </div>
        </div>
   	</div>
</div>
</td></tr></table>
<%@include file="/user/footer.jsp" %>
<script type="text/javascript">setTimeout("loadsysmes()",5000);</script>
</body>
</html>