package raky.train.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.buf.Utf8Decoder;

import raky.train.dao.AdminDao;

/**
 * Servlet implementation class Add
 */
@WebServlet("/Add")
public class Add extends HttpServlet {
	private static final long serialVersionUID = 1L; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("Utf-8");
		response.setCharacterEncoding("UTF-8");
		boolean flag=AdminDao.add(request.getParameter("1"),request.getParameter("2"),request.getParameter("3"),
	             Integer.parseInt(request.getParameter("4")),request.getParameter("5"),request.getParameter("6"),
	             Double.parseDouble(request.getParameter("7")));
		if(flag) {
			response.setContentType("text/html;charset=UTF-8");
			response.sendRedirect("welc_admin.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
