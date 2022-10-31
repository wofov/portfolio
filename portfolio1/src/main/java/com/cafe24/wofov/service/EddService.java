package com.cafe24.wofov.service;

import java.util.List;

import com.cafe24.wofov.domain.Admin_NoticeCountDTO;
import com.cafe24.wofov.domain.Admin_NoticeDTO;
import com.cafe24.wofov.domain.BasketListJoinDTO;
import com.cafe24.wofov.domain.EddFaqDTO;
import com.cafe24.wofov.domain.EddMemberDTO;
import com.cafe24.wofov.domain.HomePageDTO;
import com.cafe24.wofov.domain.ProductListDTO;
import com.cafe24.wofov.domain.ShoppingBasketDTO;

public interface EddService {
	public List<ProductListDTO> ProductListView();
	public ProductListDTO getItemPidx(String pidx);
	public List<HomePageDTO> getSiteInfo();
	public List<ShoppingBasketDTO> IdCk(String sid);
	public List<BasketListJoinDTO> BasketList(String sid);
	public EddMemberDTO Eddcid(String cid);
	public EddMemberDTO EddLogin(String cid);
	public List<EddFaqDTO> FAQ();
	public List<EddFaqDTO> FAQAll(String cate);
	
	public List<Admin_NoticeDTO> getAd_Notice_All1(String search);
	public Admin_NoticeCountDTO getct(String search);
	public List<Admin_NoticeDTO> getAd_Notice_All3(String sear,Integer stpg,Integer pageview);
	public List<HomePageDTO> Footer();
	public List<EddMemberDTO> MemberPay(String cid);
	
	public void BasketInsert(ShoppingBasketDTO dto);
	public void EddMemberInsert(EddMemberDTO dto);
	
	public void EmailCk(String cid);
	
	public void CartProductDelete(String cid,String pidx);
	
}
