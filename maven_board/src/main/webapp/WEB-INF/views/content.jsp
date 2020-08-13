<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" type="text/css" href="style.css">
<div align="center">
	<b>글내용 보기</b><br><br>
	<table border="1" width="500">
		<tr height="30">
			<th width="20%" bgcolor="yellow">글번호</th>
			<td align="center" width="30%">${getBoard.num}</td>
			<th width="20%" bgcolor="yellow">조회수</th>
			<td align="center" width="30%">${getBoard.readcount}</td>
		</tr>
		<tr height="30">
			<th width="20%" bgcolor="yellow">작성자</th>
			<td align="center" width="30%">${getBoard.writer}</td>
			<th width="20%" bgcolor="yellow">작성일</th>
			<td align="center" width="30%">${getBoard.reg_date}</td>
		</tr>
		<tr height="30">
			<th width="20%" bgcolor="yellow">글제목</th>
			<td align="center" colspan="3">
				${getBoard.subject}
			</td>
		</tr>
		<tr height="80">
			<th width="20%" bgcolor="yellow">글내용</th>
			<td colspan="3" >
				${getBoard.content}
			</td>
		</tr>
		<c:if test="${getBoard.filesize != 0}">
		<tr>
			<th width="20%" bgcolor="yellow">파일명</th>
			<td colspan="3" >	${getBoard.filename}</td>
		</tr>
	</c:if>
		<tr height="80">
			<th width="20%" bgcolor="yellow">글내용</th>
			<td colspan="3" >	${getBoard.content}</td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="4" align="right">
				<input type="button" value="글수정"
				onclick="window.location='board_update.do?num=${getBoard.num}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제"
				onclick="window.location='board_delete.do?num=${getBoard.num}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록" onclick="window.location='board_list.do'">
			</td>
		</tr>
	</table>
</div>















