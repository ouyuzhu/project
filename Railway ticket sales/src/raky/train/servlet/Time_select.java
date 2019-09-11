package raky.train.servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import raky.train.dao.UserDao;
import raky.train.entity.Tickets;

/**
 * Servlet implementation class Time_select
 */
@WebServlet("/Time_select")
public class Time_select extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Time_select() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String time_alike=request.getParameter("time");
		LinkedList<Tickets> list=UserDao.time_select(time_alike);
		request.getSession().setAttribute("time_table", list);
		for(Tickets i:list)
		System.out.println(i.getStart());
		//response.getWriter().append("Served at: ");
		response.sendRedirect("timetable.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
