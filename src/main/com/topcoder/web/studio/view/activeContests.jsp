<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div class="contentOut">
        <jsp:include page="top.jsp">
            <jsp:param name="section" value="default"/>
        </jsp:include>
        <jsp:include page="topNav.jsp">
            <jsp:param name="node" value="contests"/>
        </jsp:include>
        <div class="contentIn">
            <img src="/i/studio/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <h1>Active Contests</h1>


                <h2 align="right">Need help? Learn how to <strong><A href="/?module=Static&d1=support&d2=getStarted">get
                    started</A></strong></h2>

                <table cellpadding="0" cellspacing="0" border="0" style="clear:both; margin-left: 10px;">
                    <tr>
                        <td width="50%"><A href="/?module=ViewActiveContests" class="statTabLinkOn"><span>Active Contests</span></A>
                        </td>
                        <td width="50%">
                            <A href="/?module=ViewPastContests" class="statTabLinkOff"><span>Past Contests</span></A>
                        </td>
                    </tr>
                </table>
                <table class="stat" cellpadding="0" cellspacing="0" style="width:740px">
                    <tbody>
                        <tr>
                            <td class="NW">&nbsp;</td>
                            <td class="title" colspan="5">Active Contests</td>
                            <td class="NE">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="headerW"><div>&nbsp;</div></td>
                            <td class="header">
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Project</a>
                            </td>
                            <td class="headerC">
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("start_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Start
                                    Date</a></td>
                            <td class="headerC">
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("end_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">End
                                    Date</a></td>
                            <td class="headerR">
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("amount")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Payment</a>
                            </td>
                            <td class="header">&nbsp;</td>
                            <td class="headerE"><div>&nbsp;</div></td>
                        </tr>
                        <% boolean even = true;%>
                        <rsc:iterator list="<%=contests%>" id="resultRow">
                            <tr class="<%=even?"light":"dark"%>">
                                <td class="valueW"><div>&nbsp;</div></td>
                                <td class="value">
                                    <A href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                        <rsc:item name="name" row="<%=resultRow%>"/></A></td>
                                <td class="valueC">
                                    <rsc:item name="start_time" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="${sessionInfo.timezone}"/></td>
                                <td class="valueC">
                                    <rsc:item name="end_time" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="${sessionInfo.timezone}"/></td>
                                <td class="valueR">
                                    <rsc:item name="amount" row="<%=resultRow%>" format="$0.00" ifNull="&nbsp;"/></td>
                                <td class="valueC">
                                    <div align="right">
                                        <A href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>" class="btn_submit">
                                            &nbsp;</A></div>
                                </td>
                                <td class="valueE"><div>&nbsp;</div></td>
                            </tr>
                            <% even = !even;%>
                        </rsc:iterator>
                        <tr>
                            <td class="SW" colspan="6">&nbsp;</td>
                            <td class="SE">&nbsp;</td>
                        </tr>
                    </tbody>
                </table>


            </div>
            <img src="/i/studio/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
        <jsp:include page="foot.jsp"/>
        <img src="/i/studio/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>