package com.app.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Action;
import com.app.Result;
import com.app.dao.ProductDAO;

public class ReadController implements Action{
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		Result result = new Result();
		Long id = Long.parseLong(req.getParameter("id"));
		ProductDAO productDAO = new ProductDAO();
//		조회한 상품이 있다면(null이 아니면) orElseThrow()는 Optional에 담아놓은 객체를 리턴한다.
//		하지만 조회한 상품이 없다면(null이라면) orElseThrow()에 전달한 람다를 실행한다(오류 발생)
//		오류가 발생하면 Handler를 통해 원하는 페이지로 이동시키는 것이 실무에서 사용하는 방식이다.
		req.setAttribute("product", productDAO.select(id).orElseThrow(() -> {throw new RuntimeException();}));
		result.setPath("read.jsp");
		return result;
	}

}




















