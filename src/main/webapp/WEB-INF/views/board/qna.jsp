<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>


<!--  /.row -->


<html lang="en" class="h-100">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>req_Repair</title>

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

      h1 {text-align: center;}
      #tab {border: 2px solid rgb(0, 0, 0);}
      table td {border: 2px solid rgb(0, 0, 0);}
      table {width: 500px; height: 100px; text-align: center; margin: auto; background-color: rgb(109, 110, 110);}
      .td01.td02 {font-weight: bold; font-size: 20px;}
      

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
            <a class="nav-link active" aria-current="page" href="login-11.html">????????????</a>
            <a class="nav-link" href="#">????????????</a>
            <!-- <a class="nav-link" href="#">Contact</a> -->
          </nav>
        </div>
      </header>
      
      <h1 class="margin-left: 20px;">???????????????</h1>
      <table id="tab" style="width: 620px; margin-right: 0 auto;">
        <colgroup>
          <col style="width:170px" />
          <col style="width:auto" />
        </colgroup>
    
        <tbody>
          <tr>
            <td class="td02">??????</td>
            <td class="text-left" style="padding: 10px;">
              <select name="que" style="margin-right:100px;">
                <option value="">????????????</option>
                <option value="">TV</option>
                <option value="">?????????</option>
                <option value="">????????????</option>
                <option value="">??????????????????</option>
                <option value="">?????????</option>
                <option value="">??????</option>
              </select>
              <select name="que">
                <option value="">?????????</option>
                <option value="">????????????</option>
                <option value="">?????????</option>
                <option value="">?????????</option>
                <option value="">?????????</option>
                <option value="">??????????????????</option>
                <option value="">??????</option>
              </select>
            </td>
          </tr>

          <tr>
            <td class="td02">??????</td>
            <td class="text-left" style="padding: 10px;">
              <input type="text" name="cursor:pointer" style="width:450px;">
            </td>
          </tr>

          <tr>
            <td class="td02">?????????</td>
            <td class="text-left" style="padding: 10px;">
              <input type="text" name="cursor:pointer" style="width:450px;">         
            </td>
          </tr>

          <tr>
            <td class="td02">?????????</td>
            <td class="text-left" style="padding: 10px;">
              <input type="text" name="cursor:pointer" style="width:450px;">
            </td>
          </tr>

          <tr>
            <td class="td02">??????</td>
            <td class="text-left" style="padding: 10px;">
              <input type="text" name="cursor:pointer" style="width:450px; height: 300px;">
            </td>
          </tr>

          
          <tr>
            <td class="td02">????????????</td>
            <td class="text-left" style="padding: 10px;">
              <button type="submit" value="????????????">????????????</button><input type="text" name="cursor:pointer" style="width:370px;">
              <button type="submit" value="?????????">?????????
            </td>
          </tr>
        </tbody>
        
        <tr> <!-- ??????  ?????? ??? ?????? ??? ??? -->
            <td colspan="2" class="text-center">
              <button type="submit"  style="padding: 10px 20px; margin: 10px;"><a href="list">??????</a>
              <button type="reset"  style="padding: 10px 20px; margin: 10px;"><a href="req_repair">??????</a>
              <button type="submit"  style="padding: 10px 20px; margin: 10px;"><a href="list">HOME</a>
          </td>
        </tr>
      </table>

    <footer class="mt-auto text-center text-white-50">
      <p>Cover template for <a href="https://google.com/" class="text-white">google</a>, <a href="https://twitter.com" class="text-white">twitter</a>.</p>
    </footer>
</div>
</body>
<%@include file="../includes/footer.jsp"%>
</html>
