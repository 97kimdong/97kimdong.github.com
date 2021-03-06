<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="${path }/resources/css/common.css">
    <link rel="stylesheet" href="${path }/resources/css/main.css">
    <link rel="stylesheet" href="${path }/resources/css/style.css">
			  <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        a {
            text-decoration: none;
            color: black;
        }

        ul {
            list-style: none;
        }

        #container {
            width: 100%;
            clear: both;
        }

        .container_wrap {
            clear: both;
        }

        .visual {
            width: 100%;
            display: block;
            height: 430px;

        }

        .content_warp {
            width: 1400px;
            margin: 0 auto;
        }

        .tit_box {
            padding-top: 150px;
            font-weight: 300;
            color: beige;
            text-align: center;
            margin: 0 auto;
            font-size: 20px;
        }

        .tit_box>h3 {
            font-weight: 500;
            padding-bottom: 25px;
            font-size: 60px;
        }

        .page_tit {
            margin-top: 50px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 25px;
            font-weight: bolder;
        }

        .sub_tit {
            margin-right: 30px;
            font-size: 15px;
            letter-spacing: -2px;
            margin-bottom: 50px;
        }

        .sub_tit ul {
            list-style: none;
            text-align: center;
        }

        .sub_tit li {
            margin-left: 25px;
            display: inline-block;
            text-transform: uppercase;
        }

        .sub_tit li:after {
            display: block;
            content: '';
            border-bottom: solid 2px #000;
            transform: scaleX(0);
            transition: transform 250ms ease-in-out;
        }

        .sub_tit li:hover:after {
            transform: scaleX(1);
        }

        .goods_list {
            width: 1400px;
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            justify-content: space-between;
            border-bottom: solid 1px lightgrey;
            margin-bottom: 100px;
        }

        span.price {
            display: block;
            line-height: 45px;
            font-size: 17px;
        }

        span.desc {
            font-size: 13px;
            color: gray;
        }

        .goods>a>img {
            width: 313px;
            height: 400px;
        }

        .item {
            margin: 50px 0 50px 0;
            float: left;
        }

        .info {
            font-size: 15px;
            line-height: 45px;
            font-weight: 600;
        }

        .list_line {
            clear: both;
            height: 55px;
            border-top: solid 2px #000;
            border-bottom: solid 1px lightgray;
        }

        .pick_list>li {
            float: right;
            display: flex;
            margin-top: 15px;
            margin-right: 5px;
        }

        .pick_list>li>a {
            font-weight: 400;
            font-size: 15px;
            margin-right: 10px;
            letter-spacing: -2px;
            color: gray;
        }

        .list_line .pick_list .sub_navi {
            float: left;
        }

        .pick_list_num {}

        .pick_list_num::after {
            margin-left: 15px;
            content: "???";
        }

        .select_num {
            margin-left: 15px;
            color: gray;
            border: none;
            border-bottom: solid 1px lightgray;
        }

        .select_num:focus {
            outline: none;
        }



        /* ------------- ????????? ?????? ------------- */
        .location_wrap {
            position: relative;
            width: 100%;
            /*background:#f9f9f9;*/
        }

        .location_wrap .location_cont {
            width: 1200px;
            margin: 18px auto 0;
        }

        .location_wrap .location_cont:after {
            display: block;
            clear: both;
            content: "";
        }

        .location_cont em {
            font-size: 0;
        }

        .location_cont em img {
            position: relative;
            margin: 0;
            top: -4px;
        }

        .location_cont img {
            display: inline-block;
            vertical-align: middle;
            margin: 0 8px 2px;
        }

        .location_cont a img {
            margin-left: 0;
        }

        .location_cont .local_home {
            color: #777777;
        }

        .location_cont .local_home:hover {
            text-decoration: underline;
        }

        /* ????????? ????????? ????????? */
        .sub_content .location_wrap {
            margin: 0;
            border-bottom: none 0;
        }

        .location_cont em+.location_select {
            margin-left: 5px;
        }

        .location_select {
            display: inline-block;
            position: relative;
            min-width: 130px;
            border: none;
            border-bottom: 1px solid #ddd;
            background: #ffffff;
            z-index: 50;
            padding: 0;
        }

        .location_select .location_tit {
            background: url("${path}/resources/img/product/select_arrow.png") no-repeat right 3px center;
        }

        .location_select .location_tit.actvie {
            background: url("${path}/resources/img/product/select_arrow.png") no-repeat right 3px center;
        }


        .location_select .location_tit span {
        	display: inline-block;
        	cursor:pointer;
            padding: 6px 32px 6px 2px;
            font-size: 13px;
            color: #888;
        }

        .location_select ul {
            display: block;
            position: absolute;
            top: 30px;
            left: 0px;
            width: 100%;
            padding: 6px 0 6px 0;
            font-size: 0;
            background: #ffffff;
            border: 1px solid #ddd;
        }

        .location_select ul li {}

        .location_select ul li a {
            display: block;
            font-size: 13px;
            color: #888;
            font-family: 'Poppins', "Noto Sans KR", sans-serif;
            padding: 4px 8px;
        }

        .location_select ul li a span {
            display: inline-block;
        }

        .location_select ul li a:hover {
            color: #ffffff;
            text-decoration: none;
            background: #222222;
        }
    </style>
