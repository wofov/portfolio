<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="z"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
int size = (Integer)request.getAttribute("size");
int w = 0;%>
<meta charset="utf-8">
<script>
function prlist(bcode) {
var ajax = new XMLHttpRequest();
ajax.open("post","./pr?bcode="+bcode,true);
ajax.send();
ajax.onload = function() {
   if(ajax.status==200){
	   var info = ajax.response;
   	}
}
}
</script>
<div class="title_group1">
    <h3 class="title1"><span designElement="text" textIndex="1"  textTemplatePath="cmVzcG9uc2l2ZV93cmlzdHdhdGNoX2NsYXNzaWNfZ2wvbWFpbi9pbmRleC5odG1s" >Celebrity Collection</span></h3>
</div>
<div class="show_display_col4">
<style>
.designDisplay_633b83b7559e9 .goods_list li.gl_item{ width:300px; }
</style>

<div id='designDisplay_633b83b7559e9' class='designDisplay' designElement='display' templatePath='main/index.html' displaySeq='10344' page='' perpage='' category='' displayStyle='responsible'>
<ul class="displayTabContainer displayTabType1">
        <li class="current" style="width:25%" onclick="prlist(00)">전체 상품</li>
        <li style="width:25%" onclick="prlist(01)">서랍장</li>
        <li style="width:25%" onclick="prlist(02)">소파</li>
        <li style="width:25%" onclick="prlist(03)">매트리스</li>
</ul>

<div class="designDisplay_633b83b7559e9 display_responsible_class displayTabContentsContainer displayTabContentsContainerBox" style="display: block;">
<style>
    .designDisplay_633b83b7559e9.goods_list li.gl_item{ width:300px; }
</style>
<ul class="goods_list designDisplay_633b83b7559e9 goods_info_style_2">

    
<!--Celebrity Collection 상품출력 반복코드 -->
 <z:forEach var="ad" items="${productlist}">
 <input type="hidden" value="${ad.bcode }" id="bcode">
<li class="gl_item" id="check">
<div class="gl_inner_item_wrap">
    <!--상품이미지-->
    <div class="gli_image goodsDisplayImageWrap">
        <a href="javascript:void(0);" class="respItemImageArea" onclick="display_goods_view('767','',this,'goods_view')">
            <img src="http://wofov.cafe24.com/portfolio2/upload/${ad.pimg }" data-src="./product/767_2022051214434020.jpg" class="goodsDisplayImage lazyload" onerror="this.src='./images/noimage.gif'" alt="[디앤에이] 아우라 천연가죽 4인소파"/>
        </a>
        <div class="respGoodsZzim">
            <a class="zzimArea" href="javascript:void(0)" onclick="display_goods_zzim(this, 767)">
                <img src="./images/icon_zzim.png" class="zzimImage normal " alt="찜하기" title="찜하기" />
                <img src="./images/icon_zzim_on.png" class="zzimImage active hide" alt="찜한 상품" title="찜한 상품" />
            </a>
        </div>
    </div>

    <div class="resp_display_goods_info infO_style_2">
    <!-- +++++++++++++++++++++++++++++++++ NEW 상품 정보 ++++++++++++++++++++++++++++++++ -->
        <!-- 컬러옵션 -->
        <div class="goodS_info displaY_color_option">
        </div>

        <div class="infO_group">

            <!-- 브랜드명 -->
            <div class="goodS_info displaY_brand_name">
                <span class="areA">AQUARIC</span>
            </div>

            <!-- 상품명-->
            <div class="goodS_info displaY_goods_name">
                <span class="areA"><a href="./item?idx=${ad.pidx }">${ad.pname }</a></span>
            </div>
        </div>

        <!-- 짧은 설명 -->
        <div class="goodS_info displaY_goods_short_desc">
            <span class="areA">${ad.psub }</span>
        </div>

        <div class="infO_group">
            <!-- (할인혜택)판매가 -->
            <div class="goodS_info displaY_sales_price">
                <span class="areA">
                    <span class="nuM"><fmt:formatNumber value="${ad.price}" pattern="#,###" /></span>&#x20a9;
                </span>
            </div>
        </div>
    </div>
</div>
</li>
</z:forEach>
<!--Celebrity Collection 상품출력 반복코드 끝 -->

</div>