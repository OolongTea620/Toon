package com.to.t1.toon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.to.t1.member.MemberVO;
import com.to.t1.review.ReviewVO;
import com.to.t1.util.Pager;

@Mapper
public interface ToonMapper {

	public List<ToonVO> getList(Pager pager)throws Exception;
	public Long getTotalCount(Pager pager)throws Exception;
	public ToonVO getSelect(ToonVO toonVO)throws Exception;
	
	public long updateScore(ReviewVO reviewVO)throws Exception;
	public long deleteScore(ReviewVO reviewVO)throws Exception;
	public long setHitUpdate(ToonVO toonVO)throws Exception;
	
	//미정 기능 사용시 controller, service 추가 요망
	public long setInsert(ToonVO toonVO)throws Exception;
	public long setUpdate(ToonVO toonVO)throws Exception;
	public long setDelete(ToonVO toonVO)throws Exception;
	
	public List<ToonVO> index(@Param("toonVO") ToonVO toonVO,@Param("memberVO") MemberVO memberVO)throws Exception;
	
	public List<ToonVO> toonDay(@Param("toonVO") ToonVO toonVO,@Param("memberVO") MemberVO memberVO)throws Exception;
	public List<ToonVO> toonDayAver(ToonVO toonVO, MemberVO memberVO)throws Exception;
	public List<ToonVO> toonDayRecent(ToonVO toonVO, MemberVO memberVO)throws Exception;
	public List<ToonVO> toonDaySelect(ToonVO toonVO, MemberVO memberVO)throws Exception;
	
	public List<ToonVO> genre(@Param("toonVO") ToonVO toonVO,@Param("memberVO") MemberVO memberVO)throws Exception;
	public List<ToonVO> genreAver(ToonVO toonVO, MemberVO memberVO)throws Exception;
	public List<ToonVO> genreRecent(ToonVO toonVO, MemberVO memberVO)throws Exception;
	
	
	public List<ToonVO> ranking(ToonVO toonVO,MemberVO memberVO)throws Exception;
	public List<ToonVO> rankingAver(ToonVO toonVO,MemberVO memberVO)throws Exception;
	public List<ToonVO> rankingRecent(ToonVO toonVO,MemberVO memberVO)throws Exception;
	
	public List<ToonVO> endRe(ToonVO toonVO,MemberVO memberVO)throws Exception;
	public List<ToonVO> endReAver(ToonVO toonVO,MemberVO memberVO)throws Exception;
	public List<ToonVO> endReRecent(ToonVO toonVO,MemberVO memberVO)throws Exception;

	public List<ToonVO> toonSearch(@Param("toonVO") ToonVO toonVO,@Param("memberVO") MemberVO memberVO)throws Exception;
	
	
}

