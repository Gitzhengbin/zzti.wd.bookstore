<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragrma","no-cache"); 
response.setDateHeader("Expires",0); 
%>
<html lang="zh-CN" style="height:auto">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>预付款信息列表</title>
<link rel="icon" href="<c:url value='/logo/logo.png'/>">
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/dashboard.css'/>" rel="stylesheet">
<script src="<c:url value='/js/html5shiv.min.js'/>"></script>
<script src="<c:url value='/js/respond.js'/>"></script>
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script type="text/javascript">
    $(function() {
   			var svby = $("#select_value_begin_year").val();
   			var svey = $("#select_value_end_year").val();
			var page = $("#page_servlet").val();//选中跳转至的页数
			$("li").each(function(){
			    $(this).attr("class","");
			});
			var n = 4;
			var end = $("#pages_servlet").val();
			for(var m = 1;m <= end;m++,n++){
				//var s = document.getElementById('pages_ul');
				$("#pages_ul").append("<li id=li_"+m+" class=><a href=# onclick=fanye("+m+");>"+m+"</a></li>");
			}
			$("#pages_ul").append("<li>"
			      +"<a href=# aria-label=Next>"
			       + "<span aria-hidden=true>&raquo;</span>"
			     + "</a>"
			   + "</li>");
			$("#li_"+page).attr("class","active");
			//增加票据时，自动生成时间中的年份
			//获得当前年份
			var today = new Date();
	        year1 = today.getFullYear();
	        year2 = year1 + 1;
	        year3 = year2 + 1;
	        year0 = year1 - 1;
	        $("#sb_y_0").text(year0);
			$("#sb_y_1").text(year1);
			$("#sb_y_2").text(year2);
			$("#sb_y_3").text(year3);
			$("#se_y_0").text(year0);
			$("#se_y_1").text(year1);
			$("#se_y_2").text(year2);
			$("#se_y_3").text(year3);
			for(var i = 0;i < 4;i++){
				if($("#sb_y_"+i).text() == svby){
					$("#sb_y_"+i).attr("selected",true);
				} 
				if($("#se_y_"+i).text() == svey){
					$("#se_y_"+i).attr("selected",true);
				}
			}
		});
		function fanye(pages){
			$("#pay_form").attr("action","List_Pay_Prove_Servlet?method=list&page="+pages);
			tijiao();
		}
		function tijiao(){
			var change_times = new Array();
			change_times.push($("#select_begin_month").val());
			change_times.push($("#select_begin_day").val());
			change_times.push($("#select_end_month").val());
			change_times.push($("#select_end_day").val());
			for(i=0;i<change_times.length;i++){
				if(change_times[i].length==1){
					change_times[i] = "0"+change_times[i];
				}
			}
			begin_time = $("#select_begin_year").val()+"-"+change_times[0]+"-"+change_times[1];
			end_time = $("#select_end_year").val()+"-"+change_times[2]+"-"+change_times[3];
			$("#select_begin_time").val(begin_time);
			$("#select_end_time").val(end_time);
			$("#pay_form").submit();
		}
		function addFun(){
			var date;
	        var month;
	        var year;
	        var today = new Date();
	        year = today.getFullYear()+"";
	        month = today.getMonth() + 1;
	        month+="";
	        date = today.getDate()+"";
       		hour = today.getHours()+"";
			minute = today.getMinutes()+"";
			second = today.getSeconds()+"";
			if(month.length == 1){
				month = "0"+month;
			}if(date.length == 1){
				date = "0"+date;
			}if(hour.length == 1){
				hour = "0"+hour;
			}if(minute.length == 1){
				minute = "0"+minute;
			}if(second.length == 1){
				second = "0"+second;
			}
			
			var ok_time = year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
	        $("#addpay_time").val(ok_time);
		}
    </script>
