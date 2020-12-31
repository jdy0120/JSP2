<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
ArrayList<ProductInfo> pdtList = (ArrayList<ProductInfo>)request.getAttribute("pdtList");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title></title>
	<style>
	body { margin:0; font-size:13px; }
	ol, ul { list-style:none; }
	a:link { color:#4f4f4f; text-decoration:none; }
	a:visited { color:#4f4f4f; text-decoration:none; }
	a:hover { color:#f00; text-decoration:underline; }
	#wrapper { width:1250px; margin:0 auto; }
	#top {
		width:100%; height:50px; text-align:center; font-size:25px; color:#4f4f4f; 
		font-weight:bold; padding-top:30px;
	}
	.outerBox {
		border:5px #4f4f4f solid; width:270px; text-align:center;
		padding:5px; margin:10px; float:left;
	}
	.innerBox {
		border:1px #000 solid; width:260px; height:190px; padding:5px; 
		text-align:center; display:table-cell; vertical-align:middle;
	}
	.pdtName { font-size:15px; padding-top:7px; padding-bottom:3px; font-weight:bold; }
	.pdtPrice { color:red; font-weight:bold; }
	</style>
</head>
<body>
<div id="wrapper">
	<div id="top">PRODUCTS LIST</div>
	<%
		int max = 4;
		for (int i = 0; i < pdtList.size(); i++) {
	%>
	<div class="outerBox">
		<div class="innerBox"><img src="/test3/product/pdt_img/<%=pdtList.get(i).getTp_img() %>.png" width="256" height="200" /></div>
		<div class="pdtName"><%=pdtList.get(i).getTp_name() %></div>￦ <span class="pdtPrice"><%=pdtList.get(i).getTp_price() %></span>
	</div>
	<%} %>
</div>
</body>
</html>