/*
 * Confirm.java
 *
 * Created on October 7, 2004, 2:11 PM
 */

package com.topcoder.web.tc.controller.request.contracting;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import java.util.*;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.*;

import com.topcoder.web.tc.model.ContractingResponse;
import com.topcoder.web.tc.model.ContractingResponseGroup;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.shared.util.DBMS;
/**
 *
 * @author  rfairfax
 */
public class Confirm  extends ContractingBase {

    protected void contractingProcessing() throws TCWebException {
        try {
            //load preference groups
            ArrayList groups = new ArrayList();

            Request r = new Request();
            r.setContentHandle("preference_groups");

            ResultSetContainer rsc = (ResultSetContainer)getDataAccess().getData(r).get("preference_groups");
            for(int i = 0; i < rsc.size(); i++) {

                String name = rsc.getStringItem(i, "preference_group_desc");

                //load preferences here
                Request rpref = new Request();
                rpref.setContentHandle("preferences_by_group");
                rpref.setProperty("prid", String.valueOf(rsc.getIntItem(i, "preference_group_id")));

                ContractingResponseGroup g = new ContractingResponseGroup();

                g.setName(name);

                ResultSetContainer rscPref = (ResultSetContainer)getDataAccess().getData(rpref).get("preferences_by_group");
                for(int j = 0; j < rscPref.size(); j++) {

                    String text = rscPref.getStringItem(j, "preference_desc");
                    int type =rscPref.getIntItem(j, "preference_type_id");
                    int id = rscPref.getIntItem(j, "preference_id");

                    if(type != Constants.PREFERENCE_SINGLE_ANSWER && info.getPreference(String.valueOf(id)) != null) {
                        //look up answer
                        String answer = "";

                        Request rval = new Request();
                        rval.setContentHandle("preference_values");
                        rval.setProperty("prid", String.valueOf(rscPref.getIntItem(j, "preference_id")));

                        ResultSetContainer rscVal = (ResultSetContainer)getDataAccess().getData(rval).get("preference_values");

                        for(int x = 0; x < rscVal.size(); x++) {

                            if(info.getPreference(String.valueOf(id)).equals( String.valueOf(rscVal.getIntItem(x, "preference_value_id")) )) {
                                answer = rscVal.getStringItem(x, "value");
                            }

                        }

                        ContractingResponse rsp = new ContractingResponse();
                        rsp.setName(text);
                        rsp.setVal(answer);

                        g.addResponse(rsp);
                    }

                }

                if(g.getResponses().size() != 0) {
                    groups.add(g);
                }
            }

            getRequest().setAttribute("prefs", groups);

            //resume status
            if(info.getResume() == null)
            {
                ResumeServices resumeServices = (ResumeServices) createEJB(getInitialContext(), ResumeServices.class);
                if(resumeServices.hasResume(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME)) {
                    getRequest().setAttribute("resume", "Not Supplied, Using Existing Resume");
                } else {
                    getRequest().setAttribute("resume", "Not Supplied");
                }
            }
            else
                getRequest().setAttribute("resume","Attached (" + info.getResume().getRemoteFileName() + ")");

            //tech skill
            ArrayList techSkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(Constants.SKILL_TYPE_TECHNOLOGIES));

            rsc = (ResultSetContainer)getDataAccess().getData(r).get("skill_list");
            for(int i = 0; i < rsc.size(); i++) {
                int id = rsc.getIntItem(i, "skill_id");
                String text = rsc.getStringItem(i, "skill_desc");

                if(info.getSkill(String.valueOf(id)) != null) {
                    ContractingResponse resp = new ContractingResponse();
                    resp.setName(text);
                    resp.setVal(info.getSkill(String.valueOf(id)));

                    techSkills.add(resp);
                }
            }

            getRequest().setAttribute("techSkills", techSkills);
            getRequest().setAttribute("techNote", getNote(Constants.TECH_NOTE_TYPE_ID, getUser().getId()));

            //database skill
            ArrayList dbSkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(Constants.SKILL_TYPE_DATABASES));

