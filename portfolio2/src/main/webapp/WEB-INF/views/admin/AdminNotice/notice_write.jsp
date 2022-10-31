<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<meta charset="UTF-8">
<script src="./ckeditor/ckeditor.js"></script>
<script>
	function oksign() {
		var pm1 = CKEDITOR.instances.pm1.getData();
		if(frm1.sub.value==""){
			alert("제목을 입력하세요");
		}
		else if(pm1==""){
			alert("공지 내용을 입력하세요");
		}
		else{
			frm1.submit();
		}
	}
	function golist() {
		if(confirm("목록으로 이동하겠습니까?")){
			location.href='admin-notice';
		}
	}
</script>
<p>공지사항 등록페이지<form id="frm1" name="frm1" method="post" action="admin-notice-insert?up=no" enctype="multipart/form-data"></p>
<div class="write_view">
<ul>
    <li>공지사항 여부</li>
    <li>
        <label class="label_notice"><em class="cbox"><input type="checkbox" id="ck" name="ck"></em> 공지 출력</label> ※ 공지출력을 체크할 시 해당 글 내용은 최상단에 노출 되어 집니다.
    </li>
</ul>
<ul>
    <li>공지사항 제목</li>
    <li>
        <input type="text" class="notice_input1" id="sub" name="sub"> ※ 최대 150자까지 입력이 가능
    </li>
</ul>
<ul>
    <li>글쓴이</li>
    <li>
        <input type="text" class="notice_input2" id="wr" name="wr" value="<%=session.getAttribute("anm")%>"readonly> ※ 관리자 이름이 노출 됩니다.       
    </li>
</ul>
<ul>
    <li>첨부파일</li>
    <li>
        <input type="file" name="file" accept="image/*"> ※ 첨부파일 최대 용량은 2MB 입니다.       
    </li>
</ul>
<ul class="ul_height">
    <li>공지내용</li>
    <li>
        <textarea class="notice_input3"id="pm1" name="pm1"></textarea>
    </li>
</ul>
</div></form>
<div class="board_btn">
    <button class="border_del" onclick="golist()">공지목록</button>
    <button class="border_add" onclick="oksign()">공지등록</button>
</div>
<script>
CKEDITOR.replace("pm1",{height:300});
</script>