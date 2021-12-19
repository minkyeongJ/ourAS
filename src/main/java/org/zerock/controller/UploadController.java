package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {

	//get방식으로 첨부파일 업로드
	@GetMapping("/uploadForm")
	public void uploadForm() {

		log.info("upload form");
	}
	//POST방식으로 첨부파일 업로드
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

		String uploadFolder = "C:\\upload";
		
		for (MultipartFile multipartFile : uploadFile) {

			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);  //transforTo() 업로드 된 파일 저장
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
		} // end for

	}
	
	//get방식으로 첨부파일 업로드
	@GetMapping("/uploadAjax")
	public void uploadAjax() {

		log.info("upload ajax");
	}
 
	//오늘 날짜의 경로를 문자열로 생성
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	 //해당 경로가 있는지 검사하고, 폴더를 생성  ->이후 생성된 폴더로 파일 저장
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	//AttachFileDTO의 리스트를 반환 //JSON 데이터 반환
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {

		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";

		String uploadFolderPath = getFolder();
		
		// make folder --------
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder
	
		for (MultipartFile multipartFile : uploadFile) {

			AttachFileDTO attachDTO = new AttachFileDTO();

			String uploadFileName = multipartFile.getOriginalFilename();

			
			 // IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);

			
			UUID uuid = UUID.randomUUID(); //임의의 값 생성해서 중복 방지
				
			uploadFileName = uuid.toString() + "_" + uploadFileName; //원래의 파일 이름과 구분 할 수 있도록 중간에 '_' 추가
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				 
			    // check image type file  --> 섬네일 생성
				if (checkImageType(saveFile)) {

					attachDTO.setImage(true);

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					//Tunmnailator는 inputStream과 java.io.File 객체 사용하여 파일 생성 // 사이즈 파라미터(width, height
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					thumbnail.close();
				}

				// add to List
				list.add(attachDTO);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	 
	 //파일이 이미지 타입인지 검사
	 private boolean checkImageType(File file) {

			try {
				String contentType = Files.probeContentType(file.toPath());

				return contentType.startsWith("image");

			} catch (IOException e) {
				e.printStackTrace();
			}
			return false;
	}
	 
	//파일 이름을 받아 이미지 데이터를 전송하는 코드 
 	@GetMapping("/display")
	@ResponseBody
	//getFile()은 문자령로 파일의 경로 포함된 fileName을 파라미터르 받고 byte[]전송
	public ResponseEntity<byte[]> getFile(String fileName) {

		log.info("fileName: " + fileName);

		File file = new File("c:\\upload\\" + fileName);

		log.info("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();
			//MIME 타입 데이터를 http의 헤더 메지니에 보냄
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
		 
	 //첨부파일의 다운로드
	 //MIME 타입은 다운로드 할 수 있는 APPLICATION_OCTET_STREAM으로 지정
	 @GetMapping(value="/download" ,produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	 @ResponseBody
	 //@RequestHeader 통해 필요한 HTTP 헤더 메시지 내용 수집
	 public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent")String userAgent, String fileName){
		
		 Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
		
		 if(resource.exists() == false) {
			 return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		 }
		
		 String resourceName = resource.getFilename();
		
		 //remove UUID -> 파일이름 저장
		 String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		 //다운로드 시 파일 이름 처리
		 HttpHeaders headers = new HttpHeaders();
		 
		 try {
			
			 boolean checkIE = (userAgent.indexOf("MSIE") > -1 ||
			 userAgent.indexOf("Trident") > -1); //Trident : IE 브라우저 엔진이름
			
			 String downloadName = null;
			
		 if(checkIE) {
			 downloadName = URLEncoder.encode(resourceOriginalName, "UTF8").replaceAll("\\+", " ");
		 }else {
			 downloadName = new
			 String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");
		 }
		 //Content-Disposition - 다운로드 시 저장되는 이름
		 headers.add("Content-Disposition", "attachment; filename="+downloadName);
		
		 } catch (UnsupportedEncodingException e) {
			 e.printStackTrace();
		 }
		
		 return new ResponseEntity<Resource>(resource, headers,HttpStatus.OK);
	}
	 
    //브라우저에서 전송하는 파일 이름과 종류를 파라미터로 받아서 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {

		log.info("deleteFile: " + fileName);

		File file;

		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			if (type.equals("image")) {

				String largeFileName = file.getAbsolutePath().replace("s_", "");

				log.info("largeFileName: " + largeFileName);

				file = new File(largeFileName);

				file.delete();
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}

}
