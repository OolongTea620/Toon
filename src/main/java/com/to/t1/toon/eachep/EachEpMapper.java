package com.to.t1.toon.eachep;

import org.apache.ibatis.annotations.Mapper;

import com.to.t1.mypage.RecentVO;
import com.to.t1.review.ReviewVO;
import com.to.t1.toon.ToonVO;
import com.to.t1.util.Pager;

@Mapper
public interface EachEpMapper {

	public ToonVO getList(Pager pager)throws Exception;
	public Long getTotalCount(Pager pager)throws Exception;
	public ToonVO getSelect(EachEpVO eachEpVO)throws Exception;
	
	public int setHitUpdate(EachEpVO eachEpVO)throws Exception;
	public int setRecentToon(RecentVO recentVO)throws Exception;
	
	public int updateScore(ReviewVO reviewVO)throws Exception;
	public int deleteScore(ReviewVO reviewVO)throws Exception;

}