            rsc = (ResultSetContainer)getDataAccess().getData(r).get("skill_list");
            for(int i = 0; i < rsc.size(); i++) {
                int id = rsc.getIntItem(i, "skill_id");
                String text = rsc.getStringItem(i, "skill_desc");

                if(info.getSkill(String.valueOf(id)) != null) {
                    ContractingResponse resp = new ContractingResponse();
                    resp.setName(text);
                    resp.setVal(info.getSkill(String.valueOf(id)));

                    dbSkills.add(resp);
                }
            }

            getRequest().setAttribute("dbSkills", dbSkills);
            getRequest().setAttribute("dbNote", getNote(Constants.DB_NOTE_TYPE_ID, getUser().getId()));

            //languages skill
            ArrayList langSkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(Constants.SKILL_TYPE_LANGUAGES));

            rsc = (ResultSetContainer)getDataAccess().getData(r).get("skill_list");
            for(int i = 0; i < rsc.size(); i++) {
                int id = rsc.getIntItem(i, "skill_id");
                String text = rsc.getStringItem(i, "skill_desc");

                if(info.getSkill(String.valueOf(id)) != null) {
                    ContractingResponse resp = new ContractingResponse();
                    resp.setName(text);
                    resp.setVal(info.getSkill(String.valueOf(id)));

                    langSkills.add(resp);
                }
            }

            getRequest().setAttribute("langSkills", langSkills);
            getRequest().setAttribute("langNote", getNote(Constants.LANGUAGE_NOTE_TYPE_ID, getUser().getId()));

            //os skill
            ArrayList osSkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(Constants.SKILL_TYPE_OS));

            rsc = (ResultSetContainer)getDataAccess().getData(r).get("skill_list");
            for(int i = 0; i < rsc.size(); i++) {
                int id = rsc.getIntItem(i, "skill_id");
                String text = rsc.getStringItem(i, "skill_desc");

                if(info.getSkill(String.valueOf(id)) != null) {
                    ContractingResponse resp = new ContractingResponse();
                    resp.setName(text);
                    resp.setVal(info.getSkill(String.valueOf(id)));

                    osSkills.add(resp);
                }
            }

            getRequest().setAttribute("osSkills", osSkills);
            getRequest().setAttribute("osNote", getNote(Constants.OS_NOTE_TYPE_ID, getUser().getId()));

            //industries skill
            ArrayList industrySkills = new ArrayList();

            //load skill list from db
            r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(Constants.SKILL_TYPE_INDUSTRIES));

            rsc = (ResultSetContainer)getDataAccess().getData(r).get("skill_list");
            for(int i = 0; i < rsc.size(); i++) {
                int id = rsc.getIntItem(i, "skill_id");
                String text = rsc.getStringItem(i, "skill_desc");

                if(info.getSkill(String.valueOf(id)) != null) {
                    ContractingResponse resp = new ContractingResponse();
                    resp.setName(text);
                    resp.setVal(info.getSkill(String.valueOf(id)));

                    industrySkills.add(resp);
                }
            }

            getRequest().setAttribute("industrySkills", industrySkills);
            getRequest().setAttribute("industryNote", getNote(Constants.INDUSTRY_NOTE_TYPE_ID, getUser().getId()));

        } catch(TCWebException tce) {
            throw tce;
        } catch(Exception e) {
            throw new TCWebException(e);
        }
    }


    protected String getNote(int noteTypeId, long userId) throws Exception {
        Request r = new Request();
        r.setContentHandle("skill_note");
        r.setProperty(Constants.USER_ID, String.valueOf(userId));
        r.setProperty("ntid", String.valueOf(noteTypeId));
        ResultSetContainer skillNote = (ResultSetContainer)getDataAccess().getData(r).get("skill_note");
        return skillNote.getStringItem(0, "text")==null?"":skillNote.getStringItem(0, "text");

    }

    protected void setNextPage() {

        setNextPage(Constants.CONTRACTING_CONFIRM_PAGE);
        setIsNextPageInContext(true);
    }

}
