package raky.train.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import raky.train.dao.UserDao;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if(UserDao.check(request.getParameter("username")))
		{
			try {
				response.getWriter().append("This user name has been occupied, please re-register! ");
				response.setContentType("text/html;charset=UTF-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				response.sendRedirect("register.html");
			}	
		}
		else{
			UserDao.register(request.getParameter("username"), request.getParameter("password"),
					 request.getParameter("truename"), request.getParameter("id_card"), 
					 request.getParameter("phone"));
			response.setContentType("text/html;charset=UTF-8");
			sleep(30000);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}

	private void sleep(int i) {
		for(int j=0;j<i;j++);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
