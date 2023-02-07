<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link href="/resources/css/board_comm/board_comm_list.css"
      rel="stylesheet">
<link rel="stylesheet" href="/resources/css/board_comm/toastr.css"
      integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<script src="/resources/js/board_comm/toastr.min.js"
        integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script src="/resources/js/paging/searchPaging_B.js"></script>


<main class="layoutCenter">
    <body>
    <section class="notice">
        <div class="page-title">
            <div class="container">
                <center>
                    <a href="/board/list.paw"> <img
                            src="/resources/image/board_comm_mongmong.PNG">
                    </a>
                </center>
            </div>
        </div>
        <!-- board seach area -->
        <div id="board-search">
            <div class="container">
                <br>
                <div class="search-window">
                    <form action="/board/list.paw">
                        <div class="search-wrap">
                            <input type="text" class="txt" placeholder="제목이나 내용을 검색하세요"
                                   name="subKeyword" id="subKeyword" value="${subKeyword}"
                                   style="width: 530px; height: 38px;"/>&nbsp; <input
                                type="submit" value="검색" class="btn submit"/> <br>
                        </div>
                    </form>
                    <div></div>
                </div>
            </div>
        </div>


        <!-- board list area -->
        <div id="board-list">
            <div class="container">
            <table class="board-table" id="board_list">

                <thead>
                <div class="tab_radio">
                    <input type="radio" id="a" name="BC_BCC_NAME" value="전체게시판" checked><label for="a">전체게시판</label>
                    <input type="radio" id="b" name="BC_BCC_NAME" value="자유게시판"><label for="b">자유게시판</label>
                    <input type="radio" id="c" name="BC_BCC_NAME" value="정보게시판"><label for="c">정보게시판</label>
                    <input type="radio" id="d" name="BC_BCC_NAME" value="긴급실종유기견"><label for="d">긴급실종유기견</label>
                    <input type="radio" id="f" name="BC_BCC_NAME" value="자원봉사구해요"><label for="f">자원봉사구해요</label>
                </div>

                </thead>
                <tbody class="board">
                </tbody>
            </table>
            </div>
            <br> <a href="/board/writeForm.paw" class="btn submit" style="float: right">글쓰기</a>

            <div id="PAGE_NAVI_B"></div>
            <input type="hidden" id="PAGE_INDEX_B" name="PAGE_INDEX_B"/>
<%--            <br/>--%>

            <form id="commonForm" name="commonForm"></form>
        </div>
        <br>
    </section>
    </body>
