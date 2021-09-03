
package com.to.t1.toon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.to.t1.member.MemberService;
import com.to.t1.member.MemberVO;
import com.to.t1.util.Pager;

@Controller
@RequestMapping("/toon/**")
public class ToonController {
	@Autowired
	private ToonService toonService;
	
	@Autowired
	private MemberService memberService;

	@GetMapping("toonList")
	public void getList(Pager pager, Model model, Authentication auth2)throws Exception{
		List<ToonVO> list=toonService.getList(pager);
		model.addAttribute("list", list);
		model.addAttribute("listsize", list.size());
	}
	
	@GetMapping("toonSelect")
	public void getSelect(ToonVO toonVO, Authentication auth2,MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();

		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }
		
		toonVO= toonService.getSelect(toonVO);
		mv.addObject("toonVO", toonVO);
		
	}

	@GetMapping("toonSearch")
	public ModelAndView toonSearch(ToonVO toonVO,MemberVO memberVO, Authentication auth2)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }
		
		List<ToonVO> search = toonService.toonSearch(toonVO, memberVO);
		
		mv.addObject("toonSearch", search);
		mv.setViewName("toon/toonSearch");
		
		
		
		return mv;
	}
	
	@GetMapping("toonIndex")
	   public ModelAndView toonIndex(ToonVO toonVO,MemberVO memberVO, Authentication auth2) throws Exception {
	      ModelAndView mv = new ModelAndView();
	      
	      if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	    	  
	      }
	      
	      toonVO.setTotalHit(0);
			List<ToonVO> index = toonService.toonIndex(toonVO,memberVO);
			
			
			mv.addObject("toonIndex", index);
			
	      mv.setViewName("toon");
	      
	      System.out.println("username"+memberVO.getUsername());
	    
	      return mv ;
	   }
	//모르겠당
	
	
	
	@GetMapping("toonDay")
	   public ModelAndView toonDay(ToonVO toonVO,MemberVO memberVO, Authentication auth2) throws Exception {
	      ModelAndView mv = new ModelAndView();	      
	      if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);}
	      
	      toonVO.setToonDay("mon");
	      List<ToonVO> mt = toonService.toonDay(toonVO,memberVO);
	      
	      toonVO.setToonDay("tue");
	      List<ToonVO> tt = toonService.toonDay(toonVO,memberVO);
	      
	      toonVO.setToonDay("wen");
	      List<ToonVO> wt = toonService.toonDay(toonVO,memberVO);
	      
	      toonVO.setToonDay("thu");
	      List<ToonVO> tt2 = toonService.toonDay(toonVO,memberVO);
	      
	      toonVO.setToonDay("fri");
	      List<ToonVO> ft = toonService.toonDay(toonVO,memberVO);
	      
	      toonVO.setToonDay("sat");
	      List<ToonVO> st = toonService.toonDay(toonVO,memberVO);
	      
	      toonVO.setToonDay("sun");
	      List<ToonVO> st2 = toonService.toonDay(toonVO,memberVO);
	      	      
	      mv.addObject("mt", mt);
	      mv.addObject("tt", tt);
	      mv.addObject("wt", wt);
	      mv.addObject("tt2", tt2);
	      mv.addObject("ft", ft);
	      mv.addObject("st", st);
	      mv.addObject("st2", st2);
	      mv.setViewName("toon/toonDay/toonDay");
	      
	      System.out.println("username"+memberVO.getUsername());
	    
	      return mv ;
	   }
	
	
	@GetMapping("toonDayAver")
	public ModelAndView toonDayAver(ToonVO toonVO,MemberVO memberVO, Authentication auth2) throws Exception {
		ModelAndView mv = new ModelAndView();		
		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }		
		toonVO.setToonDay("mon");
		List<ToonVO> mt = toonService.toonDayAver(toonVO,memberVO);
		
		toonVO.setToonDay("tue");
		List<ToonVO> tt = toonService.toonDayAver(toonVO,memberVO);
		
		toonVO.setToonDay("wen");
		List<ToonVO> wt = toonService.toonDayAver(toonVO,memberVO);
		
		toonVO.setToonDay("thu");
		List<ToonVO> tt2 = toonService.toonDayAver(toonVO,memberVO);
		
		toonVO.setToonDay("fri");
		List<ToonVO> ft = toonService.toonDayAver(toonVO,memberVO);
		
		toonVO.setToonDay("sat");
		List<ToonVO> st = toonService.toonDayAver(toonVO,memberVO);
		
		toonVO.setToonDay("sun");
		List<ToonVO> st2 = toonService.toonDayAver(toonVO,memberVO);		
		
		mv.addObject("mt", mt);
		mv.addObject("tt", tt);
		mv.addObject("wt", wt);
		mv.addObject("tt2", tt2);
		mv.addObject("ft", ft);
		mv.addObject("st", st);
		mv.addObject("st2", st2);
		mv.setViewName("toon/toonDay/toonDayAver");
		return mv ;
	}
	
	@GetMapping("toonDayRecent")
	public ModelAndView toonDayRecent(ToonVO toonVO, MemberVO memberVO, Authentication auth2)throws Exception{
		ModelAndView mv = new ModelAndView();
	
		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }
		
		toonVO.setToonDay("mon");
		List<ToonVO> mt = toonService.toonDayRecent(toonVO,memberVO);
		
		toonVO.setToonDay("tue");
		List<ToonVO> tt = toonService.toonDayRecent(toonVO,memberVO);
		
		toonVO.setToonDay("wen");
		List<ToonVO> wt = toonService.toonDayRecent(toonVO,memberVO);
		
		toonVO.setToonDay("thu");
		List<ToonVO> tt2 = toonService.toonDayRecent(toonVO,memberVO);
		
		toonVO.setToonDay("fri");
		List<ToonVO> ft = toonService.toonDayRecent(toonVO,memberVO);
		
		toonVO.setToonDay("sat");
		List<ToonVO> st = toonService.toonDayRecent(toonVO,memberVO);
		
		toonVO.setToonDay("sun");
		List<ToonVO> st2 = toonService.toonDayRecent(toonVO,memberVO);
		
		
		mv.addObject("mt", mt);
		mv.addObject("tt", tt);
		mv.addObject("wt", wt);
		mv.addObject("tt2", tt2);
		mv.addObject("ft", ft);
		mv.addObject("st", st);
		mv.addObject("st2", st2);
		mv.setViewName("toon/toonDay/toonDayRecent");
		return mv ;
	}
	
	@GetMapping("toonDaySelect")
	public ModelAndView toonDaySelect(ToonVO toonVO, MemberVO memberVO, Authentication auth2)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }
		
		toonVO.setToonDay("mon");
		List<ToonVO> mt = toonService.toonDayRecent(toonVO,memberVO);
		
		toonVO.setToonDay("tue");
		List<ToonVO> tt = toonService.toonDayRecent(toonVO,memberVO);
		
		toonVO.setToonDay("wen");
		List<ToonVO> wt = toonService.toonDayRecent(toonVO,memberVO);
		
		toonVO.setToonDay("thu");
		List<ToonVO> tt2 = toonService.toonDayRecent(toonVO,memberVO);
		
		toonVO.setToonDay("fri");
		List<ToonVO> ft = toonService.toonDayRecent(toonVO,memberVO);
		
		toonVO.setToonDay("sat");
		List<ToonVO> st = toonService.toonDayRecent(toonVO,memberVO);
		
		toonVO.setToonDay("sun");
		List<ToonVO> st2 = toonService.toonDayRecent(toonVO,memberVO);
		
		
		mv.addObject("mt", mt);
		mv.addObject("tt", tt);
		mv.addObject("wt", wt);
		mv.addObject("tt2", tt2);
		mv.addObject("ft", ft);
		mv.addObject("st", st);
		mv.addObject("st2", st2);
		mv.setViewName("toon/toonDay/toonDaySelect");
		return mv ;
	}
	
	
	@GetMapping("genre")
	public ModelAndView genre(ToonVO toonVO,MemberVO memberVO, Authentication auth2)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }
		
		toonVO.setGenre("action");
		List<ToonVO> ac = toonService.genre(toonVO,memberVO);
		
		toonVO.setGenre("school");
		List<ToonVO> sc = toonService.genre(toonVO,memberVO);
		
		toonVO.setGenre("romance");
		List<ToonVO> ro = toonService.genre(toonVO,memberVO);		
		
		toonVO.setGenre("fantasy");
		List<ToonVO> fa = toonService.genre(toonVO,memberVO);
		
		toonVO.setGenre("thriller");
		List<ToonVO> th = toonService.genre(toonVO,memberVO);
		
		toonVO.setGenre("comedy");
		List<ToonVO> co = toonService.genre(toonVO,memberVO);
		
		mv.addObject("action", ac);
		mv.addObject("school", sc);
		mv.addObject("romance", ro);		
		mv.addObject("fantasy", fa);
		mv.addObject("thriller", th);
		mv.addObject("comedy", co);		

		mv.setViewName("toon/genre/genre");
		
		return mv;
	}
	
	@GetMapping("genreAver")
	public ModelAndView genreAver(ToonVO toonVO,MemberVO memberVO, Authentication auth2)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }
		
		toonVO.setGenre("action");
		List<ToonVO> ac = toonService.genreAver(toonVO,memberVO);
		
		toonVO.setGenre("school");
		List<ToonVO> sc = toonService.genreAver(toonVO,memberVO);
		
		toonVO.setGenre("romance");
		List<ToonVO> ro = toonService.genreAver(toonVO,memberVO);		
		
		toonVO.setGenre("fantasy");
		List<ToonVO> fa = toonService.genreAver(toonVO,memberVO);
		
		toonVO.setGenre("thriller");
		List<ToonVO> th = toonService.genreAver(toonVO,memberVO);
		
		toonVO.setGenre("comedy");
		List<ToonVO> co = toonService.genreAver(toonVO,memberVO);
		
		mv.addObject("action", ac);
		mv.addObject("school", sc);
		mv.addObject("romance", ro);		
		mv.addObject("fantasy", fa);
		mv.addObject("thriller", th);
		mv.addObject("comedy", co);		

		mv.setViewName("toon/genre/genreAver");
		
		return mv;
	}
	
	@GetMapping("genreRecent")
	public ModelAndView genreRecent(ToonVO toonVO,MemberVO memberVO, Authentication auth2)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }
		
		toonVO.setGenre("action");
		List<ToonVO> ac = toonService.genreRecent(toonVO,memberVO);
		
		toonVO.setGenre("school");
		List<ToonVO> sc = toonService.genreRecent(toonVO,memberVO);
		
		toonVO.setGenre("romance");
		List<ToonVO> ro = toonService.genreRecent(toonVO,memberVO);		
		
		toonVO.setGenre("fantasy");
		List<ToonVO> fa = toonService.genreRecent(toonVO,memberVO);
		
		toonVO.setGenre("thriller");
		List<ToonVO> th = toonService.genreRecent(toonVO,memberVO);
		
		toonVO.setGenre("comedy");
		List<ToonVO> co = toonService.genreRecent(toonVO,memberVO);
		
		mv.addObject("action", ac);
		mv.addObject("school", sc);
		mv.addObject("romance", ro);		
		mv.addObject("fantasy", fa);
		mv.addObject("thriller", th);
		mv.addObject("comedy", co);		

		mv.setViewName("toon/genre/genreRecent");
		
		return mv;
	}
	
	@GetMapping("ranking")
	public ModelAndView ranking(ToonVO toonVO,MemberVO memberVO, Authentication auth2)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }
		
		toonVO.setTotalHit(0);
		List<ToonVO> ra = toonService.ranking(toonVO,memberVO);
		toonVO.setTotalHit(0);
		List<ToonVO> ra2 = toonService.ranking(toonVO,memberVO);
		
		mv.addObject("rank", ra);
		mv.addObject("rank2", ra2);
		
		mv.setViewName("toon/ranking/ranking");
		
		return mv;
	}
	
	@GetMapping("rankingAver")
	public ModelAndView rankingAver(ToonVO toonVO,MemberVO memberVO, Authentication auth2)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }
		
		toonVO.setTotalHit(0);
		List<ToonVO> ra = toonService.rankingAver(toonVO,memberVO);
		toonVO.setTotalHit(0);
		List<ToonVO> ra2 = toonService.rankingAver(toonVO,memberVO);
		
		mv.addObject("rank", ra);
		mv.addObject("rank2", ra2);
		
		mv.setViewName("toon/ranking/rankingAver");
		
		return mv;
	}
	
	@GetMapping("rankingRecent")
	public ModelAndView rankingRecent(ToonVO toonVO,MemberVO memberVO, Authentication auth2)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }
		
		toonVO.setTotalHit(0);
		List<ToonVO> ra = toonService.rankingRecent(toonVO,memberVO);
		toonVO.setTotalHit(0);
		List<ToonVO> ra2 = toonService.rankingRecent(toonVO,memberVO);
		
		mv.addObject("rank", ra);
		mv.addObject("rank2", ra2);
		
		mv.setViewName("toon/ranking/rankingRecent");
		
		return mv;
	}
	
	
	@GetMapping("endRe")
	public ModelAndView endKr(ToonVO toonVO,MemberVO memberVO, Authentication auth2)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }
		
		toonVO.setTotalHit(0);
		List<ToonVO> en = toonService.endRe(toonVO,memberVO);
		
		mv.addObject("end", en);
		mv.setViewName("toon/end/endRe");
		
		return mv;
	}
	
	@GetMapping("endReAver")
	public ModelAndView endKrAver(ToonVO toonVO,MemberVO memberVO, Authentication auth2)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }
		
		toonVO.setTotalHit(0);
		List<ToonVO> en = toonService.endReAver(toonVO,memberVO);
		
		mv.addObject("end", en);
		mv.setViewName("toon/end/endReAver");
		
		return mv;
	}
	
	@GetMapping("endReRecent")
	public ModelAndView endKrRecent(ToonVO toonVO,MemberVO memberVO, Authentication auth2)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(auth2 != null) {
	    	  memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
	    	  mv.addObject("memberVO",memberVO);
	      }
		
		toonVO.setTotalHit(0);
		List<ToonVO> en = toonService.endReRecent(toonVO,memberVO);
		
		mv.addObject("end", en);
		mv.setViewName("toon/end/endReRecent");
		
		return mv;
	}
	
	
	
}