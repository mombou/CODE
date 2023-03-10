package model2.mvcmember;

public class MemberDTO {
	
	private String user_id;
	private String user_pass;
	private String name;
	private String nick;
	private String birth;
	private String tel;
	private String email;
	private int user_class;
	private String ask;
	private String answer;
	private String fav_movie;
	private java.sql.Date regidate;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getUser_class() {
		return user_class;
	}
	public void setUser_class(int user_class) {
		this.user_class = user_class;
	}
	public String getAsk() {
		return ask;
	}
	public void setAsk(String ask) {
		this.ask = ask;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getFav_movie() {
		return fav_movie;
	}
	public void setFav_movie(String fav_movie) {
		this.fav_movie = fav_movie;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	@Override
	public String toString() {
		return "MemberDTO [user_id=" + user_id + ", user_pass=" + user_pass + ", name=" + name + ", nick=" + nick
				+ ", birth=" + birth + ", tel=" + tel + ", email=" + email + ", user_class=" + user_class + ", ask="
				+ ask + ", answer=" + answer + ", fav_movie=" + fav_movie + ", regidate=" + regidate + "]";
	}
}
