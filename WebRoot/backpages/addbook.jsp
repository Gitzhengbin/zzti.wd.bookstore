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
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
		//自定义时间
		function diyTime(){
			isDIYTime = !isDIYTime;
			if(isDIYTime){
				password = prompt("请输入密码：","管理员密码");
		        if(password != "99889"){
		            alert("密码错误！");
		        }else{
		        	$("#diyTimeButton").text("取消自定义时间");
		        	$(".selectvalue").attr("disabled",false);
		        }
			}else{
				printTime();
				$("#diyTimeButton").text("自定义时间");
				$(".selectvalue").attr("disabled",true);
			}
		}
		//提交 form 时 执行此
		function formTime(){
			var time_year = $("#selectYear").val();
			var time_month = $("#selectMonth").val();
			var time_date = $("#selectDate").val();
			var time_hour = $("#selectHour").val();
			var time_minute = $("#selectMinute").val();
			var time_second = $("#selectSecond").val();
			if(time_month.length == 1){
				time_month = "0"+time_month;
			}if(time_date.length == 1){
				time_date = "0"+time_date;
			}if(time_hour.length == 1){
				time_hour = "0"+time_hour;
			}if(time_minute.length == 1){
				time_minute = "0"+time_minute;
			}if(time_second.length == 1){
				time_second = "0"+time_second;
			}
			var ok_time = time_year+"-"+time_month+"-"+time_date+" "+time_hour+":"+time_minute+":"+time_second;
	        $("#addpay_time").val(ok_time);
			$("#pay_time").val(ok_time);
		}
		function printTime(){
			var date;
	        var month;
	        var year;
	        var today = new Date();
	        year = today.getFullYear();
	        month = today.getMonth() + 1;
	        month+="";
	        date = today.getDate()+"";
       		hour = today.getHours()+"";
			minute = today.getMinutes()+"";
			second = today.getSeconds()+"";
			$("#select_year0").text(year-1);
			$("#select_year1").text(year);
			$("#select_year2").text(year+1);
			$("#select_year3").text(year+2);
			$("#date_"+date).attr("selected",true);
			$("#month_"+month).attr("selected",true);
			$("#hour_"+hour).attr("selected",true);
			$("#minute_"+minute).attr("selected",true);
			$("#second_"+second).attr("selected",true);
		}
	</script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto">
  <nav class="navbar navbar-default" style="margin-top:2%;height:auto">
  <div class="container-fluid" style="height:auto">
        <div class="main" style="height:auto">
          <h2 class="sub-header">添加图书信息</h2>
          <div class="table-responsive">
			<form id="pay_prove_form" action="<c:url value='addBookAction.action'/>" method="post">
			  <div class="form-group">
			    <label for="exampleInputEmail1">书名</label>
			    <div class="input-group" style="width:30%">
				    <input type="text" name="name" class="form-control" id="user_code" placeholder="请输入图书名称"/>
      			</div>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">作者</label>
			    <div class="input-group" style="width:30%">
		       		<input type="text" name="author" class="form-control" id="pay_total" placeholder="请输入作者姓名"/>
			    </div>
			   </div>
			   <div class="form-group">
			   		<label for="exampleInputPassword1">出版社</label>
			   	 <div class="input-group" style="width:30%">
			   			<input name="press" class="form-control" id="user_surplus" type="text" placeholder="请输入出版社名称"/>
			   	 </div>
			   </div>
			   <div class="form-group">
			   		<label for="exampleInputPassword1">ISBN号码</label>
			   	 <div class="input-group" style="width:30%">
			   			<input name="isbn" class="form-control" id="user_surplus" type="text" placeholder="由纯数字组成"/>
			   	 </div>
			   </div>
			   <div class="form-group">
			   		<label for="exampleInputPassword1">页数</label>
			   	 <div class="input-group" style="width:30%">
			   			<input name="number" class="form-control" id="user_surplus" type="text" placeholder="请输入图书总页数"/>
			   	 </div>
			   </div>
			   <div class="form-group">
			   		<label for="exampleInputPassword1">价格</label>
			   	 <div class="input-group" style="width:30%">
			   			<input name="price" class="form-control" id="user_surplus" type="text" placeholder="请输入图书价格"/>
			   	 </div>
			   </div>
			  <button type="submit" class="btn btn-default" onclick="">添加</button>
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