<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
String poenum = (String)request.getAttribute("hmjoin_poenum");
String paycard = (String)request.getAttribute("paycard");
String paytel = (String)request.getAttribute("paytel");
String payha = (String)request.getAttribute("payha");
String paycash = (String)request.getAttribute("paycash");
String pay_hope = (String)request.getAttribute("pay_hope");
%>

<meta charset="UTF-8">
<p>홈페이지 가입환경 설정</p>
<div class="subpage_view">
<ul class="info_form">
    <li>홈페이지 제목</li>
    <li>
      <input type="text" id="a1" name="a1" value="${siteinfo[0]['hmjoin_sub']}" class="in_form1">
    </li>
</ul>    
<ul class="info_form">
    <li>관리자 메일 주소</li>
    <li>
        <input type="text" id="a2" name="a2" class="in_form2" value="${siteinfo[0]['hmjoin_email']}"> ※ 관리자가 보내고 받는 용도로 사용하는 메일 주소를 입력합니다.(회원가입,인증메일,회원메일발송 등에서 사용)
    </li>
</ul> 
<ul class="info_form">
    <li>포인트 사용 유/무</li>
    <li class="checkcss">
    <input type="hidden" id="h1" name="h1" value="aa"> 
        <em><label><input type="radio" id="a3" name="ra1" class="ckclass" value="Y" <%if(poenum.intern()=="Y"){out.print("checked");} %> >포인트 사용</label></em> 
        <em><label><input type="radio" id="a4" name="ra1" class="ckclass" value="N" <%if(poenum.intern()=="N"){out.print("checked");} %>>포인트 미사용</label></em>
    </li>
</ul>
<ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
    <li>회원가입시 적립금</li>
    <li>
        <input type="text" id="a5" name="a5" class="in_form3" value="${siteinfo[0]['hmjoin_point']}" maxlength="5"> 점
    </li>
    <li>회원가입시 권한레벨</li>
    <li>
        <input type="text" id="a6" name="a6" class="in_form3" value="${siteinfo[0]['hmjoin_level']}" maxlength="1"> 레벨
    </li>
</ul> 
</div>
<p>홈페이지 기본환경 설정</p>
<div class="subpage_view">
<ul class="info_form2">
    <li>회사명</li>
    <li>
        <input type="text" id="b1" name="b1"  value="${siteinfo[0]['basic_na']}" class="in_form0"> 
    </li>
    <li>사업자등록번호</li>
    <li>
        <input type="text" id="b2" name="b2" value="${siteinfo[0]['basic_lnum']}" class="in_form0"> 
    </li>
</ul> 
<ul class="info_form2">
    <li>대표자명</li>
    <li>
        <input type="text" id="b3" name="b3" value="${siteinfo[0]['basic_ld']}" class="in_form0"> 
    </li>
    <li>대표전화번호</li>
    <li>
        <input type="text" id="b4" name="b4" value="${siteinfo[0]['basic_ltel']}" class="in_form0"> 
    </li>
</ul>
<ul class="info_form2">
    <li>통신판매업 신고번호</li>
    <li>
        <input type="text"id="b5" name="b5" value="${siteinfo[0]['basic_tnum']}" class="in_form0"> 
    </li>
    <li>부가통신 사업자번호</li>
    <li>
        <input type="text" id="b6" name="b6" value="${siteinfo[0]['basic_bnum']}" class="in_form0"> 
    </li>
</ul>
<ul class="info_form2">
    <li>사업장 우편번호</li>
    <li>
        <input type="text" id="b7" name="b7" value="${siteinfo[0]['basic_addrnum']}" class="in_form0"> 
    </li>
    <li>사업장 주소</li>
    <li>
        <input type="text" id="b8" name="b8" value="${siteinfo[0]['basic_addr']}" class="in_form2"> 
    </li>
</ul>
<ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
    <li>정보관리책임자명</li>
    <li>
        <input type="text"id="b9" name="b9" value="${siteinfo[0]['basic_jna']}" class="in_form0"> 
    </li>
    <li>정보책임자 E-mail</li>
    <li>
        <input type="text"id="b10" name="b10" value="${siteinfo[0]['basic_email']}" class="in_form1"> 
    </li>
</ul>
</div>
<p>결제 기본환경 설정</p>
<div class="subpage_view">  
<ul class="info_form2">
    <li>무통장 은행</li>
    <li>
        <input type="text"id="c1" name="c1" value="${siteinfo[0]['pay_bank']}" class="in_form0"> 
    </li>
    <li>은행계좌번호</li>
    <li>
        <input type="text" id="c2" value="${siteinfo[0]['pay_banknum']}" name="c2"class="in_form1"> 
    </li>
