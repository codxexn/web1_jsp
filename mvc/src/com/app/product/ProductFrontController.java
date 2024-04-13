package com.app.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Result;
import com.app.product.controller.DeleteOkController;
import com.app.product.controller.ListController;
import com.app.product.controller.ReadController;
import com.app.product.controller.UpdateController;
import com.app.product.controller.UpdateOkController;
import com.app.product.controller.WriteOkController;

public class ProductFrontController extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String target = req.getRequestURI().replace(req.getContextPath() + "/", "").split("\\.")[0];
		Result result = null;
		
		if(target.equals("write")) {
			result = new Result();
			result.setPath("write.jsp");
		}else if(target.equals("write-ok")) {
			result = new WriteOkController().execute(req, resp);
			
		}else if(target.equals("list")) {
			result = new ListController().execute(req, resp);
			
		}else if(target.equals("read")) {
			result = new ReadController().execute(req, resp);
			
		}else if(target.equals("update")) {
			result = new UpdateController().execute(req, resp);
			
		}else if(target.equals("update-ok")) {
			result = new UpdateOkController().execute(req, resp);
			
		}else if(target.equals("delete-ok")) {
			result = new DeleteOkController().execute(req, resp);
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


















