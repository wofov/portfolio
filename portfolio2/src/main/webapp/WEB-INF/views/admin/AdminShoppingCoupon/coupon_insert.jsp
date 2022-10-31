<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
 <script src="./js/jquery.js"></script>
    <script src="./js/jquery-ui.js"></script>
    <script src="./js/index.js"></script>
    <link rel="stylesheet" href="./js/jquery-ui.css?v=4">
<p>쇼핑몰 관리 페이지<form id="f" name="f" method="post" action="couponinsert" enctype="multipart/form-data"></p>
<div class="subpage_view" style="margin-top: 25px;">
    <span style="height: 35px; border-bottom:1px solid #ccc;">※ 신규 쿠폰등록 </span>
    <span>
     <ol class="coupon_in">
        <li>쿠폰명</li>
        <li><input type="text" name="cpname" class="inputs coupon_intext4" maxlength="40"> ※ 쿠폰명은 최대 40자까지 입력이 가능합니다.</li>
     </ol>
     <ol class="coupon_in">
        <li>쿠폰종류</li>
        <li><input type="text" name="cpw" class="inputs coupon_intext1" maxlength="40"> ※ 쿠폰종류를 입력해 주세요 (상품할인, 배송비할인)</li>
     </ol>
     <ol class="coupon_in">
        <li>사용 시작일</li>
        <li><input type="text" name="stda" class="inputs coupon_intext1" id="da1" maxlength="10" readonly> ※ 클릭시 해당 시작을 캘린더에서 선택 하세요</li>
     </ol>
     <ol class="coupon_in">
        <li>사용 종료일</li>
        <li><input type="text" name="endda" class="inputs coupon_intext1" id="da2" maxlength="10" readonly> ※ 종료 일자 이후에는 쿠폰은 더 이상 사용되지 않습니다.</li>
     </ol>
     <ol class="coupon_in">
        <li>쿠폰타입</li>
        <li>
            <select class="inputs coupon_intext2" name="cpsel" id="cpsel"onchange="sel()">
                <option value="">쿠폰 타입 선택</option>
                <option value="정액할인">정액할인</option>
                <option value="정률할인">정률할인</option>
            </select>
             ※ 정액할인 일 경우 할인 금액을 입력해야 하며, 정률 할인 일 경우 할인율 % 값을 입력하세요</li>
     </ol>
     <ol class="coupon_in">
        <li>할인금액 및 할인율</li>
        <li id="nump"><input type="text" name="nump" class="inputs coupon_intext1"> ※ 정률할인 일 경우 숫자 100 이상 입력이 안됩니다.</li>
     </ol>
     <ol class="coupon_in">
        <li>최소 주문금액</li>
        <li><input type="text" name="mp" id="mp" class="inputs coupon_intext1"> ※ 해당 쿠폰은 최소 주문금액이 되어야만 사용이 가능합니다. (최소 10000 이상 부터 입력이 가능합니다.)</li>
     </ol>
     <ol class="coupon_in">
        <li>쿠폰이미지 등록</li>
        <li><input type="file" accept="image/*" name="file"> ※ 쿠폰이미지는 최소 2MB 이하 이미지만 사용가능 합니다.</li>
     </ol>
    </span>
    <span>
    <input type="button" value="쿠폰 리스트" onclick="cp0()"class="shopping_btn2" title="쿠폰 리스트">
    <input type="button" value="등록 완료" onclick="cp1()"class="shopping_btn" title="등록 완료">
    </span>
</div>
</div></form>
<script>
function sel() {
	var so = document.getElementById("cpsel").value;
	if(so!=""){
		var s1 = document.getElementById("nump");
		if(so=="정액할인"){
			s1.innerHTML = "<input type='text' id='s1' name='nump' maxlength='13' class='inputs coupon_intext1'>";
		}
		else{
			s1.innerHTML = "<input type='text' id='s1'  name='nump' maxlength='2' class='inputs coupon_intext1'> ※ 정률할인 일 경우 숫자 100 이상 입력이 안됩니다.";
		}
	}
}
function cp0() {
	location.href='./admin-shopping';
}
$(function () {
	$("#da1").datepicker({minDate: '-12m', maxDate: '+12m'});
	$("#da2").datepicker({minDate: '-12m', maxDate: '+12m'});
})
function cp1() {
	
	if(f.cpname.value==""){
		alert("쿠폰 이름을 입력하세요.");f.cpname.focus();
	}
	else if(f.cpw.value==""){
		alert("쿠폰 종류를 입력하세요.");f.cpw.focus();
	}
	else if(f.stda.value==""){
		alert("사용 시작일은 선택해주세요");f.stda.focus();
	}
	else if(f.endda.value==""){
		alert("사용 종료일을 선택해주세요");f.endda.focus();
	}
	else if(f.stda.value > f.endda.value || f.stda.value==f.endda.value){
		alert("시작, 종료일을 올바르게 설정해주세요.");
	}
	else if(f.cpsel.value==""){
		alert("쿠폰 타입을 선택해주세요.");f.cpsel.focus();
	}
	else if(f.nump.value==""||isNaN(f.nump.value)==true){
		alert("할인금액 및 할인율를 숫자로 입력해주세요.");f.nump.focus();
	}
	else if(f.mp.value==""|| isNaN(f.mp.value)==true){
		alert("최소 주문 금액을 숫자로 입력해주세요.");f.mp.focus();
	}
	else if(f.mp.value <10000){
		alert("10000원 이상 입력해주세요.");
	}
	else if(f.file.value==""){
		alert("쿠폰이미지를 첨부해주세요.");f.file.focus();
	}
	else{
		f.submit();
	}
}
</script>