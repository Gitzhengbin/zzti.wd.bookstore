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
	function updateF(id){
		$("#update_id").val(id);
		$("#update_name").val($("#list_name_"+id).text());
		$("#update_author").val($("#list_author_"+id).text());
		$("#update_press").val($("#list_press_"+id).text());
		$("#update_isbn").val($("#list_isbn_"+id).text());
		$("#update_number").val($("#list_number_"+id).text());
		$("#update_price").val($("#list_price_"+id).text());
	}
	function updateFrom(){
		var ac = true;
		$(".checkForm_null").each(function(){
			if($(this).val() == ''){
				ac = false;
			}
		});
		$(".checkForm_digit").each(function(){
			if(isNaN($(this).val())){
				ac = false;
			}
		});
		if(ac == false){
			alert("请按规则修改信息，并确保完整");
		}else{
			$("#updateBookForm").submit();
		}
	}
</script>
</head>
<body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto">
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
						<div class="row">
						  <div class="col-xs-6 col-md-3">
						    <a href="#" class="thumbnail">
						      <img src="<c:url value='//'/>" alt="...">
						    </a>
						  </div>
						</div>
					<form name="updateBookForm" id="updateBookForm" action="updateBookAction.action" method="post">
						<table>
							<input type="hidden" name="id" id="update_id"/>
							<tr>
								<td>
									<div class="form-group">
										<label for="recipient-name" class="control-label" id="label_address">书名：</label>						
									    <input type="text" name="name" class="form-control checkForm_null" id="update_name" placeholder="请输入图书名称">
					      			</div>
								</td>
								<td style="width:30px;"></td>
								<td>
									<div class="form-group">
										<label for="recipient-name" class="control-label" id="label_address">作者：</label> 
										<input type="text" name="author" class="form-control checkForm_null" id="update_author">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<label for="recipient-name" class="control-label" id="label_address">出版社：</label> 
										<input type="text" name="press" class="form-control checkForm_null" id="update_press">
									</div>
								</td>
								<td style="width:30px;"></td>
								<td>
									<div class="form-group">
										<label for="recipient-name" class="control-label" id="label_address">ISBN号码：</label>
										<input type="text" name="isbn" class="form-control checkForm_null checkForm_digit" id="update_isbn">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<label for="recipient-name" class="control-label" id="label_address">页数：</label>
										<input type="text" name="number" class="form-control checkForm_null checkForm_digit" id="update_number">
									</div>			
								</td>
								<td style="width:30px;"></td>
								<td>
									<div class="form-group">
										<label for="recipient-name" class="control-label" id="label_address">价格：</label>
										<input type="text" name="price" class="form-control checkForm_null checkForm_digit" id="update_price">
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" onclick="updateFrom();">保存</button>
				</div>
			</div>
		</div>
	</div>

	<nav class="navbar navbar-default" style="margin-top:2%;height:auto">
		<div class="container-fluid" style="height:auto">
			<div class="main" style="height:auto">
				<h2 class="sub-header">图书信息列表</h2>
				<div class="table-responsive">
					<table class="table table-striped" style="font-size:14px;">
						<thead>
							<tr>
								<th>书名</th>
								<th>作者</th>
								<th>出版社</th>
								<th>ISBN号码</th>
								<th>页数</th>
								<th>价格</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="a" items="${list}">
								<tr>
									<td id="list_name_${a.id}">${a.name}</td>
									<td id="list_author_${a.id}">${a.author}</td>
									<td id="list_press_${a.id}">${a.press}</td>
									<td id="list_isbn_${a.id}">${a.isbn}</td>
									<td id="list_number_${a.id}">${a.number}</td>
									<td id="list_price_${a.id}">${a.price}</td>
									<td>
										<button type="button" class="btn btn-primary btn-xs" onclick="updateF(${a.id});" data-toggle="modal" data-target="#add_update_Modal">修改</button>
										&nbsp;&nbsp;<button type="button" class="btn btn-primary btn-danger btn-xs" onclick="location='deleteBookAction.action?id=${a.id}'">删除</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>
	</nav>
</body>
</html>