package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the comp_download table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompDownloadHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDECompDownloadEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompDownload findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param url                   url.
     * @param description           description.
     * @param compVersions          compVersions.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDECompDownload create(String url, String description, LocalDDECompVersions compVersions) throws CreateException;

    /**
     * Returns a Collection of LocalDDECompDownload with the given compVersions id.
     *
     * @param compVersId            compVersions id.
     * @return a Collection of local interfaces (LocalDDECompDownload).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByCompVersId(long compVersId) throws FinderException;

}