</main>
<script>
    /* 이 페이지에서만 적용되는 제이쿼리라 따로 빼놈 - 등록 완료 후 이벤트 처리 */


    $(document).ready(function () {
        fn_selectBoardList(1);//첫화면 보이기
    });

    function fn_selectBoardList(pageNo, BC_BCC_NAME = '전체게시판') {
        var comAjax = new ComAjax();

        comAjax.setUrl("<c:url value='/pagingBoard/list.paw' />");
        comAjax.setCallback("fn_selectBoardListCallback");

        comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX_B").val());
        comAjax.addParam("PAGE_ROW", 10);
        comAjax.addParam("BC_BCC_NAME", BC_BCC_NAME);
        comAjax.ajax();

    }

    function fn_selectBoardListCallback(data) {
        var total = data.TOTAL_B;

        var body = $(".board");
        body.empty(data.TOTAL_B);

        // alert("fn_selectBoardListCallback 실행 시작");

        if (total == 0) {
            var str = "<tr align='center'>"
                + "<td colspan='4'>조회된 결과가 없습니다.</td>" + "</tr>";
            body.append(str);

        } else {
            var params = {
                divId: "PAGE_NAVI_B",
                pageIndex: "PAGE_INDEX_B",
                totalCount: total,
                eventName: "fn_selectBoardList",
            };
            gfn_renderPaging_B(params);
            // body.html(data);
            var str = "";
            $.each(data.list, function (key, value) {
                str += "<tr align='center' class='use_move' data-href='/board/detail.paw' onclick=\"move(this,\'BC_IDX:"+value.BC_IDX+"\')\"> "
                    + "<td align='center'>" + value.BC_IDX + "</td>"
                    + "<td align='center'>" + value.BC_BCC_NAME + "</td>"
                    + "<td class='title'>" + value.BC_TITLE + "</td>"
                    // + "<a href='#this' name='title'>" + value.BC_TITLE + "</a>"
                    // + "<input type='hidden' name='title' id='IDX' value=" + value.BC_IDX + ">"
                    + "<td align='center'>" + value.BC_WRITER_NAME + "</td>"
                    + "<td align='center'>" + value.BC_READHIT + "</td>"
                    + "</tr>";
            });
            body.append(str);

            // alert('fn_selectBoardListCallback끝');
        }

    }


    /* ------------------- 라디오 버튼 클릭했을때!!!------------------- */

    $("input:radio[name='BC_BCC_NAME']").on('click', function () {
        var BC_BCC_NAME = $(this).val();
        fn_selectBoardList(1, BC_BCC_NAME)

        // $.ajax({
        // 	type: "post",
        // 	url: "/board/list3.paw",
        // 	data: {
        // 		BC_BCC_NAME: BC_BCC_NAME
        // 	},
        // 	dataType: "text",
        // 	success: function (data) {
        // 		alert(data)
        // 		$(".board").html(data);
        // 		//fn_selectCateList(1);
        // 		//fn_selectCateListCallback(data);
        // 	},
        // 	error: function (data) {
        // 		alert('error');
        // 	}
        // })

    });


    <%--function fn_selectCateList(pageNo) {--%>
    <%--    alert('카테고리ON!');--%>
    <%--    var comAjax = new ComAjax();--%>

    <%--    comAjax.setUrl("<c:url value='/pagingBoard/list.paw' />");--%>
    <%--    comAjax.setCallback("fn_selectCateListCallback");--%>

    <%--    comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX_B").val());--%>
    <%--    comAjax.addParam("PAGE_ROW", 10);--%>
    <%--    comAjax.ajax();--%>
    <%--}--%>


    <%--function fn_selectCateListCallback(data) {--%>
    <%--    var total = data.TOTAL_B;--%>
    <%--    var body = $(".board");--%>
    <%--    body.empty(data.TOTAL_B);--%>

    <%--    alert("카테고리 시작");--%>

    <%--    if (total == 0) {--%>
    <%--        var str = "<tr align='center'>"--%>
    <%--            + "<td colspan='4'>조회된 결과가 없습니다.</td>" + "</tr>";--%>
    <%--        body.append(str);--%>

    <%--    } else {--%>
    <%--        var params = {--%>
    <%--            divId: "PAGE_NAVI_B",--%>
    <%--            pageIndex: "PAGE_INDEX_B",--%>
    <%--            totalCount: total,--%>
    <%--            eventName: "fn_selectCateList",--%>
    <%--        };--%>

    <%--        gfn_renderPaging_B(params);--%>

    <%--        var str = "";--%>
    <%--        $.each(data.list, function (key, value) {--%>
    <%--            str += "<tr>"--%>
    <%--                + "<td align='center'>" + value.BC_IDX + "</td>"--%>
    <%--                + "<td align='center'>" + value.BC_BCC_NAME + "</td>"--%>
    <%--                + "<td class='title'>"--%>
    <%--                + "<a href='#this' name='title'>" + value.BC_TITLE + "</a>"--%>
    <%--                + "<input type='hidden' name='title' id='IDX' value=" + value.BC_IDX + ">"--%>
    <%--                + "</td>"--%>
    <%--                + "<td align='center'>" + value.BC_WRITER_ID + "</td>"--%>
    <%--                + "<td align='center'>" + value.BC_READHIT + "</td>"--%>
    <%--                + "</tr>";--%>
    <%--        });--%>
    <%--        body.append(str);--%>

    <%--        alert('카테고리 끝');--%>
    <%--    }--%>
    // }


    $(function () {

        if ('${success}') {
            toastr.success('${success}');

        }
        if ('${warning}') {
            toastr.warning('${warning}');

        }
        if ('${info}') {
            toastr.info('${info}');

        }
        if ('${error}') {
            toastr.info('${error}');
        }

    });


</script>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
