<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>商品管理</title>
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

	<script>
		// 弹框初始化操作
		$(function () {
			$('[data-toggle="popover"]').popover();
			selectAllOrNot();
			deleteAll();
			selectOne();
		});

		function showAdd(){
			location.href="${pageContext.request.contextPath}/after/add_goods.jsp";
		}
		
		// 解决选择下拉框内容到输入框内容的问题
		function showName(obj, id) {
			var name = $(obj).text();
			$("#typeBtn").text(name);
			$("#typeId").val(id);
			
			console.log("当前选中的商品类型：" + $("#typeId").val());
		}

		// 全选 & 全不选 & 反选
		function selectAllOrNot() {
			$("#allCheckbox").click(function () {
				var oneBox = $(".oneCheckbox");
				var checkedNum = 0;
				for (var i = 0; i < oneBox.length; i++) {
					oneBox[i].checked = !oneBox[i].checked;
					if (oneBox[i].checked) {
						checkedNum++;
					}
				}
				if (checkedNum === 0) {
					$("#selectNum").text("");
				} else {
					$("#selectNum").text(checkedNum);
				}
			});
		}

		// 单选 按钮角标数（选中-累加，取消-累减）
		function selectOne() {
			var oneBox = $(".oneCheckbox");
			oneBox.click(function () {
				var checkedNum = 0;
				for (var i = 0; i < oneBox.length; i++) {
					if (oneBox[i].checked) {
						checkedNum++;
					}
				}
				if (checkedNum === 0) {
					$("#selectNum").text("");
				} else {
					$("#selectNum").text(checkedNum);
				}
			});
		}

		// 批量删除
		function deleteAll() {
			$('#delAllBtn').click(function () {
				if (!confirm("确认删除这些商品吗？")) {
					return false;
				}
				var checkedIds = $(".oneCheckbox");
				for (var i = 0; i < checkedIds.length; i++) {
					if (checkedIds[i].checked) {
						window.location.href = "${pageContext.request.contextPath}/admin?methodName=delGoodsById&id=" + $(checkedIds[i]).val();
					}
				}
			});
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
						<li class="active"><a href="${pageContext.request.contextPath}/admin?methodName=toGetGoodsList">商品管理 <span class="sr-only">(current)</span></a></li>
						<li><a href="${pageContext.request.contextPath}/after/goods_type_list.jsp">商品类型管理</a></li>
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
		<div class="jumbotron" style="padding-top:20px;padding-bottom:25px">
			<div class="container">
				<h2>商品管理</h2>
			</div>

		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<button type="button" onclick="showAdd()" id="addBtn" class="btn btn-info">添加商品</button>
					<button type="button" class="btn btn-primary" id="delAllBtn">批量删除<span class="badge" id="selectNum"></span></button>
				</div>

				<div class="col-md-6" style="text-align: right;padding-right: 25px;">
					<form class="form-inline" action="${pageContext.request.contextPath}/admin" method="get">
						<input type="hidden" name="methodName" value="queryGoodsByCondition">
						<div class="form-group">
							<input type="text" class="form-control" id="inputGoodsName" placeholder="商品名称">
						</div>
						<div class="form-group">
							<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown"
								 aria-haspopup="true" aria-expanded="false">
									--&nbsp;<span id="typeBtn">商品类型</span>&nbsp;--
								</button>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
									<!--  -->
									<li><a onclick="showName(this, '1')">手机</a></li>
									<li><a onclick="showName(this, '2')">相机</a></li>
									<li><a onclick="showName(this, '3')">平板</a></li>
									<li><a onclick="showName(this, '4')">电视</a></li>
									<li><a onclick="showName(this, '5')">笔记本</a></li>
									<li><a onclick="showName(this, '6')">家电</a></li>
									<li><a onclick="showName(this, '7')">路由器</a></li>
									<li><a onclick="showName(this, '8')">智能硬件</a></li>
								</ul>
							</div>
						</div>
						<input type="hidden" id="typeId" name="typeId" value="${goods.typeId}">
						<button type="submit" class="btn btn-info">查询</button>
					</form>
				</div>
			</div>
		</div>

		<!--以下显示表格-->
		<div class="container" style="margin-top:20px;">

			<table style="text-align: center;margin-right:10px;width:99%" class="table table-striped table-hover table-bordered">
				<thead style="text-align: center;">
					<tr>
						<th><input type="checkbox" id="allCheckbox" /></th>
						<th>序号</th>
						<th>商品名称</th>
						<th>商品价格</th>
						<th>图片</th>
						<th>上架时间</th>
						<th>类型</th>
						<th>商品描述</th>
						<th>编辑</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
					
					<c:forEach items="${pageBean.pageList}" var="goods">
						<tr>
							<td><input type="checkbox" class="oneCheckbox" value="${goods.id}" /></td>
							<td>${goods.id}</td>
							<td>${goods.goodsName}</td>
							<td>${goods.price}</td>
							<td>
								<c:if test="${not empty goods.imgPath}">
									<img src="http://localhost:8081/uploadfile/images/${goods.imgPath}" class="img-rounded" height="50px" width="50px" />
								</c:if>
								<c:if test="${empty goods.imgPath}">
									<img src="http://localhost:8081/uploadfile/images/default.jpg" class="img-rounded" height="50px" width="50px">
								</c:if>
							</td>
							<!-- <td><img src="${pageContext.request.contextPath}/images/fruit.jpg" class="img-rounded" height="50px" width="50px" /></td> -->
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${goods.deployDate}" type="both"/></td>
							<td>${goods.goodsType.typename}</td>
							<td>
								<button type="button" class="btn btn-primary" data-toggle="popover" data-placement="top" title="商品介绍"
								 data-content="${goods.description}">详情</button>
							</td>
							<td><a href="${pageContext.request.contextPath}/admin?methodName=getGoodsById&id=${goods.id}"><span class="glyphicon glyphicon-edit" color="#5BC0DE"></span></a></td>
							<td>
								<a href="${pageContext.request.contextPath}/admin?methodName=delGoodsById&id=${goods.id}"
								   class="glyphicon glyphicon-trash"
								   color="#5BC0DE"
								   onclick="return confirm('确认删除 id=${goods.id} 的【${goods.goodsName}】吗?')"
								></a>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		<div class="container">
			<nav aria-label="..." class="navbar-right" style="margin-right:15px">
				<ul class="pagination">
					<c:if test="${pageBean.currentPage == 1}">
						<li class="disabled"><a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">首</span></a></li>
						<li class="disabled"><a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					</c:if>
					<c:if test="${pageBean.currentPage != 1}">
						<li><a href="${pageContext.request.contextPath}/admin?methodName=toGetGoodsList&currentPage=1" aria-label="Previous"><span aria-hidden="true">首</span></a></li>
						<li><a href="${pageContext.request.contextPath}/admin?methodName=toGetGoodsList&currentPage=${pageBean.currentPage - 1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					</c:if>
						<!-- 当前选中样式：li class="active"
							<span class="sr-only">(current)</span> -->
						<c:if test="${pageBean.totalPage < 5}">
							<c:forEach begin="1" end="${pageBean.totalPage}" var="pageNo">
								<li id="liPage${pageNo}"><a href="" id="page${pageNo}">${pageNo}</a></li>
							</c:forEach>
						</c:if>
						<c:if test="${pageBean.totalPage >= 5}">
							<li id="liPage1"><a href="" id="page1">1</a></li>
							<li id="liPage2"><a href="" id="page2">2</a></li>
							<li id="liPage3"><a href="" id="page3">3</a></li>
							<li id="liPage4"><a href="" id="page4">4</a></li>
							<li id="liPage5"><a href="" id="page5">5</a></li>
						</c:if>
					<c:if test="${pageBean.currentPage == pageBean.totalPage}">
						<li class="disabled"><a href="javascript:void(0)" aria-label="Next"><span aria-hidden="true">»</span></a></li>
						<li class="disabled"><a href="javascript:void(0)" aria-label="Next"><span aria-hidden="true">尾</span></a></li>
					</c:if>
					<c:if test="${pageBean.currentPage != pageBean.totalPage}">
						<li><a href="${pageContext.request.contextPath}/admin?methodName=toGetGoodsList&currentPage=${pageBean.currentPage + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
						<li><a href="${pageContext.request.contextPath}/admin?methodName=toGetGoodsList&currentPage=${pageBean.totalPage}" aria-label="Next"><span aria-hidden="true">尾</span></a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</body>
	<script type="text/javascript">
		$(function() {
			changePageNo();
		});
		
		// 每点击一次下一页：1.清除上一页码样式 2.设置当前页样式 3.设置更新所有页链接
		function changePageNo() {
			var currentPage = ${pageBean.currentPage}; // typeof: number
			var showPageNos = 5; // 总共显示5页的页码
			var link = "${pageContext.request.contextPath}/admin?methodName=toGetGoodsList&currentPage=";
			
			// $("#page1").text(currentPage - showPageNos + 1);
			// $("#page2").text(currentPage - showPageNos + 2);
			// $("#page3").text(currentPage - showPageNos + 3);
			// $("#page4").text(currentPage - showPageNos + 4);
			// $("#page5").text(currentPage - showPageNos + 5);
			if (currentPage > showPageNos) {
				// 页码 > 5 时
				for (var i = 1; i <= 5; i++) {
					var pageNo = currentPage - showPageNos + i;
					$("#page"+i).text(pageNo);
					$("#page"+i).attr("href", link + pageNo);
				}
				$("#liPage"+showPageNos).attr("class", "active");
			} else {
				// 页码 < 5 时
				for (var i = 1; i <= 5; i++) {
					$("#page"+i).text(i);
					$("#page"+i).attr("href", link + i);
				}
				$("#liPage"+currentPage).attr("class", "active");
			}
		}
	</script>
</html>
