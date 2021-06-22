package com.to.t1.mypage;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.to.t1.board.BoardVO;
import com.to.t1.member.MemberMapper;
import com.to.t1.member.MemberVO;
import com.to.t1.toon.ToonVO;
import com.to.t1.util.Pager;

@Service
public class MypageService {
	
	@Autowired
	private MypageMapper mypageMapper;

	public List<RecentVO> getList(MemberVO memberVO, Pager pager) throws Exception {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		
		System.out.println();
		obj.put("memberVO", memberVO);
		obj.put("pager", pager);
		
		System.out.println(" 유저네임"+memberVO.getUsername());
		pager.makeRow(); 
		Long totalCount = mypageMapper.getTotalCount1(obj);
		System.out.println("totalcount : "+totalCount);
		pager.makeNum(totalCount); 
		
		return mypageMapper.getList(obj);
	}
	
	public int setDelete(RecentVO recentVO) throws Exception {
		return mypageMapper.setDelete(recentVO);
	}

	public List<RecentVO> getList2(MemberVO memberVO, Pager pager) throws Exception {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("memberVO", memberVO);
		obj.put("pager", pager);
		
		pager.makeRow();
		long totalCount = mypageMapper.getTotalCount2(obj);
		pager.makeNum(totalCount);
		
		return mypageMapper.getList2(obj);
	}
	
	public List<RecentVO> getList3(MemberVO memberVO, Pager pager) throws Exception {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		
		obj.put("memberVO", memberVO);
		obj.put("pager", pager);
	
		
		pager.makeRow();
		long totalCount = mypageMapper.getTotalCount3(obj);
		pager.makeNum(totalCount);
		
		
		return mypageMapper.getList3(obj);
	}
	
	public List<RecentVO> getList4(MemberVO memberVO, Pager pager) throws Exception {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		
		obj.put("memberVO", memberVO);
		obj.put("pager", pager);
	
		
		pager.makeRow();
		long totalCount = mypageMapper.getTotalCount4(obj);
		pager.makeNum(totalCount);
		
		
		return mypageMapper.getList4(obj);
	}
	
}
