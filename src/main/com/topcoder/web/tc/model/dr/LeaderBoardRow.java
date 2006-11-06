/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.model.dr;

/**
 * <strong>Purpose</strong>:
 * A simple bean for the leader board.
 *
 * @author pulky
 * @version 1.0.1
 */
public class LeaderBoardRow extends BaseBoardRow implements IBoardRow {

    /**
     * Property indicating if this row is in the top performers
     */
    private boolean topPerformer;

    /**
     * Property to store the points prize
     */
    private double pointsPrize;

    /**
     * Default constructor
     */
    public LeaderBoardRow() {
        super();
    }

    /**
     * Constructor setting properties.
     *
     * @param period         The period to set.
     * @param phase          The phase to set.
     * @param rank           The rank to set.
     * @param userId         The userId to set.
     * @param userName       The userName to set.
     * @param points         The points to set.
     * @param topPerformer   The topPerformer to set.
     * @param winTrip        The winTrip to set.
     * @param pointsPrize    The pointsPrize to set.
     * @param placementPrize The placementPrize to set.
     * @param totalPrize     The totalPrize to set.
     * @param outstandingPoints     The outstandingPoints to set.
     */
    public LeaderBoardRow(long period, long phase, long rank, long userId, String userName, long points,
                          boolean topPerformer, boolean winTrip, double pointsPrize,
                          double placementPrize, double totalPrize, long outstandingPoints) {
        super();
        this.period = period;
        this.phase = phase;
        this.rank = rank;
        this.userId = userId;
        this.userName = userName;
        this.points = points;
        this.topPerformer = topPerformer;
        this.pointsPrize = pointsPrize;
        this.placementPrize = placementPrize;
        this.outstandingPoints = outstandingPoints;
    }

    /**
     * @return Returns the pointsPrize.
     */
    public double getPointsPrize() {
        return pointsPrize;
    }

    /**
     * @param pointsPrize The pointsPrize to set.
     */
    public void setPointsPrize(double pointsPrize) {
        this.pointsPrize = pointsPrize;
    }

    /**
     * @return Returns the topPerformer.
     */
    public boolean isTopPerformer() {
        return topPerformer;
    }

    /**
     * @param topPerformer The topPerformer to set.
     */
    public void setTopPerformer(boolean topPerformer) {
        this.topPerformer = topPerformer;
    }

    /**
     * @return Returns the totalPrize.
     */
    public double getTotalPrize() {
        return this.placementPrize + this.pointsPrize;
    }

    /**
     * @return true if the coder will win a trip.
     */
    public boolean isWinTrip() {
        return (this.placementPrize > 0);
    }
}
