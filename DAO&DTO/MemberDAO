package model2.mvcmember;

import Common.MyJDBConnect;

public class MemberDAO extends MyJDBConnect {
	//WebProject01

	public MemberDAO() {
		super();
	}

	// 1. 로그인 확인 => id, pass 일치하는지 여부
	public MemberDTO getMember(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM member WHERE user_id=? AND user_pass=?"; 

		try {
			// 쿼리 실행
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();

			// 결과 처리
			if (rs.next()) {
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setName(rs.getString("name"));
				dto.setNick(rs.getString("nick"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setRegidate(rs.getDate("regidate"));
				dto.setUser_class(rs.getInt("user_class"));
				dto.setAsk(rs.getString("ask"));
				dto.setAnswer(rs.getString("answer"));
				dto.setFav_movie(rs.getString("fav_movie"));
				dto.setBirth(rs.getString("birth"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//아이디에 해당하는 dto 정보 반환
	public MemberDTO getMemberById(String uid) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM member WHERE user_id=?"; 

		try {
			// 쿼리 실행
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();

			// 결과 처리
			if (rs.next()) {
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setName(rs.getString("name"));
				dto.setNick(rs.getString("nick"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setRegidate(rs.getDate("regidate"));
				dto.setUser_class(rs.getInt("user_class"));
				dto.setAsk(rs.getString("ask"));
				dto.setAnswer(rs.getString("answer"));
				dto.setFav_movie(rs.getString("fav_movie"));
				dto.setBirth(rs.getString("birth"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	// 닉네임으로 dto 정보 반환
	public MemberDTO getMemberByNick(String nick) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM member WHERE nick=?"; 

		try {
			// 쿼리 실행
			psmt = con.prepareStatement(query);
			psmt.setString(1, nick);
			rs = psmt.executeQuery();

			// 결과 처리
			if (rs.next()) {
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setName(rs.getString("name"));
				dto.setNick(rs.getString("nick"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setRegidate(rs.getDate("regidate"));
				dto.setUser_class(rs.getInt("user_class"));
				dto.setAsk(rs.getString("ask"));
				dto.setAnswer(rs.getString("answer"));
				dto.setFav_movie(rs.getString("fav_movie"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	// 2. 비밀번호 찾기 => 아이디, 질문, 답변으로 회원 정보 확인 => 일치하면 true 반환
	public boolean findPass(String id, String ask, String answer) {
    	boolean isFind = false;
    	
        String query = "SELECT * FROM member WHERE user_id=? AND ask=? and answer=?"; 

        try {
            // 쿼리 실행
            psmt = con.prepareStatement(query); 
            psmt.setString(1, id);   
            psmt.setString(2, ask);
            psmt.setString(3, answer);
            rs = psmt.executeQuery();  

            // 결과 처리
            if (rs.next()) {
                isFind = true;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return isFind;
    }
	
	// 비밀번호 변경
	public void newPass(String id, String pass) {
        String query = "update member set user_pass = ? where user_id=?"; 

        try {
            psmt = con.prepareStatement(query); 
            psmt.setString(1, pass);   
            psmt.setString(2, id);
            
            psmt.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	// 3. 리뷰 개수 확인 => member, review join
	public int reviewCount(String uid) {
		int cnt = 0;
		String query = "select count(review_id) as cnt from member m, review r "
				+ "where m.user_id = r.user_id "
				+ "and m.user_id = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 4. 회원가입 => insert
	public int insertMember(MemberDTO dto) {
		int res = 0;
		
		String query = "insert into member "
				+ "(user_id, user_pass, name, nick, birth, tel, email, ask, answer, fav_movie) "
				+ "values (?, ?, ?, ?, ?, ?, ?, ?, ? ,?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getUser_pass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getNick());
			psmt.setString(5, dto.getBirth());
			psmt.setString(6, dto.getTel());
			psmt.setString(7, dto.getEmail());
			psmt.setString(8, dto.getAsk());
			psmt.setString(9, dto.getAnswer());
			psmt.setString(10, dto.getFav_movie());
			
			res = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//회원 정보(memberView.jsp)에서 정보 수정
	public int updateMember(MemberDTO dto) {
		int res = 0;
		String query = "update member set user_pass=?, nick=?, ask=?,"
				+ " answer=?, tel=?, email=?, fav_movie=? where user_id = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getUser_pass());
			psmt.setString(2, dto.getNick());
			psmt.setString(3, dto.getAsk());
			psmt.setString(4, dto.getAnswer());
			psmt.setString(5, dto.getTel());
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getFav_movie());
			psmt.setString(8, dto.getUser_id());
			
			res = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
}









