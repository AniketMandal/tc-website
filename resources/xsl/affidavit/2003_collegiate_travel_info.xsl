<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/news_events/public_news_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

    <TITLE>2003 Sun Microsystems and Topcoder Collegiate Challenge Information</TITLE>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

<!-- Top begins -->
<xsl:call-template name="Top"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC"><img src="/i/spacer.gif" height="1" width="170"/></td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/spacer.gif" height="1" width="6"/></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelgray</xsl:with-param>
                <xsl:with-param name="image">invitation_gray</xsl:with-param>
                <xsl:with-param name="title">2003 TopCoder Collegiate Challenge</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="0" width="100%" id="tccc_bkgd">
                <tr valign="top">
                    <td width="50%" align="right"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched"><img src="/i/tournament/tccc03/tccc03_home.gif" alt="" width="110" height="90" border="0" /></a></td>
                    <td width="50%" align="left"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched"><img src="/i/tournament/tccc03/sun03_home.gif" alt="Sun Microsystems" width="135" height="90" border="0" /></a></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>

        <p>
        <CENTER>
            2032 Sun Microsystems and <BR/>
            TopCoder Collegiate Challenge<BR/>
            April 4 - 5, 2003<BR/><BR/><BR/>
            Travel Information
        </CENTER>
        <BR/><BR/> <BR/><BR/>
        <B><U>HOTEL INFORMATION:</U></B><BR/>
        <BR/>
          University Park Hotel @ MIT<BR/>
          20 Sidney Street<BR/>
          Cambridge, MA 02139<BR/>
          Phone: (617) 577-0200<BR/>
        <BR/>
          A room will be confirmed for your arrival on April 3rd and departure on April 6th.   The check-in time is
          3:00pm and check-out time is 12:00noon.  If you have any special requests, please indicate them on the
          registration form. The cost of your sleeping room and applicable taxes will be charged to the TopCoder
          master account.  You will be required to provide a credit card upon check-in for any incidentals.<BR/>
        <BR/>
        <B><U>AIRLINE INFORMATION:</U></B><BR/>
        <BR/>
          TopCoder will secure airline reservations based upon your registration information and email a
          suggested travel itinerary to you.  Travel arrangements need to be finalized no later than Monday,
          March 17th.  Please be advised that once airlines tickets are confirmed, any changes are subject to
          penalty fees at your own expense.<BR/>
        <BR/>
        <B><U>AIRPORT TRANSPORTATION:</U></B><BR/>
        <BR/>
          TopCoder will provide round trip transportation to and from the University Park Hotel @ MIT and Boston/Logan
          airport. More information will be provided prior to the event. <B><U>Please plan for your arrival into Boston/Logan
          airport by 4:00pm on April 3rd.</U></B><BR/>
        <BR/>
        <BR/>
        <BR/>
        <CENTER>
          <H1>Registration Form</H1>
          <BR/>
          <BR/>
          <FONT color="#FF0000"><U><B>REGISTRATION DEADLINE:</B></U>  March 17, 2003</FONT>
        </CENTER>
        </p>


        <TABLE border="0" cellspacing="3" cellpadding="0" width="100%">
    <FORM name="questForm" method="POST" action="/">
        <INPUT TYPE="hidden" NAME="t" VALUE="affidavit"/>
        <INPUT TYPE="hidden" NAME="c" VALUE="2003_collegiate_submit_info"/>
            <TR><TD COLSPAN="2"><U><B>CONTACT INFORMATION:</B></U><BR/></TD></TR>

            <TR>
                <TD align="right"><INPUT TYPE="hidden" NAME="q1" VALUE="First Name"/>First Name: </TD>
                <TD align="left"><INPUT TYPE="text" NAME="a1" size="20"><xsl:attribute name="value"><xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/first_name"/></xsl:attribute></INPUT><BR/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q2" VALUE="Last Name"/>Last Name: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a2" size="20"><xsl:attribute name="value"><xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/last_name"/></xsl:attribute></INPUT><BR/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q3" VALUE="Social Security #"/>Social Security #: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a3" size="10"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q4" VALUE="Date of Birth"/>Date of Birth: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a4" size="10"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q5" VALUE="Handle"/>Handle: </TD>
              <TD align="left"><INPUT TYPE="text" NAME="a5" size="15"><xsl:attribute name="value"><xsl:value-of select="/TC/AFFIDAVIT/Affidavit/Info/handle"/></xsl:attribute></INPUT></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q6" VALUE="Phone"/>Phone:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a6" size="15"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q7" VALUE="School"/>School:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a7" size="30"/></TD>
            </TR>
            <BR/>
            <TR><TD COLSPAN="2"><U><B>Mailing address:</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q8" VALUE="Street Address"/>Street Address:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a8" size="50"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q9" VALUE="City"/>City:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a9" size="25"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q10" VALUE="State"/>State:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a10" size="2"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q11" VALUE="Zip"/>Zip:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a11" size="15"/></TD>
            </TR>

            <BR/>
            <TR><TD COLSPAN="2"><U><B>Emergency contact:</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q12" VALUE="Emergency contact Name"/>Name:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a12" size="30"/><BR/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q13" VALUE="Emergency contact Phone"/>Phone:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a13" size="15"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q14" VALUE="Emergency contact Relationship"/>Relationship:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a14" size="30"/></TD>
            </TR>

            <BR/>


            <TR><TD COLSPAN="2"><U><B>Media Information:</B></U></TD></TR>

            <TR>
              <TD COLSPAN="2">
                  Please list your local newspapers, radio, and television stations for both hometown and college locations.
              </TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q15" VALUE="Newspapers"/>Newspapers:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a15" size="50"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q16" VALUE="Radio"/>Radio:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a16" size="50"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q17" VALUE="TV"/>TV:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a17" size="50"/></TD>
            </TR>

            <BR/>
            <TR><TD COLSPAN="2"><U><B>Miscellaneous:</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q18" VALUE="Shirt size"/>Shirt size:</TD>
              <TD align="left">
                  <SELECT name="a18">
                      <OPTION value="S">S</OPTION>
                      <OPTION value="M">M</OPTION>
                      <OPTION value="L">L</OPTION>
                      <OPTION value="XL">XL</OPTION>
                      <OPTION value="XXL">XXL</OPTION>
                  </SELECT>
              </TD>
            </TR>

            <BR/>
            <TR><TD COLSPAN="2"><U><B>GUEST INFORMATION:</B></U></TD></TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q19" VALUE="Guest First Name"/>First Name:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="q19" size="20"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q20" VALUE="Guest Last Name"/>Last Name:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a20" size="20"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q21" VALUE="Guest Date of Birth"/>Date of Birth:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a21" size="15"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q22" VALUE="Guest Phone"/>Phone:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a22" size="15"/></TD>
            </TR>
            <BR/>
            <TR><TD COLSPAN="2"><U><B>Emergency contact (for guest):</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q23" VALUE="Guest Emergency Contact Name"/>Name:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a23" size="30"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q24" VALUE="Guest Emergency Contact Phone"/>Phone:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a24" size="15"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q25" VALUE="Guest Emergency Contact Relationship"/>Relationship:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a25" size="30"/></TD>
            </TR>

            <BR/>
            <TR><TD COLSPAN="2"><U><B>TRAVEL INFORMATION:</B></U></TD></TR>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q26" VALUE="Departure City/Airport"/>Departure City/Airport:</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a26" size="50"/></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q27" VALUE="Guest Departure City/Airport (if different)"/>Guest Departure City/Airport (if different):</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a27" size="50"/></TD>
            </TR>

            <BR/>
            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q28" VALUE="November 21, 2002 - preferred departure time"/>November 21, 2002 - preferred departure time:</TD>
              <TD align="left"><SELECT name="a28"><OPTION value="AM">AM</OPTION><OPTION value="PM">PM</OPTION></SELECT></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q29" VALUE="November 24, 2002 - preferred departure time"/>November 24, 2002 - preferred departure time:</TD>
              <TD align="left"><SELECT name="a29"><OPTION value="AM">AM</OPTION><OPTION value="PM">PM</OPTION></SELECT></TD>
            </TR>

            <BR/>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q30" VALUE="Seating preference"/>Seating preference:</TD>
              <TD align="left"><SELECT name="a30"><OPTION value="Window">Window</OPTION><OPTION value="Aisle">Aisle</OPTION></SELECT></TD>
            </TR>

            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q31" VALUE="Preference for your hotel room"/>Preference for your hotel room :</TD>
              <TD align="left"><SELECT name="a31"><OPTION value="Smoking">Smoking</OPTION><OPTION value="Non Smoking">Non Smoking</OPTION></SELECT></TD>
            </TR>


            <TR>
              <TD align="right"><INPUT TYPE="hidden" NAME="q32" VALUE="Personal Considerations/Special Requests"/>Personal Considerations/Special Requests: (Physical requirements or Medical needs)</TD>
              <TD align="left"><INPUT TYPE="text" NAME="a32" size="50"/></TD>
            </TR>
            <TR><TD COLSPAN="2" ALIGN="center"><input type="submit" name="submit" value=" Submit "/></TD></TR>
            </FORM>
        </TABLE>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
                <tr><td colspan="4" valign="top" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>
