<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="z"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
int size = (Integer)request.getAttribute("size");
int w = 0;%>
<meta charset="UTF-8">
<p>신규등록 관리자</p>
<ol class="new_admin_title">
    <li>NO</li>
    <li>관리자명</li>
    <li>아이디</li>
    <li>전화번호</li>
    <li>이메일</li>
    <li>담당부서</li>
    <li>담당직책</li>
    <li>가입일자</li>
    <li>승인여부</li>
</ol>
   <%if(size==0){ %> 
<ol class="new_admin_none">
	<li>신규 등록된 관리자가 없습니다.</li>
</ol>
 <%}else{%>
 <z:forEach var="ad" items="${admin_list_Y}"><z:set var="Text" value="${ad.jtime }"/>
<ol class="new_admin_lists">
    <li><%=++w %></li>
    <li>${ad.jname }</li>
    <li>${ad.jid }</li>
    <li>${ad.jtel }</li>
    <li>${ad.jemail}</li>
    <li>${ad.jm1 }</li>
    <li>${ad.jm2 }</li>
    <li>${fn:substring(Text,0,10)}</li>
    <li>
        <input type="button" onclick="upok(${ad.jidx })" value="승인" class="new_addbtn1" title="승인">
        <input type="button" onclick="deok(${ad.jidx })" value="미승인" class="new_addbtn2" title="미승인">
    </li>
</ol>
</z:forEach>
<%} %>
<script>
	var ad = "${aid}";
	function upok(up1) {
		if(ad=="wowo"){
			location.href='./admin-listokno?upok='+up1+'&deok=';}
		else{alert("권한이 없습니다.");}
	}
	function deok(de1) {
		if(ad=="wowo"){
			location.href='./admin-listokno?upok=&deok='+de1;}
		else{alert("권한이 없습니다.");}
	}
</script>
