package com.topcoder.web.privatelabel.view.tag;

import com.topcoder.web.privatelabel.model.DemographicResponse;
import com.topcoder.web.privatelabel.model.DemographicQuestion;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.JspException;
import java.util.Map;
import java.io.IOException;

public class DemographicQuestionText extends TagSupport {
    private DemographicResponse response = null;
    private Map questions = null;

    public void setResponse(DemographicResponse response) {
        this.response = response;
    }

    public void setQuestion(Map questions) {
        this.questions = questions;
    }

    public int doStartTag() throws JspException {
        try {
            DemographicQuestion question = (DemographicQuestion)questions.get(new Long(response.getQuestionId()));
            pageContext.getOut().print(question.getText());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

}
