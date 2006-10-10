<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.model.CoderSessionInfo,
                 com.topcoder.web.common.BaseServlet"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer coderInfo= (ResultSetContainer)request.getAttribute("member_info");%>
<% CoderSessionInfo info = (CoderSessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);%>

<% if (coderInfo!=null && !coderInfo.isEmpty()) { %>
<table width="180" border="0" cellspacing="0" cellpadding="3" bgcolor="#555555">
    <tr>
        <td class="statTextBig" bgcolor="#333333">&#160;Coder: 
        <tc-webtag:handle coderId='<%=coderInfo.getLongItem(0, "coder_id")%>'/><br>
            Total Earnings: 
            <% if (coderInfo.getItem(0, "overall_earnings").getResultData() == null || coderInfo.getDoubleItem(0, "overall_earnings") > 0) { %>
                <A href="/tc?module=PaymentSummary&cr=<%=info.getUserId()%>" class="statTextBig">
                    <rsc:item set="<%=coderInfo%>" name="overall_earnings" format="$#,##0.00" ifNull="$0.00"/>
                </A>
            <% } else { %>
                $0.00
            <% } %>
        </td>
    </tr>

    <tr>
        <td align="center">
        <a href="<%=coderInfo.getIntItem(0, "has_image")==0?"https://"+request.getServerName()+"/reg/?nrg=false":"/tc?module=MemberProfile&cr="+coderInfo.getIntItem(0, "coder_id")%>"><img src="<rsc:item set="<%=coderInfo%>" name="image_path" ifNull="/i/m/nophoto_submit.gif"/>" alt="" width="126" height="140" border="0" class="myStatsPhoto" /></a>
        </td>
    </tr>
</table>

<table width="180" border="0" cellspacing="0" cellpadding="3">
    <tr><td colspan="2" class="myStatsTitle">Algorithm</td></tr>

    <tr>
        <td class="formHandleEven">Rating</td>
        <td class="formHandleEven" align="right">
        <% if (coderInfo.getItem(0, "rating").getResultData()==null||coderInfo.getIntItem(0, "rating")<1) { %>
        Not Rated
        <% } else { %>
        <A href="/tc?module=AlgoCompetitionHistory&cr=<%=info.getUserId()%>" class="statTextBig"><rsc:item set="<%=coderInfo%>" name="rating" ifNull="Not Rated"/></A>
        <% } %>
        </td>
    </tr>
    <% if (coderInfo.getItem(0, "rating").getResultData()!=null&&coderInfo.getIntItem(0, "rating")>0) { %>
   <tr>
      <td class="formHandleEven" colspan="2" align="center">
      <A href="/stat?c=coder_room_stats&cr=<%=coderInfo.getLongItem(0, "coder_id")%>" class="statTextBig">My Last Match</A>
      </td>
   </tr>
    <% } %>

    <tr><td colspan="2" class="myStatsTitle">Design</td></tr>

    <tr>
        <td class="formHandleEven">Rating</td>
        <td class="formHandleEven" align="right">
            <% if (coderInfo.getItem(0, "design_rating").getResultData()!=null 
                    && coderInfo.getIntItem(0, "design_rating")>0) { %>
            <A href="/tc?module=CompetitionHistory&ph=112&cr=<%=info.getUserId()%>" class="statTextBig">
                <rsc:item set="<%=coderInfo%>" name="design_rating" format="#"/>
            </A>
            <% } else {%>
            Not Rated
            <% } %>
        </td>
    </tr>

    <tr><td colspan="2" class="myStatsTitle">Development</td></tr>

    <tr>
        <td class="formHandleEven">Rating</td>
        <td class="formHandleEven" align="right">
            <% if (coderInfo.getItem(0, "development_rating").getResultData()!=null 
                    && coderInfo.getIntItem(0, "development_rating")>0) { %>
            <A href="/tc?module=CompetitionHistory&ph=113&cr=<%=info.getUserId()%>" class="statTextBig">
                <rsc:item set="<%=coderInfo%>" name="development_rating" format="#"/>
            </A>
            <% } else {%>
            Not Rated
            <% } %>
        </td>
    </tr>
</table>

<% } else { %>
<table width="180" border="0" cellspacing="0" cellpadding="5" bgcolor="#555555">
    <tr>
        <td class="statTextBig" bgcolor="#333333">Coder: 
        <a href="/tc?module=MemberProfile&cr=<%=info.getUserId()%>" class="<tc:ratingStyle rating='<%=info.getRating()%>'/>"><%=info.getHandle()%></a>
        </td>
    </tr>

    <tr>
        <td class="statText">
            <p>You are not rated for any TopCoder Competition.</p>

            <p>To learn more about Algorithm Competitions, go to the 
            <a href="/tc?module=Static&d1=help&d2=index" class="statText">Competition Guide.</a></p>

         <p>To learn more about Design Competitions, check out 
         <A href="/tc?module=Static&d1=dev&d2=support&d3=desGettingStarted" class="statText">this tutorial</A>.</p>

         <p>To learn more about Development Competitions, check out 
            <A href="/tc?module=Static&d1=dev&d2=support&d3=devGettingStarted" class="statText">this tutorial</A>.</p>
        </td>
    </tr>
</table>

<% } %>