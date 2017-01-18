<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title></title>

  <link rel="stylesheet" href="src/css/style.css">
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
  
</head>
<body>

  <jsp:include page="./component/header.jsp">
  	<jsp:param value="navbar-static-top" name="navbar_style"/>
  </jsp:include>
  
  <main>
  	<script type="text/javascript">
		function idCheck(form) {
			if(${id == null}){
				alert('로그인 후 이용가능합니다.');
			}else{
				form.submit();
			}
		}
		
		function clean(a){
			a.value="";
		}
		
	</script>
    <div id="detail_main" class="container" style="margin-top: 40px">
      <div class="row">

        <div class="col-md-3 col-md-push-9"> <!--오룬쪽  -->
          <div class="panel panel-default">
            <div class="panel-body">
            
              <form class="form-horizontal" action="book.do" method="POST"> 
              
              	<h4><strong>예매일자</strong></h4>
				<div class="form-group" style="margin-bottom: 30px;">
				
				  <input type="hidden" name="sno" value="${bean.sno}">
				
                  <div class="col-xs-12">
                    <select class="form-control" name="bookDate">
                      <!-- <option value="option_default">예매일자를 선택하세요.</option>
                      <option value="option1">2016/01/27 (잔여:15)</option>
                      <option value="option2">2016/01/28 (잔여:25)</option>
                      <option value="option3">2016/01/29 (잔여:15)</option>
                      <option value="option4">2016/01/30 (잔여:15)</option> -->
                      <c:forEach var="bookinfo" items="${bookinfo}">
						<option>${bookinfo.ssdate} (잔여석: ${bookinfo.ssseat})</option>
					  </c:forEach>
                    </select>
                  </div>
                </div>
				
				<h4><strong>The-Ticket 시간</strong></h4>
				<div style="margin-bottom: 30px;">
					${bookinfo_time}
				</div>
				
				<h4><strong>인원수</strong></h4>
				<div class="form-group" style="margin-bottom: 30px;">
					<div class="col-xs-12">
						<input type="number" class="form-control" name="people" placeholder="0" min="0" max="${bookinfo.get(0).ssseat}" required style="font-size: 20px;">
					</div>
				</div>

                <div class="form-group">
                  <div class="col-xs-12">
                    <button type="submit" class="btn btn-danger" style="width: 100%; height: 50px; font-size: 20px; font-weight: bold">예매하기</button>
                  </div>
                </div>

              </form>
              
            </div>
          </div>
        </div><!--end 오룬쪽  -->

        <div class="col-md-9 col-md-pull-3"><!-- 왼쪽  -->

          <div class="row"  style="margin-bottom: 10px; border-style: solid; border-width: 1px; border-radius: 4px; border-color: #ddd; padding: 15px;">
            <div class="col-xs-12 col-md-7">
              <img src="src/image/poster/${bean.smainimg}" class="img-responsive img-rounded" alt="Responsive image" style="width: 100%;">
            </div>

            <div class="col-xs-12 col-md-5">
              <ul>
                <li style="list-style: none; margin-bottom: 30px;">
                  <h3><strong>The-Ticket</strong></h3>${bean.sname}
                </li>
                <li style="list-style: none; margin-bottom: 30px;">
                  <h3><strong>장소</strong></h3>${bean.saddress}
                </li>
                <li style="list-style: none; margin-bottom: 30px;">
                  <h3><strong>기간</strong></h3>${bean.speriod}
                </li>
                <li style="list-style: none; margin-bottom: 30px;">
                  <h3><strong>출연</strong></h3>${bean.sactor}
                </li>
				<li style="list-style: none; margin-bottom: 30px; font-size: 35px; font-weight: 900; color: #d9534f;">
               		<c:set var="price" value="${bean.sprice}" />
					<fmt:formatNumber type="currency" currencySymbol="￦" value="${price}" />
             	</li>
             	
             	<li style="list-style: none; margin-bottom: 30px;">
	             	<form name="like_no" method="post" action="Like.do?id=${id}&sno=${bean.sno}">
		                <input type="hidden" name="selectLike" value="1">
		                <button type="button" id="no" style="display:${like_no}" onclick="idCheck(this.form)" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>&nbsp;LIKE</button>
					</form>
					<form name="like_yes" method="post" action="Like.do?id=${id}&sno=${bean.sno}">
						<input type="hidden" name="selectLike" value="2">
						<button type="button" id="yes" style="display:${like_yes}" onclick="idCheck(this.form)" class="btn btn-danger btn-lg active"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp;LIKE</button>
					</form>
             	</li>
             	
              </ul>

            </div>
          </div>

          <div class="row">
            <div class="col-xs-12" style="margin-bottom: 20px;">
              <h3><strong>The-Ticket 정보</strong></h3>
              <c:forEach var="imgbean" items="${imgbean}">
				<img src="src/image/poster/${imgbean.ssubimg }" class="img-responsive" alt="Responsive image" width="100%">
			  </c:forEach>
            </div>
          </div>
          
          <div class="row">
          	<div class="col-xs-12">
          		<h3><strong>후기</strong></h3>
          	</div>
          </div>
          
          <div class="row">
          	<form name="reviewForm" method="post" action="review.do?sno=${bean.sno}">
          		<div class="form-group">
		            <div class="col-xs-10" style="padding-right: 0px">
		              <textarea class="form-control" name="contents" rows="3" style="resize: none" onfocus="clean(this)">후기를 남겨주세요.</textarea>
		            </div>
		            <div class="col-xs-2">
		              <button type="button" class="btn btn-lg btn-danger " style="width: 100%; height: 70px;" onclick="idCheck(this.form)">작성하기</button>
		            </div>
		        </div>
            </form>
          </div>
          
		<div class="row">
		<div class="col-xs-12">
			<table class="table table-hover">
				<thead>
					<tr>
					  <th width="100"></th>
					  <th></th>
					</tr>
				</thead>
		        <tbody>
		       		<c:forEach var="reviewAll" items="${reviewAll }">
						<tr>
							<td>
								<c:if test="${reviewAll.profile == null}">
									<img src="src/image/profile_img/profile_default.png" class="img-responsive img-circle" alt="Responsive image" style="margin: 0 auto; width: 100px; height: 100px; max-width: none;">
								</c:if>
								<c:if test="${reviewAll.profile != null}">
									<img src="src/image/profile/${reviewAll.profile}" class="img-responsive img-circle" alt="Responsive image" style="margin: 0 auto; width: 100px; height: 100px; max-width: none;">
								</c:if>
							</td>
							<td style="vertical-align:middle;">
								<div style="padding-left: 20px;">
									${reviewAll.name}님(ID: ${reviewAll.rid })&nbsp;&nbsp;작성일: ${reviewAll.rdate}<br>${reviewAll.rcontents}
								</div>
							</td>
						</tr>
					</c:forEach>
				 </tbody>
			</table>
			</div>
		</div>
          
          <nav style="text-align: center;">
			  <ul class="pagination">
			    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
	    		
	    		<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li><a href="#">6</a></li>
			    <li><a href="#">7</a></li>
			    <li><a href="#">8</a></li>
			    <li><a href="#">9</a></li>
			    <li><a href="#">10</a></li>
			    
			    <li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
			  </ul>
	  	  </nav>
		  
        </div> <!-- end div(class="col-md-9 col-md-pull-3") 왼쪽창  -->
      </div> <!-- end div(class="row") 전체행  -->
    </div> <!-- end container  -->
  </main>

  <jsp:include page="./component/footer.jsp"></jsp:include>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>