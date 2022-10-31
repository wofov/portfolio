<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="z"%>
<%request.setCharacterEncoding("utf-8");
String adminok = (String)session.getAttribute("aid");
int a1 = (int)request.getAttribute("a1");
String val = (String)request.getAttribute("val");
String sear = (String)request.getAttribute("sear");
int w = 0;
int w1 = 0;
int w2 = 0;
int w3=0;
int w4=0;
int w5=0;
int w6=0;
%>
<meta charset="UTF-8">
<p>상품관리 페이지</p>
<div class="subpage_view">
    <span>등록된 상품 <%=a1 %>건</span>
    <span>
        <form id="fsear" name="fsear" method="post" action="admin-product">
        <select class="p_select1" name="val">
            <option value="1" <%if(val.intern()=="1"){out.print("selected");} %>>상품명</option>
            <option value="2" <%if(val.intern()=="2"){out.print("selected");} %>>상품코드</option>
        </select>
        <input type="text" class="p_input1" placeholder="검색어를 입력해 주세요" name="sear" value="<%=sear%>">
        <input type="submit" value="검색" title="상품검색" onclick="return li()"class="p_submit">
        </form>
    </span>
</div>
<div class="subpage_view2">
    <ul>
        <li><input type="checkbox" id="ckzero" name="ckzero" onclick="ckzero()"></li>
        <li>상품코드</li>
        <li>이미지</li>
        <li>상품명</li>
        <li>카테고리 분류</li>
        <li>판매가격</li>
        <li>할인가격</li>
        <li>할인율</li>
        <li>재고현황</li>
        <li>판매유/무</li>
        <li>품절</li>
        <li>관리</li>
    </ul>
   <z:forEach var="ad" items="${adprolist}">
    <input type="hidden" name="${ad.pidx }" id="prock<%=++w %>" value="${ad.pidx }">
    <ul>
        <li><input type="checkbox" id="ck<%=++w1%>" name="ck<%=++w2%>"></li>
        <li>${ad.pcode }</li>
        <li><img style="width: 30px; height: 30px;" src="http://wofov.cafe24.com/portfolio2/upload/${ad.pimg}"></li>
        <li>${ad.pname}</li>
        <li>${ad.code }</li>
        <li id="adprice<%=++w3%>" value="${ad.price }"><p style="display:inline-block" id="ad1<%=++w5%>"></p></li>
        <li id="addcprice<%=++w4%>" value="${ad.dcprice}"><p style="display:inline-block" id="ad2<%=++w6%>"></p></li>
        <li>${ad.dc }%</li>
        <li>${ad.pct }</li>
        <li>${ad.market }</li>
        <li>${ad.nopro }</li>
        <li>관리</li>
    </ul>
    </z:forEach>
    <%if(a1==0){ %>
    <ul>
        <li style="width: 100%;">등록된 상품이 없습니다.</li>
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
    <input type="button" value="선택상품 삭제" title="선택상품 삭제" onclick="dede()" class="p_button">
    <span style="float: right;">
    <input type="button" value="신규상품 등록" title="신규상품 등록" onclick="new_pro()" class="p_button p_button_color1">
    <input type="button" value="카테고리 등록" title="카테고리 등록" onclick="catego()" class="p_button p_button_color2">
    </span>
</div>
<form id="depost" name="depost" action="admin-product?val=&sear=" method="post"></form>
<script>
var w = 1;
while(w<<%=a1%>+1){
	var adprice = document.getElementById("adprice"+w).value;
		document.getElementById("ad1"+w).innerText = adprice.toLocaleString();
	var addcprice = document.getElementById("addcprice"+w).value;
		document.getElementById("ad2"+w).innerText = addcprice.toLocaleString();
	w++;
}
var ad = "<%=adminok%>";
function ckzero() {
	var ckzero = document.getElementById("ckzero");
	var tr;
	if(ckzero.checked==true){
		tr = true;
	}
	var wck = 1 ;
	while(wck<<%=a1+1%>){
		document.getElementById("ck"+wck).checked = tr;
		wck++;
	}
}
function li() {
	fsear.submit();
	return true;
}
function dede() {
if(ad=="wowo"){
		var delist = "";
		var deck = 0 ;
		var wde = 1 ;
		while(wde<<%=a1+1%>){
			if(document.getElementById("ck"+wde).checked==true){
				delist += "," + document.getElementById("prock"+wde).value;
				deck++;
			}
			wde++;
		}
		if(deck==0){
			alert("삭제할 상품을 선택해주세요.");
		}
		else{
			ajax(delist);
		}
}
	else{
		alert("권한이 없습니다.");
	}
}

function ajax(delist) {
	var deli;
	 function wck() {     
	     if(window.XMLHttpRequest){
	   	      return new XMLHttpRequest;
	      };
	 }
	 function ade() {
	 if(deli.readyState == XMLHttpRequest.DONE && deli.status==200){
	      if(this.response=="ok"){
	         depost.submit();
	      }
		 }
	 }
	 var dd = "delist="+delist;
	 deli = wck();
	 deli.onreadystatechange = ade;
	 deli.open("POST","./procuct-list-delete",true);
	 deli.setRequestHeader("content-type","application/x-www-form-urlencoded");
	 deli.send(dd);	
}

function new_pro() {
	location.href="./admin-product-write";
}
function catego() {
	location.href="./admin-category?sh=&val=";
}
</script>