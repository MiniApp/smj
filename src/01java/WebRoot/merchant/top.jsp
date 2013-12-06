<%@ page contentType="text/html;charset=UTF-8"%>
<script type="text/javascript" src="${ctx}/js/sugu_ajax.js"></script>
<script language="javascript">
var is_show = false;
function loadsysmes(){
	/**
	var ajax = new Ajax('sysid','${ctx}');
	ajax.getSend('${ctx}/publicAction.do?method=sysmesnum&mathStamp='+Math.random(),function(s){
		var xml = new Xml(s);
		var result = xml.getElements("result");
		if(parseInt(result[0].attributes[0].nodeValue)>0){
			document.getElementById("mes_num").innerHTML = result[0].attributes[0].nodeValue;
			if(!is_show){tips_pop();playmusic();}
		}else{if(is_show){tips_pop();}}
	});
	setTimeout("loadsysmes()",20000);
	**/
}
function playmusic(){
	var url="${ctx}/sound/msg.wav";
	document.getElementById("bgsound").src=url;
}
function AddFavorite(sURL, sTitle){
    try{
        window.external.addFavorite(sURL, sTitle);
    }catch(e){
        try{
        	window.sidebar.addPanel(sTitle, sURL, "");
        }catch(e){
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
function tips_pop(){
  	var MsgPop=document.getElementById("sys_mes");
  	var popH=parseInt(MsgPop.style.height);
   	if (popH==0){
   		MsgPop.style.display="block";
  		show=setInterval("changeH('up')",2);
  		is_show = true;
   	} else {
   		hide=setInterval("changeH('down')",2);
   		is_show = false;
  	}
}
function changeH(str) {
 	var MsgPop=document.getElementById("sys_mes");
 	var popH=parseInt(MsgPop.style.height);
 	if(str=="up"){
  		if (popH<=150){
  			MsgPop.style.height=(popH+4).toString()+"px";
  		}else{
  			clearInterval(show);
  		}
 	}
 	if(str=="down"){
  		if (popH>=4){
  			MsgPop.style.height=(popH-4).toString()+"px";
  		}else{
  			clearInterval(hide);
  			MsgPop.style.display="none";
  		}
 	}
}
function sys_mes_scall(){
	document.getElementById("sys_mes").style.bottom="-"+document.documentElement.scrollTop+"px";
}

function scall(){
	sys_mes_scall();
}
	window.onscroll=scall;
	window.onresize=scall;
	window.onload=scall;
	window.onload=function(){    //加载
		document.getElementById('sys_mes').style.height='0px';
	}
</script>
<bgsound src="" loop="1" id="bgsound" />
<div id="sys_mes">
	<div class="title">
		消息提醒
		<span class="close" onclick="tips_pop()">X</span>
	</div>
	<div class="con">
		<ul>
			<li>
				<a href="#" target="_blank">您有新的消息</a>（
				<span id="mes_num">0</span>）
			</li>
		</ul>
	</div>
</div>
<div class="header">
	<div class="sidebox">
		<div class="lft">
			<p class="logo">
				<a href="http://www.sunbyway.com"><img
						src="${ctx}/images/logo.gif" alt="送每家" border="0" width="210"
						height="55" /> </a>
			</p>
			<p class="txt">
				打造成都本地最好的
				<span>生活服务平台</span>
			</p>
		</div>
		<div class="rgt">
			<div class="topbar">
				<c:choose>
					<c:when test="${sGlobal.smj_userid>0}">
   					${sGlobal.smj_name} 
   					<a href="${ctx}/userAction.do?method=integral"
							style="font-size: 11px; padding: 0 0 0 5px;"><img
								src="${ctx}/images/credit.gif" alt="" border="0" width="12"
								height="11">${sGlobal.smj_integral}</a>&nbsp;|
   					&nbsp;<a href="${ctx}/userAction.do?method=billList">我的订单</a>&nbsp;|
   					&nbsp;<a href="${ctx}/userAction.do?method=userinfo">个人中心</a>&nbsp;|
   					&nbsp;<a href="${ctx}/userAction.do?method=favorite">收藏夹</a>&nbsp;|
   					&nbsp;<a href="#"
							target="_blank">消息</a>&nbsp;|
   				</c:when>
					<c:otherwise>
   					亲，欢迎来宋美佳！
   					&nbsp;&nbsp;<a href="${ctx}/user/login.jsp">请登录</a>
   					&nbsp;<a href="${ctx}/uregister.jsp">免费注册</a>&nbsp;| 
   				</c:otherwise>
				</c:choose>
				&nbsp;
				<a href="${ctx}/mregister.jsp" class="col_f60">超市加盟</a>&nbsp;|&nbsp;
				<c:choose>
					<c:when test="${sGlobal.smj_userid>0}">
						<a href="#" onclick="closePage()">退出</a>
					</c:when>
					<c:otherwise>
						<a href="${ctx}/commons/help.jsp">帮助</a>
					</c:otherwise>
				</c:choose>
				&nbsp;-&nbsp;
				<a href="#"
					onclick="AddFavorite('http://www.5smj.com','送每家网 - 要方便，就上送每家！');"
					class="col_f60">[加入收藏]</a>
			</div>
			<div class="menubar">
				<ul>
					<li <logic:equal value="1" name="tag">class="sel"</logic:equal>>
						<a href="userAction.do?method=mlogin"><span>店铺管理</span> 
						</a>
					</li>
					<li <logic:equal value="3" name="tag">class="sel"</logic:equal>>
						<a href="userAction.do?method=leavewordList"><span>留言板</span>
						</a>
					</li>
					<li <logic:equal value="4" name="tag">class="sel"</logic:equal>>
						<a href="userAction.do?method=commdsInfo"><span>商品列表</span>
						</a>
					</li>
					<li <logic:equal value="6" name="tag">class="sel"</logic:equal>>
						<a href="${ctx}/index.jsp"><span>首页</span> </a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<script>
function closePage(){
      if(confirm("确认退出")){
         alert("fdafafdsafdsa");
      }
}
</script>