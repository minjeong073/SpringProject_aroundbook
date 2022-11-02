<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl fmt library -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>

<!-- bootstrap jQuery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/static/css/style.css" type="text/css" >

<!-- bootstrap icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
	
	<div class="wrap ">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<!-- body -->
		<div class=" container d-flex flex-column justify-content-center">
			<div class="my-4"></div>
			
			<div class="my-3">
				<div class="mx-3 my-5 d-flex flex-column align-items-center">
					<div class="outer-form-text w-25 text-center mb-5">
						<h2 class="main-font-text my-2">주문 내역</h2>
					</div>
					
					<!-- forEach -->

					<c:forEach var="orderInfo" items="${orderInfoList }">
						
						<div class="border my-4 w-75">
							<div class="m-4"><h3>주문 정보</h3></div>
							
							<div class="d-flex justify-content-center">
								<table class="table m-3 w-75 text-center">
									<tr>
										<th class=" w-25">주문 번호</th>
										<td>${orderInfo.order.orderNumber }</td>
									</tr>
									<tr>
										<th></th>
										<td>${orderInfo.orderBookDetailList[0].bookDetail.title }</td> <!-- 안됨 -->
									<tr>
								</table>
							
								<c:forEach var="details" items="${orderInfo.orderBookDetailList }">
								
								<div class="bg-danger">책 정보</div>
								
								<!-- 책 정보 -->
								<div class="border d-flex w-75 my-4 px-5 bookDetail-div" data-isbn=${details.orderDetail.isbn }>
									<div class=" m-4 p-2"><img src="${detail.bookDetail.cover }" width="160px"></div>
									<div class="book-detail-text mt-5 ml-3">
										<div><h2>${detail.bookDetail.title }</h2></div>
										<div>${detail.bookDetail.author } ${detail.bookDetail.publisher }</div>
										<div class="mt-2">수량 : ${detail.orderDetail.count }</div>
									</div>
								</div>
								</c:forEach>
								
							</div>
							<div class="d-flex justify-content-center">
								<table class="table m-3 w-75 text-center">
									<tr>
										<th class="w-25">결제 금액</th>
										<td><fmt:formatNumber value="${orderInfo.order.totalPrice }" pattern="#,###"/> 원 </td>
									</tr>
								</table>
							</div>
						</div>
					
					<!-- 주문자 정보 -->
					<div class="border my-4 w-75">
						<div class="m-4"><h3>주문자 정보</h3></div>
						
						<div class="d-flex justify-content-center">
							<table class="table m-3 w-75 text-center">
								<tr>
									<th class=" w-25">주문자명</th>
									<td>${nonMember.name }</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${nonMember.phoneNumber }</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${nonMember.email }</td>
								</tr>
							</table>
						</div>
					</div>
					
					<!-- 배송 정보 -->
					<div class="border my-4 w-75">
						<div class="m-4"><h3>배송 정보</h3></div>
						
						<div class="d-flex justify-content-center">
							<table class="table m-3 w-75 text-center">
								<tr>
									<th class=" w-25">이름</th>
									<td>${orderInfo.order.name }
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${orderInfo.order.phoneNumber }
								</tr>
								<tr>
									<th>우편번호</th>
									<td>${orderInfo.order.address1 }</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${orderInfo.order.address2 }</td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td>${orderInfo.order.address3 }</td>
								</tr>
								
							</table>
						</div>
					</div>
					
				</c:forEach>
				</div> <!--  -->
			</div>
			
		</div> <!-- body -->
	</div> <!-- wrap -->
	
</body>
</html>