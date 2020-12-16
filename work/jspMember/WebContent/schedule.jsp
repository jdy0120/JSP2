<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
String uid = (String)session.getAttribute("uid");
if (uid == null) {
	out.println("<script>");
	out.println("alert('로그인 후에 사용하실 수 있습니다.');");
	out.println("location.href='loginForm.jsp';");
	out.println("</script>");
}

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&characterEncoding=utf8&verifyServerCertificate=false&useSSL=false&serverTimezone=UTC";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();

} catch(Exception e) {
	out.println(e.getMessage());
}
request.setCharacterEncoding("utf-8");
Calendar sdate = Calendar.getInstance();	// 시작일
int year, month, cYear, cMonth, cDay;
cYear = sdate.get(Calendar.YEAR);			// 올해 연도
cMonth = sdate.get(Calendar.MONTH) + 1;		// 현재 월
cDay = sdate.get(Calendar.DATE);			// 현재 일
if (request.getParameter("y") == null) {	// 받아온 연도와 월이 없으면
	year = sdate.get(Calendar.YEAR);		// 올해 연도
	month = sdate.get(Calendar.MONTH) + 1;	// 현재 월
} else {
	year = Integer.parseInt(request.getParameter("y"));
	month = Integer.parseInt(request.getParameter("m"));
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#sch table, #sch th, #sch td { border:1px solid black; }
#sch { border-collapse:collapse; }
#sch th { height:30px; background:#585858; color:white; }
#sch td { height:100px; }
.txtRed { color:red; }
.txtBlue { color:blue; }
#today { background:#efefef; }
.scheduleBox {
	width:400px; height:300px; background:yellow;
	overflow:auto; position:absolute;
	display:none;
}

</style>
<script>
function changeDate() {
	document.frmSchDate.submit();
}

function setToday() {
	document.frmSchDate.y.value = "<%=cYear%>";
	document.frmSchDate.m.value = "<%=cMonth%>";
	document.frmSchDate.submit();
}

function showSchedule(box) {
	var obj = document.getElementById(box);
	obj.style.display = "block";
	
}

function hideSchedule(box) {
	var obj = document.getElementById(box);
	obj.style.display = "none";
	
}
</script>
</head>
<body>
<h2>일정 관리</h2>
<%
sdate.set(year, month - 1, 1);
//입력받은 년도와 월을 이용하여 시작일을 지정(월은 -1을 해야 함)
int startWeekDay = 0, endDay = 0;
Calendar edate = Calendar.getInstance();	// 종료일
edate.set(year, month, 1);		// 시작일의 다음달 1일
edate.add(Calendar.DATE, -1);	// 다음달 1일에서 하루를 뺀 날짜(시작월의 말일)
startWeekDay = sdate.get(Calendar.DAY_OF_WEEK); // 시작일의 요일번호이자 1일의 시작 위치
endDay = edate.get(Calendar.DATE); // 말일
%>
<form name="frmSchDate" action="schedule.jsp" method="post">
<table width="700">
<tr><td align="center">
	<select name="y" onchange="changeDate();">
<% for (int i = 1988 ; i <= (cYear + 1) ; i++) { %>
		<option value="<%=i %>" 
			<% if (year == i) { %>selected="selected"<% } %>><%=i %></option>
<% } %>
	</select> 년&nbsp;&nbsp;
	<select name="m" onchange="changeDate();">
<% for (int i = 1 ; i <= 12 ; i++) { %>
		<option value="<%=i %>" 
			<% if (month == i) { %>selected="selected"<% } %>><%=i %></option>
<% } %>
	</select> 월&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="오늘 날짜" onclick="setToday();" />
</td></tr>
</table>
</form>
<table width="700" cellpadding="5" id="sch">
<tr>
<th width="100">일</th><th width="100">월</th><th width="100">화</th>
<th width="100">수</th><th width="100">목</th><th width="100">금</th>
<th width="100">토</th>
</tr>
<%
if (startWeekDay != 1) {
	out.println("<tr>");
	for (int i = 1 ; i < startWeekDay ; i++){
		out.println("<td>&nbsp;</td>");
	}
}

String txtClass = null, txtID = null, schImg = "", closeImg = "";
for (int i = 1, n = startWeekDay ; i <= endDay ; i++, n++ ){
	// i: 날짜의 일(day)부분을 담당할 변수
	// n: 요일번호(1~7) 담당으로 일주일이 지나면 다음 줄로 내리기 위한 용도

	txtClass = "";	txtID = ""; closeImg="";

	if (n % 7 == 1) {
	// 일요일이면 새로운 줄을 열어주고, 글자색을 빨간색으로 변경
		out.println("<tr>");
		txtClass = " class=\"txtRed\"";
	}
	if (n % 7 == 0)	txtClass = " class=\"txtBlue\"";
	
	if (year == cYear && month == cMonth && i == cDay)
		txtID = " id=\"today\"";

	String sql = "select * from t_schedule_list where ml_id = '" + uid + "' and sl_stime like '" + year + "-" + month + "-" + (i < 10 ? "0" + i : i) + "%' order by sl_stime";

	rs = stmt.executeQuery(sql);
	if (rs.next()) { // 일정이 있으면
		schImg = "<a href=\"javascript:showSchedule('box" + i + "');\">";
		// 이미지 클릭시 해당 일정을 보여주는 함수 호출
		schImg += "&nbsp;<img src='img/schedule_icon.png' width='30%' /></a>";
		out.println("<div class='scheduleBox' id='box" + i + "'>");
		out.println(rs.getString("sl_stime").substring(0,10)+" 일정<span style='width:230px;'></span>");
		out.println("</img >");
		closeImg = "<a href=\"javascript:hideSchedule('box" + i + "');\">";
		closeImg += "&nbsp;<img src='img/close.png' width='5%' align='absmiddle' /></a><br /><br />";
		out.println(closeImg);
		do {
			out.println("일시: " + rs.getString("sl_stime").substring(11) + "&nbsp;&nbsp;");
			out.println("<input type=\"button\" value=\"수정\" onclick=\"location.href='schedule_form.jsp?idx=" + rs.getInt("sl_idx") + ";\")\"'>&nbsp;&nbsp;");
			out.println("<input type=\"button\" value=\"삭제\" onclick=\"goDelete(" + rs.getInt("sl_idx") +")\"'>");
			out.println(rs.getString("sl_content").replace("\r\n", "<br />"));
			out.println("<hr />");
		}while (rs.next());
		out.println("</div>");
		String args = "?w=in&y=" + year + "&m=" + month + "&d=" + i;
		out.print("<td valign='top'" + txtClass + txtID + ">" + 
		"<a href='schedule_form.jsp" + args + "'>" + i + "</a>" + schImg
		+"</td>");
	}else {
		String args = "?w=in&y=" + year + "&m=" + month + "&d=" + i;
		out.print("<td valign='top'" + txtClass + txtID + ">" + 
		"<a href='schedule_form.jsp" + args + "'>" + i + "</a></td>");
	}

	if (n % 7 == 0)	out.println("</tr>");
	// 일주일이 지났으므로 다음 줄로 내림
	
	if (i == endDay && n % 7 != 0) {
	// 마지막 일을 출력했으나 토요일이 아니어서 "</tr>"을 출력하지 않은 상태이면
		for (int k = n % 7 ; k < 7 ; k++) {
			out.println("<td>&nbsp;</td>");
		}
		out.println("</tr>");
	}
}
%>
</table>
</body>
</html>
