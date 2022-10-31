package com.cafe24.wofov.service;

import java.util.List;

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

public interface AdminService {
	//Select
	public Admin_LoginDTO getjid(String jid);
	public List<Admin_LoginDTO> getAll();
	public List<HomePageDTO> getSiteInfo();
	public List<Admin_NoticeDTO> getAd_Notice_All1();
	public Admin_NoticeCountDTO getct();
	public List<Admin_NoticeDTO> getAd_Notice_All3(Integer stpg,Integer pageview);
	public List<AdminProductDTO> getproductAll(String sear);
	public List<AdminProductDTO> getproductAllpname(String sear);
	public List<Admin_NoticeDTO> getviewidx(String nidx);
	public AdminProductDTO getCheck(String pcode);
	public List<ProductBcodeDTO> getbcodeAll();
	public List<ProductScodeDTO> getscodeAll(String scode);
	public List<ProductCategoryDTO> getproductcatemenuAll(String sh);
	public List<ProductCategoryDTO> getproductcatecodeAll(String sh);
	public List<ShoppingCouponDTO> getcouponAll();
	
	//Insert
	public void InsertAdminJoin(Admin_LoginDTO dto);
	public void InsertSiteInfo(HomePageDTO dto);
	public void AdminNoticeInsert(Admin_NoticeDTO dto);
	public void InsertProduct(AdminProductDTO dto);
	public void InsertCate(ProductCategoryDTO dto);
	public void InsertCoupon(ShoppingCouponDTO dto);
	
	//Update
	public void getjidx(Integer jidx);
	public void UpdateNoticeFileNo(Admin_NoticeDTO dto);
	public void UpdateNoticeFileOk(Admin_NoticeDTO dto);
	public void UpdateAdminInfo(AdminInfoUpdateDTO dto);
	
	//Delete
	public void getjidx2(Integer jidx);
	public void AdminNoticeDelete(String nidx);
	public void AdminProductDelete(String pidx);
	public void CateListDelete(String code);
	public void ProductCodeDelete(String code);
	
	
}
