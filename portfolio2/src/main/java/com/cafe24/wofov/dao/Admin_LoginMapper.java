package com.cafe24.wofov.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

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

@Repository//자바코드를 어느정도 숨기기위해서
@Mapper
public interface Admin_LoginMapper {
	@Select("select * from admin_join where jid=#{jid}")public Admin_LoginDTO getjid(String jid);
	
	@Select("select * from admin_join where jenum='Y'")public List<Admin_LoginDTO> getAll();
	
	@Select("select * from hmpg order by idx desc limit 0,1")public List<HomePageDTO> getSiteInfo();
	
	@Select("select * from ad_notice where nyn='on'")public List<Admin_NoticeDTO> getAd_Notice_All1();
	
	@Select("select count(*) as ct from ad_notice where nyn is null")public Admin_NoticeCountDTO getct();
	
	@Select("select * from ad_notice where nyn is null order by nidx desc limit #{stpg},#{pageview}")
	public List<Admin_NoticeDTO> getAd_Notice_All3(@Param("stpg") Integer stpg,@Param("pageview")Integer pageview);
	
	@Select("select * from product_wr where pcode like #{sear}")public List<AdminProductDTO> getproductAll(String sear);
	
	@Select("select * from product_wr where pname like #{sear}")public List<AdminProductDTO> getproductAllpname(String sear);
	
	@Select("select * from ad_notice where nidx=#{nidx}")public List<Admin_NoticeDTO> getviewidx(String nidx);
	
	@Select("select pcode from product_wr where pcode=#{pcode}")public AdminProductDTO getCheck(String pcode);
	
	@Select("select distinct bcode from ad_cate order by bcode")public List<ProductBcodeDTO> getbcodeAll();
	
	@Select("select scode from ad_cate where bcode=#{scode}")public List<ProductScodeDTO> getscodeAll(String scode);
	
	@Select("select * from ad_cate where bmenu like #{sh} or smenu like #{sh}")
	public List<ProductCategoryDTO> getproductcatemenuAll(String sh);
	
	@Select("select * from ad_cate where bcode like #{sh} or scode like #{sh} or code like #{sh}")
	public List<ProductCategoryDTO> getproductcatecodeAll(String sh);
	
	@Select("select * from newcp order by idx desc")public List<ShoppingCouponDTO> getcouponAll();
	
	
	@Insert("insert into admin_join values(#{jidx},#{jid},#{jpw},#{jname},#{jemail},#{jtel},#{jm1},#{jm2},#{jtime},#{jenum})")
	public void InsertAdminJoin(Admin_LoginDTO dto);
	@Insert("insert into hmpg values(#{idx},#{hmjoin_sub},#{hmjoin_email},#{hmjoin_poenum},#{hmjoin_point},#{hmjoin_level},#{basic_na},#{basic_lnum},#{basic_ld},#{basic_ltel},#{basic_tnum},#{basic_bnum},#{basic_addrnum},#{basic_addr},#{basic_jna},#{basic_email},#{pay_bank},#{pay_banknum},#{paycard},#{paytel},#{payha},#{paymi},#{payma},#{paycash},#{pay_adna},#{pay_adpay},#{pay_hope},#{time})")
	public void InsertSiteInfo(HomePageDTO dto);
	@Insert("insert into ad_notice values(#{nidx},#{nyn},#{nsub},#{nwr},#{nfile},#{nmain},#{ntime})")
	public void AdminNoticeInsert(Admin_NoticeDTO dto);
	@Insert("insert into product_wr values(#{pidx},#{bcode},#{scode},#{pcode},#{pname},#{psub},#{price},#{dc},#{dcprice},#{pct},#{market},#{nopro},#{pimg},#{pimg2},#{pimg3},#{pmain},#{pd},#{code})")
	public void InsertProduct(AdminProductDTO dto);
	@Insert("insert into ad_cate values(#{cidx},#{code},#{bcode},#{bmenu},#{ck},#{scode},#{smenu},#{cenum},#{jtime})")
	public void InsertCate(ProductCategoryDTO dto);
	@Insert("insert into newcp values(#{idx},#{cpname},#{cpw},#{stda},#{endda},#{cpsel},#{nump},#{mp},#{file},#{time})")
	public void InsertCoupon(ShoppingCouponDTO dto);
	
	
	@Update("update admin_join set jenum='N' where jidx=#{jidx}")public void getjidx(Integer jidx);
	
	@Update("update ad_notice set nyn=#{nyn}, nsub=#{nsub}, nmain=#{nmain} where nidx=#{nidx}")
	public void UpdateNoticeFileNo(Admin_NoticeDTO dto);
	
	@Update("update ad_notice set nyn=#{nyn}, nsub=#{nsub}, nmain=#{nmain}, nfile=#{nfile} where nidx=#{nidx}")
	public void UpdateNoticeFileOk(Admin_NoticeDTO dto);
	@Update("update admin_join set jpw=#{jpw}, jname=#{jname},jemail=#{jemail}, jtel=#{jtel}, jm1=#{jm1}, jm2=#{jm2} where jid=#{jid}")
	public void UpdateAdminInfo(AdminInfoUpdateDTO dto);
	
	
	@Delete("delete from admin_join where jidx=#{jidx}")public void getjidx2(Integer jidx);
	@Delete("delete from ad_notice where nidx=#{nidx}")public void AdminNoticeDelete(String nidx);
	@Delete("delete from product_wr where pidx=#{pidx}")public void AdminProductDelete(String pidx);
	@Delete("delete from ad_cate where code=#{code}")public void CateListDelete(String code);
	@Delete("delete from product_wr where code=#{code}")public void ProductCodeDelete(String code);


	

	
	
}
