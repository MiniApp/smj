var ids = new Array();//已选择菜单的ID数组
var all_old_num = 0;//记录更改前数量
//增加订单行
function add_bill(dish_id,dish_name,price,integral){
	if(typeof(HTMLElement)!="undefined" && !window.opera) { 
    	HTMLElement.prototype.__defineSetter__("outerText",function(sText){ 
        	var parsedText=document.createTextNode(sText); 
        	this.outerHTML=parsedText; 
        	return parsedText; 
        	}); 
    	HTMLElement.prototype.__defineGetter__("outerText",function(){ 
        	var r=this.ownerDocument.createRange(); 
        	r.selectNodeContents(this); 
        	return r.toString(); 
        	});  
	}
	var t_rows = document.getElementById('bill_table').rows.length;//表格行数
	if(ids.length == 0){
		ids[0] = dish_id;//菜ID记录到数组
		var t_row = document.getElementById('bill_table').insertRow(t_rows);//插入最后一行
		var t_cel = t_row.insertCell(0);//第一列
		t_cel.innerHTML = "<span onclick='del_bill(this,"+dish_id+")'><img src=images/del.gif align=absmiddle border=0 alt=删除 /></span>";
		var t_cel = t_row.insertCell(1);
		t_cel.innerHTML = dish_name;
		var t_cel = t_row.insertCell(2);
		t_cel.innerHTML = integral;
		var t_cel = t_row.insertCell(3);
		t_cel.innerHTML = "<input type=hidden name=price_"+dish_id+" id=price_"+dish_id+" value="+price+"><span>"+price+"</span>";
		var t_cel = t_row.insertCell(4);
		t_cel.innerHTML = "<input name=num_"+dish_id+" id=num_"+dish_id+" type=text onblur=f_blur('"+dish_id+"') onfocus=f_focus('"+dish_id+"') value=1 style=margin-top:-4px;width:30px; />";
		var t_cel = t_row.insertCell(5);
		t_cel.innerHTML = "<input name=memo_"+dish_id+" maxlength=50 id=memo_"+dish_id+" type=text style=margin-top:-4px;width:200px; />";
		if(t_row.addEventListener){//firefox
			
		}else{//IE
			t_row.attachEvent("onmouseover",function(){changeBackground_a(t_row)});//注册行事件
			t_row.attachEvent("onmouseout",function(){changeBackground_b(t_row)});//注册行事件
		}
		var kc_sum = document.getElementById('kc_sum').outerText;
		var kc_allprice = document.getElementById('kc_allprice').outerText;
		document.getElementById('kc_sum').innerHTML = (kc_sum*1+1);
		document.getElementById('kc_allprice').innerHTML = (kc_allprice*1+price*1);
	}else{
		var isHave = false;
		for(var i=0;i<ids.length;i++){
			if(ids[i] == dish_id){
				isHave = true;
				var old_num = document.getElementById('num_'+dish_id).value;
				document.getElementById('num_'+dish_id).value = old_num*1+1;
				var kc_sum = document.getElementById('kc_sum').outerText;
				var kc_allprice = document.getElementById('kc_allprice').outerText;
				document.getElementById('kc_sum').innerHTML = (kc_sum*1+1);
				document.getElementById('kc_allprice').innerHTML = (kc_allprice*1+price*1);
				break;
			}
		}
		if(!isHave){
			var i_l = ids.length;
			ids[i_l] = dish_id;
			var t_row = document.getElementById('bill_table').insertRow(t_rows);
			var t_cel = t_row.insertCell(0);
			t_cel.innerHTML = "<span onclick='del_bill(this,"+dish_id+")'><img src=images/del.gif align=absmiddle border=0 alt=删除 /></span>";
			var t_cel = t_row.insertCell(1);
			t_cel.innerHTML = dish_name;
			var t_cel = t_row.insertCell(2);
			t_cel.innerHTML = integral;
			var t_cel = t_row.insertCell(3);
			t_cel.innerHTML = "<input type=hidden name=price_"+dish_id+" id=price_"+dish_id+" value="+price+"><span>"+price+"</span>";
			var t_cel = t_row.insertCell(4);
			t_cel.innerHTML = "<input name=num_"+dish_id+" id=num_"+dish_id+" type=text onblur=f_blur('"+dish_id+"') onfocus=f_focus('"+dish_id+"') value=1 style=margin-top:-4px;width:30px; />";
			var t_cel = t_row.insertCell(5);
			t_cel.innerHTML = "<input name=memo_"+dish_id+" maxlength=50 id=memo_"+dish_id+" type=text style=margin-top:-4px;width:200px; />";
			if(t_row.addEventListener){//firefox
			
			}else{//IE
				t_row.attachEvent("onmouseover",function(){changeBackground_a(t_row)});//注册行事件
				t_row.attachEvent("onmouseout",function(){changeBackground_b(t_row)});//注册行事件
			}
			var kc_sum = document.getElementById('kc_sum').outerText;
			var kc_allprice = document.getElementById('kc_allprice').outerText;
			document.getElementById('kc_sum').innerHTML = (kc_sum*1+1);
			document.getElementById('kc_allprice').innerHTML = (kc_allprice*1+price*1);
		}
	}
}
function changeBackground_a(t_id){
	t_id.style.background='#f6f6f6';
}
function changeBackground_b(t_id){
	t_id.style.background='';
}
function del_bill(obj,sel_id){
	var row_id = obj.parentNode.parentNode.rowIndex;
	for(var i=0;i<ids.length;i++){
		if(ids[i] == sel_id){
			ids.splice(i,1);
			break;
		}
	}
	var kc_num = document.getElementById('num_'+sel_id).value;
	var price = document.getElementById('price_'+sel_id).value;
	var kc_sum = document.getElementById('kc_sum').outerText;
	var kc_allprice = document.getElementById('kc_allprice').outerText;
	document.getElementById('kc_sum').innerHTML = (kc_sum*1-kc_num*1);
	document.getElementById('kc_allprice').innerHTML = (kc_allprice*1-(price*1)*(kc_num*1));
	document.getElementById('bill_table').deleteRow(row_id);
}
//当失去焦点时
function f_blur(carteId){
	var new_num = document.getElementById('num_'+carteId).value;
	var reg = /^\d+$/;
	if(!reg.test(new_num)){
		alert("请输入大于0的整数！");
		document.getElementById('num_'+carteId).value = all_old_num;
		return;
	}
	if(new_num*1<=0){
		alert("请输入大于0的整数！");
		document.getElementById('num_'+carteId).value = all_old_num;
		return;
	}
	if(new_num != all_old_num){
		var price = document.getElementById('price_'+carteId).value;//单价
		if(new_num*1 > all_old_num*1){//增加
			var kc_sum = document.getElementById('kc_sum').outerText;
			var kc_allprice = document.getElementById('kc_allprice').outerText;
			document.getElementById('kc_sum').innerHTML = (kc_sum*1+(new_num*1-all_old_num*1));
			document.getElementById('kc_allprice').innerHTML = (kc_allprice*1+price*(new_num*1-all_old_num*1));
		}else if(new_num*1 < all_old_num*1){//减少
			var kc_sum = document.getElementById('kc_sum').outerText;
			var kc_allprice = document.getElementById('kc_allprice').outerText;
			document.getElementById('kc_sum').innerHTML = (kc_sum*1-(all_old_num*1-new_num*1));
			document.getElementById('kc_allprice').innerHTML = (kc_allprice*1-price*(all_old_num*1-new_num*1));
		}
	}
}
//当获得焦点时
function f_focus(carteId){
	all_old_num = document.getElementById('num_'+carteId).value;
}
function makeids(){
	var idstr = "";
	for(var i=0;i<ids.length;i++){
		if(i==0){
			idstr = ids[i];
		}else{
			idstr += ","+ids[i];
		}
	}
	document.getElementById('ids').value = idstr;
}
function isUndefined(variable) {
	return typeof variable == 'undefined' ? true : false;
}
function setMenuPosition(ctrlid){
	var offset = 0;
	var showobj = document.getElementById('li_'+ctrlid);
	var menuobj = document.getElementById('dish_'+ctrlid);
	if(showobj) {
		showobj.pos = fetchOffset(showobj);
		showobj.X = showobj.pos['left'];
		showobj.Y = showobj.pos['top'];
		showobj.w = showobj.offsetWidth;
		showobj.h = showobj.offsetHeight;
		menuobj.w = menuobj.offsetWidth;
		menuobj.h = menuobj.offsetHeight;
		var sTop = document.documentElement && document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop;
		if(offset != -1) {
			menuobj.style.left = (showobj.X + menuobj.w > document.body.clientWidth) && (showobj.X + showobj.w - menuobj.w >= 0) ? showobj.X + showobj.w - menuobj.w + 'px' : showobj.X + 'px';
			menuobj.style.top = offset == 1 ? showobj.Y + 'px' : (offset == 2 || ((showobj.Y + showobj.h + menuobj.h > sTop + document.documentElement.clientHeight) && (showobj.Y - menuobj.h >= 0)) ? (showobj.Y - menuobj.h) + 'px' : showobj.Y + showobj.h + 'px');
		} else if(offset == -1) {
			menuobj.style.left = (document.body.clientWidth-menuobj.w)/2 + 'px';
			var divtop = sTop + (document.documentElement.clientHeight-menuobj.h)/2;
			if(divtop > 100) divtop = divtop - 100;
			menuobj.style.top = divtop + 'px';
		}
		if(menuobj.style.clip && !is_opera) {
			menuobj.style.clip = 'rect(auto, auto, auto, auto)';
		}
	}
}
function fetchOffset(obj) {
	var left_offset = obj.offsetLeft;
	var top_offset = obj.offsetTop;
	while((obj = obj.offsetParent) != null) {
		left_offset += obj.offsetLeft;
		top_offset += obj.offsetTop;
	}
	return { 'left' : left_offset, 'top' : top_offset };
}