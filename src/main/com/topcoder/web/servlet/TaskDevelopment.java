package com.topcoder.web.servlet;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.CoderRegistration;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.ejb.AuthenticationServices.User;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.user.RegistrationInfo;
import com.topcoder.dde.forum.DDEForumHome;
import com.topcoder.dde.forum.DDEForum;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.dde.user.PricingTier;
 
import javax.rmi.PortableRemoteObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.naming.Context;
import java.text.NumberFormat;
public final class TaskDevelopment {


    private static final String XSL_DIR = TCServlet.XSL_ROOT + "development/";
    private static Logger log = Logger.getLogger(TaskDevelopment.class);

    public static String translateForumType(int forumtype) {
        switch (forumtype) {
        case com.topcoder.dde.catalog.Forum.SPECIFICATION:
            return "specification";
        case com.topcoder.dde.catalog.Forum.COLLABORATION:
        default:
            return "collaboration";
        }
    }

    private static String[] setFields(String phoneNumber) {
        if(phoneNumber == null) phoneNumber = "";
        StringBuffer phoneFormatted = new StringBuffer("");
        for(int i=0;i<phoneNumber.length();i++){
           char c = phoneNumber.charAt(i);
           if(Character.isDigit(c)){
              phoneFormatted.append(c);
           } 
        }
        String phone = phoneFormatted.toString();
        String[] phoneElements = new String[3];
        int[] limits = {10, 7, 0};
        for (int i = 0; i < 3; i++) {
            int limit = limits[i];
                        
            String s;
            int length = phone.length();
            if (length > limit) {
                int index = length - limit;
                s = phone.substring(0, index);
                phone = phone.substring(index);
            } else {
                s = "";
            }
            phoneElements[i] = s;
        }
        return phoneElements;
    }



