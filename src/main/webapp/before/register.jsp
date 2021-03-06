<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>用户注册</title>
		<link rel="stylesheet" type="text/css" href="./css/login.css">
		<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>

	</head>
	<body>
		<form id="form" method="post" action="../user">
			<input type="hidden" name="methodName" value="register" />
			<div style="text-align:center">
				<img src="./image/logo.png" />
			</div>
			<div class="regist">
				<div class="regist_center">
					<div class="regist_top">
						<div class="left fl">会员注册</div>
						<div class="right fr"><a href="./index.jsp" target="_self">锋迷网</a></div>
						<div class="clear"></div>
						<div class="xian center"></div>
					</div>
					<div class="regist_main center">
						<div class="username">
							用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;
							<input class="shurukuang" type="text" name="username" placeholder="请输入你的用户名[至少5位]" id="userName" />
							<span id="usrMsg" style="font-size:18px; color: red;">*</span>
						</div>
						<div class="username">
							密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;
							<input class="shurukuang" type="password" name="password" placeholder="请输入你的密码[4-8位]" id="mm1" />
							<span id="pwdMsg" style="font-size:18px; color: red;">*</span>
						</div>

						<div class="username">
							确认密码:&nbsp;&nbsp;
							<input class="shurukuang" type="password" name="repassword" placeholder="请确认你的密码" id="mm2" />
							<span id="dbPwdMsg" style="font-size:18px; color: red;">*</span>
						</div>
						<div class="username">
							手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;
							<input class="shurukuang" type="text" name="phone" placeholder="请填写正确的手机号" id="phone" />
							<span id="phoneMsg" style="font-size:18px; color: red;">*</span>
						</div>
						<div class="username">
							邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:&nbsp;&nbsp;
							<input class="shurukuang" type="text" name="mail" placeholder="请填写邮箱地址" id="mail" />
							<span id="mailMsg" style="font-size:18px; color: red;">*</span>
						</div>

						<!-- <div class="username">
						<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="yanzhengma" type="text" name="username" placeholder="请输入验证码"/></div>
						<div class="right fl"><img src="./image/yanzhengma.jpg"></div>
						<div class="clear"></div>
					</div> -->
					</div>
					<div class="regist_submit">
						<input class="submit" type="submit" onclick="validateForm()" name="submit" value="立即注册">
					</div>
				</div>
			</div>
		</form>
		<script type="text/javascript">
			$(function() {
				$("#userName").blur(function() {
					validateName();
				});
				$("#mm1").blur(function() {
					validateMm();
				});
				$("#mm2").blur(function() {
					validateMm();
				});
				$("#phone").blur(function() {
					validatePhone();
				});
				$("#mail").blur(function() {
					validateMail();
				});
			});
			
			function validateMail() {
				var mail = $("#mail").val();
				var reg = /^\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}$/;
				if (mail.match(reg)) {
					$("#mailMsg").text("OK");
					$("#mailMsg").css("color", "green");
					return true;
				} else {
					$("#mailMsg").text("该邮箱格式错误");
					$("#mailMsg").css("color", "red");
					return false;
				}
			}
			
			function validatePhone() {
				var phone = $("#phone").val();
				var reg = /^0?(13|14|15|17|18|19)[0-9]{9}$/;
				if (phone.match(reg)) {
					$("#phoneMsg").text("OK");
					$("#phoneMsg").css("color", "green");
					return true;
				} else {
					$("#phoneMsg").text("该手机格式错误");
					$("#phoneMsg").css("color", "red");
					return false;
				}
			}

			function validatePwd(id, msg) {
				var pwd = $(id).val();
				var reg = /^[\w]{4,8}$/;
				if (pwd != '') {
					if (reg.test(pwd)) {
						$(msg).text("OK");
						$(msg).css("color", "green");
						return true;
					} else {
						$(msg).text("该密码不符合规范");
						$(msg).css("color", "red");
						return false;
					}
				} else {
					$(msg).text("该密码不能为空");
					$(msg).css("color", "red");
					return false;
				}
			}

			function validateMm() {
				var v1 = $("#mm1").val();
				var v2 = $("#mm2").val();

				if (validatePwd("#mm1", "#pwdMsg")) {
					if (validatePwd("#mm2", "#dbPwdMsg")) {
						if (v1 == v2) {
							$("#dbPwdMsg").text("OK");
							$("#dbPwdMsg").css("color", "green");
							return true;
						} else {
							$("#dbPwdMsg").text("两次密码不一致，请检查");
							$("#dbPwdMsg").css("color", "red");
							return false;
						}
					}
				}
			}

			var result = true;
			function validateName() {
				var name = $("#userName").val();
				
				if (name != '') {
					var reg = /^[\w]{5,}$/;
					if (!reg.test(name)) {
						$("#usrMsg").text("该用户名不符合规范");
						$("#usrMsg").css("color", "red");
						return false;
					}
					
					$.get("../user?methodName=validateUsr&username=" + name, function(data) {
						// alert(data + "," + (typeof data));
						// 共用 /user?methodName=validateUsr 登陆 查询到才可用，注册 查询不到才可用
						if (data == "false") {
							$("#usrMsg").text("OK");
							$("#usrMsg").css("color", "green");
							result = true;
						} else {
							$("#usrMsg").text("该用户名已经被占用");
							$("#usrMsg").css("color", "red");
							result = false;
						}
					});
				} else {
					result = false;
					$("#usrMsg").text("该用户名不能为空");
					$("#usrMsg").css("color", "red");
				}
			}

			function validateForm() {
				//alert("1");
				//alert($("#form"));
				$("#form").submit(function() {
					//alert("2");
					if (validateMm() && result && validateMail()) {
						//此表单都正确，可以提交给服务器
						//alert("3");
						return true;
					} else {
						//alert("4");
						return false;
					}
				});
			}
		</script>
	</body>
</html>
