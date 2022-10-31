<%@page import="com.cafe24.wofov.domain.HomePageDTO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="z"%>
<script>
var ajax = new XMLHttpRequest();
ajax.open("post","./footer-info",true);
ajax.send();
ajax.onload = function() {
   if(ajax.status==200){
	   var info = JSON.parse(ajax.response);
	   document.getElementById("basic_ltel").innerText = info["list"][0]["basic_ltel"];
	   document.getElementById("basic_na").innerText = info["list"][0]["basic_na"];
	   document.getElementById("basic_na2").innerText = info["list"][0]["basic_na"];
	   document.getElementById("pay_bank").innerText = info["list"][0]["pay_bank"];
	   document.getElementById("basic_lnum").innerText = info["list"][0]["basic_lnum"];
	   document.getElementById("pay_bank2").innerText = info["list"][0]["pay_bank"];
	   document.getElementById("basic_lnum2").innerText = info["list"][0]["basic_lnum"];
	   document.getElementById("pay_adna").innerText = info["list"][0]["pay_adna"];
	   document.getElementById("basic_ltel2").innerText = info["list"][0]["basic_ltel"];
	   document.getElementById("basic_addr").innerText = info["list"][0]["basic_addr"];
	   document.getElementById("hmjoin_sub").innerText = info["list"][0]["hmjoin_sub"];
	   document.getElementById("basic_ld").innerText = info["list"][0]["basic_ld"];
	   document.getElementById("basic_addr2").innerText = info["list"][0]["basic_addr"];
	   document.getElementById("basic_ltel3").innerText = info["list"][0]["basic_ltel"];
	   document.getElementById("basic_na3").innerText = info["list"][0]["basic_na"];
	   document.getElementById("basic_lnum3").innerText = info["list"][0]["basic_lnum"];
	   document.getElementById("basic_ld2").innerText = info["list"][0]["basic_ld"];
	   document.getElementById("basic_email").innerText = info["list"][0]["basic_email"];
	   document.getElementById("hmjoin_sub2").innerText = info["list"][0]["hmjoin_sub"];
   	}
}
</script>
<div class="footer_b">
    <div class="resp_wrap">
        <ul class="menu2">
            <li><a href="company" designElement="text" textIndex="1">회사소개</a></li>
            <li><a href="agreement" designElement="text" textIndex="2">이용약관</a></li>
            <li><a href="privacy" designElement="text" textIndex="3"><strong>개인정보처리방침</strong></a></li>
            <li><a href="guide" designElement="text" textIndex="4">이용안내</a></li>
            <li><a href="" designElement="text">제휴안내</a></li>
            <li><a href="cs?cate=6" designElement="text" textIndex="5">고객센터</a></li>               
        </ul>
    </div>
</div>
<div class="resp_wrap">
    <ul class="footer_contents">
        <li class="footer_a1">
            <h3 class="title"><a href="#" designElement="text" textIndex="6" target="_self">CS CENTER</a></h3>
            <ul class="menu">
                <li class="company_phone">
                    <a href="tel:02-1234-5678" id="basic_ltel"></a>
                </li>
                <li class="open_close">
                    <p designElement="text" textIndex="7">MON-FRI : AM 09:00 ~ PM 06:00 &nbsp;/&nbsp;  SAT, SUN, HOLIDAY OFF</p>
                </li>
                <li class="open_close">
                    <p designElement="text" textIndex="8">LUNCH &nbsp; &nbsp; : AM 12:00 ~ PM 01:00</p>
                </li>
            </ul>
            <!-- //고객센터 -->
        </li>
        <li class="footer_b1">
            <h3 class="title"><span designElement="text" textIndex="9"   >BANK INFO</span></h3>
            <ul class="menu">
                <li class="company_bank">
                    <p class="bank_info"><span designElement="text" textIndex="10"   >HOLDER</span> : 주식회사 <p id="basic_na"></p> / <h id="pay_bank"></h>은행 <h id="basic_lnum"></h></p>
                </li>
            </ul>
            <!-- //무통장 입금계좌 -->
        </li>
        <li class="footer_c1">
            <h3 class="title"><span designElement="text" textIndex="11"   >DELIVERY INQUIRY</span></h3>
            <ul class="menu">					
                <li class="besong_search">
                    <span designElement="text" textIndex="12"   >DELIVERY : <h id="pay_adna"></h>택배 1588-0000</span> &nbsp; &nbsp;
                    <a href="#" target="_blank" title="새창" class="link_f" designElement="text" textIndex="13" alt="택배사 배송추적 주소를 입력하세요.">배송추적</a>
                </li>
            </ul>
            <!-- //배송 정보 -->
        </li>
    </ul>        
