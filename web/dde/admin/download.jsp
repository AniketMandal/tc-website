<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "com.topcoder.util.config.*" %>
<%@ page import = "com.topcoder.servlet.request.*" %>
<%
String namespace = "com.topcoder.servlet.request.FileUpload";

Iterator it = null;
if(request.getMethod().equals("POST")){
    //retrieve uploaded files with persistence
    try{
        FileUpload fu = new FileUpload(request,true);
        it = fu.getAllUploadedFiles();
    }catch (FileSizeLimitExceededException fe){
    }

}
%>
<html>
<head>
	<title>Simple File Upload</title>
</head>

<body>

<form enctype="multipart/form-data" method="POST">
<table border="0" cellpadding="0" cellspacing="0" align="center" bgcolor="#333333">
    <tr>
        <td>Upload Document</td>
    </tr>
    <tr>
        <td width="100%" align="left">
            <input type="file" name="file1" value="" maxlength="250" size="25" class="formButtonA1">
        </td>
    </tr>
    <tr>
	<td align="center"><input type="submit" name="a" value="Save" class="formButtonA1"></td>
    </tr>
<% if (it != null){  %>
    <tr>
        <td>Uploaded Files</td>
    </tr>
    <%  while (it.hasNext()) {
    	UploadedFile uf = (UploadedFile)it.next();
    	File f = uf.getFile();
    %>
    <tr>
	<td align="left"><%= uf.getRemoteFileName()%></td>
    </tr>
    <% } %>
<% } %>
</table>
</form>

</body>
</html>