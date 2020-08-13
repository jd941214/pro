<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<script type="text/javascript">
	function check(){
		if (f.writer.value==""){
			alert("이름을 입력하세요!!")
			f.writer.focus()
			return false
		}
		if (f.subject.value==""){
			alert("제목을 입력하세요!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("내용을 입력하세요!!")
			f.content.focus()
			return false
		}
		if (f.passwd.value==""){
			alert("비밀번호를 입력하세요!!")
			f.passwd.focus()
			return false
		}
		return true
	}
</script>
<link rel="stylesheet" type="text/css" href="style.css">
<div align="center">
	<form name="f" action="board_update.do" method="post" 
															onsubmit="return check()">
		<input type="hidden" name="num" value="${getBoard.num}"/>													
		<table border="1" width="70%">
			<tr bgcolor="yellow">
				<td align="center" colspan="2">글 수 정</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">이 름</th>
				<td><input type="text" name="writer" class="box" 
									value="${getBoard.writer}"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">제 목</th>
				<td><input type="text" name="subject" class="box" size="40"
									value="${getBoard.subject}"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">Email</th>
				<td><input type="text" name="email" class="box" size="40"
									value="${getBoard.email}"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">내 용</th>
				<td><textarea name="content" rows="10" cols="40" class="box">${getBoard.content}</textarea></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">비밀번호</th>
				<td><input type="password" name="passwd" class="box"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="yellow">
					<input type="submit" value="글수정">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='board_list.do'">				
				</td>
			</tr>
		</table>
	</form>
</div>
