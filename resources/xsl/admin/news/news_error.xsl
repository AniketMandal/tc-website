<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../css.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../left.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
<xsl:template match="/">
<html>

<head>
<title>Registration</title>



<xsl:call-template name="CSS"/>



</head>

<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">
<TABLE width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td colspan="2" valign="top">
      <xsl:choose>
        <xsl:when test="/ADMIN/LoggedIn='true'"> <xsl:call-template name="TopLoggedIn"/> </xsl:when>
        <xsl:otherwise>  <xsl:call-template name="TopLoggedOut"/> </xsl:otherwise>
      </xsl:choose>
    </td>
    <td width="100%" bgcolor="#4d0000"> <img src="/images/spacer.gif" width="1" height="1"/> </td>
  </tr> 
  <tr>
    <td valign="top">
      <table width="156" cellpadding="0" cellspacing="0" border="0">
        <xsl:choose>
          <xsl:when test="/ADMIN/LoggedIn='true'"> <xsl:call-template name="ContactMail_LO"/> </xsl:when>
        </xsl:choose>
        <tr> 
          <td valign="top"> 
            <xsl:call-template name="LeftSideNavBarForm"/>
          </td> 
        </tr>
      </table>

  </td>
  <td width="100%" bgcolor="#4d0000"><img src="/images/spacer.gif" width="1" height="1"/></td>
 </tr> 
<tr>
 <td valign="top">


<table width="156" cellpadding="0" cellspacing="0" border="0">





      <tr>
        <td valign="top">
        

        			
<xsl:call-template name="LeftSideNavBarForm"/>
              
              


              
              
              


       </td>
      </tr>
    </table>
  </td>
  <td valign="top">


<table width="619" cellspacing="0" cellpadding="0" border="0">
<tr>
  <td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="5" /></td>
</tr>
<tr>
  <td width="619" align="left"><img src="/images/mail_error.gif" width="619" height="20" /></td>
</tr>
</table><br/>

<table width="619" cellspacing="0" cellpadding="0" border="0">
 <tr>
  <td>
  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
  An error was encountered attempting to send an activation code to your e-mail address.  <b>Please contact support to activate your account.</b>
  </font>
  </td>
 </tr>
</table><br /><br/>

<table width="619" cellspacing="0" cellpadding="0" border="0">
 <tr>
  <td width="490" align="left"><img src="/images/whatnow_header.gif" width="619" height="20" /></td>
</tr>
</table><br/>

<table width="619" cellspacing="0" cellpadding="0" border="0">
 <tr>
  <td>
    <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
    <ul>
      <SCRIPT TYPE="text/javascript">setContactSubject('4')</SCRIPT>
      <li/><a href="JavaScript:doSubmitNavBar('contact','')">Contact Us with comments, questions, or suggestions</a>
      <li/><a href="JavaScript:doSubmitNavBar('','')">Return Home</a>
      <li/><a href="JavaScript:doSubmitNavBar('','competition')">Read about Competitions</a>
      <li/><a href="JavaScript:doSubmitNavBar('','help')">Go to the FAQ section</a>
    </ul>
    </font>
  </td>
 </tr>
</table> 
 
    
  
  </td>
  
    <td width="100%"><img src="/images/spacer.gif" width="1" height="1"/></td>

 </tr>
</table> 



</body>

</html>
</xsl:template>
</xsl:stylesheet>
