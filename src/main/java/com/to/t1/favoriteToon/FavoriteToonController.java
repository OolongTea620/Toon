package com.to.t1.favoriteToon;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/favorite/**")
public class FavoriteToonController {

	@Autowired
	private FavoriteToonService favoriteToonService;
	
	@PostMapping("setFavorite")
	public void setFavorite(FavoritetoonVO favoritetoonVO, Model model,Authentication auth)throws Exception{
		if(auth!=null) {
			favoritetoonVO.setUsername(auth.getName());
			model.addAttribute("result", favoriteToonService.setFavorite(favoritetoonVO));
		}		
	}
	
	@PostMapping("delFavorite")
	@ResponseBody	//ajax등 데이터를 요청한 곳으로 값을 바로 전송
	public int delFavorite(FavoritetoonVO favoritetoonVO, Model model,Authentication auth)throws Exception{
		int result=0;
		if(auth!=null) {
			favoritetoonVO.setUsername(auth.getName());
			result=favoriteToonService.delFavorite(favoritetoonVO);
		}
		
		return result;
	}

}
