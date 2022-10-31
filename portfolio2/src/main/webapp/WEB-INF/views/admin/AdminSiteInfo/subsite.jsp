<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function mi() {
		var z5 = document.getElementById("a5").value;
		var z6 = document.getElementById("a6").value;
		var z9 = document.getElementById("c9").value;
		var z10 = document.getElementById("c10").value;
		var z13 = document.getElementById("c13").value;
		
		var code = /[^0-9]/;
		
	if(frm.a1.value==""){
		alert("홈페이지 제목을 입력해주세요.");frm.a1.focus();}
	else if(frm.a2.value==""){
		alert("관리자 메일 주소를 입력해주세요.");frm.a2.focus();}
	else if(frm.a5.value==""||code.test(z5)==true){
		alert("적립금 숫자만 입력해주세요.");frm.a5.focus();}
	else if(frm.a6.value==""||code.test(z6)==true){
		alert("권한레벨 숫자만 입력해주세요.");frm.a6.focus();}
	else if(frm.b1.value==""){
		alert("회사명을 입력해주세요.");frm.b1.focus();}
	else if(frm.b2.value==""){
		alert("사업자 등록번호를 입력해주세요.");frm.b2.focus();}
	else if(frm.b3.value==""){
		alert("대표자명을 입력해주세요.");frm.b3.focus();}
	else if(frm.b4.value==""){
		alert("대표 전화번호를 입력해주세요.");frm.b4.focus();}
	else if(frm.b5.value==""){
		alert("통신판매업 신고번호를 입력해주세요.");frm.b5.focus();}
	else if(frm.b6.value==""){
		alert("부가통신 사업자번호를 입력해주세요.");frm.b6.focus();}
	else if(frm.b7.value==""){
		alert("사업장 우편번호를 입력해주세요.");frm.b7.focus();}
	else if(frm.b8.value==""){
		alert("사업장 주소를 입력해주세요.");frm.b8.focus();}
	else if(frm.b9.value==""){
		alert("정보관리책임자명을 입력해주세요.");frm.b9.focus();}
	else if(frm.b10.value==""){
		alert("정보책임자 이메일을 입력해주세요.");frm.b10.focus();}
	else if(frm.c1.value==""){
		alert("은행명을 입력해주세요.");frm.c1.focus();}
	else if(frm.c2.value==""){
		alert("은행 계좌번호를 입력해주세요.");frm.c2.focus();}
	else if(frm.c9.value==""||code.test(z9)==true){
		alert("최소 포인트 숫자만 입력해주세요.");frm.c9.focus();}
	else if(frm.c10.value==""||code.test(z10)==true){
		alert("최대 포인트 숫자만 입력해주세요.");frm.c10.focus();}
	else if(frm.c12.value==""){
		alert("배송업체명을 입력해주세요.");frm.c12.focus();}
	else if(frm.c13.value==""||code.test(z13)==true){
		alert("배송비 가격 숫자만 입력해주세요.");frm.c13.focus();}
	else{
		frm.submit();
	}
}
function mide() {
	if(confirm("저장 취소 하시겠습니까?")){
		frm.submit();
	}
}
</script>