package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/islogin.do")
public class IsLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("isLogin doGet()");
		
		String mode = request.getParameter("mode");
		System.out.println(mode);
		
		HttpSession session = request.getSession();
		
		MemberDAO dao = new MemberDAO();
		
		int cnt = dao.reviewCount((String)session.getAttribute("UserId"));
		
		if(mode.equals("mylist")) {
			if(session.getAttribute("UserId") != null) {
				request.setAttribute("reviewCnt", cnt); //내가 쓴 리뷰 몇개인지 표시 위해
				request.getRequestDispatcher("/Member/MyPageMain.jsp").forward(request, response);
			}
			else {
				response.sendRedirect("/Member/LoginForm.jsp");
			}
		}
		else if(mode.equals("wishlist")) {
			if(session.getAttribute("UserId") != null) {
				request.getRequestDispatcher("/Member/WishList.jsp").forward(request, response);
			}
			else {
				response.sendRedirect("/Member/LoginForm.jsp");
			}
		}
		else if(mode.equals("join")) {
			if(session.getAttribute("UserId") != null) {
				response.sendRedirect("/Member/LoginForm.jsp");
			}
			else {
				response.sendRedirect("/Member/Join.jsp");
			}
		}else if(mode.equals("login")) {
			response.sendRedirect("/Member/LoginForm.jsp");
		}
		
		dao.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
