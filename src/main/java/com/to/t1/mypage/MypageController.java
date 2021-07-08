package com.to.t1.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.to.t1.favoriteToon.FavoritetoonVO;
import com.to.t1.member.MemberService;
import com.to.t1.member.MemberVO;
import com.to.t1.review.ReviewVO;
import com.to.t1.ticket.UseTicketVO;
import com.to.t1.util.Pager;


@Controller
@RequestMapping("/mypage/**")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private MemberService memberService;

	@GetMapping("recentToon") 
	public String getList(Model model, MemberVO memberVO, Pager pager)throws Exception{
		
		List<RecentVO> ar = mypageService.getList(memberVO, pager);
		
		memberVO = memberService.myPage(memberVO);	

		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		model.addAttribute("memberVO", memberVO);
		
		System.out.println(pager.getStartNum());
		System.out.println(pager.getLastNum());
		
		System.out.println("리센트툰");
		
		return "mypage/recentToon";
	}
	
	@GetMapping("delete")
	public String setDelete(HttpServletRequest request)throws Exception{
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i =0; i<size; i++) {
			mypageService.setDelete(ajaxMsg[i]);
		}	
		
		return "mypage/recentToon";
	}
	
	//댓글삭제
	@PostMapping("delete2")
	public String setDelete2(ReviewVO reviewVO, Model model,HttpServletRequest request)throws Exception{

		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i =0; i<size; i++) {
//			reviewService.delReview(reviewVO);
//			model.addAttribute("result", reviewService.delReview(reviewVO));
			mypageService.setDelete2(ajaxMsg[i]);
		}	
	
		return "mypage/review";
	}
	
	//관심 웹툰 삭제
	@PostMapping("delete3")
	public String setDelete3(FavoritetoonVO favoritetoonVO, Model model,HttpServletRequest request)throws Exception{

		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i =0; i<size; i++) {
//			reviewService.delReview(reviewVO);
//			model.addAttribute("result", reviewService.delReview(reviewVO));
			mypageService.setDelete3(ajaxMsg[i]);
		}	
	
		return "mypage/favoriteToon";
	}
	
	//구매한웹툰 삭제
	@PostMapping("delete4")
	public String setDelete4(UseTicketVO useTicketVO, Model model,HttpServletRequest request)throws Exception{

		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i =0; i<size; i++) {
//			reviewService.delReview(reviewVO);
//			model.addAttribute("result", reviewService.delReview(reviewVO));
			mypageService.setDelete4(ajaxMsg[i]);
		}	
	
		return "mypage/useToon";
	}

	@GetMapping("favoriteToon") 
	public String getList2(Model model, MemberVO memberVO, Pager pager)throws Exception{
		
		List<RecentVO> ar = mypageService.getList2(memberVO, pager);
		memberVO = memberService.myPage(memberVO);	
		System.out.println(ar);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		System.out.println("페이보릿툰");
		return "mypage/favoriteToon";
	}
	
	@GetMapping("useToon") 
	public String getList3(Model model, MemberVO memberVO, Pager pager)throws Exception{
		
		List<RecentVO> ar = mypageService.getList3(memberVO,  pager);
		
		memberVO = memberService.myPage(memberVO);	
		System.out.println(ar);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		System.out.println("구매웹툰");
		return "mypage/useToon";
	}
	
	@GetMapping("review") 
	public String getList4(Model model, MemberVO memberVO, Pager pager)throws Exception{
		
		List<RecentVO> ar = mypageService.getList4(memberVO,  pager);
		
		memberVO = memberService.myPage(memberVO);	
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "mypage/review";
	}
}
