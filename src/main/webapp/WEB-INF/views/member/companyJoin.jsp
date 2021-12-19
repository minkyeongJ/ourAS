<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function(data) {
            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ��Դϴ�.
            // ������ �����Ͽ� �پ��� Ȱ����� Ȯ���� ������.
        }
    })
</script>

<!DOCTYPE html>
<html>
<head>

<!-- īī�� �ּ� -->
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kakao API</title>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>member</title>

         
         <!-- Bootstrap core CSS -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/index.css" rel="stylesheet">
        <!--Bootsrap 4 CDN-->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

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
  
  <body class="d-flex h-100 text-white bg-dark">
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
      <header class="mb-auto">
        <div>
          <h3 class="float-md-start mb-0"><a href="index.html"><input type="image" src="../resources/img/bb.jpg"></a></h3>
          <nav class="nav nav-masthead justify-content-center float-md-end">
            <a class="nav-link active" aria-current="page" href="login-11.html">ȸ������</a>
            <a class="nav-link" href="#">ȸ������</a>
            <!-- <a class="nav-link" href="#">Contact</a> -->
          </nav>
        </div>
      </header>

      <article>
        <header class="member-info">
          <h2 class="member-title text-center">ȸ������</h2><br><br>
        </header>
        
        <form name="write_form_member" role="form" action="/member/join" method="post">
          <table width="640" style="padding:10px">
            <tr height="3" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
            <tr>
              <th>���̵�</th>
              <td><input type="text" name="userid"></td>
            </tr>

            <tr>
 
            <tr>
              <th>��й�ȣ</th>
              <td><input type="password" name="userpw"> ����/�������� 6�� �̻�</td>
            </tr>

<!--             <tr>
              <th>��й�ȣȮ��</th>
              <td><input type="password" name="mbpw"> ����/�������� 6�� �̻�</td>
            </tr> -->

            <tr>
              <th> �̸�</th>
              <td><input type="text" name="userName"></td>
            </tr>
            
            <tr>
              <th> ȸ���</th>
              <td><input type="text" name="comName"></td>
            </tr>
           
            <tr>
              <th>�̸���</th>
              <td>
                <input type='text' name="email">
                <!-- @<input type='text' name="email_dns">
                  <select name="emailaddr">
                      <option value="">�����Է�</option>
                      <option value="daum.net">daum.net</option>
                      <option value="empal.com">empal.com</option>
                      <option value="gmail.com">gmail.com</option>
                      <option value="hanmail.net">hanmail.net</option>
                      <option value="msn.com">msn.com</option>
                      <option value="naver.com">naver.com</option>
                      <option value="nate.com">nate.com</option>
                  </select> -->
                </td>
            </tr>

            <tr>
          	<th>�ּ�</th>
               <td><input type="text" id="address_kakao" name="address" style="width: 300px;" readonly /></td>
         		<!-- <input type="text" name="zip_h_1" style="width: 100px;"> - 
                <input type="text" name="zip_h_2" style="width: 100px;"><input type="submit" style="margin-left: 5px;" value="ã��"><br>
                <input type="text" name="addr_h1" style="width: 427px; margin-top: 10px;"> -->
              <!-- </td> -->
            </tr>
            <th>�� �ּ�</th>
            <td><input type="text" name="address_detail" style="width: 300px;" /></td>
            <!-- <th>�ּ�</th>
            <td>
              <input type="text" name="zip_h_1" style="width: 100px;"> - 
              <input type="text" name="zip_h_2" style="width: 100px;"><input type="submit" style="margin-left: 5px;" value="ã��"><br>
              <input type="text" name="addr_h1" style="width: 427px; margin-top: 10px;">
            </td> -->
          </tr>
          
          <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			window.onload = function(){
			    document.getElementById("address_kakao").addEventListener("click", function(){ //�ּ��Է�ĭ�� Ŭ���ϸ�
			        //īī�� ���� �߻�
			        new daum.Postcode({
			            oncomplete: function(data) { //���ý� �Է°� ����
			                document.getElementById("address_kakao").value = data.address; // �ּ� �ֱ�
			                document.querySelector("input[name=address_detail]").focus(); //���Է� ��Ŀ��
			            }
			        }).open();
			    });
			}
			</script>

            <tr>
              <th>�ڵ��� ��ȣ</th>
                <td><input type="text"name="phone1"> -
                    <input type="text" name="phone2"> -
                    <input type="text" name="phone3">
                </td>
              </tr>
            <tr>
            
            <tr>
              <th>��ȭ ��ȣ</th>
                <td><input type="text"name="tel1"> -
                    <input type="text" name="tel2"> -
                    <input type="text" name="tel3">
                </td>
              </tr>
            <tr>
      		<tr>
              <th> ����ڹ�ȣ</th>
              <td><input type="text" name="bizno"></td>
            </tr>
            <tr>
              <th></th>
              <td><input type="hidden" name="crimsPaper" value=""></td>
            </tr>
            <tr height="3" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
            	<tr>
	                <td colspan="2" class="text-center">
	                  <input type="submit" value="ȸ������">
	                  <input type="reset" value="���">
	              	</td>
            	</tr>
            </table>
	        <input type="hidden" name="authList[0].auth" value="ROLE_USER">
	        <input type="hidden" name="mType" value="company">
      </form>
      </article>

    <footer class="mt-auto text-white-50">
      <p>Cover template for <a href="https://google.com/" class="text-white">google</a>, <a href="https://twitter.com" class="text-white">twitter</a>.</p>
    </footer>
</div>
</body>
</html>