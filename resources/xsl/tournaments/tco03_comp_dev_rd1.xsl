<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tco03_head.xsl"/>
  <xsl:import href="../includes/modules/tco03_links.xsl"/>
  <xsl:import href="../includes/modules/tco03_sublinks.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>

<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Overview</title>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body onLoad="timer(1);">

<a name="top_page"></a>

<xsl:variable name="contestId">
    <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
</xsl:variable>

<!-- Top Begins -->
<xsl:call-template name="Top"/>
<!-- Top Ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText">

<!-- TCO Head Begins -->
<xsl:call-template name="tco03_head"/>
<!-- TCO Head Ends -->

<!-- Tab bar links-->
            <xsl:call-template name="tco03_links">
                <xsl:with-param name="selectedContest">component</xsl:with-param>
                <xsl:with-param name="selectedTab">competitors</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="tco03_sublinks">
                <xsl:with-param name="selectedTab"></xsl:with-param>
            </xsl:call-template>

            <blockquote>
            <h2>Competitors</h2>
            <div align="right" class="bodyText"><A href="/index?t=tournaments&amp;c=tco03_comp_des_rd1">Design</A>&#160;&#160;|&#160;&#160;<strong>Development</strong></div>
            <br/>
            
    <!-- Design Winners Begins -->
            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Development Advancers</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center" class="formFrame">
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="10%" align="center">Seed</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="20%" align="left">Handle</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Average Score</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="30%" align="right">Round Scores</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Tournament Earnings</td>
                </tr>
                
                <tr valign="middle">
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154579">Altrag</a></td>
                    <td class="formHandleOdd" align="right">95.11</td>
                    <td class="formHandleOdd" align="right"><strong>94.32, 95.90</strong></td>
                    <td class="formHandleOdd" align="right">$240.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven" align="left"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=153089">preben</a></td>
                    <td class="formHandleEven" align="right">91.98</td>
                    <td class="formHandleEven" align="right"><strong>84.24, 99.71</strong></td>
                    <td class="formHandleEven" align="right">$94.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="formHandleOdd" align="right">91.91</td>
                    <td class="formHandleOdd" align="right"><strong>86.78, 97.04</strong></td>
                    <td class="formHandleOdd" align="right">$168.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">4</td>
                    <td class="formHandleEven" align="left"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=154714">rnielsen</a></td>
                    <td class="formHandleEven" align="right">91.37</td>
                    <td class="formHandleEven" align="right"><strong>87.66, 88.00, 85.08</strong></td>
                    <td class="formHandleEven" align="right">$96.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">5</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=266149">akhil_bansal</a></td>
                    <td class="formHandleOdd" align="right">87.99</td>
                    <td class="formHandleOdd" align="right"><strong>94.21, 93.04, 81.77, 93.29</strong></td>
                    <td class="formHandleOdd" align="right">$72.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">6</td>
                    <td class="formHandleEven" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=273428">rbnn</a></td>
                    <td class="formHandleEven" align="right">83.52</td>
                    <td class="formHandleEven" align="right"><strong>71.91, 95.12</strong></td>
                    <td class="formHandleEven" align="right">$48.00</td>
                </tr>

            </table>
           
           <br/><br/>
            
            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Development Wild Card Pool</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center" class="formFrame">
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="10%" align="center">Seed</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="20%" align="left">Handle</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Average Score</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="30%" align="right">Round Scores</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Tournament Earnings</td>
                </tr>
                
                <tr valign="middle">
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=154307">holmana</a></td>
                    <td class="formHandleOdd" align="right">99.79</td>
                    <td class="formHandleOdd" align="right"><strong>99.79</strong></td>
                    <td class="formHandleOdd" align="right">$96.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
                    <td class="formHandleEven" align="right">97.92</td>
                    <td class="formHandleEven" align="right"><strong>97.92</strong></td>
                    <td class="formHandleEven" align="right">$96.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=278460">Ukraine</a></td>
                    <td class="formHandleOdd" align="right">96.25</td>
                    <td class="formHandleOdd" align="right"><strong>86.78, 97.04</strong></td>
                    <td class="formHandleOdd" align="right">$96.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">4</td>
                    <td class="formHandleEven" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=289251">ragnabot</a></td>
                    <td class="formHandleEven" align="right">95.88</td>
                    <td class="formHandleEven" align="right"><strong>96.25</strong></td>
                    <td class="formHandleEven" align="right">$48.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">5</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=299904">mishagam</a></td>
                    <td class="formHandleOdd" align="right">93.64</td>
                    <td class="formHandleOdd" align="right"><strong>95.88</strong></td>
                    <td class="formHandleOdd" align="right">$96.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">6</td>
                    <td class="formHandleEven" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=139153">johnm4</a></td>
                    <td class="formHandleEven" align="right">92.41</td>
                    <td class="formHandleEven" align="right"><strong>93.64</strong></td>
                    <td class="formHandleEven" align="right">$0.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">7</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=269754">j_johnso</a></td>
                    <td class="formHandleOdd" align="right">91.23</td>
                    <td class="formHandleOdd" align="right"><strong>91.23</strong></td>
                    <td class="formHandleOdd" align="right">$0.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">8</td>
                    <td class="formHandleEven" align="left"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=108281">Code-Guru</a></td>
                    <td class="formHandleEven" align="right">91.11</td>
                    <td class="formHandleEven" align="right"><strong>87.9, 91.11</strong></td>
                    <td class="formHandleEven" align="right">$0.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">9</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=273206">b0b0b0b</a></td>
                    <td class="formHandleOdd" align="right">90.98</td>
                    <td class="formHandleOdd" align="right"><strong>90.98</strong></td>
                    <td class="formHandleOdd" align="right">$0.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">10</td>
                    <td class="formHandleEven" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309786">Yi_Zhang</a></td>
                    <td class="formHandleEven" align="right">90.90</td>
                    <td class="formHandleEven" align="right"><strong>90.90</strong></td>
                    <td class="formHandleEven" align="right">$0.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">11</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=297731">TheCois</a></td>
                    <td class="formHandleOdd" align="right">89.17</td>
                    <td class="formHandleOdd" align="right"><strong>89.17</strong></td>
                    <td class="formHandleOdd" align="right">$0.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">12</td>
                    <td class="formHandleEven" align="left"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=151634">axiom</a></td>
                    <td class="formHandleEven" align="right">89.00</td>
                    <td class="formHandleEven" align="right"><strong>89.00</strong></td>
                    <td class="formHandleEven" align="right">$0.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">13</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=292290">CagedRat</a></td>
                    <td class="formHandleOdd" align="right">84.36</td>
                    <td class="formHandleOdd" align="right"><strong>84.36</strong></td>
                    <td class="formHandleOdd" align="right">$96.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">14</td>
                    <td class="formHandleEven" align="left"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=151920">Khristopher</a></td>
                    <td class="formHandleEven" align="right">84.12</td>
                    <td class="formHandleEven" align="right"><strong>84.12</strong></td>
                    <td class="formHandleEven" align="right">$96.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">15</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=310712">mayank19m</a></td>
                    <td class="formHandleOdd" align="right">83.46</td>
                    <td class="formHandleOdd" align="right"><strong>83.46</strong></td>
                    <td class="formHandleOdd" align="right">$0.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">16</td>
                    <td class="formHandleEven" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7398059">Jiggly</a></td>
                    <td class="formHandleEven" align="right">76.50</td>
                    <td class="formHandleEven" align="right"><strong>76.50</strong></td>
                    <td class="formHandleEven" align="right">$0.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">17</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=269886">n0vice</a></td>
                    <td class="formHandleOdd" align="right">75.46</td>
                    <td class="formHandleOdd" align="right"><strong>75.46</strong></td>
                    <td class="formHandleOdd" align="right">$48.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">18</td>
                    <td class="formHandleEven" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018">Tomson</a></td>
                    <td class="formHandleEven" align="right">74.39</td>
                    <td class="formHandleEven" align="right"><strong>74.39</strong></td>
                    <td class="formHandleEven" align="right">$0.00</td>
                </tr>

            </table>            


           <br/><br/>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Project Scores</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center" class="formFrame">
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="25%">Project Name</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15" align="center">Total<br/>Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="10%" align="center">Place</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%">Winner(s)</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%" align="right">Board&#160;Score</td>
                </tr>
                
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=6526755" class="statText" target="_blank">.NET Command Line Utility</a></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=292290"><strong>CagedRat</strong></a></td>
                    <td class="formHandleOdd" align="right">84.36</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=269886"><strong>n0vice</strong></a></td>
                    <td class="formHandleEven" align="right">75.46</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018"><strong>Tomson</strong></a></td>
                    <td class="formHandleOdd" align="right">74.39</td>
                </tr>
            
                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=4312547" class="statText" target="_blank">API Version Compatibility</a></td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=273428"><strong>rbnn</strong></a></td>
                    <td class="formHandleEven" align="right">71.91</td>
                </tr>
            
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7289752" class="statText" target="_blank">Complex Number</a></td>
                    <td class="formHandleOdd" align="center">10</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145"><strong>srowen</strong></a></td>
                    <td class="formHandleOdd" align="right">97.92</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=273428"><strong>rbnn</strong></a></td>
                    <td class="formHandleEven" align="right">95.12</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=154714"><strong>rnielsen</strong></a></td>
                    <td class="formHandleOdd" align="right">95.08</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">4</td>
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=266149"><strong>akhil_bansal</strong></a></td>
                    <td class="formHandleEven" align="right">93.29</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">5</td>
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=269754"><strong>j_johnso</strong></a></td>
                    <td class="formHandleOdd" align="right">91.23</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">6</td>
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=108281"><strong>Code_Guru</strong></a></td>
                    <td class="formHandleEven" align="right">91.11</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">7</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309786"><strong>Yi_Zhang</strong></a></td>
                    <td class="formHandleOdd" align="right">90.90</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">8</td>
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=297731"><strong>TheCois</strong></a></td>
                    <td class="formHandleEven" align="right">89.17</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">9</td>
                    <td class="formHandleOdd"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=310712"><strong>mayank19m</strong></a></td>
                    <td class="formHandleOdd" align="right">83.46</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">10</td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7398059"><strong>Jiggly</strong></a></td>
                    <td class="formHandleEven" align="right">76.50</td>
                </tr>
            
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=6401733" class="statText" target="_blank">Date Utility</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018"><strong>aksonov</strong></a></td>
                    <td class="formHandleOdd" align="right">86.78</td>
                </tr>
            
                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=5903352" class="statText" target="_blank">HTTP Listener</a></td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=151920"><strong>Khristopher</strong></a></td>
                    <td class="formHandleEven" align="right">84.12</td>
                </tr>
            
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=5800322" class="statText" target="_blank">NNTP Client</a></td>
                    <td class="formHandleOdd" align="center">4</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=154579"><strong>Altrag</strong></a></td>
                    <td class="formHandleOdd" align="right">94.32</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=154714"><strong>rnielsen</strong></a></td>
                    <td class="formHandleEven" align="right">87.66</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=153089"><strong>preben</strong></a></td>
                    <td class="formHandleOdd" align="right">84.24</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">4</td>
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=266149"><strong>akhil_bansal</strong></a></td>
                    <td class="formHandleEven" align="right">81.77</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7339417" class="statText" target="_blank">Synchronous Processing Wrapper</a></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=154579"><strong>Altrag</strong></a></td>
                    <td class="formHandleOdd" align="right">95.90</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=266149"><strong>akhil_bansal</strong></a></td>
                    <td class="formHandleEven" align="right">92.57</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=139153"><strong>johnm4</strong></a></td>
                    <td class="formHandleOdd" align="right">92.41</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=6601809" class="statText" target="_blank">Trie Collection</a></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=299904"><strong>mishagam</strong></a></td>
                    <td class="formHandleEven" align="right">93.64</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7361823" class="statText" target="_blank">Type Safe Enum</a></td>
                    <td class="formHandleOdd" align="center">6</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=278460"><strong>Ukraine</strong></a></td>
                    <td class="formHandleOdd" align="right">96.25</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=289251"><strong>ragnabot</strong></a></td>
                    <td class="formHandleEven" align="right">95.88</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=266149"><strong>akhil_bansal</strong></a></td>
                    <td class="formHandleOdd" align="right">94.21</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">4</td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=273206"><strong>b0b0b0b</strong></a></td>
                    <td class="formHandleEven" align="right">90.98</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">5</td>
                    <td class="formHandleOdd"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=151634"><strong>axiom</strong></a></td>
                    <td class="formHandleOdd" align="right">89.00</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">6</td>
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=154714"><strong>rnielsen</strong></a></td>
                    <td class="formHandleEven" align="right">88.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7353016" class="statText" target="_blank">Unsigned Data Types</a></td>
                    <td class="formHandleOdd" align="center">5</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=154307"><strong>holmana</strong></a></td>
                    <td class="formHandleOdd" align="right">99.79</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=153089"><strong>preben</strong></a></td>
                    <td class="formHandleEven" align="right">99.71</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018"><strong>aksonov</strong></a></td>
                    <td class="formHandleOdd" align="right">97.04</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">4</td>
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=266149"><strong>akhil_bansal</strong></a></td>
                    <td class="formHandleEven" align="right">93.04</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">5</td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=108281"><strong>Code_Guru</strong></a></td>
                    <td class="formHandleOdd" align="right">87.90</td>
                </tr>

            </table>
            </blockquote>
            <p><br/></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

  <!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">tco03</xsl:with-param>
            </xsl:call-template>
        </td>
  <!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<xsl:call-template name="Foot"/>
<!-- Footer Ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

