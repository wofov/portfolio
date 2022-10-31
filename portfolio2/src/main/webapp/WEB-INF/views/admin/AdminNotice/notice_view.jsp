<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String a0 = (String)request.getAttribute("a0");
String ad_wr = "";
String ck = "";
if(a0.equals("a0")){
	ad_wr = "공지";
	ck = "checked";
}
else{
	ad_wr = a0 + "번 공지글";
}
%>
<meta charset="UTF-8">
<script src="./ckeditor/ckeditor.js"></script>
<p>공지사항 VIEW 페이지<form name="f" in="f" method="post" action="admin-notice-insert?up=ok" enctype="multipart/form-data"></p>
<div class="write_view"><input type="hidden" name="idx" value="${noticeview[0]['nidx']}">
<ul>
    <li>공지번호</li>
    <li><%=ad_wr %></li>
</ul>
<ul>
    <li>공지사항 여부</li>
    <li>
        <label class="label_notice"><em class="cbox"><input type="checkbox" name="ck" <%=ck %>></em> 공지 출력</label> ※ 공지출력을 체크할 시 해당 글 내용은 최상단에 노출 되어 집니다.
    </li>
</ul>
<ul>
    <li>공지사항 제목</li>
    <li>
        <input type="text" class="notice_input1" name="sub" value="${noticeview[0]['nsub']}"> ※ 최대 150자까지 입력이 가능
    </li>
</ul>
<ul>
    <li>글쓴이</li>
    <li>
        <input type="text" class="notice_input2" name="wr" value="${noticeview[0]['nwr']}" readonly> ※ 관리자 이름이 노출 됩니다.       
    </li>
</ul>
<ul>
    <li>첨부파일</li>
    <li><input type="file" name="file" accept="image/*" multiple="multiple">※새로운 첨부파일 적용시 기본 첨부파일은 삭제
        <em class="fileview">기존 첨부 파일명 :${noticeview[0]['nfile']} </em>
    </li>
</ul>
<ul class="ul_height">
    <li>공지내용</li>
    <li>
        <textarea class="notice_input3" placeholder="공지내용 출력" id="pm1" name="pm1">${noticeview[0]['nmain']}</textarea>
    </li>
</ul>
</div></form>
<div class="board_btn">
    <button class="border_list" onclick="back1()">공지목록</button>
    <button class="border_modify" onclick="up1()">공지수정</button>
    <button class="border_del" onclick="de1(${noticeview[0]['nidx']})">공지삭제</button>
</div>
<script>
CKEDITOR.replace("pm1",{height:300});

function back1() {history.go(-1);
}
function up1() {
	var pm1 = CKEDITOR.instances.pm1.getData();
	if(f.sub.value==""){
		alert("제목을 입력해주세요");
	}
	else if(pm1==""){
		alert("내용을 입력해주세요");
	}
	else{f.submit();}
}
function de1(a) {
	var idx = a;
	if(confirm("해당 게시글을 삭제 하시겠습니까?")){
		var da3;
		function wck() {     
			 if(window.XMLHttpRequest){
			   	  return new XMLHttpRequest;
			 };
		}
		function aa3() {
		if(da3.readyState == XMLHttpRequest.DONE && da3.status==200){
			 if(this.response=="ok"){
			 	location.href='./admin-notice';
			 }
		}
		}
		var dd = "ckpa=,"+idx;
		da3 = wck();
		da3.onreadystatechange = aa3;
		da3.open("POST","./admin-notice-delete",true);
		da3.setRequestHeader("content-type","application/x-www-form-urlencoded");
		da3.send(dd);	
	}
}
</script>


