package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/check.do")
public class CheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Check doGet()");
		
		MemberDAO dao = new MemberDAO();
		
		String mode = request.getParameter("mode");
		String id = request.getParameter("id");
		String nick = request.getParameter("nick_id");
		
		int res = 0;
		
		PrintWriter pw = response.getWriter();
		
		//id 중복 확인
		if(mode.equals("idCheck")) {
			MemberDTO dto = dao.getMemberById(id);
			
			if(dto.getUser_id() != null) {
				//중복
				System.out.println("중복된 아이디입니다");
				res = 1;
			}
			else {
				//중복X
				System.out.println("사용 가능한 아이디입니다");
				res = 0;
			}
			pw.write(res + "");
		}
		
		//nick 중복 확인
		if(mode.equals("nickCheck")) {
			
			MemberDTO dto = dao.getMemberByNick(nick);
			
			if(dto.getUser_id() != null) {
				//중복
				//System.out.println("중복된 닉네임입니다");
				res = 1;
			}
			else {
				//중복X
				//System.out.println("사용 가능한 닉네임입니다");
				res = 0;
			}
			pw.write(res + "");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Check doPost()");
	}

}
