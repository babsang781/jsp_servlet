package temp;

public class St_MemberDTO {   // DB ���̺� �ִ� �÷���� ���߾ �̸� ���� ���� �򰥸��� �ʰ� ����
	private String id;
	private String pw;
	private String nick;
	
	public St_MemberDTO() {
		// �⺻ ������, ��Ʈ�� �����̽� ����, �Ű� ������ ���� ���ϴ� �� �⺻������
		// ������ �Ἥ ���� �� ������ �׷��� �� ���, ��������� �����ڶ�� �θ��� �� ����
	}
	
	// ������ : 1. �⺻ ������, 2. ��������� ������ 
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