</div>
<div class="footer_c">
    <div class="resp_wrap">
        <div class="line">
            <ul class="menu3">
                    <li class="footer_a1">
            <h3 class="title"><a href="/service/cs" designElement="text" textIndex="15"    target="_self">CS CENTER</a></h3>
            <ul class="menu">
                <li class="company_phone">
                    <a href="tel:02-1234-5678"><h id="basic_ltel2"></a>
                </li>
                <li class="open_close">
                    <p designElement="text" textIndex="16"   >MON-FRI : 10:00 ~ 19:00 &nbsp;</p>
                </li>
                <li class="open_close">
                    <p designElement="text" textIndex="17"   >SAT, SUN, HOLIDAY : 11:00~20:00</p>
                </li>
            </ul>
            <!-- //고객센터 -->
        </li>
        <li class="footer_b1">
            <h3 class="title"><span designElement="text" textIndex="18"   >BANK INFO</span></h3>
            <ul class="menu">
                <li class="company_bank">
                    <p class="bank_info"><span designElement="text" textIndex="19">HOLDER</span> : 주식회사 <h id="basic_na2"></h> / <h id="pay_bank2"></h>은행 <h id="basic_lnum2"></h></p>
                </li>
            </ul>
            <!-- //무통장 입금계좌 -->
        </li>
        <li class="footer_c1">
            <h3 class="title"><span designElement="text" textIndex="20"   >매장안내</span></h3>
            <ul class="menu">
                 <li class="refund_address">
                    <span designElement="text" textIndex="21"   >주소 : <h id="basic_addr"></h></span> 
                </li>
            </ul>
            <!-- //배송 정보 -->
        </li>
                
            </ul>
            
        </div>
    </div>
</div>




<div class="footer_c">
    <div class="resp_wrap">
        <div class="line">
            <ul class="menu3">
                <li class="company"><span designElement="text" textIndex="22"   ></span> / <span class="pcolor"><h id="hmjoin_sub"></h> /</span></li>
                <li class="ceo"><span designElement="text" textIndex="23"   >CEO</span> : <span class="pcolor"><h id="basic_ld"></h> </span></li>
                <li class="address"><span designElement="text" textIndex="24"   >ADDRESS</span> : <h id="basic_addr2"></h> <span class="pcolor"></span></li>
                <li class="phone"><span designElement="text" textIndex="25"   >TEL</span> : <a href="tel:02-1234-5678" class="link_f"> <h id="basic_ltel3"></h></a></li>
                <li class="company"><span designElement="text" textIndex="26"   >COMPANY</span> : <span class="pcolor">주식회사 <h id="basic_na3"></h></span></li>
                <li class="business_license"><span designElement="text" textIndex="27"   >BUSINESS LICENCE</span> :  <h id="basic_lnum3"></h> &nbsp; &nbsp; <span class="link_f"><a href="#">사업자정보확인</a></span></li>
                <li class="mailselling_license"><span designElement="text" textIndex="28"   >ONLINE LICENCE</span> : <span class="pcolor">2022-인테리어-0576</span></li>
                <li class="member_info_manager"><span designElement="text" textIndex="29"   ><span xss=removed>PRIVACY OFFICER</span></span> : <span class="pcolor"><h id="basic_ld2"></h> (<a class="pcolor" href=""><h id="basic_email"></h></a>)</span></li>
                
            </ul>
            <!-- //회사 정보 -->
            <p class="copyright" designElement="text" textIndex="30"   >COPYRIGHT (c) <strong class="pcolor"><h id="hmjoin_sub2"></h></strong>&nbsp; ALL RIGHTS RESERVED.</p>
            <div class="escrow"></div>
        </div>
    </div>
</div>