<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>锋迷商城</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
</head>
<body>
<!-- start header -->
<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li><a href="./index.html" target="_blank">锋迷商城</a></li>
                <li>|</li>

                <li><a href="../after/login.jsp" target="_blank">锋迷网后台管理系统</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">
            <div class="gouwuche fr"><a href="">购物车</a></div>
            <div class="fr">
                <ul>
					<c:if test="${not empty existUser.username}">
                    	<li>欢迎&nbsp;<span style="color: orange;">${existUser.username}</span>&nbsp;</li>
					</c:if>
                    <li><a href="login.jsp">登录</a></li>
                    <li>|</li>
                    <li><a href="register.jsp" target="_blank">注册</a></li>
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
    <a href="./index.html" target="_blank">
        <div class="logo fl">
            <img alt="" src="image/logo.png" width="240px" height="70px" style="padding-top:10px">
        </div>
    </a>

    <div class="nav fl" style="padding-left:50px;">
        <ul id="menuId">

        </ul>
    </div>
    <div class="search fr">
        <form action="" method="post">
            <div class="text fl">
                <input type="text" class="shuru" placeholder="锋迷6&nbsp;锋迷MIX现货">
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

<!-- start banner_y -->
<div class="banner_y center">
    <div class="nav">
        <ul id="menuGoods">
            <!-- <li>
                <a href="">手机</a>
                <a href="">电话卡</a>
                <div class="pop">
                    <div class="left fl">
                        <div>
                            <div class="xuangou_left fl">
                                <a href="">
                                    <div class="img fl"><img src="./image/xm6_80.png" alt=""></div>
                                    <span class="fl">锋迷6</span>
                                    <div class="clear"></div>
                                </a>
                            </div>
                            <div class="xuangou_right fr"><a href="./xiangqing.html" target="_blank">选购</a></div>
                            <div class="clear"></div>
                        </div>

                </div>
            </li> -->

        </ul>
    </div>

</div>

<div class="sub_banner center">
    <div class="sidebar fl">
        <div class="fl"><a href=""><img src="./image/hjh_01.gif"></a></div>
        <div class="fl"><a href=""><img src="./image/hjh_02.gif"></a></div>
        <div class="fl"><a href=""><img src="./image/hjh_03.gif"></a></div>
        <div class="fl"><a href=""><img src="./image/hjh_04.gif"></a></div>
        <div class="fl"><a href=""><img src="./image/hjh_05.gif"></a></div>
        <div class="fl"><a href=""><img src="./image/hjh_06.gif"></a></div>
        <div class="clear"></div>
    </div>
    <div class="datu fl"><a href=""><img src="./image/hongmi4x.png" alt=""></a></div>
    <div class="datu fl"><a href=""><img src="./image/xiaomi5.jpg" alt=""></a></div>
    <div class="datu fr"><a href=""><img src="./image/pinghengche.jpg" alt=""></a></div>
    <div class="clear"></div>


</div>
<!-- end banner -->

