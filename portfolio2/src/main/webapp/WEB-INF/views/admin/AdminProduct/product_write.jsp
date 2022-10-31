<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="z"%>
<%request.setCharacterEncoding("utf-8");%>
<% 
int size = (int)request.getAttribute("size");
%>
<meta charset="UTF-8">
<script src="./ckeditor/ckeditor.js"></script>
<p>상품 등록 페이지<form id="f" name="f" method="POST" action="product-write" enctype="multipart/form-data"></p>
<div class="product_insert">
    <ul><input type="hidden" value="0" name="pidx">
        <li>대메뉴 카테고리</li>
        <li>
            <select class="product_input1" id="bcode" name="bcode"onchange="plus()">
            <option value="">대메뉴 선택</option>
          <z:forEach var="ad" items="${codelist}">
            	<option value="${ad.bcode }">${ad.bcode }</option>
            </z:forEach>
            </select>
        </li>
    </ul>
    <ul>
        <li>소메뉴 카테고리</li>
        <li> 
             <select class="product_input1" id="scode" name="scode" value="">
             </select>
        </li>
    </ul>
    <ul>
        <li>상품코드</li>
        <li>
            <input type="text" class="product_input1" id="pcode" name="pcode"> 
            <input type="button" value="중복확인" title="중복확인" class="product_btn" onclick="dck()"> <span class="help_text">※ 상품코드는 절대 중복되지 않도록 합니다.</span>
        	<input type="hidden" name="ck" id="ck" value="0">
        </li>
    </ul>
    <ul>
        <li>상품명</li>
        <li>
            <input type="text" class="product_input2" maxlength="100" id="pname" name="pname"> <span class="help_text">※ 상품명은 최대 100자까지만 적용할 수 있습니다.</span>
        </li>
    </ul>
    <ul>
        <li>상품 부가설명</li>
        <li>
            <input type="text" class="product_input4" maxlength="200" id="psub" name="psub"> <span class="help_text">※ 상품명은 최대 200자까지만 적용할 수 있습니다.</span>
        </li>
    </ul>
    <ul>
        <li>판매가격</li>
        <li>
            <input type="text" class="product_input3" maxlength="7" id="price" name="price" onkeyup="dcdc()"> <span class="help_text">※ , 없이 숫자만 입력하세요 최대 7자리</span>
        </li>
    </ul>
    <ul>
        <li>할인율</li>
        <li>
            <input type="text" class="product_input3" maxlength="2" value="0" id="dc" name="dc" onkeyup="dcdc()">% <span class="help_text">※ 숫자만 입력하세요</span>
        </li>
    </ul>
    <ul>
        <li>할인가격</li>
        <li>
            <input type="text" class="product_input3" maxlength="7" value="0" id="dcprice" name="dcprice" readonly> <span class="help_text">※ 할인율이 0%일 경우 할인가격은 0으로 처리 합니다.</span>
        </li>
    </ul>
    <ul>
        <li>상품재고</li>
        <li>
            <input type="text" class="product_input3" maxlength="4" value="0" id="pct" name="pct">EA <span class="help_text">※ 숫자만 입력하세요. 재고가 0일 경우 soldout이 됩니다.</span>
        </li>
    </ul>
    <ul>
        <li>판매 유/무</li>
        <li>
            <label class="product_label">
            <input type="radio" name="market" value="Y" style="vertical-align:-1px;" checked> 판매시작
            </label>
            <label class="product_label">
            <input type="radio" name="market" value="N" style="vertical-align:-1px;"> 판매종료
            </label> <span class="help_text">※ 숫자만 입력하세요. 재고가 0일 경우 soldout이 됩니다.</span>
        </li>
    </ul>
    <ul>
        <li>조기품절</li>
        <li>
            <label class="product_label">
                <input type="radio" name="nopro" value="Y" style="vertical-align:-1px;"> 사용
            </label>
            <label class="product_label">
                <input type="radio" name="nopro" value="N" style="vertical-align:-1px;" checked> 미사용
            </label>
        </li>
    </ul>
    <ul style="height: 160px;">
        <li>상품 대표이미지</li>
        <li>
            <ol style="width:100%; height: auto;">
            <li style="width:100%; height:45px;">
            <input type="file" name="pimg">
            <span class="help_text">※ 상품 대표이미지 이며, 이미지 용량은 2MB 까지 입니다.</span>
            </li>
            <li style="height:45px;">
            <input type="file"  name="pimg2">
            <span class="help_text">※ 추가 이미지 이며, 이미지 용량은 2MB 까지 입니다.</span>
            </li>
            <li style="height:45px;">
            <input type="file"  name="pimg3">
            <span class="help_text">※ 추가 이미지 이며, 이미지 용량은 2MB 까지 입니다.</span>
            </li>
            </ol>
        </li>
    </ul>
    <ul style="height: 400px;">
        <li>상품 상세설명</li>
        <li>
            <textarea class="product_text1" id="pmain" name="pmain"></textarea>
        </li>
    </ul>
