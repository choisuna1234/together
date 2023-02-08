<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/css/board_comm/mypageBoardList.css" rel="stylesheet">
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<main class="layoutCenter">
<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>
<div class="main_wrap">


    <section class="notice">
        <div class="page-title">
            <div class="container">
            <i class="fa-solid fa-dog"> &nbsp;&nbsp; ${mem_id} 님이 쓴 멍멍왈왈 게시글</i>
            </div>
        </div>
 		<input type="hidden" id="BC_WRITER_NAME" name="BC_WRITER_NAME" value="${mem_id}" />

        <!-- board list area -->
        <div id="board-list">
            <div class="container">
            <table class="board-table" id="board_list">
			<tr>
				<th>글번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
                <tbody class="board">
							<c:choose>
								<c:when test="${fn:length(myPageList) > 0}">
									<c:forEach items="${myPageList}" var="myPage">
										<tr align="center" class="use_move"
											data-href="board_detail.paw"
											onclick="move(this, 'in', 'BC_IDX')">
											<td>${myPage.BC_IDX }</td>
											<td>${myPage.BC_BCC_NAME}</td>
											<td>${myPage.BC_TITLE }</td>
											<td>${myPage.BC_MOD_DATE }</td>
											
											<tr align="center" class="use_move" data-href="board_detail.paw"
											onclick="move(this,'BC_IDX:${myPage.BC_IDX}')">
											<td width="10%">${myPage.BC_IDX }</td>
											<td width="60%">${myPage.BC_TITLE }</td>
											<td width="10%">${myPage.BC_MOD_DATE }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4">조회된 결과가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
                </tbody>
            </table>
            <br> 
        </div>
        <br>
    </section>
</div>

</main>
