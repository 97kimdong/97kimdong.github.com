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
            text-align: center;
        }
        .table tr td{
            border-bottom: 1px solid #777;
            text-align: center;
        }
        /* /페이지 공통 - 리스트 테이블 */
        /* 게시판관리 - 공지사항 */
        .btn_group{
            display: block;
            position: absolute;
            right: 0;
            top: 0;
        }
        .btn_group input[type="button"]{
            padding: 7px 20px 8px 20px;
            font-size: 14px;
        }
        <style>
        input,
        textarea {
            border: 1px solid #777;
            font-size: 0.9em;
            line-height: 2em;
            padding-left: 1em;
            padding-top: 5px;
        }        .ct_wrap {
            clear: both;
            width: 1000px;
            margin: 100px auto;
        }        button {
            padding-top: 7px;
            width: 150px;
            height: 30px;
        }        
        th {
  
        }
    </style>
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

		<div id="ct">        
        <div class="ct_wrap">
            <article id="" class="">                
            <form action="${path }/Notice/NoticeInsert" method="post" name="databankUpload">
                    <div class="table_form_wrap">
                        <table class="table_form">
                            <tbody>
                                <tr>
                                    <th><label for="title">제목</label></th>
                                    <td>
                                    	<input type="hidden" name="cus_seq" id="cus_seq" size="100" class="single100"
                                            placeholder="작성자 입력" value="${sdto.seq }">
                                        <input type="text" name="title" id="title" size="100" class="single100"
                                            placeholder="글제목 입력" required>
                                    </td>
                                </tr>
                                <tr>
                                    <th><label for="content">내용</label></th>
                                    <td><textarea style="width: 854px" name="content" id="content" cols="100" rows="8"
                                            class="multi100" placeholder="글 내용 입력" required></textarea></td>
                                </tr>                                <tr>
                                    <th></th>
                                    <td>
                                        <input type="hidden" name="lock_post" value="1">
                                        <button type="submit">등록</button>
                                        <button type="reset">취소</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
                <script>
                    function uploadFile() {
                        window.open("/myapp/data_board/uploadForm", "dataupload", "width=400, height=300");
                    }                    function uploadFile2() {
                        window.open("/myapp/data_board/uploadAjax.do", "dataupload", "width=400, height=400");
                    }
                </script>
            </article>
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