<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="z"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<% String eddpayid = (String)session.getAttribute("cid");%>
<% String eddok = (String)session.getAttribute("ok");
if(eddok==null){eddok="";}%>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
var ck = 0 ;
function eddmember() {
	if(ck==0){
		var name = document.getElementById("adname").value;
		var tel = document.getElementById("adtel").value;
		var email = document.getElementById("ademail").value;
		var cpost = document.getElementById("adpost").value;
		var caddr = document.getElementById("adaddr").value;
		var caddr2 = document.getElementById("adaddr2").value;
		
		document.getElementById("cname").value= name; 
		document.getElementById("ctel1").value= tel; 
		document.getElementById("email").value= email; 
		document.getElementById("person_nm").value= name; 
		document.getElementById("person_post").value= cpost; 
		document.getElementById("person_addr").value= caddr; 
		document.getElementById("caddr2").value= caddr2; 
		document.getElementById("person_hp1").value= tel; 
		document.getElementById("email2").value= email; 
		ck++;
	}
	else{
		document.getElementById("cname").value= "";
		document.getElementById("ctel1").value= ""; 
		document.getElementById("email").value= ""; 
		document.getElementById("person_nm").value= ""; 
		document.getElementById("person_post").value= ""; 
		document.getElementById("person_addr").value= ""; 
		document.getElementById("caddr2").value= ""; 
		document.getElementById("person_hp1").value= ""; 
		document.getElementById("email2").value= ""; 
		ck--;
	}
}
$(function () {
	$("#all_agree").click(function () {//약관동의
		var $ck = $(this).is(":checked");
		if($ck==true){
			$allck = true;
		}
		else{
			$allck = false;
		}
		$(".agree_chk").prop("checked",$allck);
	});
});
$(function () {
	$("#search_post").postcodifyPopUp({//주소찾기 버튼
		insertPostcode5:"#person_post",
		insertAddress:"#person_addr",
	});
});
function back() {
	history.go(-1);
}
function paynow() {
	if(orderFrm.cname.value==""){
		alert("주문자 이름을 입력해주세요");
	}
	else if(orderFrm.ctel1.value==""){
		alert("주문자 휴대폰 번호를 입력해주세요");
	}
	else if(orderFrm.email.value==""){
		alert("주문자 이메일을 입력해주세요");	
	}
	else if(orderFrm.person_nm.value==""){
		alert("받는 사람 이름을 입력해주세요");
	}
	else if(orderFrm.person_post.value==""){
		alert("배송지를 입력해주세요");
	}
	else if(orderFrm.caddr2.value==""){
		alert("상세주소를 입력해주세요");
	}
	else if(orderFrm.person_hp1.value==""){
		alert("받는 사람 휴대폰 번호를 입력해주세요");
	}
	else if(document.getElementById("agree1").checked==false){
		alert("쇼핑몰 이용 약관 동의를 해주세요");
	}
	else if(document.getElementById("agree2").checked==false){
		alert("개인정보 수집 및 이용 동의를 해주세요");
	}
	else if(document.getElementById("agree3").checked==false){
		alert("개인정보 제3자 제공 동의를 해주세요");
	}
	else if(document.getElementById("agree4").checked==false){
		alert("개인정보 취급위탁에 대한 동의를 해주세요");
	}
	else{
		orderFrm.submit();
	}
}
</script>
 <form name="orderFrm" id="orderFrm" method="post" enctype="application/x-www-form-urlencoded" action="pay?cid=<%=eddpayid%>">
 <input type="hidden" name="version" value="1.0">
 <input type="hidden" name="mid" value="">
 <input type="hidden" name="oid" value="">
 <!-- 결제시작 -->
