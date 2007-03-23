package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.model.Prediction;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 23, 2007
 */
public interface PredictionDAO {

    Prediction find(Integer id);

    void saveOrUpdate(Prediction prediction);


}
