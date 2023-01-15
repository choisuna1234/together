<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/user-header.jspf"%>
</head>

<style>
.wrapper {
  height: 80px;
  display: grid;
  place-items: center;
}

.typing-demo {
  width: 200px;
  animation: typing 2s steps(22), blink .5s step-end infinite alternate;
  white-space: nowrap;
  overflow: hidden;
  border-right: 3px solid;

}

@keyframes typing {
  from {
    width: 0
  }
}
    
@keyframes blink {
  50% {
    border-color: transparent
  }
}

}
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

.mainContainer {
	border-right: 2px solid #e6b4ac;
	border-bottom: 2px solid #e6b4ac;
	border-left: 5px solid #e6b4ac;
	border-radius: 2em 2em 2em 2em;
	padding: 15px;
	background-color: #e6b4ac;
}

.frame1 {
	border-radius: 2em 2em 2em 2em;
	background-color: #e6b4ac;
}

.frame2 {
	padding: 24px;
	margin-top: 20px;
	margin-right: 10px;
	background-color: #f6eeec;
	border-radius: 2em 2em 2em 2em;
}

.lastFont {
	text-align: right;
}

.title {
	float: right;
	margin-top: 13px;
	margin-right: 30px;
	font-size: 15px;
}

.content {
	border: none;
	outline: none;
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
					<br> <br>
					
					<div class="wrapper">
						<div class="typing-demo">새로운 글을 작성중입니다 :)</div>
					</div>
						<div class="mainContainer">
							<form id="frm" action="/board_write.paw" method="post">
								<div class="frame1">
									<div class="title">
										<input type="text" id="BC_TITLE" name="BC_TITLE"
											placeholder="제목" style="width: 800px; height: 40px">
										</input>
									</div>
								</div>
								<br> <br>
								<div class="frame2">
									<textarea placeholder="내용을 입력해주세요." cols="150" id="BC_CONTENTS" name="BC_CONTENTS" style="height: 500px" class="content"> </textarea>
								</div>
								<br>
						</div>
						<br>
						<div class="lastFont">
							<input class="btn submit" type="submit" value="작성하기"> <a
								class="btn submit" href="/board_list.paw">목록으로</a>
						</div>
						</form>
					</div>
					</div>
					</div>
		</section>
	</body>
</main>
</html>