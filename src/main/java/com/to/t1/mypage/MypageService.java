package com.to.t1.mypage;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.to.t1.member.MemberVO;
import com.to.t1.util.Pager;

@Service
public class MypageService {
	
	@Autowired
	private MypageMapper mypageMapper;

	public List<RecentVO> getList(MemberVO memberVO, Pager pager) throws Exception {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		
		obj.put("memberVO", memberVO);
		obj.put("pager", pager);
		
		pager.makeRow(); 
		Long totalCount = mypageMapper.getTotalCount1(obj);
		
		pager.makeNum(totalCount); 
		
		return mypageMapper.getList(obj);
	}
	
	public int setDelete(String recNum) throws Exception {
		return mypageMapper.setDelete(recNum);
	}

	public int setDelete2(String revNum) throws Exception {

		return mypageMapper.setDelete2(revNum);
		
	}
	
	public int setDelete3(String toonNum) throws Exception {

		return mypageMapper.setDelete3(toonNum);
		
	}
	
	public int setDelete4(String toonNum) throws Exception {

		return mypageMapper.setDelete4(toonNum);
		
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
		
	
		
		pager.makeRow();
		obj.put("memberVO", memberVO);
		obj.put("pager", pager);
		long totalCount = mypageMapper.getTotalCount4(obj);
		pager.makeNum(totalCount);
		System.out.println(pager.getStartRow());
		System.out.println(pager.getPerPage());
		System.out.println(mypageMapper.getList4(obj).size());
		return mypageMapper.getList4(obj);
	}
	
}
