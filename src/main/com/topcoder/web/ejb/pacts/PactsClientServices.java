package com.topcoder.web.ejb.pacts;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.List;

import javax.ejb.EJBObject;

import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.ejb.pacts.payments.InvalidStatusException;

/**
 * EJB for working with payments.
 * Each payment is represented by an instance of a BasePayment subclass, depending on its type.
 * All the payments that doesn't have any reference to a table, like contract, CCIP, Article and so on,
 * use the NoReferencePayment.
 *
 * The payment objects can be created with a minimum of information, generally the coder id, gross amount,
 * an id to a reference (like round_id) and sometimes a placed value just for creating a description.
 * Then, additional data is looked up when saving the payment and stored in the payment object, like the
 * status, description and so on.
 *
 *
 * @author Cucu
 *
 */
public interface PactsClientServices extends EJBObject {


    /**
     * Add a payment in the database.
     * An instance of a BasePayment sublcass must be passed.
     *
     * @param payment payment to add.
     * @return payment the payment added, with additional information (like id, status, description...)
     */
    BasePayment addPayment(BasePayment payment)  throws RemoteException, SQLException;

    /**
     * Adds many payments at once in one transaction, so if one fails, it rolls back.
     * 
     * @param payments payments to add to DB.
     * @return a list of the payments added, with the information completed (payment_id, net amount calculated)
     */
    public List addPayments(List payments) throws RemoteException, SQLException;

    /**
     * Update a payment.
     * The payment must be already saved in the database, or an exception will be thrown.
     *
     * @param payment payment to update.
     * @return the updated payment.
     * @throws Exception
     */
    BasePayment updatePayment(BasePayment payment) throws RemoteException, Exception;

    /**
     * Find all the payments of a certain type.
     *
     * @param paymentTypeId type of payment to look for.
     * @return a List with instances of the specific class for the payment type (always a BasePayment subclass)
     * @throws SQLException
     */
    List findPayments(int paymentTypeId) throws RemoteException, Exception, InvalidStatusException;

    /**
     * Find all the payments of a certain type, referencing to a particular id.
     * For example, if the payment is for algorithm contest, in the referenceId you must pass the round_id to look for.
     * If the payment is for review board, you must pass the project_id and so on.
     *
     * @param paymentTypeId type of payment to look for.
     * @param referenceId reference to look for
     * @return a List with instances of the specific class for the payment type (always a BasePayment subclass)
     * @throws SQLException
     */
    List findPayments(int paymentTypeId, long referenceId) throws RemoteException, Exception, InvalidStatusException;

    /**
     * Find all the payments for a coder, of any type.
     *
     * @param coderId the coder to find payments for.
     * @return a List of instances of BasePayment subclasses.
     * @throws SQLException
     */
    List findCoderPayments(long coderId) throws RemoteException, Exception, InvalidStatusException;

    /**
     * Find the payments of the specified type for a coder.
     *
     * @param coderId the coder to find payments for.
     * @param paymentTypeId type of payment to look for.
     * @return a List with instances of the specific class for the payment type (always a BasePayment subclass)
     * @throws SQLException
     */
    List findCoderPayments(long coderId, int paymentTypeId) throws RemoteException, Exception, InvalidStatusException;

    /**
     * Find the payments of the specified type for a coder.
     *
     * @param coderId the coder to find payments for.
     * @param paymentTypeId type of payment to look for.
     * @param referenceId the reference id.
     * @return a List with instances of the specific class for the payment type (always a BasePayment subclass)
     * @throws SQLException
     */
    List findCoderPayments(long coderId, int paymentTypeId, long referenceId) throws RemoteException, Exception, InvalidStatusException;

    /**
     * Get a BasePayment from the database.
     * 
     * @param paymentId id of the payment to load.
     * @return the payment loaded or null if no payment found.
     * @throws SQLException
     */
    BasePayment getBasePayment(long paymentId) throws RemoteException, SQLException, InvalidStatusException;
    
