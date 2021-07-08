package com.to.t1.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MypageMapper {

	public List<RecentVO> getList(Map map) throws Exception; //최근 본 웹툰
	
	public List<RecentVO> getList2(Map map)throws Exception; //관심 웹툰
	
	public List<RecentVO> getList3(Map map)throws Exception; //구매 웹툰
	
	public List<RecentVO> getList4(Map map)throws Exception; //내 댓글
	
	public int setDelete(String recNum) throws Exception;
	
	public int setDelete2(String revNum) throws Exception; // 댓글 삭제
	
	public int setDelete3(String toonNum) throws Exception;
	
	public int setDelete4(String toonNum) throws Exception;
	
	public long getTotalCount1(Map map) throws Exception;
	
	public long getTotalCount2(Map map) throws Exception;
	
	public long getTotalCount3(Map map) throws Exception;
	
	public long getTotalCount4(Map map) throws Exception;
	
}