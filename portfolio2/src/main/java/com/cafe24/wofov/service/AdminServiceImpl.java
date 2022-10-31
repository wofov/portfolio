package com.cafe24.wofov.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.HierarchicalMessageSource;
import org.springframework.stereotype.Service;

import com.cafe24.wofov.dao.Admin_LoginMapper;
import com.cafe24.wofov.domain.AdminInfoUpdateDTO;
import com.cafe24.wofov.domain.AdminProductDTO;
import com.cafe24.wofov.domain.Admin_LoginDTO;
import com.cafe24.wofov.domain.Admin_NoticeCountDTO;
import com.cafe24.wofov.domain.Admin_NoticeDTO;
import com.cafe24.wofov.domain.HomePageDTO;
import com.cafe24.wofov.domain.ProductBcodeDTO;
import com.cafe24.wofov.domain.ProductCategoryDTO;
import com.cafe24.wofov.domain.ProductScodeDTO;
import com.cafe24.wofov.domain.ShoppingCouponDTO;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private Admin_LoginMapper alMapper;
	
	//Select
	@Override
	public Admin_LoginDTO getjid(String jid) {
		return alMapper.getjid(jid);}
	@Override
	public List<Admin_LoginDTO> getAll(){
		return alMapper.getAll();}
	@Override
	public List<HomePageDTO> getSiteInfo(){
		return alMapper.getSiteInfo();}
	@Override
	public List<Admin_NoticeDTO> getAd_Notice_All1(){
		return alMapper.getAd_Notice_All1();}
	@Override
	public Admin_NoticeCountDTO getct() {
		return alMapper.getct();}
	@Override
	public List<Admin_NoticeDTO> getAd_Notice_All3(Integer stpg,Integer pageview){
		return alMapper.getAd_Notice_All3(stpg,pageview);}
	@Override
	public List<AdminProductDTO> getproductAll(String sear){
		return alMapper.getproductAll(sear);}
	@Override
	public List<AdminProductDTO> getproductAllpname(String sear){
		return alMapper.getproductAllpname(sear);}
	@Override
	public List<Admin_NoticeDTO> getviewidx(String nidx){
		return alMapper.getviewidx(nidx);}
	@Override
	public AdminProductDTO getCheck(String pcode) {
		return alMapper.getCheck(pcode);}
	@Override
	public List<ProductBcodeDTO> getbcodeAll(){
		return alMapper.getbcodeAll();}
	@Override
	public List<ProductScodeDTO> getscodeAll(String scode){
		return alMapper.getscodeAll(scode);}
	@Override
	public List<ProductCategoryDTO> getproductcatemenuAll(String sh){
		return alMapper.getproductcatemenuAll(sh);}
	@Override
	public List<ProductCategoryDTO> getproductcatecodeAll(String sh){
		return alMapper.getproductcatecodeAll(sh);}
	@Override
	public List<ShoppingCouponDTO> getcouponAll(){
		return alMapper.getcouponAll();}
	
	
	//Insert
	@Override
	public void InsertAdminJoin(Admin_LoginDTO dto) {
		alMapper.InsertAdminJoin(dto);}
	@Override
	public void InsertSiteInfo(HomePageDTO dto) {
		alMapper.InsertSiteInfo(dto);}
	@Override
	public void AdminNoticeInsert(Admin_NoticeDTO dto) {
		alMapper.AdminNoticeInsert(dto);}
	@Override
	public void InsertProduct(AdminProductDTO dto) {
		alMapper.InsertProduct(dto);}
	@Override
	public void InsertCate(ProductCategoryDTO dto) {
		alMapper.InsertCate(dto);}
	@Override
	public void InsertCoupon(ShoppingCouponDTO dto) {
		alMapper.InsertCoupon(dto);}
	
	
	//Update
	@Override
	public void getjidx(Integer jidx) {
		alMapper.getjidx(jidx);}
	@Override
	public void UpdateNoticeFileNo(Admin_NoticeDTO dto){
		alMapper.UpdateNoticeFileNo(dto);}
	@Override
	public void UpdateNoticeFileOk(Admin_NoticeDTO dto){
		alMapper.UpdateNoticeFileOk(dto);}
	@Override
	public void UpdateAdminInfo(AdminInfoUpdateDTO dto) {
		alMapper.UpdateAdminInfo(dto);
	}
	
	
	//Delete
	@Override
	public void getjidx2(Integer jidx) {
		alMapper.getjidx(jidx);}
	@Override
	public void AdminNoticeDelete(String nidx) {
		alMapper.AdminNoticeDelete(nidx);}
	@Override
	public void AdminProductDelete(String pidx) {
		alMapper.AdminProductDelete(pidx);}
	@Override
	public void CateListDelete(String code) {
		alMapper.CateListDelete(code);}
	@Override
	public void ProductCodeDelete(String code) {
		alMapper.ProductCodeDelete(code);}

}
