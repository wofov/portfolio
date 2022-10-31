<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="z"%>
<%request.setCharacterEncoding("utf-8");
String adminok = (String)session.getAttribute("aid");
String val = (String)request.getAttribute("val");
String sh = (String)request.getAttribute("sh");
int size = (int)request.getAttribute("size");
int w = 0;
int w1 = 0;
int w2 = 0;

%>
<meta charset="UTF-8">
<p>카테고리관리 페이지</p>
<div class="subpage_view">
    <span>등록된 카테고리 0건</span>
    <span>
        <form id="f" name="f" method="post">
        <select class="p_select1" name="sel">
            <option value="1" <%if(val.intern()=="1"){out.print("selected");} %>>카테고리명</option>
            <option value="2" <%if(val.intern()=="2"){out.print("selected");} %>>카테고리코드</option>
        </select>
        <input type="text" class="p_input1" placeholder="검색어를 입력해 주세요" name="search" value="<%=sh%>">
        <input type="submit" value="검색" title="카테고리 검색" onclick="return sub(f.sel.value)"class="p_submit">
        </form>
    </span>
</div>
<form id="frm" name="frm" method="post">
<div class="subpage_view2">
    <ul>
        <li><input type="checkbox" id="ckno" name="ckno" onclick="deall()"></li>
        <li>분류코드</li>
        <li>대메뉴 코드</li>
        <li>대메뉴명</li>
        <li>소메뉴 코드</li>
        <li>소메뉴명</li>
        <li>사용 유/무</li>
        <li>관리</li>
    </ul>
 <z:forEach var="ad" items="${catelist}">
    <input type="hidden" value="${ad.code }" id="cateck<%=++w %>" name="${ad.cidx }">
    <ul>
        <li><input type="checkbox" id="ck<%=++w1%>" name="ck<%=++w2 %>"></li>
        <li style="text-align: left; text-indent: 5px;">${ad.code }</li>
        <li>${ad.bcode }</li>
        <li style="text-align: left; text-indent: 5px;">${ad.bmenu }</li>
        <li>${ad.scode }</li>
        <li style="text-align: left; text-indent: 5px;">${ad.smenu }</li>
        <li>${ad.cenum }</li>
        <li>[수정]</li>
    </ul>
</z:forEach>
    <%if(size==0){ %>
    <ul>
        <li style="width: 100%;">등록된 카테고리가 없습니다.</li>
    </ul>
    <%} %>
</div>
<div class="subpage_view3">
    <ul class="pageing">
        <li><img src="./ico/double_left.svg"></li>
        <li><img src="./ico/left.svg"></li>
        <li>1</li>
        <li><img src="./ico/right.svg"></li>
        <li><img src="./ico/double_right.svg"></li>
    </ul>
</div>
<div class="subpage_view4">
    <input type="button" value="카테고리 삭제" title="카테고리 삭제" onclick="de1()"class="p_button">
    <span style="float: right;">
    <input type="button" value="상품 리스트" title="상품 리스트" onclick="back()"class="p_button p_button_color1">
    <input type="button" value="카테고리 등록" title="카테고리 등록" onclick="cateww()"class="p_button p_button_color2">
    </span>
</div></form>
<form id="adpost" name="adpost" method="post" action="admin-product?val=&sear="></form>
<script>
var ad = "<%=adminok%>";
function deall() {
	var ckall = document.getElementById("ckno");
	var cked;
	if(ckall.checked==true){
		cked = true;
	}
	var ckw = 1 ;
	while(ckw<<%=size+1%>){
		document.getElementById("ck"+ckw).checked = cked;
		ckw++;
	}
}
function de1() {
	if(ad=="wowo"){
		var deck = 0 ;
		var w = 1 ;
		while(w<<%=size+1%>){
			if(document.getElementById("ck"+w).checked==true){
				deck++;
			}
			w++;
		}
		if(deck==0){
			alert("삭제할 카테고리를 체크해주세요.");
		}
		else{
			var delist = "";
			var w1 = 1;
			while(w1<<%=size+1%>){
				if(document.getElementById("ck"+w1).checked==true){
					delist += "," + document.getElementById("cateck"+w1).value;
				}
				w1++;
			}
			ajax(delist);
		}
	}
	else{
		alert("권한이 없습니다.");
	}
}
function ajax(delist) {
	var da3;
	 function wck() {     
	     if(window.XMLHttpRequest){
	   	      return new XMLHttpRequest;
	      };
	 }
	 function aa3() {
	 if(da3.readyState == XMLHttpRequest.DONE && da3.status==200){
	      if(this.response=="ok"){
	         location.href='./admin-category?sh=&val=';
	      }
		 }
	 }
	 var dd = "delist="+delist;
	 da3 = wck();
	 da3.onreadystatechange = aa3;
	 da3.open("POST","./cate-list-delete",true);
	 da3.setRequestHeader("content-type","application/x-www-form-urlencoded");
	 da3.send(dd);	
}
function back() {
	adpost.submit();
}
	function cateww() {
		location.href="./admin-category-write";
	}
	function sub(sel) {
		var se = f.search.value;
		location.href='./admin-category?sh='+se+"&val="+sel;
		return false;
	}
</script>
