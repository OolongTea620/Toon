package com.to.t1.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.web.multipart.MultipartFile;

import com.to.t1.util.FileManager;

@Service
public class MemberService implements UserDetailsService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override //시큐리티에서 세션에 저장해주고 권한부여 해주고 로그인 처리해주는거
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(username);
		System.out.println("로그인 시도");
		memberVO = memberMapper.getLogin(memberVO);
		System.out.println("로그인 시도!!!!!!!!!!!!!!!");
		return memberVO;
	}
	
	public MemberVO myPage(MemberVO memberVO)throws Exception{
		return memberMapper.myPage(memberVO);
	}
	
	public boolean memberError(MemberVO memberVO, Errors errors)throws Exception{
		boolean result = false;

		result = errors.hasErrors();
//		if(!memberVO.getPassword().equals(memberVO.getPassword1())) {
//			errors.rejectValue("password1", "memberVO.password.notEqual");
//			result=true;
//		}
		
		MemberVO checkMember = memberMapper.getUsername(memberVO);
		if(checkMember !=null) {
			errors.rejectValue("username", "member.id.equal");

			result = true;
		}
		
		return result;	
	}
	
	public MemberVO getUsername(MemberVO memberVO)throws Exception{
		return memberMapper.getUsername(memberVO);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int setJoin(MemberVO memberVO, MultipartFile multipartFile, HttpSession session)throws Exception{
		
		//0. 사전 작업
		//a. password 암호화
		System.out.println(memberVO.getPassword());
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		System.out.println(memberVO.getPassword());
		//b. 사용자 계정 활성화
		memberVO.setEnabled(true);

		//1. Member Table 저장
		int result =memberMapper.setJoin(memberVO);
				
		//2. Role Table 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", memberVO.getUsername());
		map.put("roleName", "ROLE_MEMBER");
		result = memberMapper.setMemberRole(map);
		
		String filePath= "upload/member/";
		if(multipartFile.getSize() != 0) {
			
			String fileName= fileManager.save(multipartFile, filePath);
			System.out.println(fileName);
			JoinFileVO joinFileVO = new JoinFileVO();
			joinFileVO.setFileName(fileName);
			joinFileVO.setOriName(multipartFile.getOriginalFilename());
			joinFileVO.setUsername(memberVO.getUsername());
			result = memberMapper.setJoinFile(joinFileVO);
		}
		return result;
	}

//	public MemberVO getLogin(MemberVO memberVO)throws Exception{
//		return memberMapper.getLogin(memberVO);
//	}

	public int memberUpdate(MemberVO memberVO)throws Exception{
		return memberMapper.memberUpdate(memberVO);
	}
	
	public int memberDelete( HttpSession session, MemberVO memberVO)throws Exception{
		JoinFileVO joinFileVO = memberMapper.getJoinFile(memberVO);
		
		String filePath= "upload/member/";
		if(joinFileVO == null) {
			
		}else {
			boolean check = fileManager.delete(filePath, joinFileVO.getFileName(), session);
		}
		
		return memberMapper.memberDelete(memberVO);
	}
	
	
	public MemberVO searchId(MemberVO memberVO)throws Exception{
		return memberMapper.searchId(memberVO);
	}
	
	public MemberVO searchPw(MemberVO memberVO)throws Exception{
		return memberMapper.searchPw(memberVO);
	}
	
	public int pwUpdate(MemberVO memberVO)throws Exception{
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		return memberMapper.pwUpdate(memberVO);
	}
	
	public JoinFileVO getJoinFile(MemberVO memberVO)throws Exception{
		return memberMapper.getJoinFile(memberVO);
	}
	
	public MemberVO memberJoinCheck(MemberVO memberVO)throws Exception{
		return memberMapper.memberJoinCheck(memberVO);
	}
	
	public JoinFileVO selectImage(MemberVO memberVO)throws Exception{
		return memberMapper.selectImage(memberVO);
	}
	
	public int delImage(JoinFileVO joinFileVO)throws Exception{
		return memberMapper.delImage(joinFileVO);
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	   public int setImage(MemberVO memberVO,MultipartFile avatar)throws Exception {
	      String filePath= "upload/member/";
	      
	            
	         String fileName= fileManager.save(avatar, filePath); //db에 넣어주고, 경로 설정
	         System.out.println(fileName);
	         JoinFileVO joinFileVO = new JoinFileVO();
	         joinFileVO.setFileName(fileName);
	         joinFileVO.setOriName(avatar.getOriginalFilename());
	         joinFileVO.setUsername(memberVO.getUsername());
	         int result = memberMapper.setImage(joinFileVO);
	         
	      return result;
	}
	
}
