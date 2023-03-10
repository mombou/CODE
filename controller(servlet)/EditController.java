package member;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/edit.do")
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Edit doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Edit doPost()");
		
		//회원 정보 수정하기
		//로그인 했을 경우에 가능하므로 session에 저장된 id 가져옴
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("UserId");
		
		String pass = request.getParameter("user_pass");
		String nick = request.getParameter("nick_id");
		String ask = request.getParameter("ask");
		String answer = request.getParameter("answer");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String domain = request.getParameter("domain");
		String[] fav_movie = request.getParameterValues("fav_movie");
		
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		dto.setUser_id(id);
		dto.setUser_pass(pass);
		dto.setNick(nick);
		dto.setTel(tel);
		dto.setEmail(email);
		dto.setAsk(ask);
		dto.setAnswer(answer);
		
		if(domain.equals("직접입력하기")) {
			dto.setEmail(email);
		}
		else {
			dto.setEmail(email + "@" + domain);
		}
		dto.setFav_movie(Arrays.toString(fav_movie));
		
		int res = dao.updateMember(dto);
		if(res == 1) {
			response.sendRedirect("/Member/MyPageMain.jsp");
		}
		dao.close();
	}

}
