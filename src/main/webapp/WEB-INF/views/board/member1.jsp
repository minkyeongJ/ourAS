<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en" class="h-100">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>member</title>

         <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/index.css" rel="stylesheet">
        <!--Bootsrap 4 CDN-->
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!-- Custom styles for this template -->
    <link href="assets/css/cover.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
  </head>
  
  <body class="d-flex h-100 text-white bg-dark">
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
      <header class="mb-auto">
        <div>
         <!--<h3 class="float-md-start mb-0"><a href="index.html"><input type="image" src="assets/img/bb.jpg"></a></h3>
          <nav class="nav nav-masthead justify-content-center float-md-end">
            <a class="nav-link active" aria-current="page" href="login-11.html">회원가입</a>
            <a class="nav-link" href="#">회원정보</a>
            <!-- <a class="nav-link" href="#">Contact</a> -->
          </nav>
        </div>
      </header>

      <h1 style="text-align: center; margin-bottom: 30px;">회원가입(기업)</h1>

      <div class="table2">
        <table style="margin-left:auto; margin-right:auto;">
          <colgroup>
             <col style="width:auto" />
          </colgroup>
        
          <tbody>
            <!-- <tr height="3" bgcolor="#FFC8C3"><td colspan="2"></td></tr> -->
            <tr>
              <th>아이디</th>
              <td>
                <input type="text" name="id" style="width:200px;">
              </td>
            </tr>

            <tr>
              <th>비밀번호</th>
              <td>
                <input type="password" name="pw" style="width:200px; margin-right: 20px;">영문/숫자포함 6자 이상
              </td>
            </tr>

            <tr>
              <th>비밀번호확인</th>
              <td>
                <input type="password" name="mbpw" style="width:200px; margin-right: 20px;">영문/숫자포함 6자 이상
              </td>
            </tr>

            <tr>
              <th>기업명</th>
              <td>
                <input type="text" name="name" style="width:200px;">
              </td>
            </tr>
          
            <tr>
              <th style="padding-right:30px">사업자 등록증</th>
              <td>
                <input type="text" name="name" style="width:200px;">
              </td>
            </tr>

            <tr>
              <th>이메일</th>
              <td>
                <input type='text' name="email"> @
                <input type='text' name="email_dns">
                  <select name="emailaddr">
                      <option value="">직접입력</option>
                      <option value="daum.net">daum.net</option>
                      <option value="empal.com">empal.com</option>
                      <option value="gmail.com">gmail.com</option>
                      <option value="hanmail.net">hanmail.net</option>
                      <option value="msn.com">msn.com</option>
                      <option value="naver.com">naver.com</option>
                      <option value="nate.com">nate.com</option>
                  </select>
                </td>
            </tr>

            <tr>
              <th>주소</th>
              <td>
                <input type="text" name="zip_h_1" style="width: 100px;"> - 
                <input type="text" name="zip_h_2" style="width: 100px;"><input type="submit" style="margin-left: 5px;" value="찾기"><br>
                <input type="text" name="addr_h1" style="width: 427px; margin-top: 10px;">
              </td>
            </tr>

            <tr>
              <th>연락처</th>
              <td>
                <input type="text"name="tel_h1" style="width: 130px;"> -
                <input type="text" name="tel_h2_1" style="width: 130px;"> -
                <input type="text" name="tel_h2_2" style="width: 130px;">
              </td>
            </tr>
          </tbody>
        </table> 
      </div>  

      <div class="text-center" style="margin-top:30px;">
        <!-- <input type="submit" value="회원가입" style="margin-right: 10px; padding: 15px;">
        <input type="reset" value="취소" style="margin-right: 10px; padding: 15px;"> -->
      <button type="submit"  style="padding: 10px 20px; margin: 10px;"><a href="list">완료</a>
      <button type="reset"  style="padding: 10px 20px; margin: 10px;"><a href="list">취소</a>
      </div>
      

      <footer class="mt-auto text-center text-white-50">
        <p>Cover template for <a href="https://google.com/" class="text-white">google</a>, <a href="https://twitter.com" class="text-white">twitter</a>.</p>
      </footer>

    </div>

  </body>
</html>
