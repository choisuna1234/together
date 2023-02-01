<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<%@ include file="/WEB-INF/include/user-header.jspf"%>
	<link href="/resources/css/board_comm/board_comm_list.css"
		  rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/board_comm/toastr.css"
		  integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
		  crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="/resources/js/board_comm/toastr.min.js"
			integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="/resources/js/paging/paging.js"></script>
						<table class="board-table">
						<tbody>
							<c:choose>
								<c:when test="${fn:length(list) > 0}">
									<c:forEach items="${list }" var="row">
										<tr align="center" class="use_move"
											data-href="/board/detail.paw"
											onclick="move(this,'BC_IDX:${row.BC_IDX}')">
											<td width="5%">${row.BC_IDX }</td>
											<td width="15%">${row.BC_BCC_NAME }</td>
											<td width="45%">${row.BC_TITLE }</td>
											<td width="5%">${row.BC_READHIT }</td>
											<td width="10%">${row.BC_WRITER_ID }</td>
											<td width="10%"><fmt:formatDate
													value="${row.BC_MOD_DATE}" pattern="yyyy-MM-dd" /></td>
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
						
						<ul class="paging"> </ul>
						<div id="PAGE_NAVI"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
			<br />
	
	<form id="commonForm" name="commonForm"></form>
						
<script type="text/javascript">

	$(document).ready(function() {
		fn_selectBoardList(1);
		
	});

	function fn_selectBoardList(pageNo) {
		var comAjax = new ComAjax();

		comAjax.setUrl("<c:url value='/board/list.paw' />");
		comAjax.setCallback("fn_selectBoardListCallback");

		if(!isNull(pageNo)) comAjax.addParam("PAGE_INDEX", pageNo);
		else comAjax.addParam("PAGE_INDEX", $('#PAGE_INDEX').val));
		comAjax.addParam("PAGE_ROW", 10);
		if(!isNull($('#subKeyword').val))) comAjax.addParam("subKeyword", $('#subKeyword').val));
		
		comAjax.ajax();
	}

	function fn_selectBoardListCallback(data) {
		let total = data.TOTAL;
		var pl_list_body = $(".pl_list");

		if (total == 0) {
			pl_list_body.html("<tr align='center'><td class='empty'>조회된 결과가 없습니다.</td></tr>");
		} else {
			var params = {
				divId : "paging",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_selectBoardList",

			};
			
			gfn_renderPaging_B(params);

			var str = "";
			$.each(data.boardSearchList, function(key, value) {
				str += "<tr>"
							+ "<td align='center'>" + value.BC_IDX + "</td>"
							+ "<td class='title'>"
							+ "<a href='#this' name='title'>" + value.BC_TITLE + "</a>"
							+ "<input type='hidden' name='title' id='IDX' value=" + value.BC_IDX + ">"
							+ "</td>" 
							+ "<td align='center'>" + value.BC_WRITER_ID + "</td>"
							/* + "<td align='center'>" + value.BC_READHIT + "</td>" */
							+ "<td align='center'>" + value.BC_MOD_DATE + "</td>" 
						+ "</tr>";
				});
			body.append(str);
		}

		$("a[name='title']").on("click", function(e) { //제목 
			e.preventDefault();
			fn_openBoardDetail($(this));
		});

		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/detail.paw' />");
			comSubmit.addParam("BC_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}

	}
</script>

</html>
