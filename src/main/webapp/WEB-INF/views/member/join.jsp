<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!doctype html>
<html lang="en" class="h-100">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Login</title>

               <!-- Bootstrap core CSS -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">

        <!--Bootsrap 4 CDN-->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="../resources/css/cover.css" rel="stylesheet">

    <style>
      .text-container a{
        color: rgb(71, 70, 69);
        border-bottom: none;
        text-decoration: none;
        
      }
      .text-container a:hover{
        color: rgb(247, 227, 118);
        cursor: pointer;
        }
      .container a{
        color: coral;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
  </head>
  
  <body class="d-flex h-100 text-center text-white bg-dark">
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
      <header class="mb-auto">
        <div>
          <h3 class="float-md-start mb-0"><a href="index.html"><input type="image" src="../resources/img/bb.jpg"></a></h3>
          <nav class="nav nav-masthead justify-content-center float-md-end">
            <a class="nav-link active" aria-current="page" href="/join">회원가입</a>
            <a class="nav-link" href="#">회원정보</a>
            <!-- <a class="nav-link" href="#">Contact</a> -->
          </nav>
        </div>
      </header>

      <div class="text-container">
        <div class="btn-lg"><a href="/member/customerJoin">고객님</a></div>
        <div class="btn-lg"><a href="/member/companyJoin">기업</a></div>
        <div class="btn-lg"><a href="/member/engineerJoin">수리기사</a></div>
      </div>

    <footer class="mt-auto text-white-50">
      <p>Cover template for <a href="https://google.com/" class="text-white">google</a>, <a href="https://twitter.com" class="text-white">twitter</a>.</p>
    </footer>
</div>
</body>
</html>
