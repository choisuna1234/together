<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/user-header.jspf"%>
</head>
<body>
	<main class="layoutCenter">
		<div align="center">
			<h1>멍멍왈왈 수정</h1>
		</div>
		<form action="/board_modify" method="post">
			<table class="board_view">
				<tbody>
					<tr>
						<th scope="row">글 번호</th>
						<input type="text" id="BC_IDX" name="BC_IDX" value="${map.BC_IDX}" /> 
						<input type="text" id="BC_READHIT" name="BC_READHIT" value="${map.BC_READHIT}" />
						<input type="text" id="BC_WRITER_NAME" name="BC_WRITER_NAME" value="${map.BC_WRITER_NAME}" /> 
						<input type="text" id="BC_REG_DATE" name="BC_REG_DATE" value="${map.BC_REG_DATE}" />
					<tr>
						<th scope="row">제목</th>
						<td colspan="3"><input type="text" id="BC_TITLE"
							name="BC_TITLE" value="${map.BC_TITLE }" style="width: 600px" />
						</td>
					</tr>
					<tr>
						<td align="center" colspan="4">
						<textarea rows="20" cols="100"
						id="BC_CONTENTS" name="BC_CONTENTS" style="height: 300px">${map.BC_CONTENTS}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<div align="center">
				<a href="board_list.paw" class="btn normal">목록으로</a> 
				<input class="btn submit" type="submit" value="수정하기">
			</div>
		</form>
</body>
</main>
</html>