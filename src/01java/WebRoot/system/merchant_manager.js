$(function() {
	this.id = '';
	//表格
    $("#flex").flexigrid
    ({
	        url : 'systemAction.do?method=queryMerchant_ManagerList',
	        dataType : 'json',
	        colModel :
        	[{
	            display : '公司名称',
	            name : 'enterName',
	            width : 180,// 得加上 要不IE报错
	            sortable : true,
	            align : 'center'
            }, {
	            display : '证件号',
	            name : 'legalReprId',
	            width : 180,
	            sortable : true,
	            align : 'center'
            }, {
	            display : '法人代表',
	            name : 'legalReprName',
	            width : 180,
	            sortable : true,
	            align : 'center'
            }, {
	            display : '负责人',
	            name : 'respbPerson',
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
            }, {
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
            },{
	            name : '修改',
	            bclass : 'edit',
	            onpress : action
            }], 
	        sortname : "",
	        sortorder : "desc",
	        singleSelect: true,
	        usepager : true,
	        title : '商户列表',
	        useRp : true,
	        rp : 10,
	        showTableToggleBtn : true,
	        width : 800,
	        height : 263
    });
    
    var actions="";
    var alertInfo="";
    //按钮处理
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
	    		$("#infoTitle").text("商户详细信息");
	    		$("#btnDiv").css("display", "none");
	    		$('#merchantInfoForm input[name="regDate"]').removeAttr("class");
	    		$('#merchantInfoForm input[name="regDate"]').removeAttr("onClick");
	    		
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
				    $('#merchantInfoForm input[name="id"]').val(this.id);
				    actions="systemAction.do?method=getEnterDetail";
				    queryDetail(actions);
				    $("#merchantInfoForm :input").each(function(a,b){
		        		$(b).attr("readonly", "readonly");
		            });
				    $("#merchant_managerInfo").jqmShow();
			    }
			    break;
	    	
		    case '修改' :
		    	$("#infoTitle").text("商户信息修改");
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
				    $('#merchantInfoForm input[name="id"]').val(this.id);
				    actions="systemAction.do?method=updateEnterInfo";
				    alertInfo = "商户信息修改成功！";
				    queryDetail("systemAction.do?method=getEnterDetail");
				    $("#merchantInfoForm :input").each(function(a,b){
		        		$(b).removeAttr("readonly");
		            });
				    
				    $('#merchantInfoForm input[name="regDate"]').mouseover(function() {
				    	$('#merchantInfoForm input[name="regDate"]').attr("class", "Wdate").attr("onClick", "WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})");
				    }).mouseout(function() {
				    	$('#merchantInfoForm input[name="regDate"]').removeAttr("class").removeAttr("onClick");
				    });
				    
				    $("#merchant_managerInfo").jqmShow();
			    }
			    break;
		    case '删除' :
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
				    this.id = $('.trSelected', grid).attr("id").replace("row","");
				    $('#merchantInfoForm input[name="id"]').val(this.id);
				    actions="systemAction.do?method=delEnterInfo";
				    $.ajax({
				        url : actions,
				        data : $("#merchantInfoForm").serialize(),
				        type : 'POST',
				        dataType : 'json',
				        complete : function() {
				        	alert("删除成功");
				        	$('#flex').flexReload();
			           }
					});
				   
			    }
			    break;
		    case '添加' :
		    	$("#infoTitle").text("商户信息新增");
		    	$("#btnDiv").css("display", "block");
			   
			    	$(".jqmWindow").show(1000);
//				    this.id = $('.trSelected', grid).attr("id").replace("row",""); 
//				    $('#merchantInfoForm input[name="id"]').val(this.id);
				    actions="systemAction.do?method=addEnterInfo";
				    alertInfo = "商户信息新增成功！";
				    $("#merchantInfoForm :input").each(function(a,b){
		        		$(b).removeAttr("readonly");
		            });
				    
				    $('#merchantInfoForm input[name="regDate"]').mouseover(function() {
				    	$('#merchantInfoForm input[name="regDate"]').attr("class", "Wdate").attr("onClick", "WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})");
				    }).mouseout(function() {
				    	$('#merchantInfoForm input[name="regDate"]').removeAttr("class").removeAttr("onClick");
				    });
				    
				    $("#merchant_managerInfo").jqmShow();
			    
			    break;
	    }
    }
    
    
    
    //关闭按钮触发
    $("#merchant_managerInfo").jqm
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
    //发送请求 成功则赋值
    function queryDetail(url) {
    	$.ajax({
	        url : url,
	        data : $("#merchantInfoForm").serialize(),
	        type : 'POST',
	        dataType : 'json',
	        success : function(data) {
	        	$('#merchantInfoForm input[name="enterName"]').val(data.enterName);
			    $('#merchantInfoForm input[name="legalReprId"]').val(data.legalReprId);
			    $('#merchantInfoForm input[name="legalReprName"]').val(data.legalReprName);
			    $('#merchantInfoForm input[name="regDate"]').val(formatTime(data.regDate.time));
			    $('#merchantInfoForm input[name="certType"]').val(data.certType);
			    $('#merchantInfoForm input[name="certId"]').val(data.certId);
			    $('#merchantInfoForm input[name="enterBussLicenImg"]').val(data.enterBussLicenImg);
			    $('#merchantInfoForm input[name="enterAddr"]').val(data.enterAddr);
			    $('#merchantInfoForm input[name="respbPerson"]').val(data.respbPerson);
			    $('#merchantInfoForm input[name="telNo"]').val(data.telNo);
			    $('#merchantInfoForm input[name="enterState"]').val(data.enterState);
			    $('#merchantInfoForm input[name="enterBussLicen"]').val(data.enterBussLicen);
			    $('#merchantInfoForm input[name="id"]').val(this.id);
           }
		});
    	
    }
    //处理时间格式
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
    //提交信息
    $("#submit").click(function()
    {
    	 $.ajax
    	 ({
		        url : actions,
		        data : $("#merchantInfoForm").serialize(),
		        type : 'POST',
		        dataType : 'json',
		        complete: function()
		        {
				     $("#merchant_managerInfo").jqmHide();
				     $('#ctable :input').val(null);
				     alert(alertInfo);
				     $('#flex').flexReload();
				}
		  });
	 });
    //查询
    $("#query").click(function()
	{
    	 var nameSearch = $("#nameSearch").val();
         var params = [  {"name" : "nameSearch", "value" : $("#nameSearch").val()}];          
         $('#flex').flexOptions({params : params, newp : 1}).flexReload(); 
	});
    //重置
    $("#reset").click(function()
	{
    	$("#nameSearch").val("");
	});
    // 关闭窗口
    $("#divclose").click(function()
    {
    	$('#ctable :input').val(null);
    });
 });