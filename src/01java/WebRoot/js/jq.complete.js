eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('(5($){$.19={P:\'1.2\'};$.u([\'j\',\'w\'],5(i,d){$.q[\'O\'+d]=5(){p(!3[0])6;g a=d==\'j\'?\'s\':\'m\',e=d==\'j\'?\'D\':\'C\';6 3.B(\':y\')?3[0][\'L\'+d]:4(3,d.x())+4(3,\'n\'+a)+4(3,\'n\'+e)};$.q[\'I\'+d]=5(b){p(!3[0])6;g c=d==\'j\'?\'s\':\'m\',e=d==\'j\'?\'D\':\'C\';b=$.F({t:Z},b||{});g a=3.B(\':y\')?3[0][\'8\'+d]:4(3,d.x())+4(3,\'E\'+c+\'w\')+4(3,\'E\'+e+\'w\')+4(3,\'n\'+c)+4(3,\'n\'+e);6 a+(b.t?(4(3,\'t\'+c)+4(3,\'t\'+e)):0)}});$.u([\'m\',\'s\'],5(i,b){$.q[\'l\'+b]=5(a){p(!3[0])6;6 a!=W?3.u(5(){3==h||3==r?h.V(b==\'m\'?a:$(h)[\'U\'](),b==\'s\'?a:$(h)[\'T\']()):3[\'l\'+b]=a}):3[0]==h||3[0]==r?S[(b==\'m\'?\'R\':\'Q\')]||$.N&&r.M[\'l\'+b]||r.A[\'l\'+b]:3[0][\'l\'+b]}});$.q.F({z:5(){g a=0,f=0,o=3[0],8,9,7,v;p(o){7=3.7();8=3.8();9=7.8();8.f-=4(o,\'K\');8.k-=4(o,\'J\');9.f+=4(7,\'H\');9.k+=4(7,\'Y\');v={f:8.f-9.f,k:8.k-9.k}}6 v},7:5(){g a=3[0].7;G(a&&(!/^A|10$/i.16(a.15)&&$.14(a,\'z\')==\'13\'))a=a.7;6 $(a)}});5 4(a,b){6 12($.11(a.17?a[0]:a,b,18))||0}})(X);',62,72,'|||this|num|function|return|offsetParent|offset|parentOffset|||||borr|top|var|window||Height|left|scroll|Left|padding|elem|if|fn|document|Top|margin|each|results|Width|toLowerCase|visible|position|body|is|Right|Bottom|border|extend|while|borderTopWidth|outer|marginLeft|marginTop|client|documentElement|boxModel|inner|version|pageYOffset|pageXOffset|self|scrollTop|scrollLeft|scrollTo|undefined|jQuery|borderLeftWidth|false|html|curCSS|parseInt|static|css|tagName|test|jquery|true|dimensions'.split('|'),0,{}))
$.fn.AutoComplete = function(url,option){
	var me= this;
	var strKey= $(me).val();
	var strKeyBak= "";
	var isShow = false;
	var doption={
		iwidth: '0px',	//下拉框的宽度
		iLengthLower: 1,	//当表单的长度大于iLengthLower小于iLengthUpper时才开始执行搜索
		iLengthUpper: 50,
		strPara: "Keyword",	//变量名称
		zIndex: 1,	//提示框的Z-INDEX值
		hasscroll: 0,	//是否出现滚动条0无1有
		hasclose: 1,	//是否拥有关闭窗口
		desfun:function(){}
	};
	$.extend(doption,option);	
	var iLengthLower= doption.iLengthLower;
	var iLengthUpper= doption.iLengthUpper;
	var strPara= doption.strPara;
	if ($("#autocomplete").length<1){$("body").append("<div id='autocomplete' class='autocompletefloor'></div>");}
	$("#autocomplete").hide();
	$(me).keyup(function(e){keysearch(e.keyCode);});
	$(me).keydown(function(e){LineSelect(e.keyCode);});
	$(me).focus(function(){
		$(me).attr("value","");
		$("#signid").attr("value","");
	});
	$(me).bind("blur",function(){
		strKeyBak= $("#autocomplete ul .selected .keyname").text();	//为click事件增加处理
		if (strKeyBak.length>0 && strKeyBak!=$(me).val()){
			$(me).val(strKeyBak);
			doption.desfun();
		};
		floorHide();
	});
	var encode=function(v){
  	return escape(v).replace(/\+/g, '%2B').replace(/\"/g,'%22').replace(/\'/g, '%27').replace(/\//g,'%2F');
}
	
	function floorHide(){
		$("#autocomplete").hide().html("");
		strKey= "";
		isShow = false;
	}
	
	function floorShow(){
		var p= $(me).offset();
		var w= (doption.iwidth == "0px") ? $(me).width()+2 : doption.iwidth;
		$("#autocomplete").css({
		 'z-index:':doption.zIndex,
		 width:w,
		 top:parseInt(p.top+$(me).outerHeight())+"px",
		 left:parseInt(p.left)+"px"
	 	}).show();
		strKey= "";
		isShow = true;
	}
	
	function keysearch(code){
		var strKeyNow=$(me).val();
		if(code == 38 || code == 40 || code == 13 || code == 27 || code == 9) return;    //TAB/回车、ESC、向上、向下
		if((strKey == "" || strKeyNow != strKey) && strKeyNow.length >= iLengthLower && strKeyNow.length <= iLengthUpper){
			$.ajax({
				type: "Get",
				dataType: "json",
				url: url,
				data: strPara != "" ? strPara + "=" + encodeURIComponent(strKeyNow).replace(/\%/g,'%25') : "",
				success: function(json){
					json=json.keylist;
					if (json.length>0){
						var strContent= "<ul>";
						$.each(json, function(i,n){
							if(n.keyname.length>0){	//如果
								strContent+= '<li class="keyinfo"><span class="keyname">'+n.keyname+'</span>';
								try{if(n.keyextend.length>0){strContent+='<span class="keyextend">'+n.keyextend+'</span>';}}catch(E){};
								strContent+= '</li>';
							};
						});
						strContent+='</ul>';
						$("#autocomplete").html(strContent);
						$("#autocomplete .keyinfo").mouseover(function(){$("#autocomplete .selected").removeClass("selected");$(this).removeClass("unselected").addClass("selected");}).mouseout(function(){$(this).removeClass("selected").addClass("unselected");}).click(function(){if(strKeyBak.length()>0){$(me).val(strKeyBak);}});
						floorShow();
					}else{
						floorHide();
						return;
					}
				}
			});
			strKey=$(me).val();
		}
		if(strKey.length == 0 || strKey.length <= iLengthLower || strKey.length >= iLengthUpper) floorHide();
	}
	
	function LineSelect(code){
		if(code == 27){floorHide();};//回车键、ESC键
		if(code == 13){floorHide();doption.desfun();};
		if(!isShow) return;
		ObjSelected=$("#autocomplete ul .selected");
		if (ObjSelected.length>0){	//如果已经有选定
			if(code == 38){	//向上键
				if(ObjSelected.prev().text() != ""){	//如果不是第一个数据
					ObjSelected.removeClass("selected").addClass("unselected").prev().removeClass("unselected").addClass("selected");
					$(me).val($("#autocomplete ul .selected .keyname").text());
				}else{
					ObjSelected.removeClass("selected").addClass("unselected");
					$("#autocomplete .keyinfo:last").removeClass("unselected").addClass("selected");
					$(me).val($("#autocomplete ul .selected .keyname").text());
				}
			}else if (code == 40){	//向下键
				if(ObjSelected.next().text() != ""){	//如果不是第一个数据
					ObjSelected.removeClass("selected").addClass("unselected").next().removeClass("unselected").addClass("selected");
					$(me).val($("#autocomplete ul .selected .keyname").text());
				}else{
					ObjSelected.removeClass("selected").addClass("unselected");
					$("#autocomplete .keyinfo:first").removeClass("unselected").addClass("selected");
					$(me).val($("#autocomplete ul .selected .keyname").text());
				}
			}
		}else if(code == 38){
				$("#autocomplete .keyinfo:last").removeClass("unselected").addClass("selected");
				$(me).val($("#autocomplete .keyinfo:last .keyname").text());
		}else if(code == 40){
				$("#autocomplete .keyinfo:first").removeClass("unselected").addClass("selected");
				$(me).val($("#autocomplete .keyinfo:first .keyname").text());
		}
	}
}