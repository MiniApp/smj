<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>尚佰味网 - 天津外卖|网上订餐|快餐网|盒饭便当配送</title>
<meta name="Description" content="尚佰味网为您提供丰富的外卖,盒饭菜谱，您可以通过网上订餐，电话订餐等方式订到喜欢的饭菜。为您奉献天津24小时送餐业务。使您随时随地能吃上可口的饭菜。" />
<meta name="Keywords" content="sunbyway,天津快餐,天津外卖,天津订餐,天津送餐,天津美食,天津小吃,外卖网,送餐网,快餐,盒饭,网上订餐,天津24小时外卖,外卖电话,盒饭配送,快餐外卖,快餐送餐,尚佰味网,尚佰味" />
<link rel="shortcut icon" href="${ctx}/favicon.ico">
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#banner { margin: 0 auto; width: 960px; }
#joins { width: 960px; margin: 10px auto 0; overflow: hidden; }
#joins .left { width: 220px; float: left; }
#joins .right { width: 728px; float: right; }
#joins .left .content { padding: 4px 8px; width: 204px; background-color: #FFF; }
#joins .left .content .list { width: 204px; font-weight: bold; margin: 1px 0; float: left; overflow: hidden; zoom: 1; }
#joins .left .content .list span { height: 29px; line-height: 29px; width: 179px; background-color: #EFEFF1; padding-left: 25px; }
#joins .left .content .list li { height: 25px; line-height: 25px; width: 173px; padding: 0 0 0 31px; margin: 1px 0 0; float: left; background: url(${ctx}/images/pic06.gif) no-repeat 25px center #EFEFF1; background-color: #F7F7F9; }
.joinbox-top { background: url(${ctx}/images/pic04.gif) 0px 0px; margin: 0 auto; width: 220px; height: 3px; line-height: 0px; font-size: 0px; }
.joinbox-bottom { background: url(${ctx}/images/pic04.gif) 0px -4px; margin: 0 auto; width: 220px; height: 4px; line-height: 0px; font-size: 0px; }
.jiantou01 { background: url(${ctx}/images/jt01-1.gif) no-repeat 14px center; float: left; }
.box-top { background: url(${ctx}/images/pic07.gif) 0px 0px; margin: 0 auto; width: 728px; height: 7px; line-height: 0px; font-size: 0px; }
.box-bottom { background: url(${ctx}/images/pic07.gif) 0px -8px; margin: 0 auto; width: 728px; height: 7px; line-height: 0px; font-size: 0px; }
.xian01 { height: 1px; background-color: #DFDFDF; line-height: 1px; font-size: 0px; margin: 8px 0 20px; }
#joins .right .content { width: 688px; padding: 12px 20px 0; }
#joins .right .content .jieshao { width: 688px; margin: 0 auto; background-color: #FAFAFA; padding: 10px 0; overflow: hidden; color: #595959; font-size: 12px; line-height: 25px; }
#joins .right .content .zhiwei { background-image: url(${ctx}/images/pic10.gif); width: 675px; margin: 10px auto 0; height: 19px; padding: 15px 0 0 17px; font-size: 12px; color: #FFF; font-weight: bold; }
.jieshao .title { float: left; width: 80px; text-align: right; font-weight: bold; clear: both; }
.jieshao .zhiweicontent { float: left; width: 580px; }
</style>
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
	<div id="banner"><img src="${ctx}/images/pic05.jpg" width="960" height="140" /></div>
    <div id="joins">
        <div class="left"><div class="joinbox-top"></div><div class="content">
        	<div style="margin-bottom: 2px;"><img src="${ctx}/images/pic05.gif" /></div>
            <div class="list"><span class="jiantou01">开发部</span><div class="jobxiangxi"><li>网站美工</li></div></div>
            <div class="list"><span class="jiantou01">运营部</span><div class="jobxiangxi"><li>呼叫坐席/客服</li></div></div>
            <div class="list"><span class="jiantou01">市场部</span><div class="jobxiangxi"><li>招商专员</li><li>销售代表</li></div></div>
        </div><div class="joinbox-bottom"></div></div>
        <div class="right">
            <div class="box-top"></div>
            <div class="content">
                <div style="font-size: 14px; padding-left: 13px; line-height: 21px; background: url(${ctx}/images/pic08.gif) no-repeat left center;color: #595959" id="top">加入我们</div>
                <div class="xian01"></div>
                <div style="width: 674px; line-height: 27px; background-color: #FFF7D7;padding: 10px 0 10px 14px; color: #F30; font-size: 12px; margin-bottom: 21px;">
不接受任何电话自荐，简历请投HR信箱：<font style="font-size: 20px; font-weight: bold;">hr@sunbyway.com</font>，邮件标题请注明投递的职位名称。<br />如通过初审，将会电话预约面谈时间，谢谢配合！</div>
                <div class="zhiwei">网站美工</div>
                <div class="jieshao">
                	<span class="title">学历要求 :</span><span class="zhiweicontent">&nbsp;&nbsp;大专以上</span>
                	<span class="title">工作年限 :</span><span class="zhiweicontent">&nbsp;&nbsp;二年以上</span>
                	<span class="title">岗位责任 :</span>
                	<span class="zhiweicontent">&nbsp;&nbsp;1、负责整站美工设计、改版，商户活动页面设计；<br/>&nbsp;&nbsp;2、负责网站页面JavaScript编程；维护网站现有代码；<br/>
                	&nbsp;&nbsp;3、解决主流浏览器及其不同版本之间的兼容性问题；<br/>&nbsp;&nbsp;4、优化网站的前端性能, 保证网站的高质高速；<br/>&nbsp;&nbsp;5、编写相关技术文档。</span>
                	<span class="title">任职要求 :</span>
                	<span class="zhiweicontent">&nbsp;&nbsp;1、大专以上学历，计算机及相关专业毕业，二年以上工作经验；<br/>&nbsp;&nbsp;2、精通HTML、CSS+DIV、FLASH、Javascript对AJAX有深入了解；<br/>
                	&nbsp;&nbsp;3、熟练使用Photoshop/Fireworks对设计图进行切割和导出；<br/>&nbsp;&nbsp;4、对前端技术规范有深入的了解，可以合理的规划代码，对前端性能优化、代码重构有一定的经验；<br/>
                	&nbsp;&nbsp;5、善于与他人沟通、合作，具有团队精神，良好的自学能力；</span>
                </div>
                <div class="xian01"></div>
                <div class="zhiwei">呼叫坐席/客服</div>
                <div class="jieshao">
                	<span class="title">学历要求 :</span><span class="zhiweicontent">&nbsp;&nbsp;高中以上</span>
                	<span class="title">工作年限 :</span><span class="zhiweicontent">&nbsp;&nbsp;一年以上</span>
                	<span class="title">岗位责任 :</span>
                	<span class="zhiweicontent">&nbsp;&nbsp;1、在线接单并处理订单；<br/>&nbsp;&nbsp;2、接听客户咨询电话，解答客户疑问并促成销售；<br/>
                	&nbsp;&nbsp;3、对客户进行跟踪，及时反馈客户信息；<br/>&nbsp;&nbsp;4、有电话销售或呼叫中心客服经验者优先；<br/>&nbsp;&nbsp;5、公司提供完备的岗前培训。</span>
                	<span class="title">任职要求 :</span>
                	<span class="zhiweicontent">&nbsp;&nbsp;1、20-35岁，高中、中专或以上学历；<br/>&nbsp;&nbsp;2、口齿清楚，普通话标准，声音甜美；<br/>
                	&nbsp;&nbsp;3、计算机操作熟练，中文打字速度较快；<br/>&nbsp;&nbsp;4、有较强的应变能力和学习能力；<br/>
                	&nbsp;&nbsp;5、性格开朗，能承受较重的工作压力；</span>
                </div>
                <div class="xian01"></div>
                <div class="zhiwei">招商专员</div>
                <div class="jieshao">
                	<span class="title">学历要求 :</span><span class="zhiweicontent">&nbsp;&nbsp;大专以上</span>
                	<span class="title">工作年限 :</span><span class="zhiweicontent">&nbsp;&nbsp;一年以上</span>
                	<span class="title">岗位责任 :</span>
                	<span class="zhiweicontent">&nbsp;&nbsp;1、利用公司平台资源招商、赞助、合作；<br/>&nbsp;&nbsp;2、制定合作方案、计划，按流程执行任务，评估合作结果；<br/>
                	&nbsp;&nbsp;3、参与商务谈判，重点客户的开拓、关系维持、增强感情；<br/>&nbsp;&nbsp;4、协助部门经理完成大的资源对接和跟进；</span>
                	<span class="title">任职要求 :</span>
                	<span class="zhiweicontent">&nbsp;&nbsp;1、一年以上网络媒体或培训市场开发经验，有资源合作开发经验；<br/>&nbsp;&nbsp;2、具备敏锐的观察力、分析判断能力、问题分析及解决能力；<br/>
                	&nbsp;&nbsp;3、成熟稳重、反应敏捷，具有良好的学习能力、表达和沟通能力、人际交往能力能；<br/>&nbsp;&nbsp;4、有良好的团队精神, 责任心强, 刻苦耐劳,能承受工作压力；</span>
                </div>
                <div class="xian01"></div>
                <div class="zhiwei">销售代表</div>
                <div class="jieshao">
                	<span class="title">学历要求 :</span><span class="zhiweicontent">&nbsp;&nbsp;大专以上</span>
                	<span class="title">工作年限 :</span><span class="zhiweicontent">&nbsp;&nbsp;一年以上</span>
                	<span class="title">岗位责任 :</span>
                	<span class="zhiweicontent">&nbsp;&nbsp;1、完成公司制定的销售计划和指标；<br/>&nbsp;&nbsp;2、维护并增进与已开发客户的关系，经常性的沟通与交流；<br/>
                	&nbsp;&nbsp;3、了解市场信息和客户需求，分析市场动向；</span>
                	<span class="title">任职要求 :</span>
                	<span class="zhiweicontent">&nbsp;&nbsp;1、喜爱互联网，愿意接受新鲜事物；<br/>&nbsp;&nbsp;2、大专以上学历，27岁以下，男女不限；<br/>
                	&nbsp;&nbsp;3、热衷于销售，性格开朗，具有良好的沟通能力和团队合作精神；<br/>&nbsp;&nbsp;4、善于学习，工作主动，能承受一定工作压力；<br/>
                	&nbsp;&nbsp;5、有B2C类电子商务网站销售经验优先；</span>
                </div>
            </div>
            <div style="width: 728px; height: 15px; line-height: 0; font-size: 0; background-color: #FFF;"></div>
            <div class="box-bottom"></div>
        </div>
    </div>
</td></tr></table>
<%@include file="/commons/footer.jsp" %>
</body>
</html>