</head>
<body>
   <div id="wrap">
        <header id="hd">
            <div class="hd_wrap">
           
             	<jsp:include page="../hd.jsp"/>
            </div>
        </header>


        <div id="container">
            <div id="container_wrap">
  	        <section class="page1">
                    <div class="visual" style="background:url(${path}/resources/img/product/subtop_kitchenacc.jpg);">
                        <div class="tit_box">
                            <h3>POTTERY HOUSE</h3>
                            <p>EVERYDAY BESTBUY</p>
                        </div>
                    </div>
                    <div class="location_wrap">
                        <div class="location_cont">
                            <em><a href="#" class="local_home"><img src="${path}/resources/img/product/home_icon.png" alt="???"></a></em>
                            <span><img src="${path}/resources/img/product/arrow_icon.png" alt=""></span>
                            <div class="location_select">
                                <div class="location_tit"><span>??????????????</span></div>
                                <ul style="display: none;">
                                    <li><a href=""><span>?????????????????????????</span></a></li>
                                    <li><a href=""><span>????????????????????</span></a></li>
                                    <li><a href=""><span>???????????????????</span></a></li>
                                    <li><a href=""><span>????????????????????????????</span></a></li>
                                    <li><a href=""><span>????????????</span></a></li>
                                </ul>
                            </div>
                            <!-- ??? > ????????? ????????? > ?????????
                            <span><img src="${path}/resources/img/product/arrow_icon.png" alt=""></span>
                            <div class="location_select">
                                <div class="location_tit"><a href="#"><span>?????????</span></a></div>
                                <ul style="display: none;">
                                    <li><a href="?cateCd=001"><span>????????????</span></a></li>
                                    <li><a href="?cateCd=002"><span>?????????</span></a></li>
                                    <li><a href="?cateCd=005"><span>????????????????????</span></a></li>
                                </ul>
                            </div>
                            -->
                        </div>
                    </div>
                    <div class="content_warp">
                        <div class="page_tit">
                            <h2>?????? ?? ??????</h2>
                        </div>
                        <div class="sub_tit">
                            <ul>
                                <li><a href="">?????????</a></li>
                                <li><a href="">????????????</a></li>
                                <li><a href="">?????????</a></li>
                                <li><a href="">????????? ?? ?????????</a></li>
                            </ul>
                        </div>
                        <div class="list_line">
                            <ul class="pick_list">
                                <li class="sub_navi">
                                    <span class="pick_list_num" style="color: gray;">Total. <strong
                                            style="color: black;">8</strong></span>
                                    <select name="" id="" class="select_num">
                                        <option value="" selected>20????????????</option>
                                        <option value="">10????????????</option>
                                        <option value="">30????????????</option>
                                        <option value="">40????????????</option>
                                        <option value="">50????????????</option>
                                    </select>
                                </li>
                                <li>
                                    <a href="">????????????</a>
                                </li>
                                <li>
                                    <a href="">????????????</a>
                                </li>
                                <li>
                                    <a href="">???????????????</a>
                                </li>
                                <li>
                                    <a href="">???????????????</a>
                                </li>
                                <li>
                                    <a href="">???????????????</a>
                                </li>
                                <li>
                                    <a href="" style="color: #000;">?????????</a>
                                </li>
                            </ul>
                        </div>
                        <div class="goods_list">
                            <div class="item">
                                <div class="goods">
                                    <a href="product.html">
                                        <img src="${path}/resources/img/product/dhfl1.jpeg" alt="Product_img">
                                    </a>
                                </div>
                                <div class="info">
                                    <a href=""><span class="name"> [???????????????] ???????????? ?????? ?????? 400g ?????? </span></a>
                                    <a href=""><span class="price">7,500???</span></a>
                                    <a href=""><span class="desc">100g ??? ????????? : 1,875???</span></a>
                                    <a href=""><span class="tag"></span></a>
                                </div>
                            </div>
                            <div class="item">
                                <div class="goods">
                                    <a href="">
                                        <img src="${path}/resources/img/product/1633588725320l0.jpg" alt="Product_img">
                                    </a>
                                </div>
                                <div class="info">
                                    <a href=""><span class="name"> [??????] ?????? ???????????? 4??? </span></a>
                                    <a href=""><span class="price">1,700???</span></a>
                                    <a href=""><span class="desc">???????????? ???????????? ?????? ????????????!</span></a>
                                    <a href=""><span class="tag"></span></a>
                                </div>
                            </div>
                            <div class="item">
                                <div class="goods">
                                    <a href="">
                                        <img src="${path}/resources/img/product/1637147626889l0.jpg" alt="Product_img">
                                    </a>
                                </div>
                                <div class="info">
                                    <a href=""><span class="name"> [KF365] 1+?????? ???????????? ??????20??? </span></a>
                                    <a href=""><span class="price">7,150???</span></a>
                                    <a href=""><span class="desc">1??? ??? ????????? : 357.5???</span></a>
                                    <a href=""><span class="tag"></span></a>
                                </div>
                            </div>

                            <div class="item">
                                <div class="goods">
                                    <a href="">
                                        <img src="${path}/resources/img/product/1646377916155l0.jpg" alt="Product_img">
                                    </a>
                                </div>
                                <div class="info">
                                    <a href=""><span class="name"> [KF365] 1+?????? ???????????? ??????20??? </span></a>
                                    <a href=""><span class="price">6,900???</span></a>
                                    <a href=""><span class="desc">1??? ??? ????????? : 345???</span></a>
                                    <a href=""><span class="tag"></span></a>
                                </div>
                            </div>
                            <div class="item">
                                <div class="goods">
                                    <a href="">
                                        <img src="${path}/resources/img/product/1648206863338l0.jpeg" alt="Product_img">
                                    </a>
                                </div>
                                <div class="info">
                                    <a href=""><span class="name"> [????????????] ???????????? 150g </span></a>
                                    <a href=""><span class="price">2,980???</span></a>
                                    <a href=""><span class="desc">???????????? ????????? ????????? ?????? </span></a>
                                    <a href=""><span class="tag"></span></a>
                                </div>
                            </div>
                            <div class="item">
                                <div class="goods">
                                    <a href="">
                                        <img src="${path}/resources/img/product/1656427630593l0.jpg" alt="Product_img">
                                    </a>
                                </div>
                                <div class="info">
                                    <a href=""><span class="name"> [????????????] ?????? ????????? 300g (??????) </span></a>
                                    <a href=""><span class="price">5,600???</span></a>
                                    <a href=""><span class="desc">100g ??? ????????? : 1,967???</span></a>
                                    <a href=""><span class="tag"></span></a>
                                </div>
                            </div>
                            <div class="item">
                                <div class="goods">
                                    <a href="">
                                        <img src="${path}/resources/img/product/1656427724679l0.jpg" alt="Product_img">
                                    </a>
                                </div>
                                <div class="info">
                                    <a href=""><span class="name"> [????????????] ?????? ?????? ?????? 300g (??????) </span></a>
                                    <a href=""><span class="price">6,100???</span></a>
                                    <a href=""><span class="desc">100g ??? ????????? : 2,033???</span></a>
                                    <a href=""><span class="tag"></span></a>
                                </div>
                            </div>
                            <div class="item">
                                <div class="goods">
                                    <a href="">
                                        <img src="${path}/resources/img/product/1656427898500l0.jpg" alt="Product_img">
                                    </a>
                                </div>
                                <div class="info">
                                    <a href=""><span class="name"> [????????????] ?????? ????????? 300g (??????) </span></a>
                                    <a href=""><span class="price">10,900???</span></a>
                                    <a href=""><span class="desc">100g ??? ????????? : 3,633???</span></a>
                                    <a href=""><span class="tag"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
<script type="text/javascript">
$('.location_select').click(function () {
    if ($(this).find('ul').css('display') == 'none') {
        $(this).find('.location_tit').addClass('active');
        $(this).find('ul').slideDown('fast');
    } else {
        $(this).find('ul').slideUp('fast');
        $(this).find('.location_tit').removeClass('active');
    }
});
</script>
        <footer id="ft">
            <div class="ft_wrap">
            <c:import url="../ft.jsp"/>
    </div>
    </footer>
    </div>


 


 </body>
</html>