</head>
<body
	style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto">

	<div class="modal fade" id="add_update_Modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" align="left">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="add_update_ModalLabel">添加存入凭证：</h4>
				</div>
				<div class="modal-body">
					<form name="test_id" id="test_id"
						action="Manager_AddressServlet?method=add" method="post">
						<div class="form-group">
							<label for="recipient-name" class="control-label" id="label_address">编号：</label> 
							<input type="text" name="form_username" id="user-username" class="form-control" value="${maxNum+1}" disabled>
						</div>
							<label for="recipient-name" class="control-label" id="label_address">预付款单位或个人：</label> 
						<div class="input-group form-group">
							
						    <input name="pay_form_name" class="form-control" id="user_code" placeholder="预付款单位或个人代码">
						    <input name="pay_form_code" type="hidden" id="user_form_code">
						    <span class="input-group-btn">
			        			<button id="return_button" onclick="return_num()" class="btn btn-default" style="font-weight:bolder" type="button"><</button>
			      			</span>
		      			</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label" id="label_address">存款金额：</label> 
							<input type="text" name="form_password" class="form-control" id="user-password">
							<input type="hidden" id="user-id" name="form_id">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label" id="label_address">账户余额：</label> 
							<input type="text" name="form_password" class="form-control" id="user-password">
							<input type="hidden" id="user-id" name="form_id">
						</div>						
						<div class="form-group">
							<label for="recipient-name" class="control-label" id="label_address">经办人：</label>
							<input type="text" name="form_password" class="form-control" id="user-password" value="${sessionScope.username}" disabled>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label" id="label_address">时间：</label>
							<br/>
							<select id="selectYear" class="form-control refund_order_in" style="width:20%;display:inline">
				   	  			<option id="select_year0"></option>
				   	  			<option id="select_year1" selected></option>
				   	  			<option id="select_year2"></option>
				   	  			<option id="select_year3"></option>
				  			</select>年
				  			<select id="selectMonth" class="form-control refund_order_in" style="width:10%;display:inline">
				   	  			<c:forEach var="month"  begin="1" end="12">
							   	  	<option id="month_${month}">${month}</option>
							   	</c:forEach>
				  			</select>月
				  			<select id="selectDate" class="form-control refund_order_in" style="width:10%;display:inline">
				   	  			<c:forEach var="date"  begin="1" end="31">
							   	  	<option id="date_${date}">${date}</option>
							   	</c:forEach>
				  			</select>日
				  			<select id="selectHour" class="form-control refund_order_in" style="width:10%;display:inline">
			  				    <c:forEach var="hour"  begin="0" end="23">
						   	  	   <option id="hour_${hour}">${hour}</option>
						   	    </c:forEach>
				  			</select>时
				  			<select id="selectMinute" class="form-control refund_order_in" style="width:10%;display:inline">
			  				    <c:forEach var="minute"  begin="0" end="59">
						   	  	   <option id="minute_${minute}">${minute}</option>
						   	    </c:forEach>
				  			</select>分
				  			<select id="selectSecond" class="form-control refund_order_in" style="width:10%;display:inline">
			  				    <c:forEach var="second"  begin="0" end="59">
						   	  	   <option id="second_${second}">${second}</option>
						   	    </c:forEach>
				  			</select>秒
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" onclick="tijiao();">保存</button>
				</div>
			</div>
		</div>
	</div>

	<nav class="navbar navbar-default" style="margin-top:2%;height:auto">
		<div class="container-fluid" style="height:auto">
			<div class="main" style="height:auto">
				<h2 class="sub-header">预付款存入凭证列表</h2>
				<div class="table-responsive">
					<table class="table table-striped" style="font-size:14px;">
						<thead>
							<tr>
								<th>编号</th>
								<th>预付款单位或个人</th>
								<th>存款金额</th>
								<th>经办人</th>
								<th>时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="a" items="${list}">
								<tr>
									<td>${a.num}</td>
									<td><a
										href="List_Bank_Servlet?method=list&name=${a.code}&pages_num=1">${a.name}</a></td>
									<td>￥${a.pay_total}</td>
									<td>${a.operator}</td>
									<td>${a.time}</td>
									<c:if test="${a.nullify == 0}">
										<td><a
											href="List_Pay_Prove_Servlet?method=nullify&id=${a.id}&code=${a.code}&money=${a.pay_total}&state=1">作废</a>
										</td>
									</c:if>
									<c:if test="${a.nullify == 1}">
										<td><a style="color:red"
											href="List_Pay_Prove_Servlet?method=nullify&id=${a.id}&code=${a.code}&money=${a.pay_total}&state=0">恢复</a>
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<form id="pay_form"
						action="<c:url value='List_Pay_Prove_Servlet?method=list&page=1'/>"
						method="post">
						<nav margin="0px">
							<ul class="pagination" id="pages_ul">
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
							</ul>
						</nav>

						<select id="select_begin_year" class="form-control list_begin_year" style="width:8%;display:inline" name="begin_year">
							<option id="sb_y_0"></option>
							<option id="sb_y_1"></option>
							<option id="sb_y_2"></option>
							<option id="sb_y_3"></option>
						</select> 年 
						<select id="select_begin_month"
							class="form-control list_begin_month"
							style="width:6%;display:inline" name="begin_month">
							<c:forEach var="month" begin="1" end="12">
								<option value="${month}"
									<c:if test="${month == begin_month_select}">selected="selected"</c:if>>${month}</option>
							</c:forEach>
						</select> 月 <select id="select_begin_day"
							class="form-control list_bank_time"
							style="width:6%;display:inline" name="begin_day">
							<c:forEach var="day" begin="1" end="31">
								<option value="${day}"
									<c:if test="${day == begin_day_select}">selected="selected"</c:if>>${day}</option>
							</c:forEach>
						</select> 日- 
						<select id="select_end_year" class="form-control list_bank_time" style="width:8%;display:inline" name="end_year">
							<option id="se_y_0"></option>
							<option id="se_y_1"></option>
							<option id="se_y_2"></option>
							<option id="se_y_3"></option>
						</select> 年 <select id="select_end_month"
							class="form-control list_bank_time"
							style="width:6%;display:inline" name="end_month">
							<c:forEach var="month" begin="1" end="12">
								<option value="${month}"
									<c:if test="${end_month_select == month}">selected="selected"</c:if>>${month}</option>
							</c:forEach>
						</select> 月 <select id="select_end_day" class="form-control list_bank_time"
							style="width:6%;display:inline" name="end_day">
							<c:forEach var="day" begin="1" end="31">
								<option value="${day}"
									<c:if test="${end_day_select == day}">selected="selected"</c:if>>${day}</option>
							</c:forEach>
						</select> 日 
						<input type="hidden" id="select_value_begin_year" value="${begin_year_select}">
						<input type="hidden" id="select_value_end_year" value="${end_year_select}">
						<input type="hidden" id="select_begin_time" name="begin_time">
						<input type="hidden" id="select_end_time" name="end_time">
						<input type="button" class="btn btn-default" onclick="fanye(1)" value="查看" />
						<!-- <button type="button" class="btn btn-primary" onclick="addFun()" data-toggle="modal" data-target="#add_update_Modal">添加</button> -->
					</form>
				</div>
			</div>
		</div>
		</div>
	</nav>
	<input type="hidden" id="pages_servlet" value="${pages}">
	<input type="hidden" id="page_servlet" value="${pages_num}">
</body>
</html>