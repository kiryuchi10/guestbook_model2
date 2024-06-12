package himedia.controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;

public abstract class BaseServlet extends HttpServlet{
	protected String dbuser = null;
	protected String dbpass = null;
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		
		//	Context Parameter 받아오기
		ServletContext context = getServletContext();
		dbuser= context.getInitParameter("dbuser");
		dbpass= context.getInitParameter("dbpass");
		
	}
	
	
}
