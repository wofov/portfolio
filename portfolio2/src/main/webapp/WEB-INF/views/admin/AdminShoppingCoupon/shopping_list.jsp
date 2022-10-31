<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="z"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
int a = (int)request.getAttribute("size");
int w = 0;
int w1 = 0;
int w2 = 0;
%>
<p>쇼핑몰 관리 페이지</p>
    <div class="subpage_view">
        <span>※ 쿠폰발행 현황 리스트 | <em>[ 사용중인 쿠폰 <%=a %> ]</em></span>
        <span>
         <ol class="coupon_title">
            <li>번호</li>
            <li>쿠폰명</li>
            <li>쿠폰종류</li>
            <li>사용시작일</li>
            <li>사용종료일</li>
            <li>쿠폰타입</li>
            <li>할인금액</li>
            <li>최소주문금액</li>
         </ol>
<z:forEach var="ad" items="${couponlist}">
         <ol class="coupon_lists">
            <li><%=a+1-(++w)%></li>
            <li>${ad.cpname }</li>
            <li>${ad.cpw }</li>
            <li>${ad.stda }</li>
            <li>${ad.endda }</li>
            <li>${ad.cpsel }</li><input type="hidden" value="${ad.cpsel }" id="nump<%=++w2%>">
            <li>${ad.nump }<p  style="display:inline-block" id="num<%=++w1%>"></p></li>
            <li>${ad.mp }</li>
         </ol>
</z:forEach>
         <%if(a==0){ %>
         <ol class="coupon_none_lists">
            <li>등록된 쿠폰이 없습니다.</li>
        </ol><%} %>
        </span>
        <span><input type="button" value="쿠폰 등록하기" onclick="cp1()"class="shopping_btn"></span>
   
<script>
function cp1() {
	location.href='./admin-coupon-write';
}
	var w = 1;
	while(w<<%=a%>+1){
		var nump = document.getElementById("nump"+w).value;
		if(nump=="정액할인"){
			document.getElementById("num"+w).innerText = "원";
		}
		else{
			document.getElementById("num"+w).innerText = "%";
		}
		console.log(w);
		w++;
	}
</script>