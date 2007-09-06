/*
* PaidPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.util.Date;

import com.topcoder.web.ejb.pacts.BasePayment;


/**
 * This class represents a Paid status for payments. 
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 * 
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class PaidPaymentStatus extends BasePaymentStatus {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object. 
     */
    private static final long serialVersionUID = 1L;

    /**
     * The payment status id
     */
    public static final Long ID = 53l;

    /**
     * This method is executed when a payment is paid and will set the paid date
     * 
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#activate(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void activate(BasePayment payment) throws StateTransitionFailureException {
        payment.setPaidDate(new Date());
    }

    /**
     * Default constructor   
     */
    public PaidPaymentStatus() {
        super();
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#inactiveCoder(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public int inactiveCoder(BasePayment payment) throws InvalidPaymentEventException {
        throw new InvalidPaymentEventException("Cannot cancel a paid payment");
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#getId()
     */
    @Override
    public Long getId() {
        return ID;
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#newInstance()
     */
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new PaidPaymentStatus();
        newPaymentStatus.setDesc(this.desc);
        newPaymentStatus.setActive(this.active);
        return newPaymentStatus;  
    }
}

