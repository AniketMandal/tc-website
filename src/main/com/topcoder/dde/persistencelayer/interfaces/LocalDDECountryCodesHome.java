package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;

/**
 * The local home interface representing the CMP bean for the country_codes table.  
 * 
 * @version     1.0  
 * @author      Timur Zambalayev
 */ 
public interface LocalDDECountryCodesHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */ 
    public static final String EJB_REF_NAME="java:comp/env/ejb/DDECountryCodesEJB";

    /**
     * Locates an entity object using a primary key.
     *  
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation. 
     */ 
    LocalDDECountryCodes findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     * 
     * @param description           description.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */ 
    LocalDDECountryCodes create(String description) throws CreateException;

}
