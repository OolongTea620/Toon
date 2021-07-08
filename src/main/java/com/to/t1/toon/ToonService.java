package com.to.t1.toon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.to.t1.member.MemberVO;
import com.to.t1.review.ReviewVO;
import com.to.t1.util.Pager;

@Service
public class ToonService {
	@Autowired
	private ToonMapper toonMapper;
	

	public List<ToonVO> getList(Pager pager)throws Exception{
		return toonMapper.getList(pager);
	}
	
	public ToonVO getSelect(ToonVO toonVO) throws Exception{
		return toonMapper.getSelect(toonVO);
	}
	
	public long updateScore(ReviewVO reviewVO) throws Exception{
		return toonMapper.updateScore(reviewVO);
	}
	
	public long deleteScore(ReviewVO reviewVO) throws Exception{
		return toonMapper.deleteScore(reviewVO);
	}
	
	
	
	public List<ToonVO> index(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.index(toonVO,memberVO);
	}
	

	//toonDay--------------------------

	public List<ToonVO> toonDay(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.toonDay(toonVO,memberVO);
	}
	

	public List<ToonVO> toonDayAver(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.toonDayAver(toonVO,memberVO);
	}
	
	public List<ToonVO> toonDayRecent(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.toonDayRecent(toonVO,memberVO);
	}
	
	public List<ToonVO> toonDaySelect(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.toonDayRecent(toonVO,memberVO);
	}
	
	//genre-------------------------------

	public List<ToonVO> genre(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.genre(toonVO,memberVO);
	}
	

	public List<ToonVO> genreAver(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.genreAver(toonVO,memberVO);
	}
	
	public List<ToonVO> genreRecent(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.genreRecent(toonVO,memberVO);
	}
	
	//ranking---------------------------------------------

	
	public List<ToonVO> ranking(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.ranking(toonVO,memberVO);
	}
	
	public List<ToonVO> rankingAver(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.rankingAver(toonVO,memberVO);
	}
	
	public List<ToonVO> rankingRecent(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.rankingRecent(toonVO,memberVO);
	}
	
	//endRe--------------------------------------------------------
	
	
	public List<ToonVO> endRe(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.endRe(toonVO,memberVO);
	}
	
	public List<ToonVO> endReAver(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.endReAver(toonVO,memberVO);
	}
	
	public List<ToonVO> endReRecent(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.endReRecent(toonVO,memberVO);
	}
	//search
	public List<ToonVO> toonSearch(ToonVO toonVO,MemberVO memberVO) throws Exception{
		return toonMapper.toonSearch(toonVO, memberVO);
	}
	

	

	

	
}

