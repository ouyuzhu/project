package raky.train.servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import raky.train.dao.UserDao;

/**
 * Servlet implementation class Buy
 */
@WebServlet("/Buy")
public class Buy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Buy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user=(String)request.getSession().getAttribute("user");
	    Vector<String> a=new Vector<>();
	    String id = request.getParameter("tickets_id");
	    a.add(id);
	    String start = request.getParameter("start");
	    a.add(start);
	    String stop = request.getParameter("stop");
	    a.add(stop);
	    String s_time=request.getParameter("s_time");
	    a.add(s_time);
	    String a_time=request.getParameter("a_time");
	    a.add(a_time);
	    String votes=request.getParameter("votes");
	    a.add(votes);
	    String price=request.getParameter("price");
	    a.add(price);
	    System.out.println(id+" "+start+" "+stop+" "+s_time+" "+a_time+" "+votes+" "+price);
		boolean flag=UserDao.buy(user, a);
		if(flag)response.getWriter().append("Success").append(request.getContextPath());
		response.sendRedirect("order.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
