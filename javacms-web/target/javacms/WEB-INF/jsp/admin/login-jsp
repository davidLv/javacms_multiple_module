<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>JAVACMS Administrator's Control Panel</title>
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
<script type="text/javascript">
if(top!=this) {
    top.location=this.location;
}
$(function() {
    $("#username").focus();
    $("#jvForm").validate();
});
</script>
<style type="text/css">
body{background:url(/javacms/res/jeecms/img/login/bg.jpg) left top repeat-x;}
</style>
</head>
<body>
<form id="jvForm" action="/javacms/admin/login" method="post" style="width:100%;">


<div class="login-index">
  <div class="login-index-box">
      <div class="login-logo"><img src="/javacms/res/jeecms/images/login-logo.jpg"></div>
      <div class="login-text">
        <div class="username-con"><i></i><input type="text" id="username" name="username" vld="{required:true}" maxlength="100" class="username" placeholder="<spring:message code="username"/>" /></div>
        <div class="password-con"><i></i><input type="password" id="password" name="password" maxlength="32" vld="{required:true}" class="password" placeholder="<spring:message code="password"/>" /></div>
      </div>
      <div class="login-submit" style="border:none;"><input type="submit" name="submit" value="" style="border:0px none;" /></div>
      <div style="height:0; clear:both;"></div>
    </div>
</div>
</form>
</body>
</html>
