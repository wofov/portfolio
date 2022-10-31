<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="z"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%request.setCharacterEncoding("utf-8");%>
<%
int ea = (Integer)request.getAttribute("size");
String cid2 = (String)session.getAttribute("cid"); 
String cname2 = (String)session.getAttribute("cname"); 
String recom2 = (String)session.getAttribute("recom");
int w = 0;
%>
<div class="title_container">
    <h2><span designElement="text" textIndex="1">장바구니</span></h2>
    </div>
    <ul class="resp_cart_wrap">
        <!-- ++++++++++++ cart left area +++++++++++ -->
        <li class="cart_left">
            <div class="cart_contents">
    	
                <!-- 전체 선택 -->
                <ul class="cart_contents_top clearbox">
                    <li class="aa">
                        <label class="checkbox_allselect"><input type="checkbox" class="btn_select_all" id="ckzero" onclick="ckzero()"/> <span class="txt">전체선택</span></label>
                    </li>
                    <li class="bb hide">
                        <input type="button" class="btn_resp size_b btn_shipping_modify" value="배송변경" />
                    </li>
                </ul>
<c:set var = "tp" value = "0" />
<c:set var = "tdc" value = "0" />
<c:set var = "tdcp" value = "0" />
<z:forEach var="ad" items="${list}">
<c:set var="tp" value="${tp + (ad.price * ad.ct)}" />
<c:set var="tdc" value="${tdc + ((ad.price-ad.dcprice) * ad.ct)}" />
<c:set var="tdcp" value="${tdcp + (ad.dcprice * ad.ct)}" />
<input type="hidden" name="${ad.pidx }" id="cart<%=w%>" value="${ad.pidx }">
                <div class="cart_list">
                <ul class="shipping_group_list">
                    <li class="goods_delivery_info clearbox" id="sippingInfo1">
                        <ul class="detail">
                            <li class="th">배송 :</li>
                            <li class="silmul">
                                <span>직접배송</span>
    
                                <span id="price_">무료</span>
                                
                                <div class="hope">
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="cart_goods" id="cart_goods_987">
                        <div class="cart_goods_detail">
                            <div class="cgd_top">
                                <label>
                                    <input type="hidden" name="ship_possible[987]" value="Y"/>
                                    <input type="checkbox" name="cart_option_seq[]" id="ck<%=w%>" onclick="ck()" value="" stat="Y" rel="775" />
                                    <span class="goods_name">${ad.pname }</span>
                                </label>
                            </div>
                            
                            <div class="cgd_contents">
                                <div class="block block1">
                                    <ul>
                                        <li class="img_area">
                                            <a href=""><img src="http://wofov.cafe24.com/portfolio2/upload/${ad.pimg }" class="goods_thumb"></a>
                                        </li>
                                        <li class="option_area">
    
                                            <ul class="cart_option">
                                                <li><span class="xtle">구성</span> ${ad.pname }</li>
                                            </ul>
                                            <div class="cart_quantity"><span class="xtle">수량</span> ${ad.ct }개 <span class="add_txt"></span></div>
                                        </li>
                                    </ul>
                                </div>
    		 <c:set var="totalprice" value="${ad.price * ad.ct}" />
    		 <c:set var="totaldc" value="${(ad.price-ad.dcprice) * ad.ct}" />
    		 <c:set var="totaldcprice" value="${ad.dcprice * ad.ct}" />
    		 <input type="hidden" value="${ad.price}" id="ad1<%=w%>">
    		 <input type="hidden" value="${total}" id="ad2<%=w%>">
    		 <input type="hidden" value="${ad.dcprice}" id="ad3<%=w++%>">
                                <ul class="ck block2" id="mobile_cart_sale_tr_987">
                                    <li class="pblorice_a">
                                        <span class="ptitle">상품금액</span><fmt:formatNumber value="${totalprice}" pattern="#,###" />&#x20a9;
                                    </li>
                                    <li class="price_b">
                                        <span class="ptitle">
                                            할인금액 
                                        </span>
                                        <fmt:formatNumber value="${totaldc}" pattern="#,###" /> <span id="mobile_cart_sale_987">&#x20a9;</span>
                                    </li>
                                    <li class="price_c">
                                        <span class="ptitle">할인적용금액</span>
                                        <span class="total_p" id="option_suboption_price_sum_987"><span class="num"><fmt:formatNumber value="${totaldcprice}" pattern="#,###" /></span>&#x20a9;</span>
                                    </li>
                                </ul>
    
                                <ul class="block block3">
                                	<li></li>
                                	<li></li>
                                    <li><button type="button" class="btn_direct_buy btn_resp color2" onclick="dede2(${ad.pidx })">해당 상품 삭제</button></li>
                                </ul>
    
                            </div>
                        </div>
                    </li>
                </ul>
                </div>
           </z:forEach>
            </div>
            
    
            <!-- 버튼 그룹 -->
            <div class="selected_btn_groups">
                
                <div class="btns">
                    <button type="button" class="btn_resp size_b gray_05 btn_select_del" onclick="dede()">선택상품 삭제</button>
                </div>
            </div>
        </li>
        <!-- ++++++++++++ //cart left area +++++++++++ -->
    
        <!-- ++++++++++++ cart right area +++++++++++ -->
        <li class="cart_right">
            <h3 class="title_x">주문시 금액</h3>
    
            <!-- 총합계 Start -->
            <div class="total_sum_price">
                <ul class="list list1">
                    <li class="th">총 상품금액</li>
                    <li class="td"><span class="sum_price"><span class="num"><fmt:formatNumber value="${tp}" pattern="#,###" /></span>&#x20a9;</span></li>
                </ul>
                <ul class="list list2">
                    <li class="th">총 배송비</li>
                    <li class="td"><span class="sum_price"><span>0&#x20a9;</span></span></li>
                </ul>
                <ul class="list list3">
                    <li class="th">총 할인</li>
                    <li class="td"><span class="sum_price">(-) <span><fmt:formatNumber value="${tdc}" pattern="#,###" />&#x20a9;</span></span></li>
                </ul>
                <ul class="list list4 total">
                    <li class="th">총 결제금액</li>
                    <li class="td"><span class="sum_price settle_price">
                        <span class="num"><fmt:formatNumber value="${tdcp}" pattern="#,###" /></span>&#x20a9;</span>
                    </li>
                </ul>
            </div>
    
            <ul class="cart_order_btn_area">
                <li>
                    <input type="button" class="btn_resp size_c color2 btn_all_order" onclick="paygo()" value="주문하기" /><br><br>
                    <input type="button" class="btn_resp size_c color2 btn_all_order" onclick="backgo()" value="계속쇼핑하기" />
                </li>
            </ul>
            <div class="pdb10 center"></div>
            <div class="pdb10 center"></div>
        </li>
        <!-- ++++++++++++ //cart right area +++++++++++ -->
    </ul>
        <div class="total_price_n_btns">
        </div>