<!-- start danpin -->
<div class="danpin center">

    <div class="biaoti center">锋迷明星单品</div>
    <div class="main center">
        <div class="mingxing fl">
            <div class="sub_mingxing"><a href=""><img src="./image/pinpai1.png" alt=""></a></div>
            <div class="pinpai"><a href="">锋迷MIX</a></div>
            <div class="youhui">5月9日-21日享花呗12期分期免息</div>
            <div class="jiage">3499元起</div>
        </div>
        <div class="mingxing fl">
            <div class="sub_mingxing"><a href=""><img src="./image/pinpai2.png" alt=""></a></div>
            <div class="pinpai"><a href="">锋迷5s</a></div>
            <div class="youhui">5月9日-10日，下单立减200元</div>
            <div class="jiage">1999元</div>
        </div>
        <div class="mingxing fl">
            <div class="sub_mingxing"><a href=""><img src="./image/pinpai3.png" alt=""></a></div>
            <div class="pinpai"><a href="">锋迷手机5 64GB</a></div>
            <div class="youhui">5月9日-10日，下单立减100元</div>
            <div class="jiage">1799元</div>
        </div>
        <div class="mingxing fl">
            <div class="sub_mingxing"><a href=""><img src="./image/pinpai4.png" alt=""></a></div>
            <div class="pinpai"><a href="">锋迷电视3s 55英寸</a></div>
            <div class="youhui">5月9日，下单立减200元</div>
            <div class="jiage">3999元</div>
        </div>
        <div class="mingxing fl">
            <div class="sub_mingxing"><a href=""><img src="./image/pinpai5.png" alt=""></a></div>
            <div class="pinpai"><a href="">锋迷笔记本</a></div>
            <div class="youhui">更轻更薄，像杂志一样随身携带</div>
            <div class="jiage">3599元起</div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="peijian w">
    <div class="biaoti center">配件</div>
    <div class="main center">
        <div class="content">
            <div class="remen fl"><a href=""><img src="./image/peijian1.jpg"></a>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span>新品</span></div>
                <div class="tu"><a href=""><img src="./image/peijian2.jpg"></a></div>
                <div class="miaoshu"><a href="">锋迷6 硅胶保护套</a></div>
                <div class="jiage">49元</div>
                <div class="pingjia">372人评价</div>
                <div class="piao">
                    <a href="">
                        <span>发货速度很快！很配锋迷6！</span>
                        <span>来至于mi狼牙的评价</span>
                    </a>
                </div>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href=""><img src="./image/peijian3.jpg"></a></div>
                <div class="miaoshu"><a href="">锋迷手机4c 锋迷4c 智能</a></div>
                <div class="jiage">29元</div>
                <div class="pingjia">372人评价</div>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:red">享6折</span></div>
                <div class="tu"><a href=""><img src="./image/peijian4.jpg"></a></div>
                <div class="miaoshu"><a href="">红米NOTE 4X 红米note4X</a></div>
                <div class="jiage">19元</div>
                <div class="pingjia">372人评价</div>
                <div class="piao">
                    <a href="">
                        <span>发货速度很快！很配锋迷6！</span>
                        <span>来至于mi狼牙的评价</span>
                    </a>
                </div>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href=""><img src="./image/peijian5.jpg"></a></div>
                <div class="miaoshu"><a href="">锋迷支架式自拍杆</a></div>
                <div class="jiage">89元</div>
                <div class="pingjia">372人评价</div>
                <div class="piao">
                    <a href="">
                        <span>发货速度很快！很配锋迷6！</span>
                        <span>来至于mi狼牙的评价</span>
                    </a>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="content">
            <div class="remen fl"><a href=""><img src="./image/peijian6.png"></a>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href=""><img src="./image/peijian7.jpg"></a></div>
                <div class="miaoshu"><a href="">锋迷指环支架</a></div>
                <div class="jiage">19元</div>
                <div class="pingjia">372人评价</div>
                <div class="piao">
                    <a href="">
                        <span>发货速度很快！很配锋迷6！</span>
                        <span>来至于mi狼牙的评价</span>
                    </a>
                </div>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href=""><img src="./image/peijian8.jpg"></a></div>
                <div class="miaoshu"><a href="">米家随身风扇</a></div>
                <div class="jiage">19.9元</div>
                <div class="pingjia">372人评价</div>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href=""><img src="./image/peijian9.jpg"></a></div>
                <div class="miaoshu"><a href="">红米4X 高透软胶保护套</a></div>
                <div class="jiage">59元</div>
                <div class="pingjia">775人评价</div>
            </div>
            <div class="remenlast fr">
                <div class="hongmi"><a href=""><img src="./image/hongmin4.png" alt=""></a></div>
                <div class="liulangengduo"><a href=""><img src="./image/liulangengduo.png" alt=""></a></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<footer class="mt20 center">
    <div class="mt20">锋迷商城|MIUI|米聊|多看书城|锋迷路由器|视频电话|锋迷天猫店|锋迷淘宝直营店|锋迷网盟|锋迷移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
</footer>


<script type="text/javascript">
    $(function () {
        $.ajax({
            type: "get",
            url: "../goodstype/list?type=2",
            dataType: "json",
            success: function (data) {

                $(data).each(function () {
                    var html = "<li><a href='liebiao.html?typeId=" + this.id + "'>" + this.typename + "</a></li>";
                    $("#menuId").append($(html));
                })
            },
            error: function (data) {
                //alert("error");
                console.log("ajax error");
            }

        })
    })
</script>
<script type="text/javascript">
    $(function () {
        $.ajax({
            type: "get",
            url: "../goods/menu",
            dataType: "json",
            success: function (data) {

                $(data).each(function () {
                    var html = '<li>';
                    html += '<a href="">' + this.typename + '</a>';
                    html += '<div class="pop">';

                    var goods = this.goodsList;
                    $(goods).each(function () {
                        html += '<div class="left fl">';
                        html += '<div>';
                        html += '	<div class="xuangou_left fl">';
                        html += '		<a href="">';
                        html += '			<span class="fl">' + this.goodsName + '</span>';
                        html += '			<div class="clear"></div>';
                        html += '		</a>';
                        html += '	</div>';
                        html += '	<div class="xuangou_right fr"><a href="./xiangqing.html?id=' + this.id +
                            '" target="_blank">选购</a></div>';
                        html += '	<div class="clear"></div>';
                        html += '</div>';
                        html += '</div>';
                    })

                    html += '</div>';
                    html += '</li>';

                    $("#menuGoods").append($(html));

                })

            }
        })


    })
</script>

</body>
</html>
