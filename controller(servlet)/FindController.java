package model2.mvcmember;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;

@WebServlet("/mvcmember/find.do")
public class FindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("find doGet()");
		String mode = request.getParameter("mode");
		System.out.println(mode);
		
		if(mode.equals("pass")) {
			response.sendRedirect("/WebProject01/Find.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("find doPost()");
		
		String askOpt = request.getParameter("optVal");
		String answer = request.getParameter("answer");
		String id = request.getParameter("id");
		//System.out.println(askOpt);
		
		MemberDAO dao = new MemberDAO();
		boolean isChk = dao.findPass(id, askOpt, answer);
		
		//System.out.println(isChk);
		
		request.setAttribute("isChk", isChk + "");
		request.setAttribute("id", id);
		request.getRequestDispatcher("/WebProject01/Find.jsp").forward(request, response);
	}
}
