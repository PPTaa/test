<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <%@include file="../includes/sidebar.jsp" %>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <%@include file="../includes/header.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Board Table</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            Board List Page
                            <button type="button" id="regBtn" class="btn btn-xs pull-right">Register New Board</button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>#번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${list}" var="board">
                                        <tr>
                                            <td>
                                                <c:out value="${board.bno}" />
                                            </td>
                                            <td>
                                                <a class="move" href="<c:out value='${board.bno}'/>">
                                                    <c:out value="${board.title}" />
                                                </a>
                                            </td>
                                            <td>
                                                <c:out value="${board.writer}" />
                                            </td>
                                            <td>
                                                <fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" />
                                            </td>
                                            <td>
                                                <fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <!-- 검색 -->
                               	<div class="row">
                               		<div class="col-lg-12">
                               		<form id="searchForm" action="/board/list" method="get">
                               			<select name="type">
                               				<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':'' }"/>>--</option>
                               				<option value="T" <c:out value="${pageMaker.cri.type == 'T' ? 'selected':'' }"/>>제목</option>
                               				<option value="C" <c:out value="${pageMaker.cri.type == 'C' ? 'selected':'' }"/>>내용</option>
                               				<option value="W" <c:out value="${pageMaker.cri.type == 'W' ? 'selected':'' }"/>>작성자</option>
                               				<option value="TC" <c:out value="${pageMaker.cri.type == 'TC' ? 'selected':'' }"/>>제목 or 내용</option>
                               				<option value="TW" <c:out value="${pageMaker.cri.type == 'TW' ? 'selected':'' }"/>>제목 or 작성자</option>
                               				<option value="TWC" <c:out value="${pageMaker.cri.type == 'TWC' ? 'selected':'' }"/>>제목 or 내용 or 작성자</option>
                               			</select>
                               			<input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>"/>
                               			<input type="hidden" name="pageNum" value="<c:out value="${pageMaker.cri.pageNum}"/>">
                                	    <input type="hidden" name="amount" value="<c:out value="${pageMaker.cri.amount}"/>">
                                	    <button class="btn brn-default"> Search </button>
                               		</form>
                               		</div>
                               	</div>
                                
                                <!-- 페이징 -->
                                <div class="right">
                                    <ul class="pagination">
                                    
                                        <c:if test="${pageMaker.prev }">
                                            <li class="paginate_button btn previous"><a href='<c:out value="${pageMaker.cri.pageNum -1}"></c:out>'>이전</a>
                                            </li>
                                        </c:if>
                                        <c:forEach var="num" begin="${pageMaker.startPage }"
                                            end="${pageMaker.endPage }">                                        
                                            <li
                                                class="paginate_button btn">
                                                <a href="${num}">${num}</a>
                                            </li>
                                        </c:forEach>
                                        <c:if test="${pageMaker.next }">
                                            <li class="paginate_button btn next"><a href='<c:out value="${pageMaker.cri.pageNum +1}"></c:out>'>다음</a></li>
                                        </c:if>
                                    </ul>
                                </div>
                                <form id="actionForm" action="/board/list" method="GET">
                                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                    <input type="hidden" name="type" value="<c:out value="${pageMaker.cri.type}"/>"/>
                                    <input type="hidden" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>"/>
                                </form>
                                <!-- Register Modal-->
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                    aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="myModalLabel">Modal title</h5>
                                                <button class="close" type="button" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">처리가 완료 되었습니다.</div>
                                            <div class="modal-footer">
                                                <button class="btn btn-default" type="button"
                                                    data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary">Save Changes</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <%@include file="../includes/footer.jsp" %>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <!--     <script src="/resources/vendor/jquery/jquery.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/js/demo/datatables-demo.js"></script>

</body>

<script type="text/javascript">
    $(document).ready(function () {

        var result = '<c:out value="${result}"/>';

        checkModal(result);

        history.replaceState({}, null, null);

        function checkModal(result) {
            console.log("result", result)
            console.log("if asd", history.state)

            if (result === '' || history.state) {
                console.log("prevent")
                return;
            }
            if (parseInt(result) > 0) {
                console.log("if no zero")
                $(".modal-body").html("게시글" + parseInt(result) + "번이 등록 되었습니다.");
            }
            $("#myModal").modal("show");
        }

        $("#regBtn").on("click", function () {
            self.location = "/board/register";
        });

        var actionForm = $("#actionForm");

        $(".paginate_button a").on("click", function (e) {

            e.preventDefault();

            console.log("click");
            actionForm.find("input[name = 'pageNum']").val($(this).attr("href"));
            actionForm.submit();
        });
        
        $(".move").on("click", function (e) {
			e.preventDefault();
            actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>")
            actionForm.attr("action", "/board/get");
            actionForm.submit();
		});
        
        var searchForm = $("#searchForm");
    
		$("#searchForm button").on("click", function (e) {
			if(!searchForm.find("option:selected").val()){
				alert("검색종류 선택");
				return False;
			}
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드 입력");
				return False;
			}
			searchForm.find("input[name='pageNum']").val(1);
			e.preventDefault();
			searchForm.submit();	
	
		});
    });
</script>

</html>