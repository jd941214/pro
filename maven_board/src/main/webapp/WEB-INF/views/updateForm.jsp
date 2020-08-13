<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<script type="text/javascript">
	function check(){
		if (f.writer.value==""){
			alert("�̸��� �Է��ϼ���!!")
			f.writer.focus()
			return false
		}
		if (f.subject.value==""){
			alert("������ �Է��ϼ���!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("������ �Է��ϼ���!!")
			f.content.focus()
			return false
		}
		if (f.passwd.value==""){
			alert("��й�ȣ�� �Է��ϼ���!!")
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
				<td align="center" colspan="2">�� �� ��</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">�� ��</th>
				<td><input type="text" name="writer" class="box" 
									value="${getBoard.writer}"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">�� ��</th>
				<td><input type="text" name="subject" class="box" size="40"
									value="${getBoard.subject}"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">Email</th>
				<td><input type="text" name="email" class="box" size="40"
									value="${getBoard.email}"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">�� ��</th>
				<td><textarea name="content" rows="10" cols="40" class="box">${getBoard.content}</textarea></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">��й�ȣ</th>
				<td><input type="password" name="passwd" class="box"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="yellow">
					<input type="submit" value="�ۼ���">
					<input type="reset" value="�ٽ��ۼ�">
					<input type="button" value="��Ϻ���" onclick="window.location='board_list.do'">				
				</td>
			</tr>
		</table>
	</form>
</div>