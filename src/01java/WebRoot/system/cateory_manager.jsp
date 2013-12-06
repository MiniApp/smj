<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="x-ua-compatible" content="ie=7">
<title>系统控制台</title>
<link href="css/merchant.css" rel="stylesheet" type="text/css" />
<link href="css/global.css" rel="stylesheet" type="text/css" />
<link href="css/extremecomponents.css" rel="stylesheet" type="text/css"/>

<link href="css/ztree/demo.css" rel="stylesheet"   type="text/css"/>
<link href="css/ztree/zTreeStyle/zTreeStyle.css"  rel="stylesheet"  type="text/css"/>
<script type="text/javascript" src="js/ztree/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/ztree/jquery.ztree.excheck-3.5"></script>
<script type="text/javascript" src="js/ztree/jquery.ztree.exedit-3.5.js"></script>



<SCRIPT type="text/javascript">
		<!--
		var setting = {
			view: {
				selectedMulti: true
			},
			edit: {
				enable: true,
				showRemoveBtn:false,
				showRenameBtn:false
			},
			data: {
				keep: {
					parent:true,
					leaf:true
				},
				simpleData: {
					enable: true
				}
			},
            callback: {
                 beforeDrag: beforeDrag,
				beforeRemove: beforeRemove,
				beforeRename: beforeRename,
				onRemove: onRemove
            }			
		};
	  	   			
	  var treeNodes;
	   $(function() {
	   $.ajax({
	     async:false,
	     cache:false,
	     type:'POST',
	     dataType:"json",
	     url : "systemAction.do?method=find_Cateory",
	     success:function(node){
	       treeNodes = node; //把后台封装好的简单Json格式赋给treeNodes
	     } 
	   });
	   });
		
		var nodeId = "";
		function getSelectNodeMaxId(id)
		{
		      
		   var treeid;
		   
		   if(id == null)
		   {
		       treeid = -1;
		   }
		   else 
		   {
		      treeid = id;
		   }
		   
			   $(function() {
			   $.ajax({
			     async:false,
			     cache:false,
			     type:'POST',
			     dataType:"json",
			     data:{classId:parseInt(id),condition:"classId"},
			     url : "systemAction.do?method=getMaxNodeId",
			     success:function(node){
			       nodeId = node; //把后台封装好的简单Json格式赋给treeNodes
			     } 
			   });
			   });
		}
		function operationNode(type,treeid,pId,nodename)
		{
		  alert("id" + pId);
		
		  
		    var state;
			   $(function() {
			   $.ajax({
			     async:false,
			     cache:false,
			     type:'POST',
			     dataType:"json",
			     data:{type:type,pid:parseInt(pId),name:nodename,cid:parseInt(treeid)},
			     url :"systemAction.do?method=OperCateNode",
			     success:function(node){
			       state = node; //把后台封装好的简单Json格式赋给treeNodes
			     } 
			   });
			   });
		}
		
		var log, className = "dark";
		function beforeDrag(treeId, treeNodes) {
			return false;
		}
		function beforeRemove(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
		}
		function onRemove(e, treeId, treeNode) {
			showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		}
		function beforeRename(treeId, treeNode, newName) {
			if (newName.length == 0) {
				alert("节点名称不能为空.");
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				setTimeout(function(){zTree.editName(treeNode)}, 10);
				return false;
			}
			return true;
		}
		function showLog(str) {
			if (!log) log = $("#log");
			log.append("<li class='"+className+"'>"+str+"</li>");
			if(log.children("li").length > 8) {
				log.get(0).removeChild(log.children("li")[0]);
			}
		}
		
		function getTime() {
			var now= new Date(),
			h=now.getHours(),
			m=now.getMinutes(),
			s=now.getSeconds(),
			ms=now.getMilliseconds();
			return (h+":"+m+":"+s+ " " +ms);
		}
		
		var newCount = 1;
		function add(e) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			isParent = e.data.isParent,
			nodes = zTree.getSelectedNodes(),
			treeNode = nodes[0];
			var parentId;
			var classId;
		    if(nodes.length == 0)
		    {
		         alert("please select nodes");
		         return;
		    }
		    
		    if(document.getElementById('txtNodeName').value == "")
		    {
		         alert("please input node name");
		         return;
		    }
		    
		    parentId = treeNode.id;
		    getSelectNodeMaxId(treeNode.id);
			classId = nodeId;
			
			
			if (treeNode) { 
				treeNode = zTree.addNodes(treeNode, {id:nodeId, pId:treeNode.id, isParent:isParent, name:document.getElementById('txtNodeName').value});
			} else {
				treeNode = zTree.addNodes(null, {id:nodeId, pId:treeNode.id, isParent:isParent, name:document.getElementById('txtNodeName').value});
			}
	
			operationNode(1,classId,parentId,document.getElementById('txtNodeName').value);
			
			zTree.reAsyncChildNodes(nodes,"refresh");
			
		};				
		function remove(e) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			treeNode = nodes[0];
			if (nodes.length == 0) {
				alert("Please select one node at first...");
				return;
			}
			
			if(treeNode.pId == null)
			{
			      alert("cannot remoave base root");
			}
			 if(confirm("确认删除节点"))
			 {
			    operationNode(2,treeNode.id,treeNode.pId,treeNode.name);
			 
				var callbackFlag = $("#callbackTrigger").attr("checked");
				zTree.removeNode(treeNode, callbackFlag);
			 }
			 			
			
		};
				
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, treeNodes);
			$("#addParent").bind("click", {isParent:true}, add);
			$("#addLeaf").bind("click", {isParent:false}, add);
			$("#remove").bind("click", remove);
		});
		//-->
	</SCRIPT>


</head>

<body>
<%@include file="top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="left.jsp" %>
   	<div id="mainarea">
   	<h2 class="title"><img src="../images/space.gif" class="icon1"/>商品种类管理</h2>
    <p align="center">
    <input type="text" id="txtNodeName"/>
     <a id="addParent" href="#" title="添加父节点" onClick="return false;">添加父节点</a> 
      &nbsp;&nbsp;&nbsp;&nbsp;
      <a id="addLeaf" href="#" title="添加子节点" onClick="return false;">添加子节点</a>
	  &nbsp;&nbsp;&nbsp;&nbsp; <a id="remove" href="#" title="删除节点" onClick="return false;">remove node</a>
    </p>
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	</div>
</div>
</td></tr></table>
</body>
</html>