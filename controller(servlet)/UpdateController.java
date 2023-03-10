package model2.mvcmember;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;

@WebServlet("/mvcmember/update.do")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("update doPost()");
		
		String pass = request.getParameter("newPass");
		String id = request.getParameter("id");
		
		System.out.println(pass);
		System.out.println(id);
		
		MemberDAO dao = new MemberDAO();
		dao.newPass(id, pass);
		
		response.sendRedirect("/WebProject01/LoginForm.jsp");
	}

}
