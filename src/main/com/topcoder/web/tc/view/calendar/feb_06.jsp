<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Events Calendar</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_calendar"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
<jsp:include page="../includes/global_left.jsp">
<jsp:param name="node" value="competition_calendar"/>
</jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="left" class="bodyColumn">
<div class="bodyText">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="calendar"/>
<jsp:param name="title" value="February 2006"/>
</jsp:include>

<div style="float:right;white-space:nowrap;">All times are <A target="_blank" href="http://www.timeanddate.com/worldclock/city.html?n=98">Eastern Time</A> unless stated otherwise.  &#160; &#160; </div>

<strong><A href="/tc?module=Static&d1=calendar&d2=jan_06" class="prevNext">&lt; prev</A> | <A href="/tc?module=Static&d1=calendar&d2=mar_06" class="prevNext">next &gt;</A></strong>
<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="feb_06"/>
</jsp:include>

<table cellspacing="0" cellpadding="0" class="calendar" width="100%">
   <tr>
      <td class="headerC" width="14%">Sun</td>
      <td class="headerC" width="14%">Mon</td>
      <td class="headerC" width="14%">Tues</td>
      <td class="headerC" width="14%">Wed</td>
      <td class="headerC" width="14%">Thurs</td>
      <td class="headerC" width="14%">Fri</td>
      <td class="headerC" width="14%">Sat</td>
   </tr>
   
   <tr>
      <td class="empty">&#160;<br><br><br><br><br></td>
      <td class="empty">&#160;</td>
      <td class="empty">&#160;</td>
      <td class="value">1
      </td>
      <td class="value">2
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> challenges posted</strong><br>
         9:00 AM
         </div>
         <div class="tco06">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_schedule"><img src="/i/interface/emblem/tco06.gif" alt="TCO06" border="0"/><br>CDDC Week 2 Deadline &amp;<br>
         Week 3 Projects Posted</A></strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">3
      </td>
      <td class="value">4
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9808">SRM 287</A></strong><br>
         12:00 NOON
         </div>
      </td>
   </tr>
   
   <tr>
      <td class="value">5
      </td>
      <td class="value">6
      </td>
      <td class="value">7
      </td>
      <td class="value">8
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9809">SRM 288</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=nsa">NSA</A><br>
         9:00 PM
         </div>
      </td>
      <td class="value">9
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> challenges posted</strong><br>
         9:00 AM
         </div>
         <div class="tco06">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_schedule"><img src="/i/interface/emblem/tco06.gif" alt="TCO06" border="0"/><br>CDDC Week 3 Deadline &amp;<br>
         Week 4 Projects Posted</A></strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">10
      </td>
      <td class="value">11
       </td>
   </tr>
   
   <tr>
      <td class="value">12
      </td>
      <td class="value">13
         <div class="tco06">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_schedule"><img src="/i/interface/emblem/tco06.gif" alt="TCO06" border="0"/><br>Algo Registration Opens</A></strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">14
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9810">SRM 289</A></strong><br>
         7:00 AM
         </div>
      </td>
      <td class="value">15
         <div class="chat">
         <strong><A href="/tc?module=Static&d1=about&d2=jobs">Chat Session</A></strong><br>
         Subject: Full-time Employment Opportunities at TopCoder Software<br>
         7:00 PM
         </div>
      </td>
      <td class="value">16
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> challenges posted</strong><br>
         9:00 AM
         </div>
         <div class="tco06">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_schedule"><img src="/i/interface/emblem/tco06.gif" alt="TCO06" border="0"/><br>CDDC Week 4 Deadline &amp;<br>
         Week 5 Projects Posted</A></strong><br>
         9:00 AM
         </div>
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9811">SRM 290</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=ubs">UBS</A><br>
         9:00 PM
         </div>
      </td>
      <td class="value">17
      </td>
      <td class="value">18
      </td>
   </tr>
   
   <tr>
      <td class="value">19
         <div class="tco06">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_schedule"><img src="/i/interface/emblem/tco06.gif" alt="TCO06" border="0"/><br>CDDC Registration Closes</A></strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">20
      </td>
      <td class="value">21
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9812">SRM 291</A></strong><br>
         11:00 AM
         </div>
      </td>
      <td class="value">22
         <div class="long">
         <strong><A href="/longcontest/?module=Static&d1=intel_rules">Intel&#174; Multi-threading Competition 2</A></strong><br>
         12:00 PM
         </div>
      </td>
      <td class="value">23
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> challenges posted</strong><br>
         9:00 AM
         </div>
         <div class="tco06">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_schedule"><img src="/i/interface/emblem/tco06.gif" alt="TCO06" border="0"/><br>CDDC Week 5 Deadline</A></strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">24
      </td>
      <td class="value">25
      </td>
   </tr>
   
   <tr>
      <td class="value">26
      </td>
      <td class="value">27
      </td>
      <td class="value">28
         <div class="tco06">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_schedule"><img src="/i/interface/emblem/tco06.gif" alt="TCO06" border="0"/><br>Algo Registration Closes</A></strong><br>
         9:00 AM<br>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_schedule">Algo Qual Round Starts</A></strong><br>
         12:00 NOON
         </div>
      </td>
      <td class="empty">&#160;<br><br><br><br><br></td>
      <td class="empty">&#160;</td>
      <td class="empty">&#160;</td>
      <td class="empty">&#160;</td>
   </tr>

</table>

</div>
</td>
<%-- Center Column Ends --%>

    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>
</html>