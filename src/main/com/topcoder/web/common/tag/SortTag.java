package com.topcoder.web.common.tag;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.model.SortInfo;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.http.HttpUtils;
import java.io.IOException;
import java.util.Hashtable;
import java.util.Map;
import java.util.Iterator;

public class SortTag extends TagSupport {

    private static Logger log = Logger.getLogger(SortTag.class);

    protected int column = -1;
    protected int ascColumn = -1;
    protected int descColumn = -1;
    protected boolean includeParams = false;

    public void setColumn(int column) {
        this.column = column;
    }

    public void setAscColumn(int ascColumn) {
        this.ascColumn = ascColumn;
    }

    public void setDescColumn(int descColumn) {
        this.descColumn = descColumn;
    }

    public void setIncludeParams(String includeParams) {
        this.includeParams = "true".equalsIgnoreCase(includeParams);
    }

    public int doStartTag() throws JspException {
        String currCol = StringUtils.checkNull(pageContext.getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String currDir = StringUtils.checkNull(pageContext.getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        SortInfo defaults = (SortInfo) pageContext.getRequest().getAttribute(SortInfo.REQUEST_KEY);
        String sortDir = defaults.getDefault(column);
        if (sortDir == null) sortDir = "asc";

        int finalColumn = column;

        if (!(currCol.equals("") || currDir.equals(""))) {
            int inputCol = Integer.parseInt(currCol);
            if (inputCol == column) {
                if (currDir.equals("desc")) {
                    if (ascColumn > -1) finalColumn = ascColumn;
                    sortDir = "asc";
                } else {
                    if (descColumn > -1) finalColumn = descColumn;
                    sortDir = "desc";
                }
            } else if (inputCol == ascColumn) {
                finalColumn = descColumn;
                sortDir = "desc";
            } else if (inputCol == descColumn) {
                finalColumn = ascColumn;
                sortDir = "asc";
            }
        }

        StringBuffer buf = new StringBuffer(100);
        buf.append("&");
        buf.append(DataAccessConstants.SORT_COLUMN);
        buf.append("=");
        buf.append(finalColumn);
        buf.append("&");
        buf.append(DataAccessConstants.SORT_DIRECTION);
        buf.append("=");
        buf.append(sortDir);
        if (includeParams) {
            SessionInfo info = (SessionInfo) pageContext.getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
            Hashtable h = HttpUtils.parseQueryString(info.getQueryString());
            Map.Entry me = null;
            for (Iterator it = h.entrySet().iterator(); it.hasNext();) {
                me = (Map.Entry) it.next();
                String[] sArray = null;
                if (me.getValue() instanceof String) {
                    add(buf, me.getKey().toString(), me.getValue().toString());
                } else if (me.getValue().getClass().isArray()) {
                    sArray = (String[]) me.getValue();
                    for (int i = 0; i < sArray.length; i++) {
                        add(buf, me.getKey().toString(), sArray[i]);
                    }
                }
            }
        }

        try {
            pageContext.getOut().print(buf.toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

    private void add(StringBuffer buf, String key, String val) {
        if (val != null) {
            buf.append("&");
            buf.append(key);
            buf.append("=");
            buf.append(val);
        }
    }

    /**
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     */
    public int doEndTag() throws JspException {
        this.column = -1;
        this.ascColumn = -1;
        this.descColumn = -1;
        this.includeParams = false;
        return super.doEndTag();
    }

}
