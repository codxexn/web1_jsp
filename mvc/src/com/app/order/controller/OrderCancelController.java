package com.app.order.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Action;
import com.app.Result;
import com.app.dao.OrderDAO;
import com.app.dao.ProductDAO;
import com.app.vo.OrderVO;

public class OrderCancelController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String[] orderIds = req.getParameterValues("orderId");
		String[] productIds = req.getParameterValues("productId");
		OrderDAO orderDAO = new OrderDAO();
		ProductDAO productDAO = new ProductDAO();
		Result result = new Result();
	
		for(int i=0; i<orderIds.length; i++) {
			OrderVO orderVO = new OrderVO();
			orderVO.setProductId(Long.parseLong(productIds[i]));
			orderVO.setProductCount(orderDAO.selectById(Long.parseLong(orderIds[i])));
			
			productDAO.updateStock(orderVO);
			orderDAO.delete(Long.parseLong(orderIds[i]));
		}
		
		result.setRedirect(true);
		result.setPath(req.getContextPath() + "/list.order");
		
		return result;
	}

}












