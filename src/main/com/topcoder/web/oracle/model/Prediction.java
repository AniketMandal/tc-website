package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.User;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 14, 2007
 */
public class Prediction extends Base {
    Identifier id = new Identifier();
    private Integer value;

    public Prediction() {

    }

    public User getUser() {
        return id.getUser();
    }

    public void setUser(User user) {
        id.setUser(user);
    }

    public Candidate getCandidate() {
        return id.getCandidate();
    }

    public void setCandidate(Candidate candidate) {
        id.setCandidate(candidate);
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public static class Identifier implements Serializable, Cloneable {

        private User user;
        private Candidate candidate;

        public Identifier() {

        }

        public Identifier(User user, Candidate candidate) {
            this.user = user;
            this.candidate = candidate;
        }


        public User getUser() {
            return user;
        }

        public void setUser(User user) {
            this.user = user;
        }

        public Candidate getCandidate() {
            return candidate;
        }

        public void setCandidate(Candidate candidate) {
            this.candidate = candidate;
        }

        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    Identifier oa = (Identifier) o;
                    return (oa.user.getId().equals(user.getId()) &&
                            oa.candidate.getId().equals(candidate.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(user.getId());
            buf.append(" ");
            buf.append(candidate.getId());
            return buf.toString().hashCode();
        }


    }


}
