package com.to.t1.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.to.t1.toon.ToonService;
import com.to.t1.toon.eachep.EachEpService;
import com.to.t1.util.Pager;

@Controller
@RequestMapping("/review/**")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ToonService toonService;
	@Autowired
	private EachEpService eachEpService;
	
	@PostMapping("setReview")
	public void setReview(ReviewVO reviewVO, Model model,Authentication auth)throws Exception{
		if(auth!=null) {
			reviewVO.setUsername(auth.getName());
			toonService.updateScore(reviewVO);
			eachEpService.updateScore(reviewVO);
			reviewService.setReview(reviewVO);
			//리뷰리스트를 js에서 리로드하기 위해서 추가 
			Pager pager = new Pager();
			pager.setEpNum(reviewVO.getEpNum());
			pager.setToonNum(reviewVO.getToonNum());
			model.addAttribute("result", reviewService.getList(pager));
		}		
	}
	
	@PostMapping("delReview")
	public void delReview(ReviewVO reviewVO, Model model,Authentication auth)throws Exception{
		if(auth!=null) {
			reviewVO.setUsername(auth.getName());
			toonService.deleteScore(reviewVO);
			eachEpService.deleteScore(reviewVO);
			model.addAttribute("result", reviewService.delReview(reviewVO));
		}
	}
	
	@PostMapping("updateReview")
	public void updateReview(ReviewVO reviewVO, Model model,Authentication auth)throws Exception{
		if(auth!=null) {
			reviewVO.setUsername(auth.getName());
			model.addAttribute("result", reviewService.updateReview(reviewVO));
		}
	}
}