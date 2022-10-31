<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.inicis.std.util.SignatureUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String cname2 = (String)session.getAttribute("cnm");

%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="z"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
String mid					= "INIpayTest";		                    // 상점아이디					
String signKey			    = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";	// 웹 결제 signkey

String mKey = SignatureUtil.hash(signKey, "SHA-256");

Map<String, String> signParam = new HashMap<String, String>();

String timestamp			= SignatureUtil.getTimestamp();			// util에 의해서 자동생성
String orderNumber			= mid+"_"+SignatureUtil.getTimestamp();	// 가맹점 주문번호(가맹점에서 직접 설정)
String price				= "1000";

signParam.put("oid", orderNumber);
signParam.put("price", price);
signParam.put("timestamp", timestamp);

String signature = SignatureUtil.makeSignature(signParam);
%>
<script language="javascript" type="text/javascript" src="https://stgstdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>
<form name="pay" id="pay" enctype="application/x-www-form-urlencoded">
<input type="hidden" name="version" value="1.0">
<input type="hidden" name="gopaymethod" value="CARD"><!-- 결제수단 -->
<input type="hidden" name="mid" value="INIpayTest"><!-- 이니시스 제공 -->
<input type="hidden" name="oid" value="<%=orderNumber%>">
<input type="hidden" name="price" value="1000"><!-- 최종결제금액 -->
<input type="hidden" name="timestamp" value="<%=timestamp%>">
<input type="hidden" name="signature" value="<%=signature%>">
<input type="hidden" name="mKey" value="<%=mKey%>">
<input type="hidden" name="currency" value="WON"><!-- version -->
<!-- 결제자정보 -->
<input type="hidden" name="buyername" value="gd"><!-- 결제자이름 -->
<input type="hidden" name="buyertel" value="01051229647">
<input type="hidden" name="buyeremail" value="hys950526@naver.com">
<input type="hidden" name="goodname" value="상품명">
<input type="hidden" name="goodea" value="23">
<!-- 결제완료 취소 일때 -->
<input type="hidden" name="returnUrl" value="http://wofov.cafe24.com/INIstdpay_pc_return.jsp">
<input type="hidden" name="closeUrl" value="http://wofov.cafe24.com/close.jsp">
<!-- <input type="hidden" name="returnUrl" value="http://localhost:8080/wofov/INIstdpay_pc_return.jsp"> -->
<!-- <input type="hidden" name="closeUrl" value="http://localhost:8080/wofov/close.jsp"> -->

<div id="layout_body" class="layout_body">
    <div class="subpage_wrap">
        <div class="subpage_container v3 Pb10">
            <!-- 타이틀 -->
            <div class="title_container">
                <h2><span designElement="text">주문완료</span></h2>
            </div>
            
            <div class="mypage_greeting">
                <span class="username"><%=cname2 %></span>님의 주문이 정상적으로 처리되었습니다.
            </div>
        </div>
    </div>
    <div class="subpage_wrap order_payment">
        <div class="subpage_container v2 Pt0 Pb40 order_payment_left2">
         <h2 class="title_od1 Pt15"><span designElement="text" textIndex="2"   >주문상품 정보</span></h2>
