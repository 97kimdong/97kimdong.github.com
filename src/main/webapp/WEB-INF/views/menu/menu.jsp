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
            font-weight: 600;
            margin-top: 2%;
            width:313px;
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
            content: "｜";
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



        /* ------------- 페이지 위치 ------------- */
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

        /* 페이지 셀렉트 레이어 */
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
            min-width: 160px;
            border: none;
            border-bottom: 1px solid #ddd;
            background: #ffffff;
            z-index: 50;
            padding: 0;
        }

        .location_select .location_tit {
            background: url("${path}/resources/img/menu1/select_arrow.png") no-repeat right 3px center;
        }

        .location_select .location_tit.actvie {
            background: url("${path}/resources/img/menu1/select_arrow.png") no-repeat right 3px center;
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
                    <div class="visual" style="background:url(${path}/resources/img/menu1/subtop_kitchenacc.jpg);">
                        <div class="tit_box">
                            <c:forEach items="${ctgr1 }" var="li">
	                        <c:set value="${fn:substring(li.code,0,1) }" var="licode1" />
	                        <c:set value="${fn:substring(ct2,0,1) }" var="ctstr" />
	                        <c:if test="${licode1 == ctstr }">
                                <h3>${li.name }</h3>
	                        </c:if>
	                        </c:forEach>
	                        <c:forEach items="${ctgr2 }" var="li2">
	                        <c:if test="${ct2 == li2.code }">
	                            	<p>${li2.name }</p>
	                        </c:if>
	                        </c:forEach>
                        </div>
                    </div>
                    <div class="location_wrap">
                        <div class="location_cont">
                            <em><a href="${path }" class="local_home"><img src="${path}/resources/img/menu1/home_icon.png" alt="홈"></a></em>
                            <span><img src="${path}/resources/img/menu1/arrow_icon.png" alt="arrow_icon"></span>
                            <div class="location_select">
                            <c:forEach items="${ctgr1 }" var="li">
                                <c:set value="${fn:substring(li.code,0,1) }" var="licode1" />
                                <c:if test="${licode1 == ctstr }">
                                <div class="location_tit"><span>${li.name }</span></div>
                                </c:if>
                                </c:forEach>
                                <ul style="display: none;">
                                <c:forEach items="${ctgr1 }" var="li">
                                <c:set value="${fn:substring(li.code,0,1) }" var="licode1" />
                                	<c:if test="${licode1 != ctstr }">
                                    <li><a href=""><span>${li.name }</span></a></li>
                                    </c:if>
                                </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="content_warp">
                        <div class="page_tit">
                        <c:forEach items="${ctgr1 }" var="li">
                        <c:set value="${fn:substring(li.code,0,1) }" var="licode1" />
                        <c:if test="${licode1 == ctstr }">
                                <h2>${li.name }</h2>
                        </c:if>
                        </c:forEach>
                        </div>
                        <div class="sub_tit">
                            <ul>
                            <c:forEach items="${ctgr2 }" var="li2">
	                        <c:set value="${fn:substring(li2.code,0,1) }" var="licode2" />
	                        <c:if test="${ctstr == licode2 }">
	                            <li class="sub">
	                            	<a href="${path }/menu/menu?ct2=${li2.code }">${li2.name }</a>
	                            </li>
	                        </c:if>
	                        </c:forEach>
                            </ul>
                        </div>
                        <div class="list_line">
                            <ul class="pick_list">
                                <li class="sub_navi">
                                    <span class="pick_list_num" style="color: gray;">Total. <strong
                                            style="color: black;">${pdtoLi.size() }</strong></span>
                                    <select name="" id="" class="select_num">
                                        <option value="" selected>20개씩보기</option>
                                        <option value="">10개씩보기</option>
                                        <option value="">30개씩보기</option>
                                        <option value="">40개씩보기</option>
                                        <option value="">50개씩보기</option>
                                    </select>
                                </li>
                                <li>
                                    <a href="">등록일순</a>
                                </li>
                                <li>
                                    <a href="">상품평순</a>
                                </li>
                                <li>
                                    <a href="">높은가격순</a>
                                </li>
                                <li>
                                    <a href="">낮은가격순</a>
                                </li>
                                <li>
                                    <a href="">판매인기순</a>
                                </li>
                                <li>
                                    <a href="" style="color: #000;">추천순</a>
                                </li>
                            </ul>
                        </div>
                        <div class="goods_list">
                            <c:forEach items="${pdtoLi }" var="li">
                            <div class="item">
                                <div class="goods">
                                    <a href="${path }/menu/menuDetail?pcode=${li.pcode }">
                                        <img src="${path}${li.img_desc }" alt="Product_img">
                                    </a>
                                </div>
                                <div class="info">
                                    <a href="${path }/menu/menuDetail?pcode=${li.pcode }"><span class="name">${li.pname }</span></a>
                                    <a href="${path }/menu/menuDetail?pcode=${li.pcode }"><span class="price">
                                    	<fmt:formatNumber value="${li.price }" pattern="#,###" /> 원
                                    </span></a>
                                    <a href="${path }/menu/menuDetail?pcode=${li.pcode }"><span class="desc">${li.psubname }</span></a>
                                    <a href="${path }/menu/menuDetail?pcode=${li.pcode }"><span class="tag"></span></a>
                                </div>
                            </div>
                            </c:forEach>
                            
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