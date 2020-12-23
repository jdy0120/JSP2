<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
request.setCharacterEncoding("utf-8");

ArrayList<CataBigInfo> cataBigList = (ArrayList<CataBigInfo>)request.getAttribute("cataBigList");
ArrayList<CataSmallInfo> cataSmallList = (ArrayList<CataSmallInfo>)request.getAttribute("cataSmallList");
ArrayList<BrandInfo> brandList = (ArrayList<BrandInfo>)request.getAttribute("brandList");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품 등록 폼</h2>
<form name="frmPdt" action="pad_in_proc.pdta" method="post" enctype="multipart/form-data">
	<table width="800" cellpadding="5" id="pdtInForm">
		<tr>
		<th width="150">대분류</th>
		<td width="250">
			<select name="bCata">
				<option value="">대분류 선택</option>
				<% for (int i = 0; i < cataBigList.size() ; i++) {%>
				<option value="<%=cataBigList.get(i).getCb_idx()%>"><%=cataBigList.get(i).getCb_name()%></option>
				<%} %>
			</select>
		</td>
		<th width="150">소분류</th>
		<td width="250">
			<select name="sCata">
				<option value="">소분류 선택</option>
				<% for (int i = 0; i < cataSmallList.size() ; i++) {%>
				<option value="<%=cataSmallList.get(i).getCs_idx()%>"><%=cataSmallList.get(i).getCs_name()%></option>
				<%} %>
			</select>
		</td>
		</tr>
		<tr>
		<th>브랜드</th>
		<td>
			<select name="brnad">
				<option value="">브랜드 선택</option>
				<% for (int i = 0; i < brandList.size() ; i++) {%>
				<option value="<%=brandList.get(i).getBl_idx()%>"><%=brandList.get(i).getBl_name()%></option>
				<%} %>
			</select>
		</td>
		<th>원산지</th><td><input type="text" name="orig" /></td>
		</tr>
		<tr>
		<th>상품명</th><td><input type="text" name="name" /></td>
		<th>가격</th><td><input type="text" name="price" /></td>
		</tr>
		<tr>
		<th>원가</th><td><input type="text" name="cost" /></td>
		<th>할인율</th><td><input type="text" name="discount" /></td>
		</tr>
		<tr>
		<th>옵션</th>
		<td colspan="3"><input type="text" name="opt" /> (Size,S,M,L,XL,XXL:Color,RED,BLUE,BLACK)</td>
		</tr>
		<tr>
		<th>이미지1</th><td><input type="file" name="img1" /></td>
		<th>이미지2</th><td><input type="file" name="img2" /></td>
		</tr>
		<tr>
		<th>이미지3</th><td><input type="file" name="img3" /></td>
		<th>설명이미지</th><td><input type="file" name="desc" /></td>
		</tr>
		<tr>
		<th>재고</th>
		<td>
			<select name="stock">
				<option value="-1">무제한</option>
				<% for (int i = 1 ; i <= 100 ; i++){ %>
				<option value="<%=i %>"><%=i %></option>
				<%} %>
			</select> EA
		</td>
		<th>게시여부</th>
		<td>
			<input type="radio" name="view" value="y" />상품 게시
			<input type="radio" name="view" value="n" checked="checked"/>상품 미게시
		</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="submit" value="상품 등록" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="다시입력" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>