<c:set var = "tp" value = "0" />
<c:set var = "tdc" value = "0" />
<c:set var = "tdcp" value = "0" />
<z:forEach var="ad" items="${list}">
<c:set var="tp" value="${tp + (ad.price * ad.ct)}" />
<c:set var="tdc" value="${tdc + ((ad.price-ad.dcprice) * ad.ct)}" />
<c:set var="tdcp" value="${tdcp + (ad.dcprice * ad.ct)}" />
            <div class="cart_contents">
                <div class="cart_list">
                    <ul class="shipping_group_list ">
                        <li class="goods_delivery_info clearbox">
                            <ul class="detail">
                                <li class="th">배송 :</li>
                                <li class="silmul">
                                    <span>직접배송</span>
    
                                    <span class="ship_info">(선불)</span>
    
                                    <span id="price_" class="grp_shipping_price_1_21_direct_delivery">무료</span>
    
                                    <div class="hope">
                                    </div>
                                </li>
                                <li class="btn_area">
                                    <button type="button" class="btn_resp btn_shipping_modify" cart_seq="949" prepay_info="delivery" nation="korea" goods_seq="767" hop_date="" person_seq="">배송 변경</button>
                                </li>
                            </ul>
                        </li>
    
                        <li class="cart_goods">
                            <div class="cart_goods_detail">
    
                                <div class="cgd_contents">
                                    <div class="block block1">
                                        <ul>
                                            <li class="img_area">
                                                <a href="#"><img src="http://wofov.cafe24.com/portfolio2/upload/${ad.pimg }" title="" alt="상품이미지" /></a>
                                            </li>
                                            <li class="option_area">
    
    
                                                <div class="goods_name v2">
                                                    <a href="">${ad.pname }</a>
                                                </div>
    
   
    		<c:set var="totalprice" value="${ad.price * ad.ct}" />
    		 <c:set var="totaldc" value="${(ad.price-ad.dcprice) * ad.ct}" />
    		 <c:set var="totaldcprice" value="${ad.dcprice * ad.ct}" />

                                                <div class="cart_quantity">
                                                    <span class="xtle">수량</span> ${ad.ct }개
                                                </div>
    
                                            </li>
                                        </ul>
                                    </div>
    
                                    <ul class="block block2 x1" id="mobile_cart_sale_tr_989">
                                        <li class="price_a">
                                            <span class="ptitle">상품금액</span> <fmt:formatNumber value="${totalprice}" pattern="#,###" />&#x20a9;
                                        </li>
                                        <li id="cart_sale_tr_989" class="price_b">
                                            <span class="ptitle">할인금액</span>
                                            <div id="cart_option_sale_total_989">
                                                <fmt:formatNumber value="${totaldc}" pattern="#,###" /><span id="mobile_cart_sale_987">&#x20a9;</span>
                                            </div>    
                                        </li>
                                        <li class="price_c">
                                            <span class="ptitle">할인적용금액</span>
                                            <span class="total_p"><span id="option_suboption_price_sum_989"><fmt:formatNumber value="${totaldcprice}" pattern="#,###" /></span>&#x20a9;</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div></z:forEach>
    
            <div class="goods_delivery_info Pt10 y1">
                <b>기본배송비 : 0&#x20a9;</b>
                </span>
            </div>
            <div class="order_subsection v2">
                <h3 class="title3"><span>주문자</span></h3>
                <ul class="list_01 v2">
                    <li>
                        <span class="name1 pointcolor2 imp">${list2.get('cname') }</span>
                    </li>
                    <li>
                        <span class="phone1">${list2.get('ctel1') }</span>
                    </li>
                    <li><span class="email1">${list2.get('email1') }</span></li>
                    <li class="desc">
                        주문자 정보로 주문 관련 정보가 문자와 이메일로 발송됩니다.<br />
                        비회원은 이메일과 주문번호로 주문조회가 가능합니다.<br />
                    </li>
                </ul>
    
                <h3 class="title3"><span>배송지</span></h3>
                <ul class="list_01 v2">
                    <li>
                        <span class="name1 pointcolor imp">${list2.get('cname') }</span>
                        <span class="gray_06">(대한민국)</span>
                    </li>
                    <li>
                        [ ${list2.get('person_post') } ]
                        ${list2.get('person_addr') }<br/>
                        <span class="desc">
                        ${list2.get('recipient_input_address_detail') }
                        </span>
                    </li>
                    <li>
                         ${list2.get('ctel1') }
                    </li>
                    <li>
                       ${list2.get('memo') }
                    </li>
                </ul>
            </div>
        </div>
    
        <div class="subpage_container v2 Pt0 Pb40 order_payment_right2">
            <div class="order_subsection v2">
                <h3 class="title3 Pt15"><span>결제 금액</span></h3>
                <div class="order_price_total">
                    <ul>
                        <li class="th"><strong><span>상품금액</span></strong></li>
                        <li class="td"><fmt:formatNumber value="${tdcp}" pattern="#,###" />&#x20a9;</li>
                    </ul>
                    <ul>
                        <li class="th">
                            <span>배송비</span>&nbsp;
                        </li>
                        <li class="td">
                            (+) 0&#x20a9;
                        </li>
                    </ul>
                    <ul class="total">
                        <li class="th"><span>총 결제금액</span></li>
                        <li class="td">
                            <span class="price"><span class="settle_price"><fmt:formatNumber value="${tdcp}" pattern="#,###" /></span>&#x20a9;</span>
                        </li>
                    </ul>
                </div>		
                <h3 class="title3"><span>주문결제정보</span>&nbsp;</h3>
                <table class="table_row_a" cellpadding="0" cellspacing="0">
                    <colgroup><col width="100"><col></colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><p>주문번호</p></th>
                            <td>
                                123456789 &nbsp;
                                <span class="Dib desc">(2022-10-25 14:26)</span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><p>주문상태</p></th>
                            <td>주문접수</td>
                        </tr>
                        <tr>
                            <th scope="row"><p>결제일시</p></th>
                            <td>
                                입금대기
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><p>결제방식</p></th>
                            <td>
                                신용카드
                            </td>
                        </tr>
                        <!--무통장 일 경우-->
                        <tr class="hide">
                            <th scope="row"><p>입금계좌</p></th>
                            <td>신한은행 100-033-123456 예금주:주식회사 더조은</td>
                        </tr>
                        <tr class="hide">
                            <th scope="row"><p>입금기간</p></th>
                            <td>2022년 11월 07일까지 (이후 입금되지 않았을 경우 자동으로 주문무효 처리)</td>
                        </tr>
                        <!--무통장 일 경우-->
                        <tr>
                            <th scope="row"><p>결제금액</p></th>
                            <td><strong><fmt:formatNumber value="${tdcp}" pattern="#,###" />&#x20a9;</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <div class="Pb60 C">
        <a href="#" class="btn_resp size_c color2"><span>주문취소</span></a>
        <input type="button"  value="결제하기" class="btn_resp size_c color5" onclick="payment()">
    </div>
    <style type="text/css">
    @media only screen and (max-width:767px) {
        .subpage_wrap.order_payment { display:block; width:auto; }
        .subpage_wrap.order_payment .subpage_container { display:block; padding:10px 10px 40px; }
        .subpage_wrap.order_payment .subpage_container.v2 { display:block; padding:10px 10px 40px; }
        .subpage_wrap.order_payment .order_payment_left2 { padding-right:0; }
        .subpage_wrap.order_payment .order_payment_right2 { padding-left:0; }
    }
    </style></form>
    <script>
	function payment(){
		INIStdPay.pay('pay');	
	}
	
</script>