package raky.train.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import raky.train.dao.AdminDao;
import raky.train.dao.UserDao;

/**
 * servlet 1、一个特殊的类，可以通过url地址来激活类的功能 2、程序员编写类，web服务器来创建对象并运行【所以它需要web服务器支持】
 * 3、使用servlet的方法步骤 i、自定义一个servlet类，需要继承抽象类HttpServlet，重写两个方法：doGet和doPost
 * ii、配置servlet ii.1使用注解@WebServlet("/login") ii.2在web.xml中配置
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public login() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1、获取数据
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String paramscheckCode = request.getParameter("kaptcha");
		// 从session中获取google kaptcha 插件生成的验证码
		String googlecode = request.getSession().getAttribute("session_code").toString();
		System.out.println(googlecode);
		System.out.println(username + " " + password);
		// 2.业务判断
		if (username.length()>0&&password.length()>0&&UserDao.check(username, password) && paramscheckCode.equalsIgnoreCase(googlecode)) {
			request.getSession().setAttribute("user",username);
			request.getRequestDispatcher("success.jsp").forward(request, response);
		}else if(!paramscheckCode.equalsIgnoreCase(googlecode)) {
			request.setAttribute("checkError", "验证码错误");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("failure.jsp").forward(request, response);
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doAdmin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (AdminDao.check(request.getParameter("username"), request.getParameter("password"))) {
			response.setContentType("text/html;charset=UTF-8");
			HttpSession session = request.getSession();
			session.setAttribute("admin", request.getParameter("username"));
			request.getRequestDispatcher("welc_admin.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("failure.jsp").forward(request, response);
		}
	}
}
