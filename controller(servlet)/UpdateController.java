package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/update.do")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("update doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("update doPost()");
		
		
		//비밀번호 찾기 통해서 비밀번호 변경하기
		String pass = request.getParameter("newPass");
		String id = request.getParameter("id");
		
		//System.out.println(pass);
		//System.out.println(id);
		
		MemberDAO dao = new MemberDAO();
		int res = dao.newPass(id, pass);
		String msg = "";
		
		if(res == 1) {
			msg = "<script>alert('비밀번호 변경 성공')</script>";
		}
		
		dao.close();
		
		request.setAttribute("passMsg", msg);
		request.getRequestDispatcher("/Member/LoginForm.jsp").forward(request, response);
	}
}
