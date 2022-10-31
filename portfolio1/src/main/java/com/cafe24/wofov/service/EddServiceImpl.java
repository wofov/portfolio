package com.cafe24.wofov.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.wofov.dao.EddHomePageMapper;
import com.cafe24.wofov.domain.Admin_NoticeCountDTO;
import com.cafe24.wofov.domain.Admin_NoticeDTO;
import com.cafe24.wofov.domain.BasketListJoinDTO;
import com.cafe24.wofov.domain.EddFaqDTO;
import com.cafe24.wofov.domain.EddMemberDTO;
import com.cafe24.wofov.domain.HomePageDTO;
import com.cafe24.wofov.domain.ProductListDTO;
import com.cafe24.wofov.domain.ShoppingBasketDTO;
@Service
public class EddServiceImpl implements EddService{
	@Autowired
	private EddHomePageMapper alMapper;
	
	@Override
	public List<ProductListDTO> ProductListView(){
		return alMapper.ProductListView();
	}
	@Override
	public ProductListDTO getItemPidx(String pidx) {
		return alMapper.getItemPidx(pidx);
	}
	@Override
	public List<HomePageDTO> getSiteInfo(){
		return alMapper.getSiteInfo();
	}
	@Override
	public List<ShoppingBasketDTO> IdCk(String sid) {
		return alMapper.IdCk(sid);
	}
	@Override
	public List<BasketListJoinDTO> BasketList(String sid){
		return alMapper.BasketList(sid);
	}
	@Override
	public EddMemberDTO Eddcid(String cid) {
		return alMapper.Eddcid(cid);
	}
	@Override
	public EddMemberDTO EddLogin(String cid) {
		return alMapper.EddLogin(cid);
	}
	@Override
	public List<EddFaqDTO> FAQ(){
		return alMapper.FAQ();
	}
	@Override
	public List<EddFaqDTO> FAQAll(String cate){
		return alMapper.FAQAll(cate);
	}
	@Override
	public List<HomePageDTO> Footer(){
		return alMapper.Footer();
	}
	
	
	@Override
	public List<Admin_NoticeDTO> getAd_Notice_All1(String search){
		return alMapper.getAd_Notice_All1(search);}
	@Override
	public Admin_NoticeCountDTO getct(String search) {
		return alMapper.getct(search);}
	@Override
	public List<Admin_NoticeDTO> getAd_Notice_All3(String search,Integer stpg,Integer pageview){
		return alMapper.getAd_Notice_All3(search,stpg,pageview);}
	@Override
	public List<EddMemberDTO> MemberPay(String cid){
		return alMapper.MemberPay(cid);
	}
	
	
	
	@Override
	public void BasketInsert(ShoppingBasketDTO dto) {
		alMapper.BasketInsert(dto);
	}
	@Override
	public void EddMemberInsert(EddMemberDTO dto) {
		alMapper.EddMemberInsert(dto);
	}
	
	
	@Override
	public void EmailCk(String cid) {
		alMapper.EmailCk(cid);
	}
	
	
	
	@Override
	public void CartProductDelete(String cid,String pidx) {
		alMapper.CartProductDelete(cid,pidx);
	}
	
}
