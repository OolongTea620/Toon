<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- BootStrap -->    
<!--     <link rel="icon" href="images/favicon.png" type="image/png">  위에 로고-->
    <c:import url="../fragments/bootstrap.jsp"></c:import>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    
    <style type="text/css">
     .back {
    	background-image: url('../images/toon-qna1.PNG');
    	background-size : 500px;
    	border-style: solid;
    	border-color: #FFE150;
     }
     #frm {
     	background-color: #FFFF96;
     	border-style: solid;
     	border-color: #FFE150;
     }
  
    
    </style>

<title>질문 작성</title>


<!-- summernote  -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<!-- ------------ -->
<style type="text/css">
#sample {
	display: none;
}
</style>

</head>
<body>
	<c:import url="../fragments/header.jsp"></c:import>
<div class="back">
	<div class="container"><br>
		<h2><p><span style="border-radius: 15px 15px 15px 0; border: 3px solid #FFE150; 
		padding: 0.5em 0.6em; color: black; background-color:#FFFF96; ">질문 작성</span></p></h2><br>
		
		<form id="frm" action="./qnaInsert" method="post" enctype="multipart/form-data">
	
			<div class="form-group">
				<label for="username">작성자</label> <input type="text"
					readonly="readonly" value="${member.username}"
					class="form-control myCheck" id="username" name="username">
			</div>
			<div class="form-group">
				<label for="qnaTitle">제목</label> <input type="text"
					class="form-control myCheck" id="qnaTitle" name="qnaTitle">
			</div>

			<div class="form-group">
				<label for="qnaContents">내용</label>
				<textarea class="form-control myCheck" rows="5" id="qnaContents"
					name="qnaContents"></textarea>
			</div>

			<input type="button" id="add" value="파일추가" class="btn btn-warning">
			
			<div id="files" title="0"></div><br>

			<input type="button" id="btn" value="등록" class="btn btn-warning">
		</form>
	</div>
	
	</div> <!-- 작성란까지 css 일단 파일부분이 안나와서 뺴고나옴 -->
	<div id="sample">
		<div class="input-group">
			<div class="custom-file">
				<input type="file"  id="inputGroupFile04"
					class="form-control-file border" name="files">
			</div>
			<div class="input-group-append delete">
				<input class="btn btn-outline-secondary" type="button"
					id="inputGroupFileAddon04" value="Delete">
			</div>
		</div>
	</div>


	<script type="text/javascript" src="../js/board/boardInsert.js"></script>
	<script type="text/javascript" src="../js/board/fileAdd.js"></script>
	<script type="text/javascript" src="../js/board/qnaSummerFile.js"></script>
	
</body>
</html>