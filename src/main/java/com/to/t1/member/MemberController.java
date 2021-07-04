package com.to.t1.member;

import java.util.Enumeration;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
    private JavaMailSender javaMailSender;

	@Autowired
    private PasswordEncoder passwordEncoder;
	
	@GetMapping("login")
	public String getLogin()throws Exception{
		return "member/memberLogin";
	}
	
	@PostMapping("memberLogin")
	public String getLogin(HttpServletRequest request)throws Exception{
		System.out.println("Message : "+ request.getAttribute("message"));
		
		return "member/memberLogin"; 
	}
	
	@GetMapping("loginFail")
	public String loginFail()throws Exception{
		System.out.println("Login Fail");
		return "member/memberLoginResult";
	}
	
	@GetMapping("memberLoginResult")
	public String memberLoginResult(HttpSession session, Authentication auth2, Model model)throws Exception{
		
		MemberVO memberVO =new MemberVO();
		//session의 속성명들 꺼내오기 
		
		memberVO = memberService.myPage(memberVO);	
		
		Enumeration<String> en = session.getAttributeNames();
		
		while(en.hasMoreElements()) {
			System.out.println("Attribute Name : "+en.nextElement());
		}
		
		//로그인 시 session의 속성명 : SPRING_SECURITY_CONTEXT
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		
		SecurityContextImpl sc = (SecurityContextImpl)obj;
		
		Authentication auth= sc.getAuthentication();
		System.out.println("===================================");
		System.out.println("Name : "+auth.getName());
		System.out.println("Details : "+auth.getDetails());
		System.out.println("Principal : "+auth.getPrincipal());
		System.out.println("Authorities : "+auth.getAuthorities());
		System.out.println("===================================");
		
		System.out.println("===================================");
		System.out.println("Name : "+auth2.getName());
		System.out.println("Details : "+auth2.getDetails());
		System.out.println("Principal : "+auth2.getPrincipal());
		System.out.println("Authorities : "+auth2.getAuthorities());
		System.out.println("===================================");
		
		
		System.out.println(obj);
		
		System.out.println("Login 성공");
		
		return "member/memberLoginResult2";
	}

//	@PostMapping("login")
//	public String getLogin(MemberVO memberVO, HttpSession session)throws Exception{
//
//		memberVO = memberService.getLogin(memberVO);
//
//		if(memberVO != null) {
//			session.setAttribute("member", memberVO);
//		}
//
//		return "redirect:/";
//	}

	//@GetMapping("logout")
