<%@ page import="com.topcoder.security.*" %>
<%@ page import="com.topcoder.security.admin.*" %>
<%@ page import="com.topcoder.security.login.*" %>
<%@ page import="com.topcoder.security.policy.*" %>

<%@ page import="com.topcoder.dde.admin.*" %>
<%@ page import="com.topcoder.dde.user.*" %>
<%@ include file="/includes/cookies.jsp" %>
<%
	////////////////////////////////////////////
	// Load context
	////////////////////////////////////////////

    /*
	Hashtable environment = new Hashtable();
	environment.put(Context.PROVIDER_URL, "localhost:1099");
	environment.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
	Context CONTEXT = new InitialContext(environment);
    */
    Context CONTEXT = new InitialContext();


	////////////////////////////////////////////
	// Load Stateless EJB's
	////////////////////////////////////////////

	Object objUserManager = CONTEXT.lookup("dde/UserManager");
	UserManagerRemoteHome userManagerHome = (UserManagerRemoteHome)  PortableRemoteObject.narrow(objUserManager, UserManagerRemoteHome.class);
  	UserManagerRemote USER_MANAGER = userManagerHome.create();

	Object objAdmin = CONTEXT.lookup("AdminLoginEJB");
	AdminLoginHome adminLoginHome = (AdminLoginHome)  PortableRemoteObject.narrow(objAdmin, AdminLoginHome.class);
  	AdminLogin ADMIN_LOGIN = adminLoginHome.create();

	Object objPrincipalManager = CONTEXT.lookup("security/PrincipalMgr");
	PrincipalMgrRemoteHome principalManagerHome = (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(objPrincipalManager, PrincipalMgrRemoteHome.class);
	PrincipalMgrRemote PRINCIPAL_MANAGER = principalManagerHome.create();

	Object objPolicyManager = CONTEXT.lookup("security/PolicyMgr");
	PolicyMgrRemoteHome policyManagerHome = (PolicyMgrRemoteHome) PortableRemoteObject.narrow(objPolicyManager, PolicyMgrRemoteHome.class);
	PolicyMgrRemote POLICY_MANAGER = policyManagerHome.create();

	Object objLogin = CONTEXT.lookup("security/Login");
	LoginRemoteHome loginHome = (LoginRemoteHome) PortableRemoteObject.narrow(objLogin, LoginRemoteHome.class);
	LoginRemote LOGIN = loginHome.create();

	Object objPolicy = CONTEXT.lookup("security/Policy");
	PolicyRemoteHome policyHome = (PolicyRemoteHome) PortableRemoteObject.narrow(objPolicy, PolicyRemoteHome.class);
	PolicyRemote POLICY = policyHome.create();

%>

<%
/*
 	Handle session information, redirecting if necessary
*/

//////////////////////////////////////////////
// Get current user information from session
//////////////////////////////////////////////

TCSubject tcSubject = null;
User tcUser = null;
Object objTCSubject = session.getValue(/* "TCSUBJECT" */ "AdminTCSubject");
if (objTCSubject != null && objTCSubject instanceof TCSubject) {
	tcSubject = (TCSubject) objTCSubject;
	try {
  	tcUser = USER_MANAGER.getUser(tcSubject.getUserId());
		debug.addMsg("session", "loaded tcUser with id " + tcSubject.getUserId());
	} catch (UndeclaredThrowableException e) {
		debug.addMsg("session", "" + e.getUndeclaredThrowable());
	} catch (Exception e) {
		debug.addMsg("session", "" + e);
		e.printStackTrace();
	}
} else {
	tcSubject = getAdminFromLoginCookies(request, response, USER_MANAGER, ADMIN_LOGIN);
    if (session != null) session.putValue("AdminTCSubject", tcSubject);
}

//////////////////////////////////////////////
// Set current page information so that any
// attempts to login know where to go back to
//////////////////////////////////////////////

String requestURI = request.getRequestURI();
if (requestURI != null && !requestURI.endsWith("c_login.jsp") && !requestURI.endsWith("c_component_doc.jsp")) {
    StringBuffer navRedirect = request.getRequestURL();
    if (request.getQueryString() != null) {
        navRedirect.append("?");
        navRedirect.append(request.getQueryString());
    }
    session.putValue("nav_redirect", navRedirect.toString());
    session.removeValue("nav_redirect_msg");
}
if (!requestURI.endsWith("c_login.jsp") && (tcSubject == null || tcUser == null)) {
    response.sendRedirect("c_login.jsp");
}
%>
