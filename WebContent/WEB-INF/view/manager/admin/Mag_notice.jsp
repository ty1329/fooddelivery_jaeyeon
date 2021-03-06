<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자페이지-공지사항관리</title>
<link rel="stylesheet" type="text/css" href="${root}/css/Mag.css">
<link rel="stylesheet" type="text/css" href="${root}/css/header.css">
</head>
<body>
<jsp:include page="../../header/header.jsp"/>

<div class="Mag_main">
	<div class="Mag_top ">
		<span class="Mag_font">공지사항관리</span>
	</div>

	<div class="Mag_notice_top">
				<div>공지사항관리</div>
				<div></div>
				<div></div>
				<div></div>
				<div><a href="#">글쓰기</a></div>
			</div>
	
	<div class="Mag_search">
		<input type="text" placeholder="Search">
		<input type="button" value=" " class="Mag_search_2">
	</div>

	<div class="Mag_notice_title">
		<div>제목</div>
		<div>공지사항번호</div>
		<div>수정</div>
		<div>삭제</div>
	</div>
	
	<c:forEach var="notice" items="${noticeList}">
	<div class="Mag_notice_list">
		<div>${notice.notice_title }</div>
		<div>${notice.notice_num }</div>
		<div>
			<input type="button" value="수정"/>
		</div>
		<div>
			<input type="button" value="삭제"/>
		</div>
	</div>
    </c:forEach>
   
   <br/><br/>
   
   <center>
      <!-- 전체페이지 = 전체레코드/페이지당 게시물수 , 페이지 블락, 시작페이지번호, 마지막페이지번호  -->
      <c:if test="${count>0 }">
         <c:set var="pageBlock" value="${10}"/> <!-- value변경가능 -->
         <c:set var="pageCount" value="${count/listSize+(count%listSize==0 ? 0:1) }"/>
         
         <fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
         
         <!-- int startPage = (int)((currentPage-1)/pageBlock)*pageBlock+1 -->
         <c:set var="startPage" value="${result*pageBlock+1 }"/>
         <c:set var="endPage" value="${startPage+pageBlock-1 }"/>
         
         <c:if test="${endPage>pageCount }">
            <c:set var = "endPage" value="${pageCount }"/>
         </c:if>
         
         <c:if test="${startPage>pageBlock }">
            <a href="${root }/manager/admin/Mag_notice.do?pageNumber=${startPage-pageBlock}">[이전]</a>
         </c:if>
         
         <c:forEach var = "i" begin="${startPage}" end="${endPage }">
            <a href="${root }/manager/admin/Mag_notice.do?pageNumber=${i}">[${i}]</a>
         </c:forEach>
         <c:if test="${endPage<pageCount }">
            <a href="${root }/manager/admin/Mag_notice.do?pageNumber=${startPage+pageBlock}">[다음]</a>
         </c:if>
      </c:if>
   </center>
</div>

</body>
</html>