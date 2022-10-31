<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	if(session.getAttribute("anm")==null){
		out.print("<script>alert('비정상적인 접근입니다.');history.go(-1);</script>");
	}
%>
<meta charset="UTF-8">
<div class="nav_div">
    <ol>
        <li title="쇼핑몰 기본설정" onclick ="siteinfo()"> 쇼핑몰 기본설정</a></li>
        <li title="회원관리" onclick = window.open("./admin-main","_self")>회원관리</li>
        <li title="공지사항" onclick = window.open("./admin-notice","_self")>공지사항</li>
        <li title="쇼핑몰관리" onclick = window.open("./admin-shopping","_self")>쇼핑몰관리</li>
        <li title="상품리스트" onclick ="product()">상품리스트</li>
        <li title="주문내역">주문내역</li>
        <li title="매출내역">매출내역</li>
    </ol>
</div><form id="f2" name="f2" method="post" action="./admin-product">
<input type="hidden" name="sear" value="">
<input type="hidden" name="val" value=""></form>
<form id="f3" name="f3" method="post" action="./admin-siteinfo"></form>
<script>
function product() {
	f2.submit();}
function siteinfo() {
	f3.submit();}
</script>