package vo;

public class PdtPageInfo {
// ��ǰ ��� �������� �ʿ��� �����͵��� �����ϴ� Ŭ����(���ΰ� ����Ʈ ����)
	// ���� page��ȣ, page��, ����page, ����page, �Խñۼ�, ���ũ��, pageũ��
	private int cpage, pcnt, spage, epage, rcnt, bsize, psize;
	// �˻����� : �Խÿ���-admin, Ű����(��ǰ��, ��ǰ���̵�), ��ϱⰣ-admin, ī�װ�, ���ݴ�, ���-admin
	private String isview, schtype, keyword, sdate, edate, cata, sprice, eprice, stock;
	// �������� : ����price(��a��d), ��ǰ��name(��a), �����date(��a��d), �α�salecnt(��d), ����review(��d)
	private String ord;

	public int getCpage() {
		return cpage;
	}
	public void setCpage(int cpage) {
		this.cpage = cpage;
	}
	public int getPcnt() {
		return pcnt;
	}
	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}
	public int getSpage() {
		return spage;
	}
	public void setSpage(int spage) {
		this.spage = spage;
	}
	public int getEpage() {
		return epage;
	}
	public void setEpage(int epage) {
		this.epage = epage;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public int getBsize() {
		return bsize;
	}
	public void setBsize(int bsize) {
		this.bsize = bsize;
	}
	public int getPsize() {
		return psize;
	}
	public void setPsize(int psize) {
		this.psize = psize;
	}
	public String getIsview() {
		return isview;
	}
	public void setIsview(String isview) {
		this.isview = isview;
	}
	public String getSchtype() {
		return schtype;
	}
	public void setSchtype(String schtype) {
		this.schtype = schtype;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getCata() {
		return cata;
	}
	public void setCata(String cata) {
		this.cata = cata;
	}
	public String getSprice() {
		return sprice;
	}
	public void setSprice(String sprice) {
		this.sprice = sprice;
	}
	public String getEprice() {
		return eprice;
	}
	public void setEprice(String eprice) {
		this.eprice = eprice;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getOrd() {
		return ord;
	}
	public void setOrd(String ord) {
		this.ord = ord;
	}
}
