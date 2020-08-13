<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<link rel="stylesheet" type="text/css" href="style.css">
<div align="center">
	<b>글 목 록</b>
	<table border="0" width="800">
		<tr bgcolor="yellow">
			<td align="right"><a href="board_write.do">글쓰기</a></td>
		</tr>
	</table>
	<table border="1" width="800">
		<tr bgcolor="green">
			<th>번호</th>
			<th width="40%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>IP</th>
			<th>파일</th>
		</tr> 
	<c:if test="${empty boardList}">		
		<tr>
			<td colspan="7">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${boardList}">		
		<tr>
			<td>${dto.num}</td>
			<td>
				<a href="content.do?num=${dto.num}">${dto.subject}</a>
			</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.readcount}</td>
			<td>${dto.ip}</td>
			<c:if test="${dto.filesize !=0 }">
				<td><img src="${pageContext.request.contextPath}/resources/img/folder.gif"></td>
			</c:if>
			<c:if test="${dto.filesize == 0}">
			<td>
				<img src="${pageContext.request.contextPath}/resources/img/level.gif">
			</td>
		</c:if>	
		</tr>		
	</c:forEach>	
	</table>
</div>	














