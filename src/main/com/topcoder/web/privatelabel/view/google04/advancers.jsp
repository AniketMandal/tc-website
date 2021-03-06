<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google04.css"/>
<title>Google Code Jam 2004, Powered by TopCoder</title>
<jsp:include page="../script.jsp" />
</head>
<body>


<table border=0 width=100% cellpadding=0 cellspacing=0>
	<tr>
		<td width="49%">&#160;</td>
		<td align=center>
			<table border=0 width=100% cellpadding=0 cellspacing=0>
				<tr>
					<td width="49%"></td>
					<td valign=bottom align=center><img border=0 src="/i/events/google2004/codejamLogo.gif" alt="Google Code Jam logo"></td>
					<td width="49%"></td>
				</tr>
			</table>
		</td>
		<td width="49%"></td>
	</tr>
	<tr>
		<td width="49%">&#160;</td>
		<td>
			<div class=greenBigBox>

			<!-- Tab bar links-->
			<div align=center>
			<jsp:include page="links.jsp" >
			<jsp:param name="selectedTab" value="advancers"/>
			</jsp:include>
			</div>

			<br/><br/>

			<span class=bigTitle>Advancers</span>
			<span valign=top>
			<jsp:include page="right.jsp" />
			</span>

			<br/><br/>

			<table class=tableFrame cellpadding=5 cellspacing=2 border=0 width="400">
			<tr>
			<td class="advancersTitle">Round</td>
			<td class="advancersTitle" align="right" width="100%">Advancers</td>
			</tr>
			<tr valign="top">
			<td class="advancersRound"><a href="/pl/?module=Static&d1=google04&d2=advQual" class="topLink">Qualification Round</a></td>
			<td class="sidebarText" align="right"><a href="/pl/?module=Static&d1=google04&d2=advQual">500</a></td>
			</tr>
			<tr valign="top">
			<td class="advancersRound"><a href="/pl/?module=Static&d1=google04&d2=advRd1" class="topLink">Online Round 1</a></td>
			<td class="sidebarText" align="right"><a href="/pl/?module=Static&d1=google04&d2=advRd1">250</a></td>
			</tr>
			<tr valign="top">
			<td class="advancersRound"><a href="/pl/?module=Static&d1=google04&d2=advRd2" class="topLink">Online Round 2</a></td>
			<td class="sidebarText" align="right"><a href="/pl/?module=Static&d1=google04&d2=advRd2">50</a></td>
			</tr>
			<tr valign="top">
			<td class="advancersRound"><a href="/pl/?module=Static&d1=google04&d2=advFinals" class="topLink">Onsite Finals</a></td>
			<td class="sidebarText" align="right"><a href="/pl/?module=Static&d1=google04&d2=advFinals">4</a></td>
			</tr>
			</table>


			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			To find out more detailed information about the Google Code Jam 2004, including a list of the prizes, please read the <a href="/pl/?module=Static&d1=google04&d2=rules">Terms and Conditions</a>.
			</div>
		</td>
		<td width="49%">&#160;</td>
	<tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>