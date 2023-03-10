package model2.mvcmember;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;

@WebServlet("/mvcmember/join.do")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//아이디 중복 체크 위한 AJAX 요청 처리
		String userId = request.getParameter("id");
		System.out.println(userId);
		
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		int res = dao.selectView(userId);
		
		if(res == 1) {
			System.out.println("중복된 아이디입니다");
		}
		else {
			System.out.println("사용 가능한 아이디입니다");
		}
		out.write(res + "");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("login doPost()");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		dto.setId(id);
		dto.setPass(pass);
		dto.setName(name);
		dto.setTel(tel);
		dto.setEmail(email);
		
		int res = dao.insertWrite(dto);
		System.out.println(res);
	}
}
