package com.to.t1.toon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.to.t1.review.ReviewVO;
import com.to.t1.util.Pager;

@Service
public class ToonService {
	@Autowired
	private ToonMapper toonMapper;
	
	public List<ToonVO> getList()throws Exception{
		return toonMapper.getList();
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
}