<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<div id="tourneyLogo">
    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=about"><img src="/i/tournament/tco07/tco07aollogo.png" alt="2007 TopCoder Open Sponsored by AOL&#174;"/></a>
</div>
<div style="position: absolute; left: 400px; top: 50px;">
    <map name="headerLinks">
    <area shape="rect" alt="" coords="3,3, 112,25" href="/pdfs/tournaments/TCO07_Program_View.pdf" />
    <area shape="rect" alt="" coords="124,3, 210,25" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movies" />
    <area shape="rect" alt="" coords="224,3, 309,25" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=photos" />
    <area shape="rect" alt="" coords="323,3, 394,25" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=blogs&d4=overview" />
    </map>
    <img src="/i/tournament/tco07/headerLinks.png" alt="Register Now for the TCO07" usemap="#headerLinks" />
<%--
    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=registerNow"><img src="/i/tournament/tco07/registerNow.png" alt="Register Now for the TCO07"/></a>
--%>
</div>
<div id="redbar">
    <div id="pageBodyN">&nbsp;</div>
    <div style="margin: 4px 10px 4px 10px;">
        <div style="float: right;">
            <tc-webtag:format object="<%=new Date()%>" format="EEEE, MMMM d, yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>
        </div>
        &nbsp;
    </div>
</div>
<img src="/i/tournament/tco07/contentN.png" alt="contentN" style="display: block;"/>