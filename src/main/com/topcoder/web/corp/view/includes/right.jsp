<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         autoFlush="false" %>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
%>
                    <td width="190" align ="left">
                        <img src="/i/spacer.gif" alt="" width="170" height="1" border="0" class="corpRight"><br>

<!-- Candidate Testing begins-->
<% if (level1.equals("testing")) { %>
    <% if ((level2.equals("overview")) || (level2.equals("attributes")) || (level2.equals("management"))) { %>
                        <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=pricing" target="_parent" class="corpLeft"><img src="/i/buy_now.gif" alt="Buy Now" width="170" height="50" border="0" class="corpRight"></a><br>
                        <a href="/testing/"><img src="/i/promo_launch_test_mgmt.gif" alt="Launch Testing Management Tool" width="170" height="129" border="0" class="corpRight"></a><br>
    <% } %>
                        <a href="mailto:tces@topcoder.com"><img src="/i/promo_contact_tces.gif" alt="Contact TCES" width="170" height="76" border="0" class="corpRight"></a><br>
<% } %>
<!-- Candidate Testing ends -->

<!-- Recruiting begins-->
<% if (level1.equals("recruiting")) { %>
    <% if ((level2.equals("overview")) || (level2.equals("reporting"))) { %>
                        <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=pricing" target="_parent" class="corpLeft"><img src="/i/buy_now.gif" alt="Buy Now" width="170" height="50" border="0" class="corpRight"></a><br>
                        <a href="/tces/?task=MainTask"><img src="/i/promo_launch_report_tool.gif" alt="Recruiting Report Tool" width="170" height="136" border="0" class="corpRight"></a><br>
    <% } %>
                        <a href="mailto:tces@topcoder.com"><img src="/i/promo_contact_tces.gif" alt="Contact TCES" width="170" height="76" border="0" class="corpRight"></a><br>
<% } %>
<!-- Recruiting ends -->

<!-- Sponsorship begins-->
<% if ((level1.equals("sponsor")) || (level1.equals("srm")) || (level1.equals("tourny")) || (level1.equals("pbtc")) || (level1.equals("private_labelxs"))) { %>
                        <a href="http://www.topcoder.com/?t=tournaments&c=tco03_overview"><img src="/i/promo_2003_open.gif" alt="2003 TopCoder Open" width="170" height="195" border="0" class="corpRight"></a><br>
                        <a href="mailto:sponsorships@topcoder.com?"><img src="/i/promo_contact_sponsor.gif" alt="Contact Sponsorship sales" width="170" height="76" border="0" class="corpRight"></a><br>
<% } %>
<!-- Sponsorship ends -->

                        <a href="/i/tc_demo_0203.pdf"><img src="/i/promo_demographics.gif" alt="Download Demographics" width="170" height="192" border="0" class="corpRight"></a><br>
                    </td>
