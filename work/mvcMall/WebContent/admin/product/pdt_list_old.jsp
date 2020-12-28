<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
ArrayList<PdtInfo> pdtList = (ArrayList<PdtInfo>)request.getAttribute("pdtList");
ArrayList<CataBigInfo> cataBigList = (ArrayList<CataBigInfo>)request.getAttribute("cataBigList");
ArrayList<CataSmallInfo> cataSmallList = (ArrayList<CataSmallInfo>)request.getAttribute("cataSmallList");
PdtPageInfo pageInfo = (PdtPageInfo)request.getAttribute("pageInfo");

String isview, schtype, keyword, sdate, edate, bcata, scata, sprice, eprice, stock, ord;
isview =	pageInfo.getIsview();	// 게시여부(전체게시, 게시상품, 미게시상품)
schtype =	pageInfo.getSchtype();	// 검색조건(상품코드, 상품명)
keyword =	pageInfo.getKeyword();	// 검색어
sdate =		pageInfo.getSdate();	// 등록일 검색 시작일
edate =		pageInfo.getEdate();	// 등록일 검색 종료일
bcata =		pageInfo.getBcata();	// 대분류
scata =		pageInfo.getScata();	// 소분류
sprice =	pageInfo.getSprice();	// 가격대 시작 가격
eprice =	pageInfo.getEprice();	// 가격대 종료 가격
stock =		pageInfo.getStock();	// 재고량(이상)
ord =		pageInfo.getOrd();		// 정렬조건

String args = "", schArgs = "";
if (isview != null)		schArgs += "&isview=" + isview;
if (sdate != null)		schArgs += "&sdate=" + sdate;
if (edate != null)		schArgs += "&edate=" + edate;
if (bcata != null)		schArgs += "&bcata=" + bcata;
if (scata != null)		schArgs += "&scata=" + scata;
if (sprice != null)		schArgs += "&sprice=" + sprice;
if (eprice != null)		schArgs += "&eprice=" + eprice;
if (stock != null)		schArgs += "&stock=" + stock;
if (keyword != null && !keyword.equals(""))
	schArgs += "&schtype=" + schtype + "&keyword=" + keyword;
if (ord != null)		schArgs += "&ord=" + ord;

int cpage	= pageInfo.getCpage();	// 현재 페이지 번호
int pcnt	= pageInfo.getPcnt();	// 전체 페이지 수
int psize	= pageInfo.getPsize();	// 페이지 크기
int bsize	= pageInfo.getBsize();	// 블록 페이지 개수
int spage	= pageInfo.getSpage();	// 블록 시작 페이지 번호
int epage	= pageInfo.getEpage();	// 블록 종료 페이지 번호
int rcnt	= pageInfo.getRcnt();	// 검색된 게시물 개수
args = "&cpage=" + cpage + schArgs;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
td { font-size:11px; }
.date { width:80px; }
.pr { width:80px; }
</style>
<script>
<%
String scName = null;
int bc = 0, sc = 0;
for (int i = 0, j = 1 ; i < cataSmallList.size() ; i++, j++) {
	if (bc != cataSmallList.get(i).getCb_idx()) {
		j = 1;
%>
var arr<%=cataSmallList.get(i).getCb_idx()%> = new Array();
arr<%=cataSmallList.get(i).getCb_idx()%>[0] = new Option("", "소분류 선택");
<%
	}
	bc = cataSmallList.get(i).getCb_idx();	// 대분류 idx를 bc에 저장
	sc = cataSmallList.get(i).getCs_idx();	// 소분류 idx를 sc에 저장
	scName = cataSmallList.get(i).getCs_name();	// 대분류명을 scName에 저장
%>
arr<%=bc%>[<%=j%>] = new Option("<%=sc%>", "<%=scName%>");
<%
}
%>

function setCategory(obj, target) {
	var x = obj.value;	// 대분류에서 선택한 값을 x에 담음

	for (var m = target.options.length - 1 ; m > 0 ; m--) {
		target.options[m] = null;
	}

	if (x != "") {
		var selectedArray = eval("arr" + x);	// 보여줄 배열 지정
		for (var i = 0 ; i < selectedArray.length ; i++) {
			target.options[i] = new Option(selectedArray[i].value, selectedArray[i].text);
		}
		target.options[0].selected = true;
	}
}
</script>
</head>
<body>
<h2>상품 목록 화면</h2>
<form name="frmSch" action="" method="get">
<table width="800" cellpadding="5">
<tr>
<th width="15%">분류선택</th>
<td width="35%">
	<select name="bcata" onchange="setCategory(this, this.form.scata);">
		<option value="">대분류 선택</option>
<% for (int i = 0 ; i < cataBigList.size() ; i++) { %>
		<option value="<%=cataBigList.get(i).getCb_idx()%>"><%=cataBigList.get(i).getCb_name()%></option>
<% } %>
	</select>&nbsp;
	<select name="scata">
		<option value="">소분류 선택</option>
	</select>
</td>
<th width="15%">등록기간</th>
<td width="35%">
	<input type="text" name="sdate" class="date" /> ~ <input type="text" name="edate" class="date" />
</td>
</tr>
<tr>
<th>가격대</th>
<td>
	<input type="text" name="sprice" class="pr" />원 부터 <input type="text" name="eprice" class="pr" />원 까지
</td>
<th>검색어</th>
<td>
	<select name="schtype">
		<option value="">검색조건</option>
		<option value="id">상품 아이디</option>
		<option value="name">상품 이름</option>
	</select>
	<input type="text" name="keyword" />
</td>
</tr>
<tr>
<th>재고량</th>
<td>
	<select name="stock">
		<option value="">재고량 선택</option>
		<option value="-1">무한대</option>
<% for (int i = 0 ; i < 100 ; i++) { %>
		<option value="<%=i%>"><%=i%></option>
<% } %>
	</select>개 이상
</td>
<th>게시여부</th>
<td>
	<input type="radio" name="isview" value="" />전체 보기
	&nbsp;<input type="radio" name="isview" value="y" />게시중
	&nbsp;<input type="radio" name="isview" value="n" />미게시
</td>
</tr>
<tr>
<th>정렬방식</th>
<td>
	<select name="ord">
		<option value="">상품아이디(오름차순)</option>
		<option value="namea">상품명(오름차순)</option>
		<option value="pricea">낮은 가격순(오름차순)</option>
		<option value="priced">높은 가격순(내림차순)</option>
		<option value="datea">오래된 등록일순(오름차순)</option>
		<option value="dated">최근 등록일순(내림차순)</option>
		<option value="salecntd">많이 팔린순(내림차순)</option>
		<option value="reviewd">리뷰 개수순(내림차순)</option>
	</select>
</td>
<th>페이지 크기</th>
<td>
	<select name="psize">
		<option value="12">12 개</option>
		<option value="6">6 개</option>
		<option value="8">8 개</option>
		<option value="10">10 개</option>
		<option value="24">24 개</option>
	</select>개 씩 보여주기
</td>
</tr>
<tr><td colspan="4" align="center">
	<input type="submit" value="상품 검색" />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="reset" value="조건 초기화" />
</td></tr>
</table>
</form>
</body>
</html>
