package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/find.do")
public class FindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("find doGet()");
		String mode = request.getParameter("mode");
		System.out.println("mode = " + mode);
		
		if(mode.equals("pass")) {
			response.sendRedirect("/Member/Find.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("find doPost()");
		
		String askOpt = request.getParameter("optVal");
		String answer = request.getParameter("answer");
		String id = request.getParameter("id");
		//System.out.println(askOpt);
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		boolean isChk = dao.findPass(id, askOpt, answer);
		
		dao.close();
		//System.out.println(isChk);
		
		request.setAttribute("isChk", isChk + "");
		request.setAttribute("id", id);
		request.getRequestDispatcher("/Member/Find.jsp").forward(request, response);
	}
}
