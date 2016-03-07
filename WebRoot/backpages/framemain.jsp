<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN" style="height:100%">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>书籍后台</title>
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/logo/wd.ico" media="screen"/>
	<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/dashboard.css'/>" rel="stylesheet">
    <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/js/respond.js'/>"></script>
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script type="text/javascript">
    //区分选中与未选中的标题栏
    function alter_href(href,li){
    	//获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
	    var curWwwPath=window.document.location.href;
	    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
	    var pathName=window.document.location.pathname;
	    var pos=curWwwPath.indexOf(pathName);
	    //获取主机地址，如： http://localhost:8083
	    var localhostPaht=curWwwPath.substring(0,pos);
	    //获取带"/"的项目名，如：/uimcardprj
	    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    
    	$("#iframe").attr("src",localhostPaht+projectName+"/"+href);
    	//突出选中的颜色，并恢复未选中的颜色
    	$("#li_"+li).attr("style","background-color:#eee");
    	$(".lihref").each(function(){
    		   	if((($(this).attr("style") == "background-color: rgb(238, 238, 238);")||
    			($(this).attr("style") == "BACKGROUND-COLOR: #eee")
    		) && ($(this).attr("id") != ("li_"+li))){
    			$(this).attr("style","");		
    	}
    	});
    }
    //servlet
    function alter_href_title(href){
    	$("#iframe").attr("src",href);
    }
    //退出登录
    function firm(){
    	location.href="Logout_Servlet";
    }
    //判断当前时间段
    $(function(){
    	var today = new Date();
		var hour = today.getHours();
		if((hour>=0) && hour<=10){
			$("#hello_name").text("早上好 "+$("#admin_name").val());
		}else if((hour>=11) && (hour<=13)){
			$("#hello_name").text("中午好 "+$("#admin_name").val());
		}else if((hour>=14) && (hour<=18)){
			$("#hello_name").text("下午好 "+$("#admin_name").val());
		}else if((hour>=19) && (hour<=24)){
			$("#hello_name").text("晚上好 "+$("#admin_name").val());
		}
		var usercode = $("#admin_code").val();
		if(usercode == 1){
			$("#qitaxinxi").attr("style","");
		}else{
			$("#qitaxinxi").attr("style","display:none");
		}
    });
    </script>
  </head>
  <body style="background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:100%;" scroll="no">
  <!-- 删除 -->
   <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="delete_small_ModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    	<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="delete_ModalLabel">退出登录</h4>
	        <input type="hidden" name="delete_meal_id" id="delete_meal_id">
	    </div>
       <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="firm();">退出</button>
	   </div>
    </div>
  </div>
</div>
  <nav class="navbar navbar-inverse navbar-fixed-top" style="background-color:#4D698C;">
    <div class="navbar-header" style="width:100px;hight:29px;top:10">
        <img alt="Brand" style="margin-left: 10px;margin-right:10px;margin-top: 5px;" height="40px;" src="<c:url value='/logo/logo.png'/>">
    </div>
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" style="color:white;" href="#" onclick="javascript:alter_href('Opreate_Notes_Servlet?method=list');">网上书城基础支持系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#" id="hello_name" style="color:#F7F7F7;"></a></li>
            <input type="hidden" value="${sessionScope.username}" id="admin_name">
            <input type="hidden" value="${sessionScope.username_code}" id="admin_code">
            <li><a href="#" data-toggle="modal" data-target="#delete_small_ModalLabel" style="color:#F7F7F7;">退出</a></li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container-fluid"  style="height:100%">
      <div class="row" style="height:100%">
        <div class="col-sm-3 col-md-2 sidebar">
       	 <ul class="nav nav-sidebar">
          <li class="active"><a href="#">快速操作 <span class="sr-only">(current)</span></a></li>
            <li id="li_1" class="lihref"><a href="#" onclick="javascript:alter_href('/backpages/addbook.jsp',1);">添加图书信息</a></li>
          </ul>
		  <ul class="nav nav-sidebar">
            <li class="active"><a href="#">信息查看 <span class="sr-only">(current)</span></a></li>
            <li id="li_4" class="lihref"><a href="#" onclick="javascript:alter_href('manage.action',4);">图书列表</a></li>
          </ul> 
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2" style="height:100%;">
        	<iframe id="iframe" frameborder="no" border="0"  style="height:100%;width:100%;" src="<c:url value='manage.action'/>"></iframe>
        </div>
      </div>
    </div>
  </body>
</html>