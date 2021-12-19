<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
	.uploadResult {
		width: 100%;
		background-color: gray;
	}
	
	.uploadResult ul {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	
	.uploadResult ul li {
		list-style: none;
		padding: 10px;
		alingn-content: center;
		text-align :center;
	}
	
	.uploadResult ul li img {
		width: 100px;
	}
	.bigPictureWrapper {
	  position: absolute;
	  display: none;
	  justify-content: center;
	  align-items: center;
	  top:0%;
	  width:100%;
	  height:100%;
	  background-color: gray; 
	  z-index: 100;
	  background:rgb(255,255,255,0.5);
	}
	
	<!--실제 이미지 .bigpicture 안에 <img>-->
	.bigPicture {
	  position: relative;
	  display:flex;
	  justify-content: center;
	  align-items: center;
	}
	</style>
	
	<div class='bigPictureWrapper'>
	  <div class='bigPicture'>
	  </div>
	</div>
	  
	<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>
		
	<div class='uploadResult'>
		<!-- <ul> 안에 업로드된 파일의 이름 보여줌 -->
		<ul>

		</ul>
	</div>	
	
	
	<button id = 'uploadBtn'>Upload</button>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	
	
	<script>
		
		//이미지  확대해서 보여주는 <div>처리
		function showImage(fileCallPath){
	  	
		  $(".bigPictureWrapper").css("display","flex").show();
		  
		  $(".bigPicture")
		  .html("<img src='/display?fileName="+fileCallPath+"'>")
		  .animate({width:'100%', height: '100%'}, 1000);
		}
		
		//다시 클릭하면 확대된 이미지 사라짐
		$(".bigPictureWrapper").on("click", function(e){
			  $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
			  setTimeout(function() {
			    $('.bigPictureWrapper').hide();
			  }, 1000);
		});
		
		//첨부파일 삭제 위해 ajax이용해서 첨부파일 경로, 이름, 파일의 종류 전송
		$(".uploadResult").on("click","span", function(e){
			   
			  var targetFile = $(this).data("file");
			  var type = $(this).data("type");
			  console.log(targetFile);
			  
			  $.ajax({
			    url: '/deleteFile',
			    data: {fileName: targetFile, type:type},
			    dataType:'text',
			    type: 'POST',
			      success: function(result){
			         alert(result);
			       }
			  }); //$.ajax
			  
		});

		
		//특정한 종류의 파일 확장자 업로드 제한
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB
	
		function checkExtension(fileName, fileSize) {
	
			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
	
			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
			
		var cloneObj = $(".uploadDiv").clone(); //아무 내용 없는 <input type='file'> 객체 포함된 <div> 복사

	 	$("#uploadBtn").on("click", function(e){

	 		 var formData = new FormData(); //파일 업로드 객체 (가상의 form 태그)
	 
	 		 var inputFile = $("input[name='uploadFile']");
	
		 	 var files = inputFile[0].files;
	
		 	 console.log(files);
		 	
		     //add filedate to formdata
			 for(var i = 0; i < files.length; i++){
			
				 if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}

					formData.append("uploadFile", files[i]);
			 }
				
		    //Ajax 통해서 formData 자체를 전송 //uploadController에서 반환된 정보 처리함
			$.ajax({
					url : '/uploadAjaxAction',
					processData : false,  //processData, contentType 반드시 false
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',  //Ajax 호출 시 결과 타입 json으로 변경
					success : function(result) {
	
						console.log(result); //결과를 console.log로 보여줌
						
						showUploadedFile(result); //받은 Json데이터로 showUplaodedFile()호출
						
						$(".uploadDiv").html(cloneObj.html()); //복사된 객체를 <div>내에 다시 추가해서 첨부파일 부분 초기화
						
					}
				}); //$.ajax	 	
	 		});
			
	 	//목록을 보여주는 부분 함수
		var uploadResult = $(".uploadResult ul");
	
		//Json 데이터 받아서 해당 파일의 이름 추가
		//이미지 파일이 아닌 경우 파일 아이콘을 보여줌
		function showUploadedFile(uploadResultArr){
			 
			   var str = "";
			   
			   $(uploadResultArr).each(function(i, obj){
			     
			      if(!obj.image){
			    	//encodeURIComponent() 이용해서 URI 호출에 적합한 문자열로 인코딩 처리  
			        var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
			       
			        var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			       //span태그로 섬네일이나 아이콘 옆에 'x'표시 추가
			        str += "<li><div><a href='/download?fileName="+fileCallPath+"'>"+
			            "<img src='/resources/img/attach.png'>"+obj.fileName+"</a>"+
			            "<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"+
			            "<div></li>"
				           
			     }else{
			       
			       var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			       //섬네일클릭시 showImage() 호출
			       var originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.fileName;
			       
			       originPath = originPath.replace(new RegExp(/\\/g),"/");
			       
			       str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"+
			              "<img src='display?fileName="+fileCallPath+"'></a>"+
			              "<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"+
			              "<li>";
			     }
			   });
			   
			   uploadResult.append(str);
			 }

		
	</script>
</body>
</html>