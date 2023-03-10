package model2.mvcmember;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mvcmember/isLogin.do")
public class isLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("isLogin doGet()");
		
		String mode = request.getParameter("mode");
		HttpSession session = request.getSession();
		
		System.out.println(mode);
		
		if(mode.equals("mylist")) {
			if(session.getAttribute("UserId") != null) {
				response.sendRedirect("/WebProject01/MyPageMain.jsp");
			}
			else {
				response.sendRedirect("/WebProject01/LoginForm.jsp");
			}
		}
		else if(mode.equals("wishlist")) {
			if(session.getAttribute("UserId") != null) {
				response.sendRedirect("/WebProject01/WishList.jsp");
			}
			else {
				response.sendRedirect("/WebProject01/LoginForm.jsp");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