<script>
function backgo() {
	location.href='edd-main';
}
function paygo() {
	location.href='./order?sid=<%=cid2%>';
}
function ck() {
	document.getElementById("ckzero").checked=false;
}
function ckzero() {
	var ckzero = document.getElementById("ckzero");
	var tr;
	if(ckzero.checked==true){
		tr = true;
	}
	var wck = 0 ;
	while(wck<<%=ea%>){
		document.getElementById("ck"+wck).checked = tr;
		wck++;
	}
}
function li() {
	fsear.submit();
	return true;
}
function dede() {
		var delist = "";
		var deck = 0 ;
		var wde = 0 ;
		while(wde<<%=ea%>){
			if(document.getElementById("ck"+wde).checked==true){
				delist += "," + document.getElementById("cart"+wde).value;
				deck++;
			}
			wde++;
		}
		if(deck==0){
			alert("삭제할 상품을 선택해주세요");
		}
		else{
			ajax2(delist);
		}
}
function dede2(de) {
	var delist = ","+de;
	ajax2(delist);
}

function ajax2(delist) {
	var deli;
	 function wck() {     
	     if(window.XMLHttpRequest){
	   	      return new XMLHttpRequest;
	      };
	 }
	 function ade() {
	 if(deli.readyState == XMLHttpRequest.DONE && deli.status==200){
	      if(this.response=="ok"){
	    	  location.href='./ordercart?cid=<%=cid2%>';
	      }
		 }
	 }
	 var dd = "delist="+delist+"&cid=<%=cid2%>";
	 deli = wck();
	 deli.onreadystatechange = ade;
	 deli.open("POST","./cart-list-delete",true);
	 deli.setRequestHeader("content-type","application/x-www-form-urlencoded");
	 deli.send(dd);	
}

</script>