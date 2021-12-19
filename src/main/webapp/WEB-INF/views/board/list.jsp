<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">수리신청게시판</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"> 수리요청목록게시판입니다.
                         <button id='regBtn' type="button" class="btn btn-xs pull-right">
							수리신청하기                       
                         </button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>내용</th>
                                        <th>날짜</th>
                                        <th>기업명</th>
                                        <th>제품명</th>
                                        <th>진행상황</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${list}" var="board">
           <tr>
         <td><c:out value="${board.bno}" /></td>
         <td><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td>
        
         <td><c:out value="${board.writer}" /></td>
         <td><fmt:formatDate pattern="yyyy-MM-dd" 
         			value="${board.regdate}" /></td>
         <td><c:out value="${board.comName}" /></td>
         <td><c:out value="${board.product}" /></td>
         <td><c:out value="${board.state}" /></td>
           </tr>
       
          </c:forEach>
       </table>
        
        <!-- 목록 화면과 검색 처리 -->
				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/board/list" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>기업명</option>
								<option value="P"
									<c:out value="${pageMaker.cri.type eq 'P'?'selected':''}"/>>제품명</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 기업명</option>
								<option value="TP"
									<c:out value="${pageMaker.cri.type eq 'TP'?'selected':''}"/>>제목
									or 제품명</option>
								<option value="TPC"
									<c:out value="${pageMaker.cri.type eq 'TPC'?'selected':''}"/>>제목
									or 기업명 or 제품명</option>
							</select> 
							<input type='text' name='keyword'
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
							<input type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>Search</button>
						</form>
					</div>
				</div>
        
        <!-- 페이지처리 --> 
         <div class='pull-right'>
            <ul class="pagination">
  				<!-- pageMaker 이름으로 전달된 PageDTO 이용해서 화면에 페이지 번호 출력 -->
              <c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
			  </c:if>

			  <c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				 <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
					<a href="${num}">${num}</a>
				 </li>
			  </c:forEach>
  
              <c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
			  </c:if>            
             
            </ul>
          </div>
          <!--  end Pagination -->
          <!-- 실제 페이지 클릭하면 동작하는 부분 -->
          <form id='actionForm' action="/board/list" method='get'>
          	<input type='hidden' name='pageNum' value='${pagemaker.cri.pageNum }'>
          	<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
          </form>
        </div>                            	
        	<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> 
				<input type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword }"/>'>

			</form>
			
              <!-- Modal 추가-->
              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                          </div>
                          <div class="modal-body"> 처리가 완료되었습니다.</div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              <button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
               </div>
               <!-- /.modal -->
                            
                            
                            
                            <!-- /.table-responsive -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    
                    <!-- /.panel -->
                </div>
          
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                 
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
<!-- 기존 코드에 페이지 번호 클릭하면 처리 -->            
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var result = '<c:out value="${result}"/>';

						checkModal(result);
						//브라우저 상에서 보관하고 있는 데이더 삭제 
						history.replaceState({}, null, null);
						//뒤로가기 앞으로가기 할때 모달창 중복해서 나타남 방지
						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}
							
						//수리신청하기 누르면 수리신청 페이지로 이동
						$("#regBtn").on("click", function() {

							self.location = "/board/register";

						});

						var actionForm = $("#actionForm");
						
						//<a> 태그 클릭 할때 페이지 막음
						$(".paginate_button a").on("click", function(e) {
									
									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']").val($(this).attr("href"));
									actionForm.submit();
								});

						//실제 클릭은 JS 통해서 게시물 제목 클릭했을 때 이동 //게시물 제목 클릭 시 pageNum, amount 파라미터 추가
						$(".move").on("click", function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr("href") + "'>");
											actionForm.attr("action", "/board/get");
											actionForm.submit();

										});
						//검색 조건과 키원드 보이게 처리 //검색은 1페이지에서
						var searchForm = $("#searchForm");

						$("#searchForm button").on("click", function(e) {

									if (!searchForm.find("option:selected").val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']").val("1");
									e.preventDefault();

									searchForm.submit();

								});

					});
</script>
            
 <%@include file="../includes/footer.jsp" %>       