</ul>
<ul class="info_form">
    <li>신용카드 결제 사용</li>
    <li class="checkcss">
        <em><label><input type="radio" id="c3" name="ra2"class="ckclass" value="Y" <%if(paycard.intern()=="Y"){out.print("checked");} %>> 사용</label></em> 
        <em><label><input type="radio" id="c4" name="ra2"class="ckclass" value="N" <%if(paycard.intern()=="N"){out.print("checked");} %>> 미사용</label></em> ※ 해당 PG사가 있을 경우 사용으로 변경합니다.
    </li>
</ul>
<ul class="info_form">
    <li>휴대폰 결제 사용</li>
    <li class="checkcss">
        <em><label><input type="radio" id="c5" name="ra3"class="ckclass" value="Y" <%if(paytel.intern()=="Y"){out.print("checked");} %>> 사용</label></em> 
        <em><label><input type="radio"id="c6" name="ra3" class="ckclass" value="N" <%if(paytel.intern()=="N"){out.print("checked");} %>> 미사용</label></em> ※ 주문시 휴대폰 결제를 가능하게 할 것인지를 설정합니다.
    </li>
</ul>
<ul class="info_form">
    <li>도서상품권 결제사용</li>
    <li class="checkcss">
        <em><label><input type="radio"id="c7" name="ra4" class="ckclass" value="Y"<%if(payha.intern()=="Y"){out.print("checked");} %>> 사용</label></em> 
        <em><label><input type="radio" id="c8" name="ra4"class="ckclass" value="N"<%if(payha.intern()=="N"){out.print("checked");} %>> 미사용</label></em> ※ 도서상품권 결제만 적용이 되며, 그 외에 상품권은 결제 되지 않습니다.
    </li>
</ul>
<ul class="info_form2">
    <li>결제 최소 포인트</li>
    <li>
        <input type="text" class="in_form0"id="c9" name="c9" value="${siteinfo[0]['paymi']}" maxlength="5"> 점
    </li>
    <li>결제 최대 포인트</li>
    <li>
        <input type="text" class="in_form0"id="c10" name="c10" value="${siteinfo[0]['payma']}" maxlength="5"> 점
    </li>
</ul>
<ul class="info_form">
    <li>현금 영수증 발급사용</li>
    <li class="checkcss">
        <em><label><input type="radio" id="c11" name="ra5"class="ckclass" value="Y" <%if(paycash.intern()=="Y"){out.print("checked");} %>> 사용</label></em> 
        <em><label><input type="radio" id="c11" name="ra5"class="ckclass" value="N" <%if(paycash.intern()=="N"){out.print("checked");} %>> 미사용</label></em> ※ 현금영수증 관련 사항은 PG사 가입이 되었을 경우 사용가능 합니다.
    </li>
</ul>
<ul class="info_form2">
    <li>배송업체명</li>
    <li>
        <input type="text" id="c12" name="c12"class="in_form0" value="${siteinfo[0]['pay_adna']}"> 
    </li>
    <li>배송비 가격</li>
    <li>
        <input type="text" id="c13" name="c13"class="in_form0" value="${siteinfo[0]['pay_adpay']}" maxlength="7"> 원
    </li>
</ul>
<ul class="info_form" style="border-bottom:1px solid rgb(81, 61, 61);">
    <li>희망배송일</li>
    <li class="checkcss">
        <em><label><input type="radio" id="c14" name="ra6"class="ckclass" value="Y" <%if(pay_hope.intern()=="Y"){out.print("checked");} %>> 사용</label></em> 
        <em><label><input type="radio" id="c15" name="ra6"class="ckclass" value="N" <%if(pay_hope.intern()=="N"){out.print("checked");} %>> 미사용</label></em> ※ 희망배송일 사용시 사용자가 직접 설정 할 수 있습니다.
    </li>
</ul>
</div>
<div class="btn_div">
    <button type="button" class="sub_btn1" onclick="mi()" title="설정 저장">설정 저장</button>
    <button type="button" class="sub_btn2" onclick="mide()" title="저장 취소">저장 취소</button>
</div>
<form id="sitepost" name="sitepost" action="admin-siteinfo" method="post"></form>
<%@ include file="subsite.jsp"%>
