/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.util.log.Level;
import com.topcoder.apps.review.document.AbstractSubmission;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForwards;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that let the admin review the 
 * submission.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class ProjectManagerReviewAction extends ReviewAction {
    
    /**
     * <p>
     * Call the business logic layer and set session if possible.
     * </p>
     *
     * @return the result data.
     * 
     * @param mapping The ActionMapping used to select this instance
     * @param form The optional ActionForm bean for this request (if any)
     * @param request The HTTP request we are processing
     * @param response The HTTP response we are creating
     * @param errors The action errors in calling the logic layer.
     * @param forwards The action forwards from calling the logic layer.
     * @param orpd The OnlineReviewProjectData to create the action data.
     */
    public ResultData executeLogic(ActionMapping mapping,
                                   ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response,
                                   ActionErrors errors,
                                   ActionForwards forwards,
                                   OnlineReviewProjectData orpd) {        
        log(Level.INFO, "ProjectManagerReviewAction: User '" 
                        + orpd.getUser().getHandle() + "' in session " 
                        + request.getSession().getId());
        
        long sid = -1;

        // Get the id parameter
        try {
            sid = Long.parseLong
                (String.valueOf(request.getParameter(Constants.SUBMITTER_ID_KEY)));
        } catch (NumberFormatException e) {
            sid = -1;
        }

        // Call business layer
        BusinessDelegate businessDelegate = new BusinessDelegate();
        ResultData result = businessDelegate.projectDetail(orpd);
        AbstractSubmission submission = null;

        if (result instanceof SuccessResult) {
            ProjectRetrieval pr = (ProjectRetrieval) result;

            if (pr.getSubmissions() != null) {
                for (int i = 0; i < pr.getSubmissions().length; i++) {
                    if (pr.getSubmissions()[i].getSubmitter().getId() == sid) {
                        submission = pr.getSubmissions()[i];
                        break;
                    }
                }
            }

            if (submission == null) {
                return new FailureResult("No submission found!");
            } else {
                form = new SubmissionForm();
                ((SubmissionForm) form).fromSubmission(submission, pr.getSubmissions(), pr.getScorecards());
                request.getSession().setAttribute(mapping.getAttribute(), form);

                saveToken(request);

                forwards.removeForward(mapping.findForward(Constants.SUCCESS_KEY));
                forwards.addForward(mapping.findForward(Constants.EDIT_KEY));
            }
        }

        return result;
    }
}
