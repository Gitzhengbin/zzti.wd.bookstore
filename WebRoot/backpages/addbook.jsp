<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragrma","no-cache");
	response.setDateHeader("Expires",0);
%>
<html lang="zh-CN" style="height:auto">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>预付款存入凭证</title>
    <link rel="icon" href="<c:url value='/logo/logo.png'/>">
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css'/>">
    <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/js/respond.js'/>"></script>
    <script>
		function checkF(){
			var ac = true;
			$(".checkNull").each(function(){
				if($(this).val() == ''){
					ac = false;
				}
			});
			$(".checkDigit").each(function(){
				if(isNaN($(this).val())){
					ac = false;
				}
			});
			if(ac){
				$("#addBookform").submit();
			}else{
				alert("请按规则增加信息，并确保完整");
			}
		}
    </script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto">
  <nav class="navbar navbar-default" style="margin-top:2%;height:auto">
  <div class="container-fluid" style="height:auto">
        <div class="main" style="height:auto">
          <h2 class="sub-header">添加图书信息</h2>
          <div class="table-responsive">
			<form id="addBookform" action="<c:url value='addBookAction.action'/>" method="post" enctype="multipart/form-data">
			  <div class="form-group">
			    <label for="exampleInputEmail1">封面</label>
			    <div class="input-group" style="width:30%">
			    	<input type="file" class="checkNull" name="upload" size="50"/>
      			</div>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail1">书名</label>
			    <div class="input-group" style="width:30%">
				    <input type="text" name="name" class="form-control checkNull" id="user_code" placeholder="请输入图书名称"/>
      			</div>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">作者</label>
			    <div class="input-group" style="width:30%">
		       		<input type="text" name="author" class="form-control checkNull" id="pay_total" placeholder="请输入作者姓名"/>
			    </div>
			   </div>
			   <div class="form-group">
			   		<label for="exampleInputPassword1">出版社</label>
			   	 <div class="input-group" style="width:30%">
			   			<input name="press" class="form-control checkNull" id="user_surplus" type="text" placeholder="请输入出版社名称"/>
			   	 </div>
			   </div>
			   <div class="form-group">
			   		<label for="exampleInputPassword1">ISBN号码</label>
			   	 <div class="input-group" style="width:30%">
			   			<input name="isbn" class="form-control checkNull checkDigit" id="user_surplus" type="text" placeholder="由纯数字组成"/>
			   	 </div>
			   </div>
			   <div class="form-group">
			   		<label for="exampleInputPassword1">页数</label>
			   	 <div class="input-group" style="width:30%">
			   			<input name="number" class="form-control checkNull checkDigit" id="user_surplus" type="text" placeholder="请输入图书总页数"/>
			   	 </div>
			   </div>
			   <div class="form-group">
			   		<label for="exampleInputPassword1">价格</label>
			   	 <div class="input-group" style="width:30%">
			   			<input name="price" class="form-control checkNull checkDigit" id="user_surplus" type="text" placeholder="请输入图书价格"/>
			   	 </div>
			   </div>
			  <button type="button" class="btn btn-default" onclick="checkF();">添加</button>
			  <button type="reset" class="btn btn-default" onclick="">重置</button>
			</form>
          </div>
        </div>
      </div>
    </div>
	</nav>
    </div>
    <div hidden>
    <c:forEach var="a" items="${list_user}">
    	<input type="hidden" style="display:none" class="users" id="user_${a.code}" value="${a.name}">
    	<input type="hidden" style="display:none" class="users_surplus" id="user_${a.code}_surplus" value="${a.surplus}">
    </c:forEach>
    </div>
  </body>
</html>