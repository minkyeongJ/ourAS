<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--uploadFormActio 경로를 이용해서 실제 전송처리 //     multipart : 하나의 input 태그로 여러 개의 파일 업로드 가능 -->
<form action="uploadFormAction" method="post" enctype="multipart/form-data">

<input type='file' name='uploadFile' multiple>

<button>Submit</button>

</form>

</body>
</html>