<input type="hidden" name="price" value="500"><!-- 결제할금액 -->
<input type="hidden" name="timestamp" value=""> 
<input type="hidden" name="currency" value="WON"> 
<!-- 상품부분 -->
<input type="hidden" name="goodname" value="상품이름"> 
<input type="hidden" name="goodcode" value="codenumber"> 
<input type="hidden" name="goodea" value="2"><!-- 상품갯수 --> 
<input type="hidden" name="" value=""> 
<input type="hidden" name="" value=""> 
<input type="hidden" name="" value=""> 
<div id="layout_body" class="layout_body">
    <style type="text/css">
    .resp_layer_pop .btn_view_coupons { position:absolute; right:60px; top:22px; } 
    .subpage_wrap.order_payment.flyingMode .order_payment_right .order_subsection { position:fixed; right:0; top:0; z-index:100; width:100%; /*width:calc(40% - 20px);*/ }
    .subpage_wrap.order_payment.flyingMode .order_payment_right .order_subsection .right_flying_wrap1 { max-width:1260px; padding-left:40px; padding-right:40px; margin:0 auto; }
    .subpage_wrap.order_payment.flyingMode .order_payment_right .order_subsection .right_flying_wrap2 { width:100%; position:relative; }
    .subpage_wrap.order_payment.flyingMode .order_payment_right .order_subsection .right_flying_wrap3 { position:absolute; right:0; top:0; width:calc(40% - 20px); background:#fff; box-shadow:0 0 4px rgba(0, 0, 0, 0.2); }
    @media only screen and (max-width:1023px) {
        .subpage_wrap.order_payment.flyingMode .order_payment_right .order_subsection .right_flying_wrap1 { padding-left:10px; padding-right:10px; }
        .subpage_wrap.order_payment.flyingMode .order_payment_right .order_subsection .right_flying_wrap3 { width:290px; }
    }
    @media only screen and (max-width:799px) {
        .subpage_wrap.order_payment { display:block; width:auto; }
        .subpage_wrap.order_payment .subpage_container { display:block; padding:10px 0 40px; }
        .subpage_wrap.order_payment .subpage_container.v2 { display:block; padding:10px 0 40px; }
        .subpage_wrap.order_payment .order_payment_right { width:auto; padding-left:0; }
    }
    </style>
    
    <script type="text/javascript">
        function onlyNumber(obj) { $(obj).keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/g,"")); }); }
    </script>
    <div id="delivery_address_dialog" style="display:none;"></div><!--주소록-->
    <div id="PromotionDialog" class="hide"></div>
    <div id="couponDownloadDialog" style="display:none"></div>
    
    <div class="subpage_wrap">
        <div class="subpage_container v3 Pb10">
            <!-- 타이틀 -->
            <div class="title_container Pb0">
                <h2><span designElement="text" textIndex="1"   >주문/결제</span></h2>
            </div>
        </div>
    </div>
    
    
    <div id="orderPaymentLayout" class="subpage_wrap order_payment" data-ezmark="undo">
        <div class="subpage_container v2 Pt0 order_payment_left">
            <!-- 주문상품 :: START -->
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
  
            <div id="facebook_mgs"><div style="padding:10px"></div></div>
    
    <z:forEach var="ad" items="${list2}">
    <input type="hidden" value="${ad.cname }" id="adname">
    <input type="hidden" value="${ad.ctel }" id="adtel">
    <input type="hidden" value="${ad.cemail }" id="ademail">
    <input type="hidden" value="${ad.cpost }" id="adpost">
    <input type="hidden" value="${ad.caddr }" id="adaddr">
    <input type="hidden" value="${ad.caddr2 }" id="adaddr2">
    </z:forEach>
            <div class="order_subsection v2">
                <!-- ++++++++++++++++++++ 주문자 :: START ++++++++++++++++++++ -->
                <h3 class="title3"><span designElement="text" textIndex="3"   >주문자 <button type="button" id="payinfo" class="btn_resp size_b color5" onclick="eddmember()">회원정보와 동일</button></span></h3>
                <div id="order_info_input" class="">
                    <div class="order_info_input">
                        <ul class="list_01 v2">
                            <li><input type="text" name="cname" id="cname" value="" class="pilsu" style="width:170px;" title="주문자 이름" placeholder="주문자 이름" required />
                            
                            <li>
                                <input type="tel" name="ctel1" id="ctel1" value="" class="pilsu" style="width:190px;" title="휴대폰" placeholder="-를 제외한 11자리 휴대폰번호" required />
                            </li>
                         
                            <li><input type="text" name="email" id="email" value="" class="pilsu size_email_full" title="이메일" placeholder="주문자 이메일" required /></li>
                        </ul>
                    </div>
                </div>
               
    
    
                <!-- ++++++++++++++++++++ 배송지 :: START ++++++++++++++++++++ -->
                <h3 class="title3"><span designElement="text">배송지</span></h3>
                <!-- 받는분 정보 입력 란 -->
                <div class="delivery_selecter delivery_info_input">    
                    <div class="settle_tab_contents tab_box2 delivery_input">
                        <ul class="list_01 v2">
                            <!-- 받는분 -->
                            <li>
                                <input type="text" name="person_nm" id="person_nm" class="pilsu" style="width:135px;" value="" placeholder="받는 사람 이름" required />
                            </li>
                            <!-- 국내 -->
                            <li class="domestic goods_delivery_info ">
                                <input type="hidden" name="" value="" class="hide" title="우편번호" />
                                <input type="text" name="person_post" id="person_post" value="" title="우편번호" class="pilsu size_zip_all" readonly required />
                                <button type="button" class="btn_resp size_b color4" id="search_post">검색</button>
                            </li>
                            <li class="domestic goods_delivery_info ">
                                <input type="text" name="person_addr" id="person_addr" value="" class="pilsu size_address" title="도로명 주소" readonly />
                            </li>
                            <li class="domestic goods_delivery_info ">
                                <input type="text" name="recipient_input_address_detail" value="" name="caddr2" id="caddr2"class="pilsu size_address" placeholder="상세주소" required />
                            </li>
                            <!-- 연락처 -->
                            <li>
                                <input type="tel" name="person_hp1" id="person_hp1" value="" class="pilsu" style="width:190px;" title="휴대폰" placeholder="-를 제외한 11자리 휴대폰번호" required /> 
                            </li>
                       
                            <!-- 이메일 -->
                            <li class="hide">
                                <input type="email" name="recipient_email" value="" id="email2" class="size_email_full" title="이메일" />
                            </li> 
                        </ul>
                    </div>
                </div>
    
                <!-- 배송 메세지 -->
                <div id="shipMessage" class="ship_message">
                    <input type="text" class="ship_message_txt" name="memo" id="memo" value="" title="배송 메세지 입력" placeholder="배송 메세지 입력" autocomplete="off" />
                </div>    
            </div>
        </div>
        <div class="subpage_container v2 Pt0 order_payment_right">
            <div class="order_subsection v2 ">
                <div class="right_flying_wrap1">
                    <div class="right_flying_wrap2">
                        <div class="right_flying_wrap3">
                            <!-- ++++++++++++++++++++ 결제 금액 :: START ++++++++++++++++++++ -->
                            <h3 class="title3 Pt15"><span designElement="text" textIndex="6"   >결제 금액</span></h3>
                            <div class="order_price_total">
                                <ul>
                                    <li class="th"><span class="gray_01 Fs17" designElement="text" textIndex="7"   >상품금액</span></li>
                                    <li class="td"><span id="total_goods_price" class="v2 gray_01"><fmt:formatNumber value="${tp}" pattern="#,###" /></span>&#x20a9;</li>
                                </ul>
                                <ul>
                                    <li class="th">
                                        <span designElement="text" textIndex="8"   >배송비</span>&nbsp;
                                        <button type="button" class="btn_resp size_a gray_05" onclick="showCenterLayer('#besongDetailList')"><span designElement="text" textIndex="9"   >내역</span></button>
                                    </li>
                                    <li class="td">
                                        (+) <span class="total_delivery_shipping_price">0</span>&#x20a9;
                                    </li>
                                </ul>
                                <ul>
                                    <li class="th">
                                        <span designElement="text" textIndex="10"   >할인금액</span>&nbsp;
                                        <button type="button" class="btn_resp size_a gray_05" onclick="showCenterLayer('#saleDetailList')"><span designElement="text" textIndex="11"   >내역</span></button>
                                    </li>
                                    <li class="td pointcolor3">
                                        <span>(-)</span>
                                        <span class="total_sales_price"><fmt:formatNumber value="${tdc}" pattern="#,###" /></span>&#x20a9;
                                    </li>
                                </ul>
                                <ul class="total">
                                    <li class="th"><span designElement="text" textIndex="14"   >최종 결제금액</span></li>
                                    <li class="td">
                                        <span class="price"><span class="settle_price"><fmt:formatNumber value="${tdcp}" pattern="#,###" /></span>&#x20a9;</span>
                                    </li>
                                </ul>
                            </div><br>
    
    						 <input type="button" value="주문수정" name="button_pay" onclick="back()" class="btn_resp size_extra color2 Wmax" />
                            <!-- ++++++++++++++++++++ 결제 금액 :: END ++++++++++++++++++++ -->
    
    
                            <!-- ++++++++++++++++++++ 결제 수단 :: START ++++++++++++++++++++ -->
                            <h3 class="title3"><span designElement="text" textIndex="17"   >결제 수단</span></h3>
                            <ul class="payment_method_select clearbox" id="payment_type">
    
                                
                                <li>
                                    <label><input type="radio" name="payment" value="bank"/>무통장입금</label>
                                </li>
                                
                                
                                <li>
                                    <label><input type="radio" name="payment" value="CARD" checked />신용카드</label>
                                </li>
                                <li>
                                        <label><input type="radio" name="payment" value="escrow_virtual" />가상계좌</label>                                
                                </li>
                            
                            </ul>
    
                            <ul class="payment_method_select hide" id="payment_type_zero">
                                <li><strong style="color:#4b4b4b;">전액할인</strong></li>
                            </ul>

                            <!--무통장입금 - 상세 -->
                            <ul class="list_01 v2 bank hide">
                                <li>
                                    <input type="text" name="depositor" value="" title="입금자명" />
                                </li>
                                <li>
                                    <select name="bank">
                                        <option value="">은행 선택</option>
                                        <option value="신한은행 100-033-200065 예금주:주식회사 서리">신한은행 100-033-200065 예금주:주식회사 서리</option>
                                        <option value="은행1 100-033-200065 예금주:주식회사 서리">신한은행 100-033-2000 예금주:주식회사 서리</option>
                                        <option value="은행2 100-033-200065 예금주:주식회사 서리">신한은행 100-033-2065 예금주:주식회사 서리</option>
                                    </select>
                                </li>
                            </ul>
                            <ul id="typereceiptlay" class="mt_sp1 hide">
                                <li class="labelgroup_design ">
                                    <label for="typereceiptuse1"><input type="radio" name="typereceiptuse" id="typereceiptuse1" value="1" > 발급</label>
                                    <label for="typereceiptuse0" class="on"><input type="radio" name="typereceiptuse" id="typereceiptuse0" value="0" checked="checked"> 발급 안 함</label>					
                                </li>
                                <li class="hide labelgroup_design" id="typereceiptchoice" >
                                    <label class='tax_voucherchk'><input type="radio" name="typereceipt" id="typereceipt1" value="1"> 세금계산서 </label>
                                </li>
                            </ul>
                            <div id="typereceipttablelay" class="hide">
    
                                <!-- ~~~~~~~ 현금영수증 신청 부분 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                                <ul id="cash_container" class="typereceiptlay list_01 v2 Mt5 hide">
                                    <li class="labelgroup_design">
                                        <label for="cuse0" class="on"><input type="radio" name="cuse" id="cuse0" value="0" checked="checked"> 개인 소득공제</label>
                                        <label for="cuse1"><input type="radio" name="cuse" id="cuse1" value="1"> 사업자 지출증빙</label>
                                    </li>
                                    <li id="personallay">
                                      <input type="tel" name="creceipt_number[0]" class="size_email_full" maxlength="13" title="휴대폰번호( '-' 없이 입력 )" />
                                    </li>
                                    <li id="businesslay" class="hide">
                                      <input type="tel" name="creceipt_number[1]" class="size_email_full" maxlength="10" title="사업자번호( '-' 없이 입력 )" />
                                    </li>
                                    <li id="personallay">
                                      <input type="email" name="sales_email" class="size_email_full" title="이메일주소" />
                                    </li>
                                    <li id="duplicate_message" class="desc">
                                        ※ 결제창에서 다시 현금영수증을 신청하지 마세요. 중복발행 됩니다.
                                    </li>
                                </ul>
                                <!-- ~~~~~~~ 세금계산서 신청 부분 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                                <ul id="tax_container" class="typereceiptlay list_01 v2 Mt10 hide">
                                    <li>
                                        <input type="text" name="co_name" id="co_name" value="" title="상호명" />
                                    </li>
                                    <li>
                                        <input type="tel" name="busi_no" id="busi_no" value="" title="사업자번호" /> <span class="desc">ex) 123-12-12345</span>
                                    </li>
                                    <li>
                                        <input type="text" name="co_ceo" id="co_ceo" value="" title="대표자명" />
                                    </li>
                                    <li>
                                        <input type="text" name="co_status" id="co_status" value="" title="업태" style="width:130px;" /> /
                                        <input type="text" name="co_type" id="co_type" value="" title="업종" style="width:130px;" />
                                    </li>
                                    <li>
                                        <input type="text" name="co_new_zipcode" class="size_zip_all" value="" title="우편번호" readonly />
                                        <button type="button" class="btn_resp size_b color4" onclick="openDialogZipcode_resp('co_');">검색</button>
                                        <input type="hidden" name="co_address_type" id="co_address_type" value="" title="주소" />
                                        <input type="text" name="co_address" id="co_address" value="" class="size_address Mt5 " title="주소" readonly />
                                        <input type="text" name="co_address_street" id="co_address_street" value="" class="size_address Mt5 hide" title="주소" readonly />
                                        <input type="text" name="co_address_detail" id="co_address_detail" value="" class="size_address Mt5" title="상세주소" />
                                    </li>
                                    <li>
                                        <input type="text" name="person" id="person" value="" title="담당자명" />
                                    </li>
                                    <li>
                                        <input type="email" name="email123" id="email123" value="" title="이메일주소" class="size_email_full" />
                                    </li>
                                    <li>
                                        <input type="tel" name="phone" id="phone" value="" title="연락처 " /> <span class="desc">숫자만 입력</span>
                                    </li>
                                </ul>
                            </div>
                            <!-- ++++++++++++++++++++ 결제 수단 :: END ++++++++++++++++++++ -->
    
                            <!-- ++++++++++++++++++++ 약관 동의 :: START ++++++++++++++++++++ -->
                            <h3 class="title3">약관 동의</h3>
                            <div class="mem_agree_area">
                                <label class="pilsu_agree_all2"><input type="checkbox" name="all_agree" id="all_agree" value="Y" /> 전체동의</label>
                                <ul id="odAgreeList" class="agree_list2">
                                    <li>
                                        <a class="agree_view">보기</a>
                                        <label><input type="checkbox" class="agree_chk" name="agree1" id="agree1" value="Y" /> <span class="title">쇼핑몰 이용 약관</span> <span class="desc pointcolor imp">(필수)</span></label>
                                    </li>
                                    <li>
                                        <a class="agree_view">보기</a>
                                        <label><input type="checkbox" class="agree_chk" name="agree2" id="agree2" value="Y" /> <span class="title">개인정보 수집 및 이용</span> <span class="desc pointcolor imp">(필수)</span></label>
                                    </li>
                                    <li>
                                        <a class="agree_view">보기</a>
                                        <label><input type="checkbox" class="agree_chk" name="agree3" id="agree3" value="Y" /> <span class="title">개인정보 제3자 제공 동의</span> <span class="desc pointcolor imp">(필수)</span></label>
                                    </li>
                                    <li>
                                        <a class="agree_view">보기</a>
                                        <label><input type="checkbox" class="agree_chk" name="agree4" id="agree4" value="Y" /> <span class="title">개인정보 취급위탁에 대한 동의</span> <span class="desc pointcolor imp">(필수)</span></label>
                                    </li>
                                </ul>
                            </div>
  </form>
    
                            <!-- 결제 버튼 -->
                            <div class="pay_layer btn_area_c" id="pay_layer1">
                                <input type="button" value="결제하기" name="button_pay" onclick="paynow()" class="btn_resp size_extra color2 Wmax" />
                               
                                <span class="hide"><input type="button" value="장바구니로" class="btn_resp size_extra" onclick="document.location.href='cart';" /></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    </div>

    <!-- 쿠폰 목록 레이어 -->
    <div id="couponDeatilLayer" class="resp_layer_pop">
        <h4 class="title">보유 쿠폰</h4>
        <div class="y_scroll_auto2">
            <div class="layer_pop_contents v5">
                <div id="coupon_ordersheet_lay">
                    <div id="coupon_ordersheet_select"></div>
                </div>
                <div id="coupon_goods_lay"></div>
                <div id="coupon_shipping_lay">
                    <div id="coupon_shipping_select"></div>
                </div>
            </div>
        </div>
        <div class="layer_bottom_btn_area2">
            <button type="button" id="coupon_order" class="btn_resp size_c color2 Wmax">적용</button>
        </div>
        <a href="" class="btn_resp btn_view_coupons" target="_blank">보유 쿠폰 전체 보기</a>
        <a href="" class="btn_pop_close"></a>
    </div>
    <!-- //본문내용 끝 -->
   
    <script type="text/javascript">
        $(function() {
            $( window ).on('resize', function() {
                if ( window.innerWidth != WINDOWWIDTH ) {
                    setTimeout(function(){ WINDOWWIDTH = window.innerWidth; }, 10);
                }
            });
        });
    </script>