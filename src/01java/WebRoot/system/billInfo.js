$(function() {
	this.id = '';
	$('#billDateBegin').attr("class", "Wdate").attr("onClick", "WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})");
	$('#billDateEnd').attr("class", "Wdate").attr("onClick", "WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})");
	$("#flex").flexigrid
    ({
	        url : 'systemAction.do?method=queryBillInfoList',
	        dataType : 'json',
	        colModel :
        	[{
	            display : '顾客姓名',
	            name : 'custName',
	            width : 180,// 得加上 要不IE报错
	            sortable : true,
	            align : 'center'
            }, {
	            display : '交易日期',
	            name : 'billDate',
	            width : 180,
	            sortable : true,
	            align : 'center'
            }, {
	            display : '联系电话',
	            name : 'custTel',
	            width : 180,
	            sortable : true,
	            align : 'center'
            }, {
	            display : '送货时间',
	            name : 'deliverTime',
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
            }], 
            
	        sortname : "",
	        sortorder : "desc",
	        singleSelect: true,
	        usepager : true,
	        title : '订单列表',
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
	    		$("#infoTitle").text("订单详细信息");
	    		$("#btnDiv").css("display", "none");
	    		$('#billInfoForm input[name="regDate"]').removeAttr("class");
	    		$('#billInfoForm input[name="regDate"]').removeAttr("onClick");
	    		
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
				    $('#billInfoForm input[name="id"]').val(this.id);
				    actions="systemAction.do?method=getBillInfoDetail";
				    queryDetail(actions);
				    $("#billInfoForm :input").each(function(a,b){
		        		$(b).attr("readonly", "readonly");
		            });
				    
				    $("#billInfo").jqmShow();
			    }
			    break;
	    }
    }
    $("#billInfo").jqm
    ({
	    modal : true,// 限制输入（鼠标点击，按键）的对话
	    overlay : 60 // 遮罩程度%
    }).jqmAddClose('.close')// 添加触发关闭的selector
      .jqDrag('.drag');// 添加拖拽的selector
    
    function queryDetail(url) {
    	$.ajax({
	        url : url,
	        data : $("#billInfoForm").serialize(),
	        type : 'POST',
	        dataType : 'json',
	        success : function(data) {
	        	$('#billInfoForm input[name="custName"]').val(data.custName);
			    $('#billInfoForm input[name="custTel"]').val(data.custTel);
	        	$('#billInfoForm input[name="billId"]').val(data.billId);
			    $('#billInfoForm input[name="billDate"]').val(formatTime(data.billDate.time));
			    $('#billInfoForm input[name="billType"]').val(data.billType);
			    $('#billInfoForm input[name="custAddr"]').val(data.custAddr);
			    $('#billInfoForm input[name="accu"]').val(data.accu);
			    $('#billInfoForm input[name="isInvoice"]').val(data.isInvoice);
			    $('#billInfoForm input[name="isVintegral"]').val(data.isVintegral);
			    $('#billInfoForm input[name="amt"]').val(data.amt);
			    $('#billInfoForm input[name="billState"]').val(data.billState);
			    $('#billInfoForm input[name="payType"]').val(data.payType);
			    $('#billInfoForm input[name="rejectFlg"]').val(data.rejectFlg);
			    $('#billInfoForm input[name="rejectCause"]').val(data.rejectCause);
			    $('#billInfoForm input[name="rejectTime"]').val(formatTime(data.rejectTime.time));
			    $('#billInfoForm input[name="deliverFee"]').val(data.deliverFee);
			    $('#billInfoForm input[name="deliverTime"]').val(formatTime(data.deliverTime.time));
			    $('#billInfoForm input[name="userAppr"]').val(data.userAppr);
			    $('#billInfoForm input[name="apprTime"]').val(formatTime(data.apprTime.time));
			    $('#billInfoForm input[name="billAppr"]').val(data.billAppr);
			    $('#billInfoForm input[name="memo"]').val(data.memo);
			    $('#billInfoForm input[name="id"]').val(this.id);
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
    
    $("#query").click(function()
	{
         var params = [  {"name" : "billDateBegin", "value" : $("#billDateBegin").val()},  
                         {"name" : "billDateEnd", "value" : $("#billDateEnd").val()},
                         {"name" : "billState", "value" : $("#billState").val()}];          
         $('#flex').flexOptions({params : params, newp : 1}).flexReload(); 
	});
    $("#reset").click(function()
	{
    	$("#billDateBegin").val("");
    	$("#billDateEnd").val("");
    	$("#billState").val("");
	});
 });