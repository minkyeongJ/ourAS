<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/enHeader.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">[엔지니어]수리결과보고서</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"> 정상적으로 보고서가 제출되었습니다.
                        </div>
                        
              <!-- Modal 추가-->
              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                          </div>
                          <div class="modal-body"> 보고서 제출이 정상적으로 처리되었습니다.</div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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