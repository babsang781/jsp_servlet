package temp;

public class FeedCommentDTO {
	private int fcno;
	private int feedno;
	private String id;
	private String content;
	
	public FeedCommentDTO(int fcno, int feedno, String id, String content) {
		super();
		this.fcno = fcno;
		this.feedno = feedno;
		this.id = id;
		this.content = content;
	}

	public int getFcno() {
		return fcno;
	}

	public void setFcno(int fcno) {
		this.fcno = fcno;
	}

	public int getFeedno() {
		return feedno;
	}

	public void setFeedno(int feedno) {
		this.feedno = feedno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
