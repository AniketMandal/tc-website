<%@ page
  language="java"
  import="com.topcoder.web.tc.controller.legacy.stat.common.JSPUtils,
          com.topcoder.shared.dataAccess.*,
          com.topcoder.shared.dataAccess.resultSet.*,
          com.topcoder.shared.util.ApplicationServer,
          java.text.Decimalformat,
          java.util.ArrayList"
%>

<%@ taglib uri="struts-bean.tld" prefix="bean" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<html>
 <head>
   <title>TopCoder Statistics - Round Overview</title>
   <jsp:include page="baseHRef.jsp" />
   <link rel="stylesheet" type="text/css" href="/css/style.css"/>
   <link rel="stylesheet" type="text/css" href="/css/coders.css"/>
   <jsp:include page="../script.jsp" />
 </head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="round_overview"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" width="100%" align="center">
         
         <table width="100%" border="0" cellpadding="0" cellspacing="0" valign="top">
           <tr>
             <td width="11" height="26" align="left" valign="bottom"><img width="11" height="26" border="0" src="/i/steelblue_top_left1.gif"></td>
             <td valign="bottom" width="180" align="left"><img width="180" height="26" border="0" src="/i/header_statistics.gif"></td>
             <td class="bodyTextBold" valign="middle" width="100%">&#160;<span class="bodySubhead">&#160;&#160;<%= "Round Overview"%>&#160;&#160;</span></td>
             <td valign="top" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="26" border="0"></td>
           </tr>
         </table>
         <br/>
         
<script language="JavaScript">
   function submitform(){
   var frm = document.coderRankform;
   frm.action = "/stat";
    if (isNaN(parseInt(frm.er.value)))
      alert(frm.er.value+" is not a valid integer");
    else{
      frm.er.value = parseInt(frm.er.value);
      frm.submit();
    }
   }
</script>

<% //common code that pulls out the request bean.
    Request srb = (Request) request.getAttribute("REQUEST_BEAN");
%>
<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>
<%
    Decimalformat df = new Decimalformat("0.00");
    Decimalformat dfp = new Decimalformat("0.00%");
    ResultSetContainer leaders = (ResultSetContainer) queryEntries.get("High_Scorers");
    ResultSetContainer percents = (ResultSetContainer) queryEntries.get("Round_Percentages");
    ResultSetContainer image = (ResultSetContainer) queryEntries.get("Round_Sponsor_Image");

    ResultSetContainer.ResultSetrow currentrow = null;
    int topN = 5;
    try{
      topN = Integer.parseInt(srb.getProperty("er","5"));
    }catch(Exception e){}
    boolean lastMatch = request.getParameter("rd") == null;
//    if(!lastMatch)lastMatch = request.getAttribute("rd").toString().length()==0;
    if(topN<0)topN = 5;
    if(topN>1000)topN=1000;
    currentrow = leaders.getrow(0);
    String contestName = currentrow.getItem("contest_name").toString();
    int roundID = Integer.parseInt(currentrow.getItem("round_id").toString());
    String forumIDStr = currentrow.getItem("forum_id").toString();
    int forumID = -1;
    if (forumIDStr != "") {
        forumID = Integer.parseInt(forumIDStr);
    }
    //get divisionIDs
    ArrayList divisionNames = new ArrayList(5);
    ArrayList divisionIDs = new ArrayList(5);
    String last = "";
    int divisions = 0;
    //first we go through and extract all the division info
    for(int i = 0; i<percents.size();i++){
        currentrow = percents.getrow(i);
        String current = currentrow.getItem("division_desc").toString();
        if(!current.equals(last)){
            divisionNames.add(current);
            divisionIDs.add(currentrow.getItem("division_id"));
            last = current;
            divisions++;
        }
    }
    int ptrs[] = new int[divisions];
    String coders[][] = new String[divisions][topN];
    String scores[][] = new String[divisions][topN];
    String rooms[][] = new String[divisions][topN];
    String ratings[][] = new String[divisions][topN];
    String coderIDs[][] = new String[divisions][topN];
    String placeds[][] = new String[divisions][topN];
    //now go through and put all the coder's data in the arrays
    int lastdivisionID = -1;
    int divisionPtr = -1;
    for(int i = 0; i<leaders.size();i++){
        currentrow = leaders.getrow(i);
        int divisionID = Integer.parseInt(currentrow.getItem("division_id").toString());
        if(divisionID!=lastdivisionID){
            lastdivisionID = divisionID;
            divisionPtr++;
        }
        if(ptrs[divisionPtr]==topN)continue;
        String handle = currentrow.getItem("handle").toString();
        String room_name = currentrow.getItem("room_name").toString();
        String points = currentrow.getItem("final_points").toString();
        String rating = currentrow.getItem("new_rating").toString();
        String coderID = currentrow.getItem("coder_id").toString();
        String placed = currentrow.getItem("division_placed").toString();
        coders[divisionPtr][ptrs[divisionPtr]]=handle;
        placeds[divisionPtr][ptrs[divisionPtr]]=placed;
        scores[divisionPtr][ptrs[divisionPtr]]=points;
        ratings[divisionPtr][ptrs[divisionPtr]]=rating;
        coderIDs[divisionPtr][ptrs[divisionPtr]]=coderID;
        rooms[divisionPtr][ptrs[divisionPtr]++]=room_name;
    }
    topN = 0;
    for(int i = 0; i<divisions;i++)topN = Math.max(topN,ptrs[i]);

