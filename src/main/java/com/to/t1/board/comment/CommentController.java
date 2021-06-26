package com.to.t1.board.comment;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.to.t1.member.MemberService;
import com.to.t1.member.MemberVO;

 
@Controller
@RequestMapping("/comment")
public class CommentController {
 
    @Autowired
    private CommentService commentService;
    
    @Autowired
    private MemberService memberService;
    
    
    @RequestMapping("/commentList") //댓글 리스트
    @ResponseBody
    private List<CommentVO> commentList(CommentVO commentVO, Model model) throws Exception{

        return commentService.commentList(commentVO);
    }
    
    @RequestMapping("/insert") //댓글 작성 
    @ResponseBody
    private long commentInsert(@RequestParam long boNum, @RequestParam String commentContents, Authentication auth2, MemberVO memberVO) throws Exception {
        
    	memberVO = memberService.myPage((MemberVO) auth2.getPrincipal());
    	
        CommentVO commentVO = new CommentVO();
        commentVO.setBoNum(boNum);
        commentVO.setCommentContents(commentContents);
        commentVO.setUsername(memberVO.getUsername());        
        
        return commentService.commentInsert(commentVO);
    }
    
    @RequestMapping("/update") //댓글 수정  
    @ResponseBody
    private long commentUpdate(@RequestParam long coNum, @RequestParam String commentContents) throws Exception{
    	
        CommentVO commentVO = new CommentVO();
        commentVO.setCoNum(coNum);
        commentVO.setCommentContents(commentContents);
  
        return commentService.commentUpdate(commentVO);
    }
    
    @RequestMapping("/delete/{coNum}") //댓글 삭제  
    @ResponseBody
    private long commentDelete(@PathVariable long coNum) throws Exception{
        
        return commentService.commentDelete(coNum);
    }
    
}