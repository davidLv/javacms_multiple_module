<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional
.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>jeecms-left</title>
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
$(function(){
    Cms.leftLi();
});
</script>
</head>
<body>
<div class="w230 f_l ove">
    <div class="fresh" style="font-size:12px; text-indent:36px;">
<div class="date">
 <span> 
    <script language="javascript">
       var day="";
       var month="";
       var ampm="";
       var ampmhour="";
       var myweekday="";
       var year="";
       mydate=new Date();
       myweekday=mydate.getDay();
       mymonth=mydate.getMonth()+1;
       myday= mydate.getDate();
       year= mydate.getFullYear();
       if(myweekday == 0)
       weekday=" 星期日 ";
       else if(myweekday == 1)
       weekday=" 星期一 ";
       else if(myweekday == 2)
       weekday=" 星期二 ";
       else if(myweekday == 3)
       weekday=" 星期三 ";
       else if(myweekday == 4)
       weekday=" 星期四 ";
       else if(myweekday == 5)
       weekday=" 星期五 ";
       else if(myweekday == 6)
       weekday=" 星期六 ";
       document.write(year+"年"+mymonth+"月"+myday+"日 "+weekday);
      </script>
 </span>
</div>  </div>
    <div class="w229">
        <ol>
            <li class="leftCurr"><a href="">欢迎页</a></li>
        </ol>
    </div>
</div>

</body>
</html>