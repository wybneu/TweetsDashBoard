package models;

import java.sql.Timestamp;
import utils.Ref;

public class TweetTimeCounter extends Thread {

    private long tweetTime;
    private int tweetReference;
    private long presentRef;
    private long secondRef;
    private long minRef;
    private long hourRef;
    private long dayRef;
    Ref reference;

    public TweetTimeCounter(Ref reference) {
        this.reference = reference;
    }

    public void setTweetTime() {
        while (Ref.startT == 0) {
            try {
                Thread.sleep(1);
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

    }

    public synchronized boolean setPosition(long timestamp) {
        synchronized (reference) {
            tweetTime = (((timestamp - Ref.startTime.getTime()) / Ref.transMsToSeconds) + Ref.arrayLength)
                    % (Ref.arrayLength);
            tweetReference = (int) tweetTime;
            presentRef = (Ref.currentT - tweetReference + Ref.arrayLength)
                    % Ref.arrayLength;
            Timestamp currentTimestamp = new Timestamp(
                    System.currentTimeMillis());

            // System.out.println((currentTimestamp.getTime() - timestamp) <
            // (Ref.arrayLength * (long)Ref.transMsToSeconds));
            // System.out.println(currentTimestamp.getTime() - timestamp);
            // System.out.println(Ref.arrayLength * (long)Ref.transMsToSeconds);
            // System.out.println(currentTimestamp.getTime() >= timestamp);

            if (((currentTimestamp.getTime() - timestamp) < (Ref.arrayLength * (long) Ref.transMsToSeconds))
                    && (currentTimestamp.getTime() >= timestamp)) {

                // secondRef = (Ref.currentT - Ref.lastSecond + Ref.arrayLength)
                // % Ref.arrayLength;
                // minRef = (Ref.currentT - Ref.lastMin + Ref.arrayLength)
                // % Ref.arrayLength;
                // hourRef = (Ref.currentT - Ref.lastHour + Ref.arrayLength)
                // % Ref.arrayLength;
                // dayRef = (Ref.currentT - Ref.lastDay + Ref.arrayLength)
                // % Ref.arrayLength;

                // if (secondRef == presentRef) {
                // if (presentRef == 1) {
                // Ref.monthCounter++; // Add this tweet to the per-month
                // counter
                // Ref.dayCounter++; // Add this tweet to the per-day counter
                // Ref.hourCounter++; // Add this tweet to the per-hour counter
                // Ref.minuteCounter++; // Add this tweet to the per-minute
                // counter
                // Ref.secondCounter++; // Add this tweet to the per-second
                // counter
                // Ref.monthScore += Ref.mark; // Add the score to the per-month
                // score
                // Ref.dayScore += Ref.mark; // Add the score to the per-day
                // score
                // Ref.hourScore += Ref.mark; // Add the score to the per-hour
                // score
                // Ref.minuteScore += Ref.mark; // Add the score to the
                // per-minute score
                // Ref.secondScore += Ref.mark; // Add the score to the
                // per-second score
                // System.out.println("second");
                // System.out.println(presentRef);
                // } else if ((secondRef < presentRef) && (minRef >=
                // presentRef)) {
                if ((presentRef > 0) && (presentRef <= 60)) {
                    Ref.monthCounter++;
                    Ref.dayCounter++;
                    Ref.hourCounter++;
                    Ref.minuteCounter++;
                    Ref.monthScore += Ref.mark; // Add the score to the
                                                // per-month score
                    Ref.dayScore += Ref.mark; // Add the score to the per-day
                                              // score
                    Ref.hourScore += Ref.mark; // Add the score to the per-hour
                                               // score
                    Ref.minuteScore += Ref.mark; // Add the score to the
                                                 // per-minute score
                    // System.out.println("minute");
                    // System.out.println(presentRef);

                    // } else if ((minRef < presentRef) && (hourRef >=
                    // presentRef)) {
                } else if ((presentRef > 60) && (presentRef <= 3600)) {
                    Ref.monthCounter++;
                    Ref.dayCounter++;
                    Ref.hourCounter++;
                    Ref.monthScore += Ref.mark; // Add the score to the
                                                // per-month score
                    Ref.dayScore += Ref.mark; // Add the score to the per-day
                                              // score
                    Ref.hourScore += Ref.mark; // Add the score to the per-hour
                                               // score
                    // System.out.println("hour");
                    // System.out.println(presentRef);

                    // } else if ((hourRef < presentRef) && (dayRef >=
                    // presentRef)) {
                } else if ((presentRef > 3600) && (presentRef <= 86400)) {
                    Ref.monthCounter++;
                    Ref.dayCounter++;
                    Ref.monthScore += Ref.mark; // Add the score to the
                                                // per-month score
                    Ref.dayScore += Ref.mark; // Add the score to the per-day
                                              // score
                    // System.out.println("day");
                    // System.out.println(presentRef);

                    // } else if ((dayRef) <= presentRef
                    // && (Ref.arrayLength - 1) > presentRef) {
                } else if ((presentRef > 86400)
                        && (presentRef < (Ref.arrayLength - 1))) {
                    // System.out.println("True");
                    Ref.monthCounter++;
                    Ref.monthScore += Ref.mark; // Add the score to the
                                                // per-month score
                    // System.out.println("month");
                    // System.out.println(presentRef);

                }
                // System.out.println("###############");
                Ref.counterArray[tweetReference]++;
                Ref.scoreArray[tweetReference] += Ref.mark; // Add the score to
                                                            // the array
                return true;
            } else {
                System.out.println("###############");
                return false;
            }
        }
    }

}
