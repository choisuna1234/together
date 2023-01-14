<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/user-header.jspf"%>
</head>
<style>
.page-title {
	margin-bottom: 60px;
}

.container {
	width: 1100px;
	margin: 0 auto;
}

section.notice {
	padding: 80px 0;
}
.frame1{
    border-top: 10px solid #e6b4ac;
    border-right: 3px solid #e6b4ac;
    border-bottom: 3px solid #e6b4ac;
    border-left: 3px solid #e6b4ac;
    border-radius: 2em 2em 2em 2em;
    padding: 5px 15px;
}
.frame2{
padding: 100px ;
background-color: #FFFFFF;
}

</style>

<main class="layoutCenter">

	<body>
		<section class="notice">
			<div class="page-title">
				<div class="container">
					<center>
						<a href="/board_list.paw"> <img
							src="/resources/image/board_comm_mongmong.PNG">
						</a>
					</center>
					<br>
					<div>
					<div class="frame1">
					 <div class="frame2">
					<table class="board_view">
						<colgroup>
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="35%" />
						</colgroup>
						<caption>게시글 상세</caption>
						<tbody>
							<tr>
								<th scope="row">글 번호</th>
								<td>${map.BC_IDX }</td>
								<th scope="row">조회수</th>
								<td>${map.BC_READHIT }</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>${map.BC_WRITER_NAME }</td>
								<th scope="row">작성시간</th>
								<td>${map.BC_REG_DATE }</td>
							</tr>
							<tr>
								<th scope="row">제목</th>
								<td colspan="3">${map.BC_TITLE }</td>
							</tr>
							<tr>
								<td colspan="4">${map.BC_CONTENTS }</td>
							</tr>
						</tbody>
					</table>
					</div>
					</div>
					<br>
					
					<a href="/board_list.paw" class="btn submit" style="float: right;" >목록으로</a> 
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="/board_modifyForm.paw" class="btn submit" style="float: right;" >수정하기</a>
				</div>
			</div>
		</section>
	</body>
</html>