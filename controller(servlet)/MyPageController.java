package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/mypage.do")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("mypage doGet()");
		
		String mode = request.getParameter("mode");
		
		//Profile에서 로그인 한 회원 정보 필요
		String id = request.getParameter("id");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberById(id);
		
		dao.close();
		
		if(mode.equals("profile")) {
			System.out.println(mode);
			request.setAttribute("dto", dto);
			request.getRequestDispatcher("/Member/MemberView.jsp").forward(request, response);
		}
		else if(mode.equals("wishlist")) {
			System.out.println(mode);
		}
		else if(mode.equals("mylist")) {
			System.out.println(mode);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
