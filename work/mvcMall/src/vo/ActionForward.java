package vo;

// �۾��� ���������� �� �������� �������� ���� ����� �����ִ� Ŭ����
public class ActionForward {
	private String path;
	private boolean redirect;
	
	public ActionForward() {
		
	}
	
	public ActionForward(String path, boolean redirect) {
		this.path = path;
		this.redirect = redirect;
	}
	// getter setter
	public String getPath() {
		return path;
	}
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
}
