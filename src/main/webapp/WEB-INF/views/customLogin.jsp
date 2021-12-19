<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en" class="h-100">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Cover Template · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/cover/">

        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/cover/">

        <!-- Bootstrap core CSS -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/index.css" rel="stylesheet">
        <!--Bootsrap 4 CDN-->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
        <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <!-- Custom styles for this template -->
    <link href="../resources/css/cover.css" rel="stylesheet">

    <style>
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
            <a class="nav-link active" aria-current="page" href="/member/join">회원가입</a>
            <a class="nav-link" href="#">회원정보</a>
            <!-- <a class="nav-link" href="#">Contact</a> -->
          </nav>
        </div>
      </header>

      <div class="container">
        <div class="d-flex justify-content-center h-100">
          <div class="card">
            <div class="card-header">
              <h3>ourAS</h3>
              <div class="d-flex justify-content-end social_icon">
                <span><i class="fab fa-facebook-square"></i></span>
                <span><i class="fab fa-google-plus-square"></i></span>
                <span><i class="fab fa-twitter-square"></i></span>
              </div>
            </div>
            <div class="card-body">
              <h2><c:out value="${error}"/></h2>
			  <h2><c:out value="${logout}"/></h2>
			  
			  <form method='post' action="/login">
                <div class="input-group form-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                  </div>
                  <input type="text" class="form-control" name="username" placeholder="userid">
                  
                </div>
                <div class="input-group form-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                  </div>
                  <input type="password" class="form-control" name="password" placeholder="password">
                </div>
                <div class="row align-items-center remember">
                  <input type="checkbox" name="remember-me">Remember Me
                </div>
                <div class="form-group">
                  <input type="submit" value="Login" class="btn float-right login_btn">
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              </form>
            </div>
          </div>
        </div>
      </div>

    <footer class="mt-auto text-white-50">
      <p>Cover template for <a href="https://google.com/" class="text-white">google</a>, <a href="https://twitter.com" class="text-white">twitter</a>.</p>
    </footer>
</div>
</body>
</html>
