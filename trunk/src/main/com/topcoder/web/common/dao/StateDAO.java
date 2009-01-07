package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.State;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface StateDAO {

    List getStates();

    State find(String code);
}