</div></form>
<div class="subpage_view4" style="text-align:center;">
    <input type="button" value="상품 리스트" title="상품 리스트" onclick="goback1()"class="p_button p_button_color1" style="margin-right: 5px;">
    <input type="button" value="상품 등록" title="상품 등록" onclick="hap()"class="p_button p_button_color2">
</div>
<script>
CKEDITOR.replace("pmain",{height:280});
function goback1() {history.go(-1);}
function dck() {
	var hi= document.getElementById("ck").value++;
	var pcode = document.getElementById("pcode").value;
	if(f.pcode.value==""){alert("상품코드를 입력해주세요.");}
	else{ajax(pcode);}
}
function ajax(pcode) {
	var da2;
	 function wck() {     
	     if(window.XMLHttpRequest){
	   	      return new XMLHttpRequest;
	      };
	 }
	 function aa2() {
	 if(da2.readyState == XMLHttpRequest.DONE && da2.status==200){
	      if(this.response=="no"){
	         alert("중복된 코드 입니다.");
	      }
	      else{
	          alert("사용가능한 코드 입니다.");
	          document.getElementById("pcode").readOnly=true;
	          var hi= document.getElementById("ck").value++;
	      }
		 }
	 }
	 var dd = "pcode="+pcode;
	 da2 = wck();
	 da2.onreadystatechange = aa2;
	 da2.open("POST","./pcodeck",true);
	 da2.setRequestHeader("content-type","application/x-www-form-urlencoded");
	 da2.send(dd);	
}
function dcdc() {
	var dc = document.getElementById("dc").value;
 	var pr = document.getElementById("price").value;
 	var re = 1-(dc * 0.01);
 	var cof = re * pr;
	document.getElementById("dcprice").value = Math.round(cof);
}
function hap() {
	console.log(f.scode.value);
	var pmain = CKEDITOR.instances.pmain.getData();
	if(f.bcode.value==""){
		alert("대메뉴 코드를 선택해주세요");
	}
	else if(f.pcode.value==""){
		alert("상품코드를 입력해주세요");
	}
	else if(f.pname.value==""){
		alert("상품 이름을 입력해주세요");
	}
	else if(f.psub.value==""){
		alert("부가 설명을 입력해주세요");
	}
	else if(f.price.value==""){
		alert("판매가격을 입력해주세요");
	}
	else if(f.dc.value==""){
		alert("할인율을 입력해주세요");
	}
	else if(f.pct.value==""){
		alert("상품 재고를 입력해주세요");
	}
	else if(f.pimg.value==""){
		alert("상품 대표 이미지를 선택해주세요.");
	}
	else if(pmain==""){
		alert("상품 상세 설명을 입력해주세요.");
	}
	else if(f.ck.value=="0"){
		alert("상품코드 중복체크를 눌러주세요");
	}
	else{
		f.submit();
	}
}
function plus() {
	var bc = document.getElementById("bcode").value;
	if(bc!=""){
		let da;
		function wck() {		
			if(window.XMLHttpRequest){
				return new XMLHttpRequest;
			};
		}
		function ajaj() {
			if(da.readyState == XMLHttpRequest.DONE && da.status==200){
				if(this.response!=""){
					var sco = this.response.split(".");
					var stno = document.getElementById("scode");
					var z = 1;
					stno.innerHTML = "<option value='"+sco[1]+"'>"+sco[1]+"</option>')";
					while(z<sco.length){
						if(z>1){
							stno.innerHTML += "<option value='"+sco[z]+"'>"+sco[z]+"</option>')";
						}
						z++;
					}
				}
			}
		}
 		var scode = "scode="+bc;
		da=wck();
		da.onreadystatechange = ajaj;
		da.open("POST","./scodelist",true);
		da.setRequestHeader("content-type","application/x-www-form-urlencoded");
		da.send(scode);
	}
}
</script>