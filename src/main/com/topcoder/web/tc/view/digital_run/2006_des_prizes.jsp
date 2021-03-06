<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - The Digital Run</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
</head>
<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="digital_run"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="digital_run_20061031"/>
<jsp:param name="title" value="Design Cup Series"/>
</jsp:include>

<div style="float:right; text-align:right;">
<A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2006_des_overview">Overview</A>
 | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2006_des_schedule">Schedule</A>
 | Prizes
 | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2006_des_roty">Rookie of the Year</A>
 | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2006_des_rules">Rules</A><br>
<A class="bcLink" href="/tc?&ph=112&module=LeaderBoard">Current leaderboard</A> | 
<A class="bcLink" href="/tc?module=RookieBoard&ph=112">Current ROTY leaderboard</A>
</div>
<span class="title">Prizes</span>
<br><br>
For each Stage, competitors will accumulate placement points according to the <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2006_des_overview">points table</A>.  In addition to the component earnings, the top five (5) finishers will win large prizes and the top 1/3 of the point-getters in each Stage will receive a smaller prize.  A total of $75,000 will be awarded in bonus prizes each Stage and will be distributed as follows:
<br><br>
<strong>Top Five Stage Prizes</strong><br>
<strong>1st</strong> - $25,000<br>
<strong>2nd</strong> - $10,000<br>
<strong>3rd</strong> - $7,000<br>
<strong>4th</strong> - $3,000<br>
<strong>5th</strong> - $2,000
<br><br>
<span class="bigRed">Please note: For Stage 4 (February 2, 2007 - May 3, 2007), Design Cup prizes for the Top Five have increased and the Top 1/3 prizes have been extended to the Top 1/2! See below for the updated prize amounts.
<br><br>
<strong>Top Five Stage Prizes</strong><br>
<strong>1st</strong> - $40,000<br>
<strong>2nd</strong> - $20,000<br>
<strong>3rd</strong> - $12,000<br>
<strong>4th</strong> - $6,000<br>
<strong>5th</strong> - $4,000
</span>
<br><br>
If there is a tie for a position among the top 5 finishers, the tie will be resolved in the following manner (in order):
<ol>
<li>The competitor who has the most higher-placed submissions in the Stage.</li>
<li>If a tie still remains, then the competitor with the highest average individual component score of the lesser number of components used to develop the placement scores for the tied competitors.</li>
<li>If a tie still remains, then the tied competitors will share equally the prize money at hand.</li>
</ol>
<strong>Top Third Stage Prizes</strong><br>
The remaining $28,000 <span class="bigRed">($68,000 for Stage 4)</span> will be distributed among the top 1/3 <span class="bigRed">(top 1/2 for Stage 4)</span> of point-getters (all people tied for the last spot will be included), and will be allocated based on the value of each placement point.  
<br><br>
For example:<br>
A total of 120 designers accumulate placement points during the Stage.  We will sum the total number of placement points accumulated by the top 40 designers and divide $28,000 <span class="bigRed">($68,000 for Stage 4)</span> by that number to find the dollar per placement point bonus that is available to those 40 designers.  If the total placement points of those 40 designers are 7,000, then each point is worth $4 ($28,000/7,000 = $4 per placement point).  Each of the top 40 designers, including the top 5, will receive $4 for each placement point received during the Stage.  In addition, the top 5 point-getters each Stage will receive the Top Five Stage prizes outlined above.
<br><br>
As an added prize, the top 5 point-getters from each Stage will win a trip to the TCO finals to be recognized.  At the TCO awards presentation, the overall highest point-getter for the entire year will be recognized as the winner of the TopCoder&#174; Design Cup.
<br><br>
Digital Run prize money will be paid at the end of each Stage within 60 days of announcing the Top Five and Top Third money winners.
<br><br>
</div>

</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>