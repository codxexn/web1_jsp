package com.app.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.Action;
import com.app.Result;
import com.app.dao.MemberDAO;
import com.app.vo.MemberVO;

public class MemberLoginOkController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		MemberVO memberVO = new MemberVO();
		MemberDAO memberDAO = new MemberDAO();
		String memberEmail = null;
		Result result = new Result();
		HttpSession session = req.getSession();
		
		result.setRedirect(true);
		
		memberVO.setMemberEmail(req.getParameter("memberEmail"));
		memberVO.setMemberPassword(req.getParameter("memberPassword"));
		
		memberEmail = memberDAO.select(memberVO);
		
		if(memberEmail == null) {
			result.setPath(req.getContextPath() + "/login.member?login=false");
			return result;
		}
		session.setAttribute("memberEmail", memberEmail);
		result.setPath(req.getContextPath() + "/list.product");
		
		return result;
	}

}















