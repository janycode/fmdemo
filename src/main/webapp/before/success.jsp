<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册成功</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	</head>
	<body>
	<!-- start header -->
		<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="http://www.mi.com/" target="_blank">小米商城</a></li>
						<li>|</li>
						<li><a href="">MIUI</a></li>
						<li>|</li>
						<li><a href="">米聊</a></li>
						<li>|</li>
						<li><a href="">游戏</a></li>
						<li>|</li>
						<li><a href="">多看阅读</a></li>
						<li>|</li>
						<li><a href="">云服务</a></li>
						<li>|</li>
						<li><a href="">金融</a></li>
						<li>|</li>
						<li><a href="">小米商城移动版</a></li>
						<li>|</li>
						<li><a href="">问题反馈</a></li>
						<li>|</li>
						<li><a href="">Select Region</a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="right fr">
					<div class="gouwuche fr"><a href="">购物车</a></div>
					<div class="fr">
						<ul>
							<li><a href="login.jsp" target="_blank">登录</a></li>
							<li>|</li>
							<li><a href="register.jsp" target="_blank" >注册</a></li>
							<li>|</li>
							<li><a href="">消息通知</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!--end header -->

<!-- start banner_x -->
		<div class="banner_x center">
			<a href="./index.jsp" target="_blank"><div class="logo fl"></div></a>
			<a href=""><div class="ad_top fl"></div></a>
			<div class="nav fl">
				<ul>
					<li><a href="">小米手机</a></li>
					<li><a href="">红米</a></li>
					<li><a href="">平板·笔记本</a></li>
					<li><a href="">电视</a></li>
					<li><a href="">盒子·影音</a></li>
					<li><a href="">路由器</a></li>
					<li><a href="">智能硬件</a></li>
					<li><a href="">服务</a></li>
					<li><a href="">社区</a></li>
				</ul>
			</div>
			<div class="search fr">
				<form action="" method="post">
					<div class="text fl">
						<input type="text" class="shuru"  placeholder="小米6&nbsp;小米MIX现货">
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="搜索"/>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->
	<div  style="text-align:center;">
		 
		<h2 style="color:red">恭喜您，注册成功，请尽快到您的邮箱进行激活，立即登录，请点击<a href='../before/login.jsp'>登录</a></h2>
		<div class="clear"></div>
	</div>
	
	<!-- footer -->
	<footer class="mt20 center" margin="margin-top:200px">
			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>

		</footer>
		<script type="text/javascript">
			$(function(){
				var id = window.location.search;
				$.ajax({
					type:"get",
					url:"/xiaomisys/queryGoods" + id,
					dataType:"json",
					success:function(data){
						if(data.code == 1){
							var info = data.info;
							$("#gid").val(info.id);
							$("#nameInfo").html(info.goodsName);
							$("#commentInfo").html(info.comment);
							$("#priceInfo").html(info.price);
							$("#imgPath").attr("src", "/upload/" + info.imgPath);
						}else{
							alert(data.info);
						}
					}
				})
				
				
			})
			
			// 立即购买
			$("#buyBtn").click(function(){
				$.ajax({
					type:"get",
					url:"/xiaomisys/addOrder",
					data:{gid:$("#gid").val(), num:1},
					dataType:"json",
					success:function(data){
						if(data.code == 1){
							//window.location.href = "dingdanzhongxin.html";
							window.location.href = "/xiaomisys/alipayBuy?WIDout_trade_no=1234567&WIDtotal_amount=1&WIDsubject=xiaomiphone&WIDbody=";
						}else{
							alert(data.info);
						}
					}
				})
			})
			
			// 购物车
			$("#cartBtn").click(function(){
				$.ajax({
					type:"get",
					url:"/xiaomisys/addCart",
					data:{gid:$("#gid").val(), num:1},
					dataType:"json",
					success:function(data){
						if(data.code == 1){
							window.location.href = "gouwuche.html";
							//alert("加入购物车成功");
						}else{
							alert(data.info);
						}
					}
				})
			})
			
			
		</script>
	</body>
</html>