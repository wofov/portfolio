<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="z"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%request.setCharacterEncoding("utf-8");%>
<%  response.setContentType("text/html; charset=utf-8");
int a1 = (Integer)request.getAttribute("a1");
int a2 = (Integer)request.getAttribute("a2");
int nullct = (Integer)request.getAttribute("nullct");
int stpg = (Integer)request.getAttribute("stpg");
int pgnum = (Integer)request.getAttribute("pgnum");
int repg = (Integer)request.getAttribute("repg");
int valck = (Integer)request.getAttribute("valck");
String valid = (String)request.getAttribute("valid");
String hid = (String)request.getAttribute("hid");
String sear = (String)request.getAttribute("sear");
int w1 = 0;
%>
<meta charset="utf-8">
<style>
.or:hover{background-color: skyblue}
</style>
<div id="boardlayout" >
    <div class="subpage_wrap">
        <div id="subpageLNB" class="subpage_lnb">
<div id="boardLnbCommon">
    <h2 class="title1"><a href="./edd-notice" designElement="text">CS CENTER</a></h2>
    <ul class="lnb_sub">
        <li ><a href="./edd-notice" designElement="text">공지사항</a></li>
        <li ><a href="./cs.do?cate=6" designElement="text">자주 묻는 질문</a></li>
        <li ><a href="#" designElement="text">상품문의</a></li>
        <li ><a href="#" designElement="text"><b>상품후기</b></a></li>
    </ul>
</div>
<script>
$(function() {
    // 고객센터 LNB 텍스트 수정기능으로 삭제시, 클라이언트단에서 삭제 처리
    $('#boardLnbCommon a').each(function(e) {
        if ( $(this).text() == '' ) {
            $(this).parent('li, h2').remove();
        }
    });
});
</script>
        </div>
    <div class="subpage_container">
        <!-- 전체 메뉴 -->
        <a id="subAllButton" class="btn_sub_all" href="javascript:void(0)"><span designElement="text" textIndex="1"  textTemplatePath="cmVzcG9uc2l2ZV93cmlzdHdhdGNoX2NsYXNzaWNfZ2wvYm9hcmQvaW5kZXguaHRtbA==" >MENU</span></a>

        <!-- 타이틀 ( 관리자에서 설정한 "게시판명"이 노출됩니다. ) -->
        <div class="title_container">
            <h2>공지사항</h2>
        </div>

        <div id="bbslist"><form id="f" name="f" method="post">
<ul class="bbs_top_wrap">
    <li class="left">
        <select name="category" id="searchcategory">
            <option value="">- 전체 -</option>
            <option value="2" <%if(valid.equals("2")){out.print("selected");} %>>공지</option>
            <option value="1" <%if(valid.equals("1")){out.print("selected");} %>>긴급공지</option>
        </select>
    </li>
    <li class="right2"><input type="hidden" value="<%=valid %>" name="hiddenval">
        <span class="searchform"><input type="hidden" value="<%=hid %>" name="hiddensearch">
            <input type="text" name="search_text" id="search_text" class="res_bbs_search_input" value="<%=sear %>" title="제목, 내용" />
            <button type="submit" class="btn_resp size_b" onclick="return sergo(f.category.value)">검색</button>
            <input type="button" class="btn_resp size_b" onclick="re_set()" value="초기화">
        </span>
    </li>
</ul></form>
<div class="article_info hide">
총 0개 (현재 0/총 0페이지)
</div>
<!--등록된 글이 없을 경우-->
<%if(a1==0&&a2==0){ %>
<div class="no_data_area2">
    등록된 게시글이 없습니다.
</div>
<%}%>
<!--등록된 글이 있을 경우-->
<div class="res_table">
<ul class="thead">
<li style="width:45px;"><span designElement="text">번호</span></li>
<li><span designElement="text">제목</span></li>
<li style="width:94px;"><span designElement="text">작성자</span></li>
<li style="width:84px;"><span designElement="text">등록일</span></li>
</ul>
<%if(!valid.equals("2")){%>
<z:forEach var="ad" items="${dataon }"><z:set var="Text" value="${ad.ntime }"/>
<!--반복구간 사항-->
<ul class="tbody">
<li class="mo_hide">
<span class="mtitle" designElement="text">번호:</span> 공지</li>
<li class="subject">
    ${ad.nsub }
</li>
<li class="subject" style="text-align: center;">
    ${ad.nwr }
</li>
<li class="subject" style="text-align: center;">
    ${fn:substring(Text,0,10)}
</li>
</ul>
<!--반복구간 종료-->
</z:forEach>
<%} %>
<%if(!valid.equals("1")){%>
 <z:forEach var="ad" items="${data4}"><z:set var="Text" value="${ad.ntime }"/>
<!--반복구간 사항-->
<ul class="tbody">
<li class="mo_hide">
<span class="mtitle" designElement="text">번호:</span> <%=nullct-stpg-(w1++)%></li>
<li class="subject">
    ${ad.nsub }
</li>
<li class="subject" style="text-align: center;">
    ${ad.nwr }
</li>
<li class="subject" style="text-align: center;">
     ${fn:substring(Text,0,10)}
</li>
</ul>
</z:forEach>
<%} %>
<!--반복구간 종료-->
</div>
<div id="pagingDisplay" class="paging_navigation">
<p>
<!--페이지 번호 반복구간-->
<%  	int p = 1;
        int ptotal = 10;
        int pto2 = pgnum / ptotal;
        int p3= 1;
        int p3_sub = 0;
      	while(p3 <= pto2){
      		if(1<=repg && repg<=ptotal){p3_sub = 0;	}
      		else if(ptotal * p3 < repg && repg <=ptotal * (p3+1)){p3_sub = p3;}
      		p3++;
      		}
      	if(valck==1){%>
      		<a class="on red" onclick="gopage(<%=p%>)">1</a>
      	<%}
      	else{
      	while(p<=pgnum){
      		if(p3_sub==0){
      			if(p<=ptotal){%>
      			<a class="on red" onclick="gopage(<%=p%>)"><%=p %></a><%}}
      		else if(p3_sub==pto2){
      			if(ptotal*pto2 < p && p <=pgnum){%>
      		<a class="on red" onclick="gopage(<%=p%>)"><%=p %></a><% }}
      		else{ 
      			if(ptotal *p3_sub < p && p <=ptotal * (p3_sub+1) ){%>
      		<a class="on red" onclick="gopage(<%=p%>)"><%=p %></a><%}}
      		p++;}}%>
<!--페이지 번호 반복구간-->
</p>
</div>
     </div>
    </div>
<!--공지사항 끝-->
<script>
function gopage(no) {
	var se2 = f.hiddensearch.value;
	var se = f.search_text.value;
	var valhi = f.hiddenval.value;
	console.log(valhi);
	if(se2==null){
		location.href='./edd-notice?page='+no;
	}
	else{
		location.href='./edd-notice?search='+se2+'&page='+no+'&val='+se+valhi;		
	}
}
function sergo(sel) {
	var se = f.search_text.value;
	location.href='./edd-notice?search='+se+"&val="+sel;
	return false;}
function re_set() {
	location.href='./edd-notice';
}
</script>