    /**
     * Look up and fill data in the payment object.
     * It fills:
     * - the description based on the type of payment.
     * - the status (depending on whether the coder has filled the tax form or not)
     * - the due date
     *
     * @param payment the payment to fill its information
     * @return the payment with the information filled.
     */
    BasePayment fillPaymentData(BasePayment payment) throws RemoteException, SQLException;

    /**
     * Marks an assignment document as deleted
     *
     * @param ad the Assignment Document to store
     * @throws DeleteAffirmedAssignmentDocumentException
     *          If there's an attempt to delete an affirmed assignment document
     */
    void deleteAssignmentDocument(AssignmentDocument ad) throws RemoteException, DeleteAffirmedAssignmentDocumentException;

    /**
     * Inserts or updates an assignment document to the DB
     *
     * @param conn the Connection to use
     * @param ad   the Assignment Document to store
     * @return The stored assignment document template
     * @throws DeleteAffirmedAssignmentDocumentException
     *          If there's an attempt to delete an affirmed assignment document
     */
    AssignmentDocument addAssignmentDocument(AssignmentDocument ad) throws RemoteException, DeleteAffirmedAssignmentDocumentException;
    
    /**
     * Gets a list of Assignment Documents using its project id
     *
     * @param projectId the Assignment Document's project id to find
     * @return a List of Assignment Documents
     * @throws SQLException If there is some problem retrieving the data
     */
    List getAssignmentDocumentByProjectId(long projectId) throws RemoteException;
    
    /**
     * Gets a list of Assignment Documents using its user id
     *
     * @param userId                   the Assignment Document's user id to find
     * @param assignmentDocumentTypeId the Assignment Document's type id to find
     * @return a List of Assignment Documents
     * @throws SQLException If there is some problem retrieving the data
     */
    List getAssignmentDocumentByUserId(long userId, long assignmentDocumentTypeId, boolean onlyPending) throws RemoteException;

    /**
     * Marks an assignment document as affirmed
     *
     * @param ad the Assignment Document to store
     * @throws DeleteAffirmedAssignmentDocumentException
     *          If there's an attempt to delete an affirmed assignment document
     */
    public void affirmAssignmentDocument(AssignmentDocument ad) throws RemoteException;

    /**
     * Gets a Assignment Document using its ID
     *
     * @param assignmentDocumentId the Assignment Document id to find
     * @return The Assignment Document
     * @throws SQLException If there is some problem retrieving the data
     */
    AssignmentDocument getAssignmentDocument(long assignmentDocumentId) throws RemoteException;
    
    /**
     * Gets a list of Assignment Documents using its user id and studio contest id
     *
     * @param userId                   the Assignment Document's user id to find
     * @param assignmentDocumentTypeId the Assignment Document's studio contest id to find
     * @return a List of Assignment Documents
     * @throws SQLException If there is some problem retrieving the data
     */
    public List getAssignmentDocumentByUserIdStudioContestId(long userId, long studioContestId) throws RemoteException;
    
    /**
     * Gets the transformed text of an assignment document
     *
     * @param ad                       the Assignment Document to transform
     * @param assignmentDocumentTypeId the Assignment Document's type id
     * @return a List of Assignment Documents
     * @throws SQLException If there is some problem retrieving the data
     */
    String getAssignmentDocumentTransformedText(long assignmentDocumentTypeId, AssignmentDocument ad) throws RemoteException;
    
    /**
     * Returns whether a user has a hard copy of an assignmet document
     *
     * @param userId                   the Assignment Document's user id to find
     * @param assignmentDocumentTypeId the Assignment Document's type id to find
     * @return true if the user has a hard copy assignment document
     * @throws SQLException If there is some problem retrieving the data
     */
    Boolean hasHardCopyAssignmentDocumentByUserId(long userId, long assignmentDocumentTypeId) throws RemoteException;

}

