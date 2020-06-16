<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>添加/修改商品</title>
		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
		<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
		<!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
	</head>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

	<style type="text/css">
		th {
			text-align: center;
		}
	</style>
	<script type="text/javascript">
		// 用于图片上传前选中图片文件进来后，可以直接显示该图片
		function show(file) {
			var reader = new FileReader(); // 实例化一个FileReader对象，用于读取文件
			var img = document.getElementById('goodsImg'); // 获取要显示图片的标签
			// 读取File对象的数据
			reader.onload = function(evt) {
				img.width = "130";
				img.height = "130";
				img.src = evt.target.result;
			}
			reader.readAsDataURL(file.files[0]);
		}
		
		//解决选择下拉框内容到输入框内容的问题
		function showName(obj, id) {
			var name = $(obj).text();
			$("#typeName").val(name);
			$("#typeId").val(id);
		}
	</script>
	<body>


		<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					 aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">锋迷网管理系统</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="${pageContext.request.contextPath}/admin?methodName=toGetGoodsList">商品管理 <span class="sr-only">(current)</span></a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/after/goods_type_list.jsp">商品类型管理</a></li>
						<li><a href="${pageContext.request.contextPath}/after/user.jsp">用户管理</a></li>
						<li><a href="${pageContext.request.contextPath}/after/order.jsp">订单管理</a></li>
						<li><a href="${pageContext.request.contextPath}/before/index.html">> 返回锋迷网</a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="javascript:void(0)" style="color: orange;">${admin.username}</a>
						</li>
						<li> <a href="${pageContext.request.contextPath}/admin?methodName=logout"><span class="glyphicon glyphicon-log-in" style="padding-left:0px"></span></a> </li>
						<li> <a href="${pageContext.request.contextPath}/admin?methodName=logout" style="padding-left:0px">退出</a> </li>
					</ul>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>

		<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
			<div class="container">
				<c:if test="${empty goods.id}">
					<h2>添加商品信息</h2>
				</c:if>
				<c:if test="${not empty goods.id}">
					<h2>修改商品信息</h2>
				</c:if>
			</div>
		</div>
		<div class="container" style="margin-top: 20px;">

			<form class="form-horizontal" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin" method="post">
				<input type="hidden" name="methodName" value="saveOrUpdate" />
				<input type="hidden" name="id" value="${goods.id}" />
				<div class="form-group">
					<label class="col-sm-2 control-label">商品名称</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="goodsName" value="${goods.goodsName}" placeholder="请输入商品靓名">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">商品价格</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="price" value="${goods.price}" placeholder="请输入商品价格">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">商品类别</label>
					<div class="col-sm-10">
						<div class="input-group">
							<div class="input-group-btn">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
								 aria-expanded="false">下拉菜单<span class="caret"></span></button>
								<ul id="selectSpeaker" class="dropdown-menu">

								<c:if test="${empty typeList}">
									<li><a onclick="showName(this, '1')">手机</a></li>
									<li><a onclick="showName(this, '2')">相机</a></li>
									<li><a onclick="showName(this, '3')">平板</a></li>
									<li><a onclick="showName(this, '4')">电视</a></li>
									<li><a onclick="showName(this, '5')">笔记本</a></li>
									<li><a onclick="showName(this, '6')">家电</a></li>
									<li><a onclick="showName(this, '7')">路由器</a></li>
									<li><a onclick="showName(this, '8')">智能硬件</a></li>
								</c:if>
									
								<c:if test="${not empty typeList}">
									<c:forEach items="${typeList}" var="type">
										<li><a onclick="showName(this, ${type.id})">${type.typename}</a></li>
									</c:forEach>
								</c:if>
								
								</ul>
							</div><!-- /btn-group -->
							<input type="hidden" class="form-control" id="typeId" name="typeId" value="${goods.typeId}">
							<input type="text" class="form-control" disabled id="typeName" value="${goods.goodsType.typename}" aria-label="...">
						</div><!-- /input-group -->
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">商品图片</label>
					<div class="col-sm-10">
						<input type="file" name="imgPath" onchange="show(this)"> <br />
							<c:if test="${not empty goods.imgPath}">
								<img src="http://localhost:8081/uploadfile/images/${goods.imgPath}" alt="..." class="img-thumbnail" id="goodsImg" height="130px" width="130px">
							</c:if>
							<c:if test="${empty goods.imgPath}">
								<img src="http://localhost:8081/uploadfile/images/default.jpg" alt="..." class="img-thumbnail" id="goodsImg" height="130px" width="130px">
							</c:if>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">商品描述</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="description" rows="3">${goods.description}</textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">保存</button>
						<button type="reset" class="btn btn-default">清空</button>
						<span id="msg" style="color: red;">${errMsg}</span>
					</div>
				</div>
			</form>

		</div>


	</body>
</html>
