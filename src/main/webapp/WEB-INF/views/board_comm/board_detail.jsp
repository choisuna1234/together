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
.mainContainer{
    border-right: 2px solid #e6b4ac;
    border-bottom: 2px solid #e6b4ac;
    border-left: 5px solid #e6b4ac;
    border-radius: 2em 2em 2em 2em;
    padding: 15px;
    background-color: #e6b4ac;

}
.frame1{
    border-radius: 2em 2em 2em 2em;

    background-color: #e6b4ac;
}
.frame2{
padding: 30px;
margin: 0 auto;
background-color: #f6eeec;
border-radius: 2em 2em 2em 2em;
box-sizing: content-box;
display: inline-block;
 overflow: visible;
}

.fontPosition{
text-align:right;
font-size: 12px;
float:right;
margin-top: 20px;
margin-right: 10px;
}
.lastFont{
text-align:right;

}
.title{
float:left;
margin-bottom: 15px;
margin-left: 30px;
font-size: 30px;
}

</style>

<main class="layoutCenter">

	<body>
		<section class="notice">
			<div class="page-title">
				<div class="container">
					<center>
						<a href="/board_list.paw"> <img src="/resources/image/board_comm_mongmong.PNG"></a>
					</center>
					<br>
					<br>
					<div>
						<div class="mainContainer">
						<div clsss="frm">
							<div class="frame1">
							  <div class="title">
								${map.BC_TITLE }
								</div>
								<div class="fontPosition">
									<i class="fa-solid fa-user"> ${map.BC_WRITER_NAME } 님</i>
									<i class="fa-solid fa-eye"> ${map.BC_READHIT }</i>
								</div>
							</div>
							</div>
							
							<div class="frame2">
								<table class="board_view">
											<pre>${map.BC_CONTENTS }</pre>
								</table>
								<br>
								<div class="fontPosition">
							<i class="fa-solid fa-list-ol"> ${map.BC_IDX } </i> 
								${map.BC_REG_DATE }
								</div>
							</div>
						</div>
					</div>
					<br>
					<div class="lastFont">
					<a href="/board_list.paw" class="btn submit">목록으로</a> 
					<a href="/board_modifyForm.paw" class="btn submit">수정하기</a>
					</div>
				</div>
			</div>
		</section>
	</body>
</html>