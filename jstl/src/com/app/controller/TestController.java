package com.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Action;
import com.app.Result;

public class TestController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		Result result = new Result();
		List<String> datas = new ArrayList(Arrays.asList("A", "B", "C"));
		String name = req.getParameter("name");
		if(name != null) {
			name += "님";
		} else {
			name = "";
		}
//		req.setAttribute("name", name);
		req.setAttribute("datas", datas);
//		빈 문자열로 보내면 화면에서 empty로 검사가 가능하다.
		result.setPath("test.jsp?name=" + name);
		return result;
	}
	
}
