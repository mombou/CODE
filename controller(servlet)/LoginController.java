package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Login doGet()");
		
		//로그아웃 처리
		HttpSession session = request.getSession();
		//System.out.println(session.getAttribute("UserId"));
		session.invalidate();
		response.sendRedirect("/Member/LoginForm.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Login doPost()");
		
		//두번 이상 같은 아이디로 로그인 하지 못할 경우 횟수 세기
		
		String id = request.getParameter("userid");
		String pass = request.getParameter("userpass");
		//String chkBoxVal = request.getParameter("isChk");
		
		int cnt = 0;
		String msg = "";
		
		//세션 객체 생성
		HttpSession session = request.getSession();
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMember(id, pass);
		
		//System.out.println(id);
		//System.out.println(pass);
		//System.out.println(chkBoxVal);
		//System.out.println(dto.getUser_id());
		
		if(dto.getUser_id() != null) {
			//로그인 정보와 DB 정보가 일치
			
			//그런데 로그인 실패 5번 이상 했을 경우 로그인 정보와 DB 정보가 일치하더라도 로그인 불가
			if(dto.getUser_id().equals((String)session.getAttribute("fail_id")) && (int)session.getAttribute("fail_cnt") >= 5){
				msg = "<script>alert('로그인 실패 5회 초과하여 이용 불가합니다! 고객센터에 문의하세요')</script>";
				request.setAttribute("alert", msg);
				request.getRequestDispatcher("/Member/LoginForm.jsp").forward(request, response);
			}
			else {
				session.setAttribute("UserId", dto.getUser_id());
				session.setAttribute("UserName", dto.getName());
				session.setAttribute("UserClass", dto.getUser_class());
				//request.setAttribute("checked", chkBoxVal);
				request.getRequestDispatcher("/Member/LoginForm.jsp").forward(request, response);
			}
			dao.close();
		}
		else {
			//=====로그인 실패=====
			//로그인에 실패한 아이디를 따로 저장
			session.setAttribute("fail_id", id);
			
			//System.out.println("fail_cnt = " + session.getAttribute("fail_cnt"));
			
			if(id.equals(session.getAttribute("fail_id"))){
				if(session.getAttribute("fail_cnt") == null || (int)session.getAttribute("fail_cnt") == 0) {
					//fail_cnt가 null이라는 건 처음 로그인 실패
					session.setAttribute("cnt", cnt);
					int fail_cnt = (int)session.getAttribute("cnt") + 1;
					System.out.println("fail_cnt = " + fail_cnt);
					session.setAttribute("fail_cnt", (Object)fail_cnt);
					msg = "<script>alert('로그인 실패: " + fail_cnt + "회')</script>";
				}
				else {
					//fail_cnt가 null이 아니라는 건 로그인 실패가 두번 이상
					if((int)session.getAttribute("fail_cnt") >= 5) {
						msg = "<script>alert('로그인 실패 5회 초과하여 이용 불가합니다! 고객센터에 문의하세요')</script>";
						session.setAttribute("fail_cnt", (Object)session.getAttribute("fail_cnt"));
					}
					else {
						session.setAttribute("cnt", session.getAttribute("fail_cnt"));
						int fail_cnt = (int)session.getAttribute("cnt") + 1;
						System.out.println("fail_cnt = " + fail_cnt);
						session.setAttribute("fail_cnt", (Object)fail_cnt);
						msg = "<script>alert('로그인 실패: " + fail_cnt + "회(5회 초과 시 이용 불가)')</script>";
					}
				}
			}
			
			System.out.println(msg);
			
			request.setAttribute("alert", msg);
			request.getRequestDispatcher("/Member/LoginForm.jsp").forward(request, response);
			dao.close();
		}
		
		
	}
}
