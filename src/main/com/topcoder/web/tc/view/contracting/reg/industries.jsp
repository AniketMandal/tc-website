<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Contracting</title>

<jsp:include page="../../../script.jsp" />

<SCRIPT TYPE="text/javascript">
<!--
function dropdown(mySel)
{
var myWin, myVal;
myVal = mySel.options[mySel.selectedIndex].value;
if(myVal)
   {
   if(mySel.form.target)myWin = parent[mySel.form.target];
   else myWin = window;
   if (! myWin) return true;
   myWin.location = myVal;
   }
return false;
}
//-->
</SCRIPT>

</head>

<body>

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../../includes/global_left.jsp">
                <jsp:param name="level1" value="my_home"/>
                <jsp:param name="level2" value="index"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center">
        <div class="myTCBody">

        <jsp:include page="../../page_title.jsp" >
            <jsp:param name="image" value="contract"/>
            <jsp:param name="title" value="Registration"/>
        </jsp:include>

<!-- Breadcrumb-->
        <table border=0 cellpadding=0 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td class=oppDesc width="100%" valign=top>
				<span class=bodySubtitle>Industries</span>
				<br/><br/>
				This is a description paragraph with some instructions and some details about the questions asked.
				</td>
				<td valign=top>
				<jsp:include page="breadcrumb.jsp" >
				<jsp:param name="phase" value="industries"/>
				</jsp:include>
				</td>
			</tr>
		</table>

		<FORM ACTION="" METHOD=POST onSubmit="">
        <table border=0 cellpadding=3 cellspacing=0 width="100%" class=bodyText>
			<tr><td>&#160;</td><td class=bodyText colspan=5><span class=bodySubtitle>No experience</span></td><td class=bodyText colspan=6 align=right><span class=bodySubtitle>Expert</span></td>
        	<tr><td class=bodyText valign=top width="100%">&#160;</td>
            <% for(int i = 0; i<=10; i++){ %>
                <td class=bodyText align=center valign=top>
                    <span class=bodySubtitle><%=i%></span>
                </td>
            <% } %>
			</tr>
	        <tr>
	            <td class=formTextEven valign=top>Automotive</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextEven><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextOdd valign=top>Construction, Building</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextOdd><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextEven valign=top>Education</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextEven><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextOdd valign=top>Energy, Oil, Gas</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextOdd><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextEven valign=top>Federal, State, Local Governments</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextEven><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextOdd valign=top>Financial Services, Banks, Credit Unions</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextOdd><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextEven valign=top>Games</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextEven><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextOdd valign=top>Healthcare, Pharmaceuticals, Life Sciences, Biotechnology</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextOdd><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextEven valign=top>Hotels, Restaurants, Clubs, Other Leisure</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextEven><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextOdd valign=top>Information Technology, Software, Hardware, Electronics</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextOdd><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextEven valign=top>Media, Advertising, Publishing, Entertainment</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextEven><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextOdd valign=top>Non-profit, Social Sector</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextOdd><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextEven valign=top>Real Estate, Insurance</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextEven><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextOdd valign=top>Retail, Wholesale</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextOdd><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextEven valign=top>Telecommunications</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextEven><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextOdd valign=top>Transportation, Rail, Road, Air, Marine</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextOdd><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=formTextEven valign=top>Utilities</td>
            <% for(int i = 0; i<=10; i++){ %>
	            <td valign=top align=center class=formTextEven><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
			<tr>
	            <td class=bodyText valign=middle>Additional Comments:</td>
				<td class=bodyText colspan=11>
				<TEXTAREA NAME="comments" ROWS="3" COLS="40"></TEXTAREA>
				</td>
			</tr>
			<tr><td colspan=12 align=center><br/><br/><a href="/tc?module=Static&d1=contracting&d2=reg&d3=confirm"><img src="/i/submit.jpg" border=0/></a></td></tr>
		</table>
		</FORM>

        </div>
		<p align=center class=bodyText><b>Please check to make sure that your information is up-to-date.</b></p>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>