%>
         <table width="100%" border="0" cellpadding="10" cellspacing="0" bgcolor="#001B35" valign="top">
           <tr>
             <td class="bodyText" colspan="5" valign="top" style="padding: 0px,0px,0px,11px">

<%
String currRound = roundID+"";
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Rounds_By_Date");
pageContext.setAttribute("resultSetdates", rsc);
%>
<script language="JavaScript">
<!--
function goTo(selection){
  sel = selection.options[selection.selectedIndex].value;
  if (sel && sel != '#'){
    window.location=sel;
  }
}
// -->
</script>
<!--   <A class="statTextBig" href="/stat?c=<%= ("round_stats&amp;rd="+roundID) %>"><B><%= contestName %></B></a><BR/>-->
<!--DATE <BR/>-->

             <form name="coderRankform" action="javaScript:submitform();" method="get">
                <span class="statTextBig"><B>Please select a round:</B><BR/></span>
                <select class="dropdown" name="Contest" onchange="goTo(this)">
                <option value="#">select a Round:</option>

                    <logic:iterate name="resultSetdates" id="resultrow" type="ResultSetContainer.ResultSetrow">

                    <% if (resultrow.getItem(0).toString().equals(currRound)) { %>
                    <option value="/stat?c=round_overview&er=<%= topN %>&rd=<bean:write name="resultrow" property='<%= "item[" + 0 /* id */ + "]" %>'/>" selected><bean:write name="resultrow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultrow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></option>
                    <% } else { %>
                    <option value="/stat?c=round_overview&er=<%= topN %>&rd=<bean:write name="resultrow" property='<%= "item[" + 0 /* id */ + "]" %>'/>"><bean:write name="resultrow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultrow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></option>
                    <% } %>

                    </logic:iterate>

                    </select>
                    <%  if (forumID != -1) { %>
                    <br><br><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<%=forumID%>" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
                    <%  } %>
             </td>
           </tr>
           <tr>
             <td class="bodyText" height="10" colspan="5" valign="top" style="padding: 0px,0px,0px,11px"><A NAME="leaders"></a></td>
           </tr>
           
           <tr style="padding: 0px,0px,0px,11px" >
           <%for(int i = 0; i<divisionNames.size();i++){%>
             <td width="5%" background="/i/steel_bluebv_bg.gif"></td>
             <td valign="middle" width="35%" nowrap="0" height="18" background="/i/steel_bluebv_bg.gif" class="registerNav">&#160;&#160;<B><%= divisionNames.get(i).toString() %> Leaders</B></td>
             <td valign="middle" width="20%" nowrap="0" height="18" background="/i/steel_bluebv_bg.gif" class="registerNav"><B>Scores</B></td>
             <td valign="middle" width="20%" nowrap="0" height="18" background="/i/steel_bluebv_bg.gif" class="registerNav"><B>Rank</B></td>
             <td valign="middle" align="center" width="20%" nowrap="0" background="/i/steel_bluebv_bg.gif"><a href="/stat?c=<%= ("round_stats&amp;rd="+roundID) %>&amp;dn=<%= divisionIDs.get(i).toString() %>" class="statText">Results</a></td>
           <%}%>
           </tr>
           
           <tr style="padding: 2px,0px,0px,0px">
             <bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>

             <% //this part creates the top scorers for the round in each division
             for(int i = 0; i<topN;i++){%>
          
           <%for(int j = 0; j<divisions;j++){
               if(coderIDs[j][i]==null){//puts in blank rows if the coder doesn't exist - happens when you view more coders than there are participants
           %>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>

           <%} else {%>
             <td valign="middle" width="5%" class="statText"><a href="/stat?c=coder_room_stats&rd=<%=roundID %>&cr=<%= coderIDs[j][i] %>" class="statText"><img src="/i/coders_icon.gif" ALT="" width="10" height="10" border="0"></a></td>
             <td valign="middle" nowrap="0" width="35%" height="15" class="statText"><a href="/tc?module=MemberProfile&cr=<%= coderIDs[j][i] %>" class="<bean:write name="nameColor" property='<%= "style[" + ratings[j][i] + "]" %>'/>"><%= coders[j][i] %></a></td>
             <td valign="middle" nowrap="0" width="20%" height="15" class="statText" align="right"><%= scores[j][i] %> &#160;&#160;</td>
             <td valign="middle" nowrap="0" width="20%" height="15" class="statText" align="right"><%= placeds[j][i] %> &#160;&#160;</td>
             <td valign="middle" nowrap="0" width="20%" height="15" class="statText">&#160;<%= rooms[j][i] %></td>
           <%  }

           }%>
           </tr>
           <%}%>

