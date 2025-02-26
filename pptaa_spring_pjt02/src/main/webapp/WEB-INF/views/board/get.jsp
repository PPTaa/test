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
                    <h1 class="h3 mb-2 text-gray-800">Board read page</h1>
                    <!-- DataTales Example -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">Board read page</div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label>bno</label>
                                        <input class="form-contorl" name="bno" value='<c:out value="${board.bno}"/>'
                                            readonly="readonly">
                                    </div>
                                    <div class="form-group">
                                        <label>Title</label>
                                        <input class="form-contorl" name="title" value='<c:out value="${board.title}"/>'
                                            readonly="readonly">
                                    </div>
                                    <div class="form-group">
                                        <label>Text Area</label>
                                        <textarea class="form-contorl" rows="3" name="content" readonly="readonly">
			                        		<c:out value="${board.content}"></c:out>
			                        		</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Writer</label>
                                        <input class="form-contorl" name="writer"
                                            value='<c:out value="${board.writer }"/>' readonly="readonly">
                                    </div>
                                    <button data-oper="modify" class="btn btn-default">Modify</button>
                                    <button data-oper="list" class="btn btn-info">List</button>
                                        
                                    <form id="operForm" action="/board/modify" method="get">
                                    	<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno }"/>'>
                                    	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
                                    	<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
                                    	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
                                    	<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
                                    </form>
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

<script>
    $(document).ready(function(){
        var operForm = $("#operForm");

        $("button[data-oper='modify']").on("click", function(e){
        	console.log("click modify");
            operForm.attr("action", "/board/modify").submit();
        });

        $("button[data-oper='list']").on("click", function(e){
            console.log("click list");
            operForm.find("#bno").remove();
            operForm.attr("action", "/board/list");
            operForm.submit();
        });
    });

</script>


</html>