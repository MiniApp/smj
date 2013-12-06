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
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<link href="css/main.css" rel="stylesheet" type="text/css" /> 
	<link rel="stylesheet" href="public/plugin/listUI/listUI.css" type="text/css" />
	<style type="text/css">
		.add{width:500px;height:200px; border:2px solid #CCC;}
		.remove{width:500px;height:200px; border:1px solid RED;}
	</style>
		<link href="css/css.css" type="text/css" rel="stylesheet"/>
        <script src="js/jquery-1.2.6.pack.js" type=text/javascript></script>
        <script src="js/js.js" type=text/javascript></script>
</head>
<body>
<%@include file="/user/top.jsp" %>
<div class="contentmain">
<div class="main_con1">
<div class="commd_con4">

<div class="box">
<DIV class=allsort>
	<DIV class=mt>
		<STRONG><A href="#" onclick="findCateory('','')">全部商品分类</A></STRONG>
	</DIV>
<DIV class=mc>
 <c:forEach var="cate" items="${cateory}">
     <DIV class="item fore">
            <c:if test="${cate.parentId eq 0}">
                   <SPAN><H3><A href="#" onclick="findCateory(${cate.cateId},${cate.classId})">${cate.name}</A></H3><S></S></SPAN></c:if>
			<DIV class=i-mc>
				<DIV class=subitem>
				<c:forEach var="subcate" items="${subcateory}">
				   <c:if test="${cate.classId eq subcate.parentId}">
				    	<DL class=fore>
				    	<DT><A href="#" onclick="findCateory(${subcate.cateId},${subcate.classId})">${subcate.name}</A></DT>
						     <DD>
						    <c:forEach var="subscate" items="${subcateory}">
						         <c:if test="${subcate.classId eq subscate.parentId}">
						         	<EM><A href="#" onclick="findCateory(${subscate.cateId},${subscate.classId})">${subscate.name}</A></EM> 
						         </c:if>
						     </c:forEach>
						     </DD>
				    </DL>
				   </c:if>
				</c:forEach>
				</DIV>
			</DIV>
		</DIV>
		</c:forEach>
</DIV>
</DIV>
</div>
<script type=text/javascript> 
$(".allsort").hoverForIE6({current:"allsorthover",delay:200});
$(".allsort .item").hoverForIE6({delay:100});
</script>
</div>
<div class="commd_con3">
<div class="condition">
<div class="conditiontitle">品牌</div>
<div id="brandList"><c:forEach var="v" items="${brand}">&nbsp;&nbsp;&nbsp;<c:if test="${v.recommend eq  1}"><a href="#" onclick="addDiv(${v.brandId},'${v.brandName}')" title=${v.brandName}>${v.brandName}</a></c:if></c:forEach>
&nbsp;&nbsp;&nbsp;<input type="button" value="多选" onclick="openCondition()"/>&nbsp;&nbsp;&nbsp;<input type="button" value="更多" onclick="chooseManyCondition()"/></div>
<div id="allBrandList" class="mcondition"><a href="#" onclick="init()">不限</a><c:forEach var="v" items="${sessionScope.brand}">&nbsp;&nbsp;&nbsp;<a href="#" onclick="" title="${v.brandName}"><input type="checkbox" name="brandName" value="${v.brandId}_${v.brandName}" onclick="setBtnChoose();"/>${v.brandName}</a></c:forEach>
&nbsp;&nbsp;&nbsp;<input type="button" value="收起" onclick="closeCondition()"/></div><div id="confim" class="confim"><input id="btnChoose" type="button" value="选择" id="chose" onclick="getChoseValue()"/>&nbsp;&nbsp;<input type="button" id="clr" value="清空" onclick="clrChild()"/></div>
<div id="chooseManyBrand" class="mcondition"><a href="#" onclick="init()">不限</a><c:forEach var="v" items="${sessionScope.brand}">&nbsp;&nbsp;&nbsp;<a href="#" onclick="addDiv(${v.brandId},'${v.brandName}')" title="${v.brandName}">${v.brandName}</a></c:forEach>
&nbsp;&nbsp;&nbsp;<input type="button" value="收起" onclick="closeCondition()"/></div>
</div>
<div id="comminfo" class="comminfo">
<input type="text" id="searchProduct"/><input type="button" value="搜索" onclick="searchSubmit()"/></div>
<div id="commdInfo"></div>
</div>
<div class="shopcarc" id="carcontent" style="display:none;">
<ul>
<li>&nbsp;&nbsp;&nbsp;<span class="shopsmall"><a href="#" onclick="openOrClsShopCar(1)">关闭</a></span></li>
<li></li>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="commimage/3.jpg"></img>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${shopcar.number}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${shopcar.price}</li>
<li></li>
<li><c:if test="${!emptyshopcar.number3}">${shopcar.number3}</c:if></li>
<li></li>
<li></li>
<li></li>
</ul>
</div>
<div id="shopcar" class="shopcar" onclick="openOrClsShopCar(0)"></div>
<script language=javascript> 
NS6 = (document.getElementById&&!document.all) 
IE = (document.all) 
NS = (navigator.appName=="Netscape" && navigator.appVersion.charAt(0)=="4") 
tempBar='';barBuilt=0;ssmItems=new Array(); 
moving=setTimeout('null',1) 
function moveOut() { 
if ((NS6||NS)&&parseInt(ssm.left)<0 || IE && ssm.pixelLeft<0) { 
clearTimeout(moving);moving = setTimeout('moveOut()', slideSpeed);slideMenu(10)} 
else {clearTimeout(moving);moving=setTimeout('null',1)}}; 
function moveBack() {clearTimeout(moving);moving = setTimeout('moveBack1()', waitTime)} 
function moveBack1() { 
if ((NS6||NS) && parseInt(ssm.left)>(-menuWidth) || IE && ssm.pixelLeft>(-menuWidth)) { 
clearTimeout(moving);moving = setTimeout('moveBack1()', slideSpeed);slideMenu(-10)} 
else {clearTimeout(moving);moving=setTimeout('null',1)}} 
function slideMenu(num){ 
if (IE) {ssm.pixelLeft += num;} 
if (NS||NS6) {ssm.left = parseInt(ssm.left)+num;} 
if (NS) {bssm.clip.right+=num;bssm2.clip.right+=num;}} 
function makeStatic() { 
if (NS||NS6) {winY = window.pageYOffset;} 
if (IE) {winY = document.body.scrollTop;} 
if (NS6||IE||NS) { 
if (winY!=lastY&&winY>YOffset-staticYOffset) { 
smooth = .2 * (winY - lastY - YOffset + staticYOffset);} 
else if (YOffset-staticYOffset+lastY>YOffset-staticYOffset) { 
smooth = .2 * (winY - lastY - (YOffset-(YOffset-winY)));} 
else {smooth=0} 
if(smooth > 0) smooth = Math.ceil(smooth); 
else smooth = Math.floor(smooth); 
if (IE) bssm.pixelTop+=smooth; 
if (NS6||NS) bssm.top=parseInt(bssm.top)+smooth 
lastY = lastY+smooth; 
setTimeout('makeStatic()', 1)}} 

function buildBar() { 
if(barText.indexOf('<IMG')>-1) 
{
      tempBar=barText;
} 
else 
{
  for (var b=0;b<barText.length;b++) 
   {
     tempBar+=barText.charAt(b)+"<BR>"
   }
} 
document.write('<td align="center" rowspan="'+ssmItems.length+1+'" width="'+barWidth+'" bgcolor="'+barBGColor+'" valign="'+barVAlign+'"><p align="center"><font face="'+barFontFamily+'" Size="'+barFontSize+'" COLOR="'+barFontColor+'"><B>'+tempBar+'</B></font></p></TD>')}

function initSlide() { 
if (NS6){ssm=document.getElementById("thessm").style;bssm=document.getElementById("basessm").style; 
bssm.clip="rect(0 "+document.getElementById("thessm").offsetWidth+" "+document.getElementById("thessm").offsetHeight+" 0)";ssm.visibility="visible";} 
else if (IE) {ssm=document.all("thessm").style;bssm=document.all("basessm").style 
bssm.clip="rect(0 "+thessm.offsetWidth+" "+thessm.offsetHeight+" 0)";bssm.visibility = "visible";} 
else if (NS) {bssm=document.layers["basessm1"]; 
bssm2=bssm.document.layers["basessm2"];ssm=bssm2.document.layers["thessm"]; 
bssm2.clip.left=0;ssm.visibility = "show";} 
if (menuIsStatic=="yes") makeStatic();}

function buildMenu() {
	if (IE||NS6) {document.write('<DIV ID="basessm" style="visibility:hidden;Position : Absolute ;Left : '+XOffset+' ;Top : '+YOffset+' ;Z-Index : 20;width:'+(menuWidth+barWidth+10)+'"><DIV ID="thessm" style="Position : Absolute ;Left : '+(-menuWidth)+' ;Top : 0 ;Z-Index : 20;" onmouseover="moveOut()" onmouseout="moveBack()">')} 
	if (NS) {document.write('<LAYER name="basessm1" top="'+YOffset+'" LEFT='+XOffset+' visibility="show"><ILAYER name="basessm2"><LAYER visibility="hide" name="thessm" bgcolor="'+menuBGColor+'" left="'+(-menuWidth)+'" onmouseover="moveOut()" onmouseout="moveBack()">')} 
	if (NS6){document.write('<table border="0" cellpadding="0" cellspacing="0" width="'+(menuWidth+barWidth+2)+'" bgcolor="'+menuBGColor+'"><TR><TD>')}
	document.write('<table border="0" cellpadding="0" cellspacing="1" width="'+(menuWidth+barWidth+2)+'" bgcolor="'+menuBGColor+'">');

	for(i=0;i<ssmItems.length;i++) {
		if (!ssmItems[i][3]) {
			ssmItems[i][3]=menuCols;ssmItems[i][5]=menuWidth-1
		} else if(ssmItems[i][3]!=menuCols) ssmItems[i][5]=Math.round(menuWidth*(ssmItems[i][3]/menuCols)-1);
		if (ssmItems[i-1]&&ssmItems[i-1][4]!="no") {
			document.write('<TR>')
		}
		if (!ssmItems[i][1]) {
			document.write('<td bgcolor="'+hdrBGColor+'" HEIGHT="'+hdrHeight+'" ALIGN="'+hdrAlign+'" VALIGN="'+hdrVAlign+'" WIDTH="'+ssmItems[i][5]+'" COLSPAN="'+ssmItems[i][3]+'"> <font face="'+hdrFontFamily+'" Size="'+hdrFontSize+'" COLOR="'+hdrFontColor+'"><b>'+ssmItems[i][0]+'</b></font></td>');
		} else {
			if(!ssmItems[i][2]) ssmItems[i][2]=linkTarget;
//			document.write('<TD BGCOLOR="'+linkBGColor+'" onmouseover="bgColor=\''+linkOverBGColor+'\'" onmouseout="bgColor=\''+linkBGColor+'\'" HEIGHT="'+hdrHeight+'" WIDTH="'+ssmItems[i][5]+'" COLSPAN="'+ssmItems[i][3]+'" style="Cursor:hand;" ALIGN="'+linkAlign+'" onclick="location.href=\''+ssmItems[i][1]+'\'"><FONT face="'+linkFontFamily+'" Size="'+linkFontSize+'">'+ssmItems[i][0]+'</TD>');
			document.write('<TD BGCOLOR="'+linkBGColor+'" onmouseover="bgColor=\''+linkOverBGColor+'\'" onmouseout="bgColor=\''+linkBGColor+'\'" HEIGHT="'+hdrHeight+'" WIDTH="'+ssmItems[i][5]+'" COLSPAN="'+ssmItems[i][3]+'"><ILAYER><LAYER onmouseover="bgColor=\''+linkOverBGColor+'\'" onmouseout="bgColor=\''+linkBGColor+'\'" WIDTH="100%" ALIGN="'+linkAlign+'"><DIV ALIGN="'+linkAlign+'"><FONT face="'+linkFontFamily+'" Size="'+linkFontSize+'"><A HREF="'+ssmItems[i][1]+'" target="'+ssmItems[i][2]+'" CLASS="ssmItems">'+ssmItems[i][0]+'</DIV></LAYER></ILAYER></TD>');
		}

		if (ssmItems[i][4]!="no"&&barBuilt==0) {buildBar();barBuilt=1;}
		if (ssmItems[i][4]!="no") {document.write('</TR>')}
	}
	document.write('</table>') 
	if (NS6){document.write('</TD></TR></TABLE>')} 
	if (IE||NS6) {document.write('</DIV></DIV>')} 
	if (NS) {document.write('</LAYER></ILAYER></LAYER>')} 

	theleft=-menuWidth;
	lastY=0;
	setTimeout('initSlide();', 1);
} 

YOffset=90; 
XOffset=0; 
staticYOffset=30; 
slideSpeed=12 
waitTime=100; 
staticMode="advanced"
menuBGColor="#000000"; 
menuIsStatic="yes"; 
menuWidth=140; 
menuCols=2; 
hdrFontFamily="宋体, Arial, Helvetica"; 
hdrFontSize="2"; 
hdrFontColor="mintcream"; 
hdrBGColor="#97BDAE"; 
hdrAlign="center"; 
hdrVAlign="center"; 
hdrHeight="20"; 
linkFontFamily="宋体, Arial, Helvetica"; 
linkFontSize="2"; 
linkBGColor="whitesmoke"; 
linkOverBGColor="#ffffff"; 
linkTarget="_top"; 
linkAlign="center"; 
barBGColor="#FF9933"; 
barFontFamily="宋体, Arial, Helvetica"; 
barFontSize="2"; 
barFontColor="mintcream"; 
barVAlign="center"; 
barWidth=12; 
barText="商户信息";
var value = "test" + "111"
ssmItems[0]=[value, "", ""] 
ssmItems[1]=[value, "", ""] 
ssmItems[2]=[value, "", ""] 

function clickhref(cHref) {window.location.href=cHref}

//onmousemove="menu_over(this);" onmouseout="menu_out(this);"
function menu_over(obj){
	obj.style.backgroundColor="whitesmoke";
	obj.style.color="mintcream";
	obj.style.cursor="hand";
}

function menu_out(obj){
	obj.style.backgroundColor="#ffffff";
	obj.style.color="mintcream";
	obj.style.cursor="";
}

buildMenu();
</script>
</div>
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script> 
<script type="text/javascript" src="js/jquery.tabs.js"></script> 
<script type="text/javascript" src="${ctx}/public/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${ctx}/public/plugin/listUI/comminfolistUI.js"></script>
  <script type="text/javascript" src="js/shopcard.js"></script>
	<script type="text/javascript">	
	
	window.unload = init();
	
	function init(){
			$(document).ready(function () { 
				$("#commdInfo").listUI({
					title : "商品列表",// 是否包含标题
					url : 'userAction.do?method=queryCommInfo', // ajax方式对应的url地址
					method : 'POST', // 数据发送方式
					dataType : 'json', // 数据加载的类型
					data:{id:0,cateid:0},
					width : '1100px',
					pageSize : 20,
					editMode : false,
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
			
			clrChild(0);
			
			document.getElementById('btnChoose').disabled = true;
		
		    var chk = document.getElementsByName('brandName');
            for (var i = 0; i < chk.length; i++) {
               chk[i].checked = false;
			}
		}
		function searchSubmit(){
		var  comm = document.getElementById('comminfo');
		    if($('#searchProduct').val() == ""){
		          alert("请输入查询信息！");
		          $('#searchProduct').focus();
		          return;
		    }
		    else{
			   var commdName = $('#searchProduct').val();
			   alert(commdName);
	           $(document).ready(function () { 
					$("#commdInfo").listUI({
						title : "商品列表",// 是否包含标题
						url : 'userAction.do?method=queryCommInfo&id=0&cateid=0&commdName='+escape(escape(commdName)), // ajax方式对应的url地址
						method : 'POST', // 数据发送方式
						dataType : 'json', // 数据加载的类型
						width : '1100px',
						pageSize : 20,
						editMode : false,
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
		
		function findCateory(cateid,classId){	 
		 $(function() {
	     $.ajax({
	     async:false,
	     cache:false,
	     type:'POST',
	     dataType:"json",
	     data:{cateid:cateid,classId:classId},
	     url : "userAction.do?method=findCateory",
	     success:function(){  
	     	
	     } 
	   });
	   });
	       window.location.reload();  
		}
	    
	    	function openCondition(){
		         var  brandArray = document.getElementById('brandList');   
		         brandArray.style.display = "none";
		         var allBrandArray = document.getElementById('allBrandList');   
		         allBrandArray.style.display = "block";
		         var  confim = document.getElementById('confim');
		         confim.style.display = "block";
		    }
		
			function closeCondition(){
		      	var  brandArray = document.getElementById('brandList');   
		         brandArray.style.display = "block";
		         
		         var allBrandArray = document.getElementById('allBrandList');   
		         allBrandArray.style.display = "none";
		         
		         var allBrandArray = document.getElementById('chooseManyBrand');   
		         allBrandArray.style.display = "none";
		         
		         var  confim = document.getElementById('confim');
		         confim.style.display = "none";
			}	
			
			function chooseManyCondition(){
			   var  brandArray = document.getElementById('brandList');   
		       brandArray.style.display = "none";
		       
		       var  confim = document.getElementById('confim');
		       confim.style.display = "none";
		       
		       var allBrandArray = document.getElementById('chooseManyBrand');   
		       allBrandArray.style.display = "block";
			}
			
			function getChoseValue(){
			var bnameinfo = "";
			
			    var bname  = document.getElementsByName('brandName');
				for(var i=0;i<bname.length;i++){
					if(bname[i].checked){
					   bnameinfo += bname[i].value + ",";
					}
				}		
	         var bnametmp = "";
	         bnametmp = bnameinfo.substr(0,bnameinfo.lastIndexOf(","));
			 addDiv(-1,bnametmp);
	    }
			
		   function clrChild(num){
		   	     var  comm = document.getElementById('comminfo');
		   	     if(document.getElementById('comminfo').getElementsByTagName("DIV").length > 0)
		         comm.innerHTML = "<input type=text id=searchProduct/><input type=button value=搜索 onclick=searchSubmit()/>";
		   }
		   
			function  addDiv(brdid,bname){
			 var  comm = document.getElementById('comminfo');
			 var brindid = "";
			 var tmpbid = "";
    		    //判断动态添加单个或者多个
				if(brdid > 0 ){
				clrChild(1);
				        tmpbid = brdid;
				  	    var newDiv  = document.createElement("DIV");
				  	    newDiv.id = "brd" + brdid;
				  	    newDiv.title = bname;
				  	    newDiv.name = brdid;
				  	    newDiv.className = "chose";
				  	    newDiv.onclick = function(){
				  	    	 document.getElementById('comminfo').removeChild(newDiv);
				  	    	 init();
				  	    }
				  	    if(comm.innerHTML.indexOf(bname) == -1){
				        	comm.insertBefore(newDiv);
				        }
				        else{
				             alert("已选择!");
				        }
				 }
				 else{
				 clrChild(1);
				       var tmp;
				       tmp = bname.split(",");  
					   for(var i=0;i<tmp.length;i++){
					           var id = tmp[i].substr(0,tmp[i].indexOf("_"));
					            var name = tmp[i].substr(tmp[i].indexOf("_")+1);
					          var newDiv  = document.createElement("DIV");
					          tmpbid += id + ",";
					          
						  	  newDiv.id = "brd" + id;
						  	  newDiv.title = name;
						  	  newDiv.className = "chose";
						  	  newDiv.onclick = function(){
						  	    	clrChild();
						  	    	init();
						  	  }
						  	  
						  	  if(comm.innerHTML.indexOf(name) > 0){
						  	  }
						  	  else{
				        	  	   comm.insertBefore(newDiv);
				              }
			           } 
			           
			           
			           
				 }
	       //判断选中的品牌是单个还是多个
	      if(tmpbid.toString().indexOf(",") == -1){
	          brindid = tmpbid;
	      }
	      else{
	           brindid = tmpbid.toString().substring(0,tmpbid.toString().lastIndexOf(","));
	      }
		  
		  $(document).ready(function () { 
				$("#commdInfo").listUI({
					title : "商品列表",// 是否包含标题
					url : 'userAction.do?method=queryCommInfo&id='+brindid+'&cateid=0', // ajax方式对应的url地址
					method : 'POST', // 数据发送方式
					dataType : 'json', // 数据加载的类型
					width : '1100px',
					pageSize : 20,
					editMode : false,
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
	
	function setBtnChoose(){
	   var bname  = document.getElementsByName('brandName');
	   var type = "";
	   for(var i=0;i<bname.length;i++){
	         if(bname[i].checked){
                 type  = bname[i].value;
             }
	   }
	   
	   if(type != ""){
	         document.getElementById('btnChoose').disabled = false;
	   }
	   else{
	         document.getElementById('btnChoose').disabled = true;
	   }
	}
	
</script>
</div>
</body>
</html>