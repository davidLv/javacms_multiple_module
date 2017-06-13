<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional
.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>JEECMS Administrator's Control Panel - powered by jeecms</title>
<link href="/javacms/res/jeecms/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="/javacms/res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="/javacms/res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="/javacms/res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="/javacms/res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<script src="/javacms/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="/javacms/res/common/js/jquery.js" type="text/javascript"></script>
<script src="/javacms/res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="/javacms/res/common/js/jquery-ui.js" type="text/javascript"></script>
<script src="/javacms/res/common/js/jeecms.js" type="text/javascript"></script>
<script src="/javacms/res/jeecms/js/admin.js" type="text/javascript"></script>

<script src="/javacms/thirdparty/ueditor/ueditor.config.js" type="text/javascript" ></script>
<script src="/javacms/thirdparty/ueditor/ueditor.all.js" type="text/javascript" ></script>
<script src="/javacms/thirdparty/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript" ></script>
<style type="text/css">        
/**============ 顶栏 ===============**/
.top-r{}
.top_bg{background:url(/javacms/res/jeecms/images/top_bg.jpg) repeat-x; width:100%; height:67px; position
:relative;}
.w270{ width:270px;}
.top_xx{height:35px; line-height:35px; color:#fff; font-size:12px;display:table-cell; padding-left:30px
;}
.top_xx span{ color:#4b9bd5; padding:0 10px;}
.top_xx a{font-size:12px; color:#fff;}
.top_xx .user-icon{background:url(/javacms/res/jeecms/images/user.png) no-repeat 0 center; width:14px
; height:15px; padding-right:20px;}
.top_xx .message{background:url(/javacms/res/jeecms/images/message.png) no-repeat 0 center; width:16px
; height:11px; padding-right:20px;}
.top_xx .message-count{color:#fff600; text-decoration:underline; padding:0 5px;}
.top_xx .message-count span{color:#fff600; padding:0;}

.top-r .top-ab{position:absolute; right:18px; top:8px; display:inline-block; width:220px;}
.top-r .top-ab form{width:120px; float:left;}
.top-r .top-ab .top-sel{border:1px solid #f0f0f0;}
.top-r .top-ab a{color:#fff; font-size:12px; margin-left:20px;}

/**============ 导航栏 ===============**/
.nav{ height:29px; position:absolute; top:35px; font-size:13px; min-width:900px;}
.nav ul li{ line-height:29px; float:left; padding:0 16px; background:url(/javacms/res/jeecms/images/nav_line
.gif) no-repeat;}
.nav ul li a{font-size:13px; padding:1px 10px; background-color:none;}
.nav ul li.current a{color:#fff; font-weight:bold; background-color:#5c9ecd; padding:1px 10px; border-radius
:3px; -moz-border-radius:3px; -o-border-radius:3px; -webkit-border-radius:3px;}
</style>

<script type="text/javascript">
function g(o){
    return document.getElementById(o);
}
function HoverLi(id){
    $("li[id^='tb_']").each(function(){
        $(this).removeClass("current");
        $(this).addClass("normal");
    });
    $("#tb_"+id).removeClass("normal");
    $("#tb_"+id).addClass("current");
}
function countUnreadMsg(){
     $.post("message/getUnreadMsgCount", {
        }, function(data) {
            if(data.result){
                 $("#countDiv").html(""+data.count+"");
            }else{
                alert("请先登录");
            }
        }, "json");
     setTimeout( "countUnreadMsg() ",1000*60*10);    
}

$(function(){
    $('a').bind("focus", function(){   
        $(this).blur();   
    }); 
    countUnreadMsg();
});
setTimeout( "countUnreadMsg() ",1000*60*10); 
function mapDialog(){
    var result=window.showModalDialog("map.do","","dialogHeight:600px;dialogWidth:800px;center:yes;resizable: yes;");
    if(result!=null){
        var href=result.split(";")[0];
        var target=result.split(";")[1];
        if(target=="rightFrame"){
                window.parent.mainFrame.document.getElementById(target).src=href;
                var rightFrameSrc=window.parent.mainFrame.document.getElementById(target).src;
                 if(rightFrameSrc.indexOf("frame")>=0){
                    window.parent.mainFrame.document.getElementById(target).src=rightFrameSrc.split("frame/")[0]+rightFrameSrc
.split("frame/")[1];
                    }
            }
        else {
                window.parent.document.getElementById(target).src=href;
            }
        }
}
</script>
<script> 
    
</script> 
</head>

<body>
<div class="top_bg">
    <div class="w270 f_l">
        <img src="/javacms/res/jeecms/images/logo.jpg" width="230" height="67" class="f_l">
        <img src="/javacms/res/jeecms/images/hudu.jpg" width="40" height="67" class="f_l">
    </div>
    <div class="top-r f_l">
        <div class="top-ab">
          <form action="index.do" target="_top" method="get">
            <select name="_site_id_param" onchange="this.form.submit();" class="top-sel">
            <option value="1" selected="selected">jeecms演示站</option>
            </select>
          </form>
          <a id="view_index" href="/jeecms/" target="_blank"><spring:message code="global.admin.viewFrontIndex"/></a>
        </div>
        <div class="top_xx"><i class="user-icon"></i><spring:message code="global.admin.welcome" arguments=" ${userName}" argumentSeparator=","/> <span>|</span><i class="message"></i><spring:message code="cmsUser.has"/><a
 href="message/v_list.do" target="rightFrame" class="message-count"><span id="countDiv"></span></a><spring:message code="cmsUser.unreadcount"/><span>|</span><a href="logout" target="_top" id="logout" onclick="return confirm
('您确定退出吗？');" class="login-out"><spring:message code="global.admin.logout"/></a></div>
        <div class="nav">
            <ul>
                <li style="background:none;" id="tb_11" onclick="HoverLi(11);" class="current"><a href
="main.do" target="mainFrame"><spring:message code="global.admin.home"/></a></li>
                <li id="tb_12" onclick="HoverLi(12);"><a href="frame/content_main.do?source=top" target
="mainFrame"><spring:message code="cms.function.content"/></a></li>
                <li class="normal" id="tb_13" onclick="HoverLi(13);"><a href="channel/channel_main.do" target
="mainFrame"><spring:message code="cms.function.channel"/></a></li>
                <li class="normal" id="tb_14" onclick="HoverLi(14);"><a href="frame/maintain_main.do" target="mainFrame"
><spring:message code="cms.function.maintain"/></a></li>
                <li class="normal" id="tb_15" onclick="HoverLi(15);"><a href="frame/user_main.do" target="mainFrame"
><spring:message code="cms.function.user" /></a></li>
                <li class="normal" id="tb_16" onclick="HoverLi(16);"><a href="frame/expand_main.do" target="mainFrame"
><spring:message code="cms.function.extension"/></a></li>
                <li class="normal" id="tb_17" onclick="HoverLi(17);"><a href="frame/statistic_main.do" target="mainFrame"
><spring:message code="cms.function.data"/></a></li>
                <li class="normal" id="tb_18" onclick="HoverLi(18);"><a href="template/template_main.do" target="mainFrame"
><spring:message code="cms.function.template"/></a></li>
                <li class="normal" id="tb_19" onclick="HoverLi(19);"><a href="resource/resource_main.do" target="mainFrame"
><spring:message code="cms.function.resource"/></a></li>
                <li class="normal" id="tb_20" onclick="HoverLi(20);"><a href="frame/config_main.do" target="mainFrame"
><spring:message code="cms.function.config"/></a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>