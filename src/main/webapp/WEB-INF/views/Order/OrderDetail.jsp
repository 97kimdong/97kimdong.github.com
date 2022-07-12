<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        /* 초기화 */
        * { margin: 0; padding: 0;}
        ul { list-style: none; } 
        a { text-decoration: none; color: #222; }
        html, body { height: 100%;}
        #container{clear: both; width: 100%;}
        .container_wrap{clear: both; width: 100%;}
        .main_wrap{
            clear: both;
            width: 1400px;
            margin: 0 auto;
            margin-top: 2%;
        }
        /* /초기화 */
        /* 왼쪽 메뉴 */
        #left_gnb{
            float: left;
            width: 13%;
            /* min-width: 180px; */
        }
        #left_gnb>ul>.gnb_menu>a{
            display: block;
            font-size: 16px;
            padding: 15px 10px 15px 16px;
            background-color: #222;
            color: #e2e2e2;
        }
        #left_gnb>ul>.gnb_menu>a:first-child{
            border-top: 1px solid #515151;
        }
        #left_gnb>ul>.gnb_menu>ul>.gnb_sub_menu>a{
            display: block;
            border-bottom: 1px solid #515151;
            border-left: 1px solid #515151;
            border-right: 1px solid #515151;
            font-size: 14px;
            padding: 15px 10px 15px 16px;
            background-color: #ffffff;
            color: #222;
        }
        #left_gnb>ul>.gnb_menu>ul>.gnb_sub_menu:hover a{
            background-color: #dbdbdb;
            color: #222;
        }
        /* /왼쪽 메뉴 */
        /* 오른쪽 컨텐츠 초기화 */
        .page{
            float: left;
            width: 85%;
            margin-left: 2%;
        }
        .page_content{
            position: relative;
            clear: both;
            width: 100%;
        }
        /* /오른쪽 컨텐츠 초기화 */
        /* 검색 */
        .search_box{
            clear: both;
            display: block;
            margin-bottom: 1%;
        }
        .search_box>form>select{
            padding: 8px 0 8px 0;
            text-align: center;
            width: 100px;
            border-color: #222;
            font-size: 14px;
        }
        .search_box>form>input{
            padding: 9px 0 8px 0;
            border: 1px solid #222;
            font-size: 14px;
        }
        .search_box>form>button{
            padding: 7px 0 8px 0;
            width: 70px;
            font-size: 14px;
        }
        /* /검색 */
        /* 페이지 공통 - 리스트 테이블 */
        .table {
            display: table;
            width: 100%;
            border-collapse: collapse;
        }
        .table tr{
            display: table-row;
        }
        .table tr th, .table tr td{
            display: table-cell;
            padding: 12px 0 12px 0;
        }
        .table tr th{
            border-top: 2px solid #000;
            border-bottom: 1px solid #777;
            background-color: #ededed;
        }
        .table tr td{
            border-bottom: 1px solid #777;
            padding-left: 25px;
            
        }
        /* /페이지 공통 - 리스트 테이블 */
        /* 게시판관리 - 공지사항 */
        .btn_group{
            display: block;
            position: absolute;
            right: 0;
            top: 0;
        }
        .table tr td input, .table tr td textarea{
        	border: none;
        }
        .btn_group input[type="button"]{
            padding: 7px 20px 8px 20px;
            font-size: 14px;
        }
        /* 게시판관리 - 공지사항 */
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
	       <section class="main_wrap">
					<jsp:include page="../Admin/LeftMenu.jsp"/>
                     <!-- 게시판관리 - 공지사항 -->
                    <article class="page">
                        <div class="page_content">
                            <!-- 검색 -->
                            <div class="search_box">
                                <form action="/myapp/board/news_search" method="POST">
                                    <select name="search_type">
                                        <option value="1">제목</option>
                                        <option value="2">내용</option>
                                    </select>
                                    <input type="hidden" id="type" name="type" value="2">
                                    <input type="text" id="search" name="search">
                                    <button type="submit" class="btn_clear">검색</button>
                                </form>
                            </div>
                            <!-- /검색 -->
                            <!-- 제품 목록 -->
                            <h2>주문내역 상세보기</h2>
            <form action="${path }/Order/OrderUpdate" method="post">
            <input type="hidden" name="seq" id="seq" value="${More.seq }" required >
                <table class="table" id="table">
                    <tbody>
                        <tr>
                            <th>주문번호</th>
                            <td>
                                <input type="text" name="order_no" value="${More.order_no }" readonly >
                            </td>
                        </tr>
                        <tr>
                            <th>주문상태</th>
                            <td>
                                <input type="text" name="order_step" id="order_step" value="${More.order_step }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>입금상태</th>
                            <td>
                                <input type="text" name="payment_status" id="payment_status" value="${More.payment_status }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>상품금액</th>
                            <td>
                                <input type="text" name="price" id="price" value="${More.price }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>사용포인트</th>
                            <td>
                                <input type="text" name="use_point" id="use_point" value="${More.use_point }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>적립포인트</th>
                            <td>
                                <input type="text" name="save_point" id="save_point" value="${More.save_point }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>최종금액</th>
                            <td>
                                <input type="text" name="total_price" id="total_price" value="${More.total_price }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>고객식별번호</th>
                            <td>
                                <input type="text" name="cus_seq" id="cus_seq" value="${More.cus_seq }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>받는사람이름</th>
                            <td>
                                <input type="text" name="delivery_cus" id="delivery_cus" value="${More.delivery_cus }" required >
                            </td>
                        </tr>
                        <tr>
                            <th>받는사람주소</th>
                            <td>
                                <input type="text" name="delivery_addr1" id="delivery_addr1" value="${More.delivery_addr1 }" required >
                            </td>
                        </tr>
                        <tr>
                            <th>받는사람상세주소</th>
                            <td>
                                <input type="text" name="delivery_addr2" id="delivery_addr2" value="${More.delivery_addr2 }" required >
                            </td>
                        </tr>
                        <tr>
                            <th>받는사람우편주소</th>
                            <td>
                                <input type="text" name="delivery_zip_code" id="delivery_zip_code" value="${More.delivery_zip_code }" required >
                            </td>
                        </tr>
                        <tr>
                            <th>메모</th>
                            <td>
                                <textarea cols="100" rows ="10" name="content" id="content" required >${More.delivery_memo }</textarea>
                            </td>
                        </tr>
                        <tr>    
                            <th>주문일자</th>
                            <td>
                                <input type="text" name="regdate" id="regdate" value="<fmt:formatDate value="${More.regdate }" pattern="YYYY-MM-dd" />" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" class="cols">
                                <input type="submit" value="수정" class="button is-info"/>
                                <input type="reset" value="취소" class="button is-info"/>
                                <a href="${path }/Order/OrderDelete?order_no=+${More.order_no }">삭제</a>
                                <a href="${path }/Admin/OrderList" class="button is-info">목록</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
                        </div>
                    </article>
                    <!-- /게시판관리 - 공지사항 -->
                </section>

            </div>
        </div>

        <footer id="ft">
            <div class="ft_wrap">
            <c:import url="../ft.jsp"/>
    </div>
    </footer>
    </div>



<script type="text/javascript">
$('.gnb_sub_menu').eq(6).find('a').css('font-weight','bold');
</script>
 </body>
</html>