//	public String logout(HttpSession session)throws Exception{
//
//		session.invalidate();
//
//		return "redirect:../";
//	}

	@GetMapping("myPage") 
	public String myPage(MemberVO memberVO, HttpSession session, Authentication auth2, Model model)throws Exception{
		System.out.println(auth2.getPrincipal());
		
		memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
		model.addAttribute("memberVO", memberVO);
		
		System.out.println("마이페이지 사진");
		
		System.out.println(memberVO);

		return  "member/myPage";
	}
	
	@PostMapping("changePassword")
	@ResponseBody
	public String changePassword(MemberVO memberVO, Authentication auth2, String newpassword, String newpassword2, Model model)throws Exception{
		
		String message = "";
		
		UserDetails userDetails = (UserDetails)auth2.getPrincipal(); //세션에 있는 유스디테일을 갖고옴
		memberVO.setUsername(userDetails.getUsername());
		
		boolean result = passwordEncoder.matches(memberVO.getPassword(), userDetails.getPassword()); //matches : 왼쪽값 오른쪽 비번 비교하느거
		
		if(result) {
			if(newpassword.equals(newpassword2)) {
				memberVO.setPassword(newpassword); 
				int result2 = memberService.pwUpdate(memberVO);
				if(result2>0) {
					message="비밀번호가 성공적으로 변경되었습니다.";
				}
			}else {
				message="변경된 비밀번호가 일치하지않습니다.";
			}
		}else {
			message="현재 비밀번호가 일치하지않습니다.";
		}
		
	
		System.out.println(auth2.getPrincipal());
		
		memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
		model.addAttribute("memberVO", memberVO);
		
		model.addAttribute("msg", message);
		
		System.out.println(message);

		return message;
	}
	
	
	@GetMapping("changePassword") 
	public String changePassword(MemberVO memberVO, Authentication auth2, Model model)throws Exception{
	
		System.out.println(auth2.getPrincipal());
		
		memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
		model.addAttribute("memberVO", memberVO);
		
		System.out.println("비번변경");	

		return  "member/changePassword";
	}


	@PostMapping("getJoinFile") 
	public void getJoinFile(MemberVO memberVO,Model model)throws Exception{
		model.addAttribute("pic", "pic");
	}
	
	@GetMapping("searchId") 
	public void searchId()throws Exception{
	}

	@PostMapping("searchId")
    @ResponseBody
	public String searchId(MemberVO memberVO,Model model)throws Exception{
		memberVO = memberService.searchId(memberVO);

		String message = "이름과 핸드폰 불일치";

		if(memberVO == null) {
			message="이름과 핸드폰 불일치";
			
		} else {
			message="회원님의 아이디는 " + memberVO.getUsername()+" 입니다.";
		}

		model.addAttribute("msg", message);
		System.out.println(message);

		return message;
		
	}

	@GetMapping("memberIdCheck")
	public String memberIdCheck(MemberVO memberVO, Model model)throws Exception{
		memberVO = memberService.getUsername(memberVO);
		String result = "0";
		if(memberVO==null) {
			result="1";
		}

		model.addAttribute("result", result);
		return "common/ajaxResult";
	}

	@GetMapping("searchPw") 
	public void searchPw()throws Exception{
	}

	@PostMapping("searchPw")
    @ResponseBody
	public String searchPw(MemberVO memberVO,Model model)throws Exception{
		
		MemberVO memberVO2 = memberService.searchPw(memberVO);
		String message = "아이디와 핸드폰 불일치";

		if(memberVO2 == null) {
			message="아이디와 핸드폰 불일치";
			
		} else {
			memberVO.setPassword("0000");
			int result = memberService.pwUpdate(memberVO);
	
			message="회원님의 비밀번호는 (00000000)으로 초기화 되었습니다.";
		}

		model.addAttribute("msg", message);

		return message;
	}

	@RequestMapping("memberJoinCheck")
	public void memberJoinCheck()throws Exception{}
	
	@PostMapping("memberJoinCheck")
	@ResponseBody
	public String memberJoinCheck(MemberVO memberVO)throws Exception{
		 memberVO = memberService.memberJoinCheck(memberVO);
		 
		 String message="";
		 
		 if(memberVO==null) {
			 message="아이디가 사용가능합니다.";
		 }else {
			 message="아이디가 중복됩니다.";
		 }
		 
		 return message;
	}

	@GetMapping("join")
	public String setJoin(@ModelAttribute MemberVO memberVO)throws Exception{
		return "member/memberJoin";
	}

	@PostMapping("join")
	public String setJoin(@Valid MemberVO memberVO,Errors errors, MultipartFile avatar, HttpSession session, Model model)throws Exception{
		System.out.println("Join Process" + memberVO.getName().length());
		if(memberService.memberError(memberVO, errors)) {
			return "member/memberJoin";
			
		} 	
		int result = memberService.setJoin(memberVO, avatar, session);
		String message = "회원가입 실패";
		String path="./memberJoin";
		
		if(result>0) {
			message ="축)회원 가입 성공";
			path="../";
		}
		
		model.addAttribute("msg", message);
		model.addAttribute("path", path);
		return "common/commonResult";
	}

	@RequestMapping("memberUpdate")
	public String memberUpdate(MemberVO memberVO, HttpSession session, Authentication auth2, Model model)throws Exception{
		System.out.println(auth2.getPrincipal());
		
		memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
		model.addAttribute("memberVO", memberVO);
		
		System.out.println("업데이트 페이지");

		return  "member/memberUpdate";
	}

	@PostMapping("memberUpdate")
	public String memberUpdate(MemberVO memberVO, Authentication auth2, HttpSession session, Model model)throws Exception{
		System.out.println(memberVO);
		
		int result = memberService.memberUpdate(memberVO);
		
		memberVO = memberService.myPage(memberVO);
		
		String message = "정보 수정 실패하였습니다";
		String path = "../";
		
		if(result>0) {
			session.setAttribute("member", memberVO);
			model.addAttribute("memberVO", memberVO);
			message ="정보 수정 성공하였습니다.";
		}
		System.out.println(result);
		
		model.addAttribute("msg", message);
		model.addAttribute("path", "./myPage");
		return "common/commonResult";
	}
	
	@GetMapping("memberDelete")
	   @ResponseBody
	   public String memberDelete(MemberVO memberVO ,Authentication authentication,HttpSession session)throws Exception{
		  ModelAndView mv = new ModelAndView();
	      String message ="";
	      UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	      memberVO.setUsername(userDetails.getUsername());
	      boolean result = passwordEncoder.matches(memberVO.getPassword(), userDetails.getPassword());
	      System.out.println(memberVO);
	      System.out.println(result);
	      if(result) {
	         memberService.memberDelete(session,memberVO);
	         message="탈퇴 되었습니다.";
	         mv.addObject("path", "./logout");
	      }else {
	         message="비밀번호가 일치하지않습니다.";
	      }
	  		return message;
	}

	   @GetMapping("CheckMail")
	   @ResponseBody
	   public String SendMail(Model model,String email, HttpSession session) {
	      Random random = new Random();
	      String key = "";
	     
	      SimpleMailMessage message = new SimpleMailMessage();
	      message.setTo(email); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
	      // 입력 키를 위한 코드
	      for (int i = 0; i < 3; i++) {
	         int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
	         key += (char) index;
	      }
	     
	      int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
	      key += numIndex;
	      message.setSubject("TOON 인증번호");
	      message.setText("TOON 인증번호입니다.\n"+"인증 번호 : "+key);
	      javaMailSender.send(message);
	      model.addAttribute("key", key);
	      System.out.println(key);
	      
	      return key;
	   }
	  
	   @PostMapping("setImage")
	   @ResponseBody
	   public String setImage(@Valid MemberVO memberVO,Errors errors, MultipartFile avatar,Authentication authentication) throws Exception{
	      System.out.println(avatar.getOriginalFilename());
	      String message="";
		   if(avatar.getSize()==0) {
	         message= "파일이없습니다.";
	      }
	      UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	      memberVO.setUsername(userDetails.getUsername()); //시큐리티에 있는 유저네임을 멤버브이오 유저네임에 집어넣음
	      System.out.println(memberVO);
	      JoinFileVO joinFileVO = memberService.selectImage(memberVO); //이미지가 있는지 없는지 찾음
	      System.out.println(joinFileVO);
	      if(joinFileVO==null) { //값이없으면 세팅
	         int result1 = memberService.setImage(memberVO, avatar);
	         System.out.println(result1);
	      }else { //값이 있으면 삭제하고 세팅
	         int result = memberService.delImage(joinFileVO);
	         int result1 = memberService.setImage(memberVO, avatar);
	         System.out.println(result1);
	      }
	      message="업로드 되었습니다.";   
	      System.out.println(message);
	      return message;
	   }

	   @PostMapping("delImage")
	   @ResponseBody
	   public String delImage(MemberVO memberVO,Authentication authentication)throws Exception{
	      String message= "";
	      UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	      memberVO.setUsername(userDetails.getUsername());
	      System.out.println(memberVO);
	      JoinFileVO joinFileVO = memberService.selectImage(memberVO);
	      if(joinFileVO==null) {
	         message="삭제할 사진이없습니다.";
	      }else {
	         
	         int result = memberService.delImage(joinFileVO);
	         message="사진이 삭제되었습니다.";
	      }
	      
	      
	      return message;
	   }
	  
	   
}

