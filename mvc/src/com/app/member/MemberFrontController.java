package com.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Result;
import com.app.member.controller.MemberJoinOkController;
import com.app.member.controller.MemberLoginOkController;
import com.app.product.controller.DeleteOkController;
import com.app.product.controller.ListController;
import com.app.product.controller.ReadController;
import com.app.product.controller.UpdateController;
import com.app.product.controller.UpdateOkController;
import com.app.product.controller.WriteOkController;

public class MemberFrontController extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String target = req.getRequestURI().replace(req.getContextPath() + "/", "").split("\\.")[0];
		Result result = null;
		
		if(target.equals("join")) {
			result = new Result();
			result.setPath("join.jsp");
			
		}else if(target.equals("join-ok")) {
			result = new MemberJoinOkController().execute(req, resp);
			
		}else if(target.equals("login")) {
			result = new Result();
			result.setPath("login.jsp");
			
		}else if(target.equals("login-ok")) {
			result = new MemberLoginOkController().execute(req, resp);
			
		}else if(target.equals("logout")){
//			req.getSession().removeAttribute("memberEmail");
			req.getSession().invalidate();
			result = new Result();
			result.setRedirect(true);
			result.setPath(req.getContextPath() + "/login.member");
			
		}else {
			result = new Result();
			result.setPath("404.jsp");
		}
		
		if(result != null) {
			if(result.isRedirect()) {
				resp.sendRedirect(result.getPath());
			}else {
				req.getRequestDispatcher(result.getPath()).forward(req, resp);
			}
		}
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}


















