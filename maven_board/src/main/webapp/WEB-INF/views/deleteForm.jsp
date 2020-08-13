<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 
<link rel="stylesheet" type="text/css" href="style.css">
<div align="center">
	<b>글 삭 제</b><br><br>
	<form name="f" action="board_delete.do" method="post">
		<input type="hidden" name="num" value="${param.num}"/>
		<table border="1">
			<tr bgcolor="yellow">
				<th>비밀번호를 입력해 주세요.
			</tr>
			<tr>
				<td align="center">비밀번호 :
					<input type="password" name="passwd">
				</td>
			</tr>
			<tr>
				<td align="center" bgcolor="yellow">
					<input type="submit" value="글삭제">
					<input type="button" value="글목록" 
								onclick="window.location='board_ist.do'">
				</td>
			</tr>
		</table>
	</form>
</div>