    static String process(HttpServletRequest request, HttpServletResponse response,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        String cacheKey = null;
        try {
            String command = Conversion.checkNull(request.getParameter("c"));
            boolean requiresLogin = false;
            RecordTag devTag = new RecordTag("DEVELOPMENT");
            String comp = Conversion.checkNull(request.getParameter("comp"));
            String date = Conversion.checkNull(request.getParameter("date"));
            String payment = Conversion.checkNull(request.getParameter("payment"));
            devTag.addTag(new ValueTag("payment", payment));
            devTag.addTag(new ValueTag("comp", comp));
            devTag.addTag(new ValueTag("date", date));
            String xsldocURLString = null;
            String project = Conversion.checkNull(request.getParameter("Project"));
            if(!payment.equals(""))
            {
                NumberFormat format = NumberFormat.getCurrencyInstance();
                
                devTag.addTag(new ValueTag("date", date));
                double paymentAmt = Double.parseDouble(payment);
                devTag.addTag(new ValueTag("payment", format.format(paymentAmt)));
                log.debug(format.format(paymentAmt*.75));
                devTag.addTag(new ValueTag("first_payment", format.format(paymentAmt*.75)));
                devTag.addTag(new ValueTag("second_payment", format.format(paymentAmt*.25)));
                
            }
            if(!date.equals(""))
            {
                
            }

            if (command.equals("inquire")) {
                if (nav.getLoggedIn()) {
                    String to = Conversion.checkNull(request.getParameter("To"));
                    devTag.addTag(new ValueTag("ProjectName", project));
                    devTag.addTag(new ValueTag("Project", project));
                    devTag.addTag(new ValueTag("To", to));
                    xsldocURLString = XSL_DIR + command + ".xsl";
                } else {
                    requiresLogin = true;
                }
            }
            /********************** tcs_inquire *******************/
            else if (command.equals("tcs_inquire")) {
                if (nav.getLoggedIn()) {
                    String to = Conversion.checkNull(request.getParameter("To"));
                    String handle = nav.getUser().getHandle();
                    devTag.addTag(new ValueTag("ProjectName", project));
                    devTag.addTag(new ValueTag("Project", project));
                    devTag.addTag(new ValueTag("To", to));
                    xsldocURLString = XSL_DIR + command + ".xsl";
                } else {
                    requiresLogin = true;
                }
            }
            /********************** send *******************/
            else if (command.equals("send")) {
                if (nav.getLoggedIn()) {
                    devTag.addTag(new ValueTag("Project", project));
                    String handle = nav.getUser().getHandle();
                    String from = nav.getUser().getEmail();
                    String to = Conversion.checkNull(request.getParameter("To"));
                    String experience = Conversion.clean(request.getParameter("Experience"));
                    String workWeek = Conversion.checkNull(request.getParameter("WorkWeek"));
                    String comment = Conversion.clean(request.getParameter("Comment"));
                    TCSEmailMessage mail = new TCSEmailMessage();
                    mail.setSubject(project + " -- " + handle);
                    StringBuffer msgText = new StringBuffer(1000);
                    msgText.append(handle);
                    msgText.append(" inquiry for project:  ");
                    msgText.append(project);
                    msgText.append("\n\n");
                    msgText.append("Hours per Week:  ");
                    msgText.append(workWeek);

                    User user = nav.getUser();
                    CoderRegistration coder = (CoderRegistration) user.getUserTypeDetails().get("Coder");
                    int rating = coder.getRating().getRating();

                    msgText.append("\n\nRating:\n");
                    msgText.append(rating);
                    msgText.append("\n\nExperience:\n");
                    msgText.append(experience);
                    msgText.append("\n\nComment:\n");
                    msgText.append(comment);
                    mail.setBody(msgText.toString());
                    mail.addToAddress(to, TCSEmailMessage.TO);
                    mail.setFromAddress(from);
                    EmailEngine.send(mail);
                    xsldocURLString = XSL_DIR + "inquiry_sent.xsl";
                } else {
                    requiresLogin = true;
                }
            }
            /********************** tcs_send *******************/
            else if (command.equals("tcs_send")) {
                if (nav.getLoggedIn()) {
                    devTag.addTag(new ValueTag("Project", project));

                    String handle = nav.getUser().getHandle();
                    devTag.addTag(new ValueTag("handle", handle));

                    String from = nav.getUser().getEmail();
                    String to = Conversion.checkNull(request.getParameter("To"));
                    String comment = Conversion.clean(request.getParameter("Comment"));
                    String activeForumId = "";

                    TCSEmailMessage mail = new TCSEmailMessage();
                    StringBuffer msgText = new StringBuffer(1000);
                    msgText.append(handle);
                    msgText.append(" inquiry for project:  ");
                    msgText.append(project);
                    msgText.append("\n\n");
                    if (request.getParameter("terms") == null) {
                        msgText.append("\n\nDid not agree to terms.\n");
                    } else {
                        msgText.append("\n\nAgreed to terms.\n");
                    }
                    msgText.append("\n\nComment:\n");
                    msgText.append(comment);
                    mail.addToAddress(to, TCSEmailMessage.TO);
                    mail.setFromAddress(from);




	            Context CONTEXT = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
                    //Context CONTEXT = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,"172.16.20.222:1099");


                    com.topcoder.security.UserPrincipal selectedPrincipal = null;

                    //get principal manager
               	    Object objPrincipalManager = CONTEXT.lookup("security/PrincipalMgr");
                    PrincipalMgrRemoteHome principalManagerHome = (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(objPrincipalManager, PrincipalMgrRemoteHome.class);
                    PrincipalMgrRemote PRINCIPAL_MANAGER = principalManagerHome.create();


                    //get forum object
                    DDEForumHome ddeforumhome = (DDEForumHome) PortableRemoteObject.narrow(CONTEXT.lookup("dde/DDEForum"), DDEForumHome.class);  
                    DDEForum ddeforum = ddeforumhome.create();

                    //retrieve the coder registration information
                    log.debug("terms: " + Conversion.checkNull(request.getParameter("terms")));
                    User user = nav.getUser();
                    CoderRegistration coder = (CoderRegistration) user.getUserTypeDetails().get("Coder");
                    int rating = coder.getRating().getRating();
                    

                    try {
                        selectedPrincipal = PRINCIPAL_MANAGER.getUser(handle);
                        PricingTier pt = new PricingTier(1, 5.0);
                    }
                    catch (NoSuchUserException noSuchUserException)
	            {
                        log.debug("creating user");
                        Object objUserManager = CONTEXT.lookup("dde/UserManager");        
  	                    UserManagerRemoteHome userManagerHome = (UserManagerRemoteHome)  PortableRemoteObject.narrow(objUserManager, UserManagerRemoteHome.class); 
  	                    UserManagerRemote USER_MANAGER = userManagerHome.create();
                        RegistrationInfo registration = new RegistrationInfo();                        
                         
                        registration.setUsername(handle);
                        registration.setPassword(user.getPassword());
                        registration.setEmail(from);
                        registration.setFirstName(coder.getFirstName());
                        registration.setLastName(coder.getLastName());

                        String address = coder.getHomeAddress1();
                        if(coder.getHomeAddress2() != null)
                        { 
                          address = address + " " + coder.getHomeAddress2();
                        } 
                        registration.setAddress(address.trim());
                        
                        registration.setCity(coder.getHomeCity());
                        registration.setPostalcode(coder.getHomeZip());
                        String[] phoneParts = setFields(coder.getHomePhone());
                        registration.setPhoneCountry(phoneParts[0]);
                        registration.setPhoneArea(phoneParts[1]);
                        registration.setPhoneNumber(phoneParts[2]);
                        registration.setUseComponents(false);
                        registration.setUseConsultants(false);
                        registration.setReceiveNews(false);
                        registration.setNewsInHtml(false);
                        registration.setTechnologies(new java.util.ArrayList());
                        registration.setCompanySize(1L);


                        Context ctx = TCContext.getInitial();
                        DataAccessInt dai = new DataAccess((javax.sql.DataSource) ctx.lookup(DBMS.OLTP_DATASOURCE_NAME));
                      
                        String companyName = "";
                        //coder is a professional
                        if(coder.getCoderType().getCoderTypeId() == 2)
                        {

                           Request companyRequest = new Request(); companyRequest.setContentHandle("user_company_name");
                           companyRequest.setProperty("cr", "" + nav.getUserId());
                           java.util.Map companyMap = dai.getData(companyRequest); 
                           ResultSetContainer companyRsc = (ResultSetContainer)companyMap.get("user_company_name");
                           
                           if (companyRsc.size() == 1) {

                              companyName = (String)companyRsc.getItem(0, "company_name").getResultData(); 
                           }
                        }
                        else //coder is a student
                        {

                            Request schoolRequest = new Request(); schoolRequest.setContentHandle("user_school_name");
                            schoolRequest.setProperty("cr", "" + nav.getUserId());
                            java.util.Map schoolMap = dai.getData(schoolRequest);
                            ResultSetContainer schoolRsc = (ResultSetContainer)schoolMap.get("user_school_name");
                            if (schoolRsc.size() == 1) {
                               companyName = (String)schoolRsc.getItem(0, "school_name").getResultData(); 
                               //this cat doesn't have a company associated...
                            }

                        }
                        registration.setCompany(companyName);

                        PricingTier pt = new PricingTier(1, 5.0);
                        registration.setPricingTier(pt);

                        log.debug("Registering user");
                        com.topcoder.dde.user.User tcsUser = USER_MANAGER.register(registration, false);
                        log.debug("Registered user");
                        tcsUser.setStatus(com.topcoder.dde.user.UserStatus.ACTIVE); 
                        log.debug("Updating user");
                        USER_MANAGER.updateUser(tcsUser);
                        log.debug("Updated user");
                        

                    }
                    catch (Exception e) {
                        throw e;
                        
                    }

                    //add the user to the appropriate role to view the specification
                    java.util.HashSet rolesSet = (java.util.HashSet)PRINCIPAL_MANAGER.getRoles(null);  
                    RolePrincipal[] roles = (RolePrincipal[])rolesSet.toArray(new RolePrincipal[0]);
                    //String formattedProject = project.substring(0, project.lastIndexOf(' ')-1);


                    //log.debug("FormattedProject: " + formattedProject);

                    int i = 0;
                    boolean notFound = true;
                    boolean permissionAdded = false;
                    //for(int i=0;i<roles.length && rating > 0 ;i++)
                  if(rating >0)
                  {
                    //get catalog object
                    Object objTechTypes = CONTEXT.lookup("ComponentManagerEJB");
                    ComponentManagerHome home = (ComponentManagerHome) PortableRemoteObject.narrow(objTechTypes, ComponentManagerHome.class);
                    
                    long componentId = Long.parseLong(request.getParameter("comp"));
                    ComponentManager componentMgr = home.create(componentId);
                    com.topcoder.dde.catalog.Forum activeForum = componentMgr.getActiveForum(com.topcoder.dde.catalog.Forum.SPECIFICATION);

                    while(notFound && i <roles.length )
                    {
                        String roleName = roles[i].getName();
                        if(roleName.startsWith("ForumUser"))
                        {

        
                            if(activeForum != null)
                            {
                                
                                   log.debug("Role: " + roleName);
                                   log.debug("FormName:  FormUser " +activeForum.getId()); 
                                   activeForumId= Long.toString(activeForum.getId());
                                   devTag.addTag(new ValueTag("forumId", activeForumId));
                                   if(roleName.equalsIgnoreCase("ForumUser " + activeForumId)){
                                      log.debug("--->got a match");
                                      notFound = false;
                                      RolePrincipal roleToAdd = roles[i];
                                      try{
                                      
                                          PRINCIPAL_MANAGER.assignRole(selectedPrincipal, roles[i], null); 
                                          permissionAdded = true;
                                      }
                                      catch(com.topcoder.security.GeneralSecurityException gse)
                                      {
                                         //ignore
                                         log.error("GeneralSecurityException occurred! ", gse);
                                         msgText.append("GeneralSecurityException occurred! " + gse.getMessage());
                                         notFound = true;
                                         
                                      }
                                   }

                            }
                            else
                            {
                               msgText.append("\n\nCould not find an active forum ");
                            }
                        }
                        i++;
                     }
                    }
                    
                   if(!permissionAdded && rating > 0) 
                   {
                      msgText.append("\n\nCould not find a match for the forum");
                      log.error("Could not find a match for the forum");
                   }
                   else if(rating > 0){
                      msgText.append("\n\nUser permissions were added");
                   }

                    mail.setSubject(project + " -- " + handle + " permission successfully added: " + permissionAdded);
                    msgText.append("\n\nRating: ");
                    msgText.append(rating);
                    mail.setBody(msgText.toString());
                    EmailEngine.send(mail);


                    if (rating <= 0)
                        xsldocURLString = XSL_DIR + "inquiry_sent_neg.xsl";
                    else{
              
                        //log.debug("http://172.16.20.222:8080/pages/c_forum.jsp?f=" +activeForumId);
                        //response.sendRedirect("http://172.16.20.222:8080/pages/c_forum.jsp?f=" +activeForumId);
                        //log.debug("afterwards?");
                        xsldocURLString = XSL_DIR + "inquiry_sent_pos.xsl";
                        //return "";
                    }

                        //xsldocURLString = XSL_DIR + "inquiry_sent_pos.xsl";
               } else {
                    requiresLogin = true;
                }
            } else if (command.length() > 0) {
                xsldocURLString = XSL_DIR + command + ".xsl";
            } else {
                throw new Exception("Invalid command: " + command);
            }
            if (requiresLogin) {
                StringBuffer url = new StringBuffer(request.getRequestURI());
                String query = request.getQueryString();
                if (query != null) {
                    url.append("/?");
                    url.append(query);
                }
                throw new NavigationException(
                        "You must login to view the member development page" // MESSAGE WILL APPEAR ABOVE LOGIN
                        , TCServlet.LOGIN_PAGE // THE LOGIN PAGE FILE
                        , url.toString()
                );
            }
            document.addTag(devTag);

            ////log.debug("XML: " + document);
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            log.error("TaskDevelopment:ERROR:\n" + ne);
            throw ne;
        } catch (Exception e) {
            e.printStackTrace();
            StringBuffer msg = new StringBuffer(150);
            msg.append("TaskDevelopment:process:");
            msg.append(":ERROR:\n");
            msg.append(e.getMessage());
            throw new NavigationException(msg.toString(), TCServlet.INTERNAL_ERROR_PAGE);
        }
        return result;
    }


}
