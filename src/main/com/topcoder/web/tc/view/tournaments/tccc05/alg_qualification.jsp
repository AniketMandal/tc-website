<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="advancers"/>
<jsp:param name="tabLev3" value="qualification"/>
</jsp:include>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tccc05_alg_qual"); %>


<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=bigTitle>Advancers</p>
 
            <table width="500" border="0" cellpadding="6" cellspacing="0" class="formFrame">
                <tr>
                  <td class="advTitle" width="100%" colspan="5">Qualification Round</td>
               </tr>
                <tr class="advHeader">
                   <td width="10%" align="center">
                       <a href="/">
                           Seed
                       </a>
                   </td>
                   <td width="30%" align="left">
                       <a href="/">
                           Handle
                       </a>
                   </td>
                   <td width="30%" align="center">
                       <a href="/">
                           Problem Set
                       </a>
                   </td>
                   <td width="15%" align="right">
                       <a href="/">
                           Rating
                       </a>
                   </td>
                   <td width="15%" align="right">
                       <a href="/">
                           Points
                       </a>
                   </td>
                </tr>
                
                                <%boolean even = false;%>
                <rsc:iterator list="<%=rsc%>" id="resultRow"><tr>
                <td class="<%=even?"advanceDk":"advanceLt"%>" align="center"><rsc:item name="seed" row="<%=resultRow%>"/></td>
                <td class="<%=even?"advanceDk":"advanceLt"%>" align="left"><A HREF="/stat?c=member_profile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>" CLASS="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item name="handle" row="<%=resultRow%>"/></A></td>
                <td class="<%=even?"advanceDk":"advanceLt"%>" align="center" nowrap="0"><rsc:item name="round_name" row="<%=resultRow%>"/></td>
                <td class="<%=even?"advanceDk":"advanceLt"%>" align="right"><rsc:item name="rating" row="<%=resultRow%>"/></td>
                <td class="<%=even?"advanceDk":"advanceLt"%>" align="right"><rsc:item name="points" row="<%=resultRow%>" format="0.00"/></td>
                </tr>
                   <%even=!even;%>
                </rsc:iterator>
             
            </table>

        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tccc05"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
