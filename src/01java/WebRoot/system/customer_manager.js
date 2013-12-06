$(function() {
	this.id = '';
	$('#regDateSearch').attr("class", "Wdate").attr("onClick", "WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})");
    $("#flex").flexigrid
    ({
	        url : 'systemAction.do?method=queryCustomerList',
	        dataType : 'json',
	        colModel :
        	[{
	            display : '用户名',
	            name : 'name',
	            width : 180,// 得加上 要不IE报错
	            sortable : true,
	            align : 'center'
            }, {
	            display : '昵称',
	            name : 'nickName',
	            width : 180,
	            sortable : true,
	            align : 'center'
            }, {
	            display : '积分',
	            name : 'accu',
	            width : 180,
	            sortable : true,
	            align : 'center'
            }, {
	            display : '注册日期',
	            name : 'regDate',
	            width : 180,
	            sortable : true,
	            align : 'center'
            }],
	            
	     	buttons : 
        	[{
	            name : '详细',
	            bclass : 'view',
	            onpress : action
            }, {
	            // 设置分割线
	            separator : true
            }, /*{
	            name : '添加',
	            bclass : 'add',
	            onpress : action
            }, {
	            // 设置分割线
	            separator : true
            }, {
	            name : '删除',
	            bclass : 'delete',
	            onpress : action
            }, {
	            separator : true
            },*/ {
	            name : '修改',
	            bclass : 'edit',
	            onpress : action
            }, {
	            separator : true
            }], 
            
	        sortname : "",
	        sortorder : "desc",
	        singleSelect: true,
	        usepager : true,
	        title : '顾客列表',
	        useRp : true,
	        rp : 10,
	        showTableToggleBtn : true,
	        width : 800,
	        height : 263
    });
        
    var actions="";
    var alertInfo="";
    function action(com, grid) 
    {
    	var width = document.documentElement.clientWidth;
    	var left = (width-600)/2;
    	$(".jqmWindow table").css("width", "560px");
    	$(".jqmWindow table").css("margin", "0 20px");
		$(".jqmWindow").css("width", "600px");
        $(".jqmWindow").css("top",(document.documentElement.scrollTop+160)+"px").css("left", left+"px");
	    switch (com) 
	    {
	    	case '详细' :
	    		$("#infoTitle").text("顾客详细信息");
	    		$("#btnDiv").css("display", "none");
	    		$('#cusInfoForm input[name="regDate"]').removeAttr("class");
	    		$('#cusInfoForm input[name="regDate"]').removeAttr("onClick");
	    		
	    		selected_count = $('.trSelected', grid).length;
			    if (selected_count == 0) 
			    {
				    alert('请选择一条记录!');
				    return;
			    }
			    if (selected_count > 1) 
			    {
				    alert('抱歉只能选择一条记录!');
				    return false;
			    }
			    if (selected_count == 1) 
			    {
			    	$(".jqmWindow").show(1000);
				    this.id = $('.trSelected', grid).attr("id").replace("row","");
				    $('#cusInfoForm input[name="id"]').val(this.id);
				    actions="systemAction.do?method=getCustomerDetail";
				    queryDetail(actions);
				    $("#cusInfoForm :input").each(function(a,b){
		        		$(b).attr("readonly", "readonly");
		            });
				    
				    $("#cusInfo").jqmShow();
			    }
			    break;
	    	
		    case '修改' :
		    	$("#infoTitle").text("顾客信息修改");
		    	$("#btnDiv").css("display", "block");
			    selected_count = $('.trSelected', grid).length;
			    if (selected_count == 0) 
			    {
				    alert('请选择一条记录!');
				    return;
			    }
			    if (selected_count > 1) 
			    {
				    alert('抱歉只能选择一条记录!');
				    return false;
			    }
			    if (selected_count == 1) 
			    {
			    	$(".jqmWindow").show(1000);
				    this.id = $('.trSelected', grid).attr("id").replace("row",""); 
				    $('#cusInfoForm input[name="id"]').val(this.id);
				    actions="systemAction.do?method=updateCustomerInfo";
				    alertInfo = "顾客信息修改成功！";
				    queryDetail("systemAction.do?method=getCustomerDetail");
				    $("#cusInfoForm :input").each(function(a,b){
		        		$(b).removeAttr("readonly");
		            });
				    $('#cusInfoForm input[name="regDate"]').mouseover(function() {
				    	$('#cusInfoForm input[name="regDate"]').attr("class", "Wdate").attr("onClick", "WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})");
				    }).mouseout(function() {
				    	$('#cusInfoForm input[name="regDate"]').removeAttr("class").removeAttr("onClick");
				    });
				    
				    $("#cusInfo").jqmShow();
			    }
			    break;
	    }
    }
    $("#cusInfo").jqm
    ({
	    // trigger : 'a.showDialog',// 触发
	    // ajax: '@href',//ajax读取方式
	    // ajaxText:'',//提示语言
	    modal : true,// 限制输入（鼠标点击，按键）的对话
	    overlay : 60 // 遮罩程度%
	    // target : t,// 提示
	    // onHide : function(h) {
	    // // // t.html('Please Wait...'); // Clear Content HTML on Hide.
	    // h.o.remove(); // remove overlay
	    // // h.w.fadeOut(888); // hide window
	    // }
    }).jqmAddClose('.close')// 添加触发关闭的selector
      .jqDrag('.drag');// 添加拖拽的selector
    
    function queryDetail(url) {
    	$.ajax({
	        url : url,
	        data : $("#cusInfoForm").serialize(),
	        type : 'POST',
	        dataType : 'json',
	        success : function(data) {
	        	$('#cusInfoForm input[name="name"]').val(data.name);
			    $('#cusInfoForm input[name="nickName"]').val(data.nickName);
			    $('#cusInfoForm input[name="accu"]').val(data.accu);
			    $('#cusInfoForm input[name="regDate"]').val(formatTime(data.regDate.time));
			    $('#cusInfoForm input[name="mobile"]').val(data.mobile);
			    $('#cusInfoForm input[name="isCert"]').val(data.isCert);
			    $('#cusInfoForm input[name="qq"]').val(data.qq);
			    $('#cusInfoForm input[name="email"]').val(data.email);
			    $('#cusInfoForm input[name="isValidate"]').val(data.isValidate);
			    $('#cusInfoForm input[name="userRank"]').val(data.userRank);
			    $('#cusInfoForm input[name="userState"]').val(data.userState);
			    $('#cusInfoForm input[name="id"]').val(this.id);
           }
		});
    	
    }
    function formatTime(time) {
    	var day = new Date(time);
    	var time = day.getFullYear()+"-"+(day.getMonth()+1)+"-"+day.getDate();
    	var y = day.getFullYear();
    	var m = day.getMonth()+1;
    	var d = day.getDate();
    	/*var h = day.getHours()+1;
    	var mm = day.getMinutes()+1;
    	var s = day.getSeconds()+1;*/
    	return y+'-'+add0(m)+'-'+add0(d);//+' '+add0(h)+':'+add0(mm)+':'+add0(s); 
    }
    function add0(m){return m<10?'0'+m:m ;}
    
    $("#submit").click(function()
    {
    	 $.ajax
    	 ({
		        url : actions,
		        data : $("#cusInfoForm").serialize(),
		        type : 'POST',
		        dataType : 'json',
		        complete: function()
		        {
				     $("#cusInfo").jqmHide();
				     alert(alertInfo);
				     $('#flex').flexReload();
				}
		  });
	 });
    $("#query").click(function()
	{
    	 var nameSearch = $("#name").val();
         var accuSearch = $("#accu").val();
         var accuCondition = $("#accuCondition").val();
         var params = [  {"name" : "nameSearch", "value" : $("#nameSearch").val()},  
                         {"name" : "nickNameSearch", "value" : $("#nickNameSearch").val()},
                         {"name" : "accuSearch", "value" : $("#accuSearch").val()},
                         {"name" : "accuCondition", "value" : $("#accuCondition").val()},
                         {"name" : "regDateSearch", "value" : $("#regDateSearch").val()},
                         {"name" : "regDateCondition", "value" : $("#regDateCondition").val()}];          
         $('#flex').flexOptions({params : params, newp : 1}).flexReload(); 
	});
    $("#reset").click(function()
	{
    	$("#nameSearch").val("");
    	$("#nickNameSearch").val("");
    	$("#accuSearch").val("");
    	$("#regDateSearch").val("");
	});
 });