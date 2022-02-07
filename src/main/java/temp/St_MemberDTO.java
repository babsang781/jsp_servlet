package temp;

public class St_MemberDTO {   // DB 테이블에 있는 컬럼명과 맞추어서 이름 짓는 것이 헷갈리지 않고 좋음
	private String id;
	private String pw;
	private String nick;
	
	public St_MemberDTO() {
		// 기본 생성자, 컨트롤 스페이스 생성, 매개 변수를 받지 못하는 것 기본생성자
		// 뭔가를 써서 만들 수 있지만 그렇게 될 경우, 사용자정의 생성자라고 부르는 게 맞음
	}
	
	// 생성자 : 1. 기본 생성자, 2. 사용자정의 생성자 
	public St_MemberDTO(String id, String pw, String nick) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
	}
	// getter/setter
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public String getpw() {
		return pw;
	}
	public void setpw(String pw) {
		this.pw = pw;
	}
	public String getnick() {
		return nick;
	}
	public void setnick(String nick) {
		this.nick = nick;
	}
	
	//tostring
	@Override
	public String toString() {
		return "st_memberDTO [id=" + id + ", pw=" + pw + ", nick=" + nick + "]";
	}
	
	
	
}