<%  int currentrowPtr = 0;
    for(int i = 0; i<divisions;i++){
%>
         </table>
         <br/>
         
         <a name="problem_stats"></a>
         <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#001B35" valign="top">
           <tr><td valign="middle" colspan="7" width="100%" nowrap="0" height="16" class="registerNav" background="/i/steel_bluebv_bg.gif">&#160;&#160;<B><%= divisionNames.get(i).toString() %> Problem Stats</B></td></tr>
           <tr>
             <td style="padding: 2px,0px,0px,0px" valign="middle" nowrap="0" width="17%" height="15" class="statText">&#160;</td>
             <td valign="middle" nowrap="0" width="25%" height="15" class="statText">&#160;<B>Problem Name</B></td>
             <td valign="middle" nowrap="0" width="9%" height="15" class="statText" align="right">&#160;<B>Submissions</B></td>
             <td valign="middle" nowrap="0" width="17%" height="15" class="statText" align="right">&#160;<B>Correct %&#160;&#160;</B></td>
             <td valign="middle" nowrap="0" width="17%" height="15" class="statText" align="right"><B>Average Pts.</B></td>
             <td colspan="2" valign="middle" nowrap="0" width="15%" height="15" class="statText" align="right"></td>
<%--             <td valign="middle" nowrap="0" width="15%" height="15" class="statText" align="right"></td> --%>
           </tr>
  <%
      currentrow = percents.getrow(currentrowPtr);
      int currentdivID = Integer.parseInt(currentrow.getItem("division_id").toString());
      while(currentrowPtr<percents.size() &&
              Integer.parseInt((currentrow = percents.getrow(currentrowPtr)).getItem("division_id").toString())==currentdivID){
        currentrowPtr++;
        String problemLevel = currentrow.getItem("problem_level").toString();
        String problemName = currentrow.getItem("problem_name").toString();
        int submissions =Integer.parseInt(currentrow.getItem("submissions").toString());
        int correct = Integer.parseInt(currentrow.getItem("successful_submissions").toString());
        int problemID = Integer.parseInt(currentrow.getItem("problem_id").toString());
        double total = correct==0?0.0D:Double.parseDouble(currentrow.getItem("total_points").toString())/correct;
        String perCor = dfp.format(submissions==0?0.0D:(((double)correct)/submissions));
        String avgPoints = df.format(total);
  %>

           <tr>
             <td valign="middle" nowrap="0" height="15" class="statText">&#160;<%=problemLevel%></td>
             <td valign="middle" nowrap="0" height="15" class="statText">&#160;&#160;<a href="/stat?c=problem_statement&pm=<%= problemID %>&rd=<%= roundID %>" class="statText"><%=problemName%></a></td>
             <td valign="middle" nowrap="0" height="15" class="statText" align="right"><%=submissions%> &#160;&#160;</td>
             <td valign="middle" nowrap="0" height="15" class="statText" align="right"><%=perCor%> &#160;&#160;</td>
             <td valign="middle" nowrap="0" height="15" class="statText" align="right"><%=avgPoints%></td>
             <td valign="middle" nowrap="0" height="15" class="statText" align="right">&#160;<a href="JavaScript:getGraph('/graph?c=problem_distribution_graph&rd=<%=roundID%>&pm=<%= problemID %>&dn=<%= currentdivID %>','600','400','distribution')" class="statText">Distribution Graph</a></td>
             <td valign="middle" nowrap="0" height="15" class="statText" align="right">&#160;<a href="Javascript:void openProblemRating(<%= problemID %>)" class="statText"><img border="0" src="/i/rate_it.gif" /></a></td>
           </tr>
           <%
           }
           }%>
           <tr><td valign="middle" colspan="7" width="100%" nowrap="0" height="16" class="registerNav"  background="/i/steel_bluebv_bg.gif"></td></tr>

           <tr>
             <td colspan="7" align="center" class="statText">
             <%if(!lastMatch){%>
             <INPUT TYPE="HIDDEN" NAME="rd" VALUE="<%=roundID%>">
             <%}%>
             <INPUT TYPE="HIDDEN" NAME="c" VALUE="round_overview">Viewing top&#160;&#160;
             <INPUT TYPE="text" NAME="er" MAXLENGTH="4" SIZE="4" value="<%=topN%>">&#160;&#160;<a href="javaScript:submitform();" class="statText">&#160;[ submit ]</a>
             </td>
           </tr>
           <tr>
             <td colspan="7">&#160;</td>
           </tr>
         </table>
             </form>

        <p><br/></p>
       </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
       <td width="180" valign="top"><img src="/i/clear.gif" width="180" height="1" border="0">
       <rsc:iterator list="<%=image%>" id="resultrow">
        <CENTER><a href="<rsc:item name="link" row="<%=resultrow%>"/>"><img src="<rsc:item name="file" row="<%=resultrow%>"/>" ALT="" width="<rsc:item name="width" row="<%=resultrow%>"/>" height="<rsc:item name="height" row="<%=resultrow%>"/>" border="0"/></a></CENTER>
       </rsc:iterator>
         <jsp:include page="../public_right.jsp" />
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
   </tr>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>
