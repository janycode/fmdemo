<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>添加/修改商品类型</title>

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

	<style>
		th {
		text-align: center;
	}
</style>
	<script type="text/javascript">
		function showName(obj, id) {
			var jqobj = $(obj);
			$("#tn").val(jqobj.text());
			$("#id1").val(id);
		}
	</script>

	</head>
	<body>
		<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					 aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span>
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
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<div class="jumbotron" style="padding-top:20px;padding-bottom:25px">
			<div class="container">
				<!--<c:if test="${empty goodsType.id}">-->
				<h2>添加商品类型</h2>
				<!--</c:if>-->
				<!--<c:if test="${not empty goodsType.id}">-->
				<h2>修改商品类型</h2>
				<!--</c:if>-->
			</div>
		</div>
		<div class="container">
			<form class="form-horizontal" action="${pageContext.request.contextPath}/goodstype/addOrUpdate" method="post">
				<input type="hidden" name="id" value="${goodsType.id}" />
				<div class="form-group">
					<label class="col-sm-2 control-label">类型名称</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="goodname" placeholder="类型名称" name="typename" value="${goodsType.typename}">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">保存</button>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>
