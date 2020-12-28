<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
ArrayList<PdtInfo> pdtList = (ArrayList<PdtInfo>)request.getAttribute("pdtlist");
ArrayList<CataBigInfo> cataBigList = (ArrayList<CataBigInfo>)request.getAttribute("cataBigList");
ArrayList<CataSmallInfo> cataSmallInfo = (ArrayList<CataSmallInfo>)request.getAttribute("cataSmallInfo");
PdtPageInfo pageInfo = (PdtPageInfo)request.getAttribute("pageInfo");

String isview,schtype,keyword,sdate,edate,bcata,scata,sprice,eprice,stock,ord;
isview = pageInfo.getIsview();	//게시여부(전체게시, 게시상품, 미게시상품)
schtype = pageInfo.getSchtype();	//검색조건(상품코드, 상품명)
keyword = pageInfo.getKeyword();// 검색어
sdate = pageInfo.getSdate();// 등록일 검색시작일
edate = pageInfo.getEdate();// 등록일 검색 종료일
bcata = pageInfo.getBcata();// 대분류
scata = pageInfo.getScata();// 소분류
sprice = pageInfo.getSprice(); // 가격대 시작 가격
eprice = pageInfo.getEprice(); //가격대 시작가격
stock = pageInfo.getStock(); // 재고량(이상)
ord = pageInfo.getOrd(); // 정렬조건

String args = "", schArgs = "";
if (isview != null)		schArgs += "%isview= '" + isview;
if (sdate != null)		schArgs += "%sdate= '" + sdate;
if (edate != null)		schArgs += "%edate= '" + edate;
if (bcata != null)		schArgs += "%bcata= '" + bcata;
if (scata != null)		schArgs += "%scata= '" + scata;
if (sprice != null)		schArgs += "%sprice= '" + sprice;
if (eprice != null)		schArgs += "%eprice= '" + eprice;
if (stock != null)		schArgs += "%stock= '" + stock;
if (keyword != null && !keyword.equals(""))
	schArgs += "&schtype=" + schtype + "&keyword=" + keyword;
if (ord != null)		schArgs += "&ord=" + ord;

int cpage 	= pageInfo.getCpage();	// 현재 페이지 번호
int pcnt 	= pageInfo.getPcnt();	// 전체 페이지 수
int psize	= pageInfo.getPsize();	// 페이지 크기
int bsize	= pageInfo.getBsize();	// 블록 페이지 개수
int spage 	= pageInfo.getSpage();	// 블록 시작 페이지 번호
int epage 	= pageInfo.getEpage();	// 블록 종료 페이지 번호
int rcnt 	= pageInfo.getRcnt();	// 검색된 게시물 개수
args = "&cpage" + cpage + schArgs;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품 목록 화면</h2>
<form name = "frmSch" action="" method = "get">
	<title>상품검색</title>
	
</form>
</body>
</html>