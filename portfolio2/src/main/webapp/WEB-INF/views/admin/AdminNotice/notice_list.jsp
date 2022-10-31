<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="z"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
String adminok = (String)session.getAttribute("aid");
%>
<%
int a1 = (int)request.getAttribute("a1");
int a2 = (int)request.getAttribute("a2");
int nullct = (int)request.getAttribute("nullct");
int stpg = (int)request.getAttribute("stpg");
int pgnum = (int)request.getAttribute("pgnum");
int repg = (int)request.getAttribute("repg");
int  w=0;
int w1=0;
int w2=0;
int w3=0;
int w4=0;
int w5=0;
int w6=0;
int w7=0;
int w8=0;
%>

<meta charset="UTF-8">
<style>
.olc:hover{background-color: pink}
.olc2:hover{background-color: skyblue}
.pg:hover{background-color: #ece6cc}
</style>
<script>
var ad = "<%=adminok%>";
function abc() {
	location.href='./admin-notice-write';
}
function abcde() {
	if(ad=="wowo"){
		var deck = 0 ;
		var ww = 1 ;
		while(ww<<%=a1+1%>){
			if(document.getElementById("ckon"+ww).checked==true){
				deck++;
			}ww++;}
		var ww2 = 1 ;
		while(ww2<<%=a2+1%>){
			if(document.getElementById("ckdata"+ww2).checked==true){
				deck++;
			}ww2++;}
		if(deck==0){alert("삭제할 공지를 체크해주세요.");}
		else{
			var ckpa = "";
			var asd = 1 ;
			while(asd<<%=a1+1%>){
				if(document.getElementById("ckon"+asd).checked==true){
					ckpa += "," + document.getElementById("ckonde"+asd).value;
				}asd++;}
			var asd2 = 1 ;
			while(asd2<<%=a2+1%>){
				if(document.getElementById("ckdata"+asd2).checked==true){
					ckpa += "," + document.getElementById("ckdatade"+asd2).value;
				}asd2++;}
			ajax(ckpa);
		}
		}
	else{
		alert("권한이 없습니다.");
	}
}
function ajax(ckpa) {
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
	 var dd = "ckpa="+ckpa;
	 da3 = wck();
	 da3.onreadystatechange = aa3;
	 da3.open("POST","./admin-notice-delete",true);
	 da3.setRequestHeader("content-type","application/x-www-form-urlencoded");
	 da3.send(dd);	
}
</script>
<p>공지사항 관리페이지</p>
<div class="subpage_view">
<ul>
    <li><input type="checkbox" id="ck0" name="ck0" onclick="ckbox()"></li>
    <li>NO</li>
    <li>제목</li>
    <li>글쓴이</li>
    <li>날짜</li>
    <li>조회</li>
</ul>
 <z:forEach var="ad" items="${dataon}"><z:set var="Text" value="${ad.ntime }"/>
<input type="hidden" name="${ad.nidx }" id="ckonde<%=++w %>" value="${ad.nidx }">
<ol onclick="onad()" class="olc">
    <li><input type="checkbox" id="ckon<%=++w1  %>" name="ckon<%=++w2  %>"></li>
    <li>공지</li>
    <li><a href="./admin-notice-view?idx=${ad.nidx }&idx2=a0" style ="color:  black">${ad.nsub }</a></li>
    <li>${ad.nwr }</li>
    <li>${fn:substring(Text,0,10)}</li>
    <li>100</li>
</ol>
</z:forEach>
 <z:forEach var="ad" items="${data4}"><z:set var="Text" value="${ad.ntime }"/>
<input type="hidden" name="${ad.nidx }" id="ckdatade<%=++w3  %>" value="${ad.nidx }">
<ol class="olc2">
    <li><input type="checkbox" id="ckdata<%=++w4 %>" name="ckdata<%=++w5 %>"></li>
    <li><%=nullct-stpg-(++w6)+1%></li>
    <li><a href="./admin-notice-view?idx=${ad.nidx }&idx2=<%=nullct-stpg-(++w7)+1%>" style ="color:  black">${ad.nsub }</a></li>
    <li>${ad.nwr }</li>
    <li>${fn:substring(Text,0,10)}</li>
    <li>100</li>
</ol>
</z:forEach>
<%if(a1==0&&a2==0){ %>
<ol class="none_text">
    <li>등록된 공지 내용이 없습니다.</li>
</ol>
<%}%>
</div>
<div class="board_btn">
    <button class="border_del" onclick="abcde()">공지삭제</button>
    <button class="border_add" onclick="abc()">공지등록</button>
</div>
<div class="border_page">
    <ul class="pageing">
        <li onclick="pre2()" class="pg"><img src="./ico/double_left.svg"></li>
        <li onclick="pre1()" class="pg"><img src="./ico/left.svg"></li>
    <%  int p = 1;
        int ptotal = 5;
        int pto2 = pgnum / ptotal;
        int p3= 1;
        int p3_sub = 0;
      	while(p3 <= pto2){
      		if(1<=repg && repg<=ptotal){
      			p3_sub = 0;	}
      		else if(ptotal * p3 < repg && repg <=ptotal * (p3+1)){
      			p3_sub = p3;}
      		p3++;}
      	while(p<=pgnum){
      		if(p3_sub==0){
      			if(p<=ptotal){%>
      			<li class="pg" onclick="gopage(<%=p%>)"><%=p %></li>
     	 	<%}}
      		else if(p3_sub==pto2){
      			if(ptotal*pto2 < p && p <=pgnum){%>
      		<li class="pg" onclick="gopage(<%=p%>)"><%=p %></li>
      		<% }}
      		else{ 
      			if(ptotal *p3_sub < p && p <=ptotal * (p3_sub+1) ){%>
      		<li class="pg"onclick="gopage(<%=p%>)"><%=p %></li>
      		<%}}
      		p++;}%>
        <li onclick="next1()" class="pg"><img src="./ico/right.svg"></li>
        <li onclick="next2(5)" class="pg"><img src="./ico/double_right.svg"></li>
    </ul>
</div>
<script>
function pre1() {
	if(<%=repg%>==0||<%=repg%>==1){
		alert("첫번째 페이지 입니다.");
	}
	else {
		location.href='./admin-notice?page='+<%=repg-1%>
	}
}
function next1() {
	if(<%=repg%>==0){
		location.href='./admin-notice?page='+<%=repg+2%>
	}
	else if(<%=pgnum%>><%=repg%>){
		location.href='./admin-notice?page='+<%=repg+1%>
	}
	else{
		alert("마지막페이지 입니다.");
	}
}
function pre2() {
	if(<%=repg%><=<%=ptotal%> && <%=repg%>!=0 && <%=repg%>!=1){
		location.href='./admin-notice?page='+1;
	}
	else if(<%=repg%>==0 || <%=repg%>==1){
		alert("첫번째 페이지 입니다");
	}
 	else {
 		location.href='./admin-notice?page='+<%=p3_sub * ptotal%>
 	}
}
function next2(no2) {
	if(<%=repg%>==0 ||<%=repg%> <= <%=ptotal%>){
		location.href='./admin-notice?page='+<%=ptotal+1%>		
	}
	else if(<%=repg%> < <%=(p3_sub+1) * ptotal%> && <%=(p3_sub+1) * ptotal%> < <%=pgnum%>){
		location.href='./admin-notice?page='+<%=(p3_sub+1)*ptotal+1%>		
	}
	else if(<%=(p3_sub+1) * ptotal%> >= <%=pgnum%> && <%=repg%> != <%=pgnum%>){
		location.href='./admin-notice?page='+<%=pgnum%>
	}
	else{
		alert("마지막페이지 입니다.");
	}
}
	function gopage(no) {
		location.href='./admin-notice?page='+no;
	}
	function ckbox() {
	var c1 = document.getElementById("ck0");
	var t1;
	if(c1.checked==true){
		t1 = true;
	}
		var ww = 1 ;
		while(ww<<%=a1+1%>){
			document.getElementById("ckon"+ww).checked = t1;
			ww++;
		}
		var ww2 = 1 ;
		while(ww2<<%=a2+1%>){
			document.getElementById("ckdata"+ww2).checked = t1;
			ww2++;
		}
	}
</script>