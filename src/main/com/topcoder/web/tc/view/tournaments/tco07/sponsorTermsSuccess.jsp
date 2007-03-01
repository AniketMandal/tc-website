<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp"/>
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="header.jsp"/>

        <table cellpadding="0" cellspacing="0" id="spacer">
            <tbody>
                <tr>
                    <td id="navSpacer">

                        <jsp:include page="nav.jsp">
                            <jsp:param name="tabLev1" value="alogrithm"/>
                            <jsp:param name="tabLev2" value="register"/>
                            <jsp:param name="tabLev3" value=""/>
                        </jsp:include>

                    </td>
                    <td id="bodySpacer" width="100%">
                        <div id="pageBody">

                            <h1>
                                <div>
                                    <c:choose>
                                        <c:when test="${eligible}">
                                            Registration Successful
                                        </c:when>
                                        <c:otherwise>
                                            Registration Failed
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </h1>


                            <div align="center" style="margin:40px;">
                                <c:choose>
                                    <c:when test="${eligible}">
                                        You have successfully registered for the<br><strong>${event.description}
                                        </strong>.
                                    </c:when>
                                    <c:otherwise>
                                        Sorry, you are ineligible for the <strong>${event.description}
                                    </strong>. If this is a mistake, contact <A href="mailto:service@topcoder.com">service@topcoder.com</A>.
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </td>
                </tr>
        </table>


        <jsp:include page="footer.jsp"/>
    </div>
</div>

</body>

</html>
