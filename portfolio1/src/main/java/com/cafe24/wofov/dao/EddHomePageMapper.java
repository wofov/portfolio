package com.cafe24.wofov.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.cafe24.wofov.domain.Admin_NoticeCountDTO;
import com.cafe24.wofov.domain.Admin_NoticeDTO;
import com.cafe24.wofov.domain.BasketListJoinDTO;
import com.cafe24.wofov.domain.EddFaqDTO;
import com.cafe24.wofov.domain.EddMemberDTO;
import com.cafe24.wofov.domain.HomePageDTO;
import com.cafe24.wofov.domain.ProductListDTO;
import com.cafe24.wofov.domain.ShoppingBasketDTO;

@Repository
@Mapper
public interface EddHomePageMapper {
	@Select("select * from product_wr")
	public List<ProductListDTO> ProductListView();
	@Select("select * from product_wr where pidx=#{pidx}")
	public ProductListDTO getItemPidx(String pidx);
	@Select("select * from hmpg order by idx desc limit 0,1")
	public List<HomePageDTO> getSiteInfo();
	@Select("select * from shopping_basket where sid=#{sid}")
	public List<ShoppingBasketDTO> IdCk(String sid);
	@Select("select p.pimg,p.pname,p.psub,p.bcode,b.ct,p.price,p.dc,p.dcprice,b.pidx from product_wr as p join shopping_basket as b on p.pidx=b.pidx where b.sid=#{sid}")
	public List<BasketListJoinDTO> BasketList(String sid);
	@Select("select * from eddmember where cid=#{cid}")
	public EddMemberDTO Eddcid(String cid);
	@Select("select * from eddmember where cid=#{cid}")
	public EddMemberDTO EddLogin(String cid);
	@Select("select fsel,fsub,fmain from faq limit 0,5")
	public List<EddFaqDTO> FAQ();
	@Select("select fsel,fsub,fmain from faq where fsel=#{cate}")
	public List<EddFaqDTO> FAQAll(String cate);
	
	@Select("select * from ad_notice where nyn='on' and nsub like #{search}")
	public List<Admin_NoticeDTO> getAd_Notice_All1(String search);
	@Select("select count(*) as ct from ad_notice where nyn is null and nsub like #{search}")
	public Admin_NoticeCountDTO getct(String search);
	@Select("select * from ad_notice where nyn is null and nsub like #{search} order by nidx desc limit #{stpg},#{pageview}")
	public List<Admin_NoticeDTO> getAd_Notice_All3(@Param("search")String search, @Param("stpg") Integer stpg,@Param("pageview")Integer pageview);
	
	@Select("select * from hmpg order by idx desc limit 0,1")
	public List<HomePageDTO> Footer();
	@Select("select * from eddmember where cid=#{cid}")
	public List<EddMemberDTO> MemberPay(String cid);
	
	
	@Insert("insert into shopping_basket values(#{idx},#{sid},#{pidx},#{ct})")
	public void BasketInsert(ShoppingBasketDTO dto);
	@Insert("insert into eddmember values(#{cidx},#{cid},#{cpw},#{cname},#{cemail},#{ctel},#{cpost},#{caddr},#{caddr2},#{recom},#{cpoint},#{ctime},#{couttime},#{emck})")
	public void EddMemberInsert(EddMemberDTO dto);
	
	
	@Update("update eddmember set emck='Y' where cid=#{cid}")
	public void EmailCk(String cid);
	
	
	@Delete("delete from shopping_basket where sid=#{cid} and pidx=#{pidx}")
	public void CartProductDelete(@Param("cid")String cid,@Param("pidx")String pidx);
}
