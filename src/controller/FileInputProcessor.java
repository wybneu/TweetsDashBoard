package controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.sql.Timestamp;

import org.json.JSONException;
import org.json.JSONObject;

import models.TweetTimeCounter;
import models.Tweets;
import models.User;
import utils.Ref;
import utils.Sentiment;
import utils.TimeTransform;

public class FileInputProcessor extends Thread {
    TimeTransform timeTrans = new TimeTransform();
    private TweetTimeCounter TweetTimestamp;
    private long interval = 0;
    private long tweetsTime1 = 0;
    private long tweetsTime2 = 0;
    Scanner inputStream = null;
    String line = null; // currentline
    JSONObject obj = null;
    JSONObject obj1 = null;
    Tweets tempTweets = null;
    User tempUser = null;
    int insertPos;
    Ref ref = null;
    FileOutputProcessor file = null;
    long preRef = 0;
    Timestamp tweetsTime;
    Timestamp tweetsTime3;
    Timestamp tweetsTime4;
    Timestamp currentTimestamp;
    int mode = 0;
    Sentiment sentiment;
    float score = 0;
    long offSet = 0;
    long offSetDebug = 0;
    long testTime = 0;
    long testTime2 = 0;

    public FileInputProcessor(Ref ref, int mode) {
        this.mode = mode;
        TweetTimestamp = new TweetTimeCounter(ref);
        this.ref = ref;
        init();
    }

    public void run() {
        if (mode == 0) {// online
            inputStream = new Scanner(System.in);
            while (inputStream.hasNextLine()) {
                synchronized (ref) {
                    inputStream = new Scanner(System.in);
                    line = inputStream.nextLine();
                    // try {
                    // obj = new JSONObject(line);
                    // } catch (JSONException e) {
                    // // TODO Auto-generated catch block
                    // e.printStackTrace();
                    // }
                    setOnlineTime(line);
                    setData(line);
                    Ref.count++;
                    Ref.secondcount++;
                }
            }
        } else {
            try {
                inputStream = new Scanner(new FileInputStream("f:\\00_00.txt"));
                line = inputStream.nextLine();
                try {
                    obj = new JSONObject(line);
                    this.tweetsTime3 = this.timeTrans.transfrom(obj.getString("created_at"));
                    tweetsTime1 = tweetsTime3.getTime();
                    this.tweetsTime = new Timestamp(System.currentTimeMillis());
                    tweetsTime2 = tweetsTime.getTime();
                    offSet = tweetsTime2 - tweetsTime1;
                    System.out.println(offSet);
                } catch (JSONException e) {
                    e.printStackTrace();
                }

                // outputStream = new PrintWriter(new
                // FileoutputStream("numbered.txt"));
            } catch (FileNotFoundException e) {

                System.out.println("File test1.txt was not found!");
                System.exit(0);
            }
            while (inputStream.hasNextLine()) {
                synchronized (ref) {

                    line = inputStream.nextLine();
                    setOfflineTime(line);
                    // count the total number of tweet input, for testing
                    Ref.count++;
                    Ref.secondcount++;
                    setData(line);
                    try {
                        // System.out.println(interval);
                        Thread.sleep(interval);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        // PrintWriter outputStream = null;
        // while (true) {
        // inputStream.close();
    }

    public void init() {
        synchronized (ref) {
            Ref.posTop10 = new Tweets[Ref.tweetsNumber];
            for (int i = 0; i < Ref.tweetsNumber; i++) {
                Ref.posTop10[i] = new Tweets();
            }
            Ref.negTop10 = new Tweets[Ref.tweetsNumber];
            for (int i = 0; i < Ref.tweetsNumber; i++) {
                Ref.negTop10[i] = new Tweets();
            }
            Ref.hotUser = new User[Ref.userNumber];
            for (int i = 0; i < Ref.userNumber; i++) {
                Ref.hotUser[i] = new User();
            }
            Ref.version = System.currentTimeMillis();
            this.preRef = Ref.version;
            file = new FileOutputProcessor();
            System.out.println(System.getProperty("user.dir"));
            sentiment = new Sentiment();
        }
    }

    public void setOnlineTime(String line) {
        try {
            obj = new JSONObject(line);
            this.tweetsTime = this.timeTrans.transfrom(obj
                    .getString("created_at"));
            this.TweetTimestamp.setPosition(tweetsTime.getTime());
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    // public void setOfflineTime() {
    // this.tweetsTime = new Timestamp(System.currentTimeMillis());
    // this.TweetTimestamp.setPosition(tweetsTime.getTime());
    // }

    public void setOfflineTime(String line) {
        try {
            obj = new JSONObject(line);
            testTime = testTime2;
            this.tweetsTime4 = this.timeTrans.transfrom(obj
                    .getString("created_at"));
            this.TweetTimestamp.setPosition((tweetsTime4.getTime() + offSet));
            this.tweetsTime = new Timestamp(System.currentTimeMillis());
            tweetsTime2 = tweetsTime.getTime();
            offSetDebug = tweetsTime2 - (tweetsTime4.getTime() + offSet);
            testTime2 = tweetsTime4.getTime();
//            System.out.println(offSetDebug);
        } catch (JSONException e) {
            e.printStackTrace();
        }
//        // interval = (long)(1+100*Math.random());
        if (((testTime2-testTime)>=0) && (testTime!=0))
        {interval = testTime2 - testTime;}
        else interval = 50;
//            interval = 20;

        // try {
        // obj = new JSONObject(line);
        // tweetsTime2 = tweetsTime1;
        // this.tweetsTime3 = this.timeTrans.transfrom(obj
        // .getString("created_at"));
        // tweetsTime1 = tweetsTime3.getTime();
        // if (((tweetsTime1 - tweetsTime2) >= 0) && (tweetsTime2 != 0)) {
        // interval = tweetsTime1 - tweetsTime2 + 2;
        // } else
        // interval = 1;
        //
        // } catch (JSONException e) {
        // e.printStackTrace();
        // }
        // // interval = (long) (1 + 100 * Math.random());
        // // interval = 0;
        // // System.out.println(tweetsTime1);
        // // System.out.println(tweetsTime2);
        // // System.out.println(interval);
        // this.tweetsTime = new Timestamp(System.currentTimeMillis());
        // this.TweetTimestamp.setPosition(tweetsTime.getTime());

    }

    public void setData(String line) {
        try {
            // System.out.println(tweetsTime.toString());
            // System.out.println(tweetsTime.getTime());

            // if (true) {
            // this.TweetTimestamp.setPosition(tweetsTime.getTime());
            // this.TweetTimestamp.setPosition(System.currentTimeMillis());
            // if (this.TweetTimestamp.setPosition(tweetsTime.getTime())) {

            // this.insertPos = Ref.tweetsNumber;
            // for (int i = Ref.tweetsNumber - 1; i >= 0; i--) {
            // if (Ref.top10[i].getRetweet_count() < obj
            // .getInt("retweet_count")) {
            // this.insertPos = i;
            // } else
            // break;
            // }
            // if (this.insertPos < Ref.tweetsNumber) {
            // for (int i = Ref.tweetsNumber - 2; i >= this.insertPos; i--)
            // {
            // Ref.top10[i + 1].setTweets(Ref.top10[i]);
            // }
            // Ref.top10[insertPos].setRetweet_count(obj
            // .getInt("retweet_count"));
            // Ref.top10[insertPos].setID(obj.getString("id_str"));
            // Ref.top10[insertPos].setMessage(obj.getString("text"));
            // Ref.top10[insertPos].setTime(tweetsTime);
            // Ref.version = System.currentTimeMillis();
            // file.updateTweets();
            // }
            score = sentiment.analysis(obj.getString("text"));
            // System.out.println(obj.getString("text"));
            // System.out.println("***************************");
            Ref.mark = score;
            this.insertPos = Ref.tweetsNumber;
            for (int i = Ref.tweetsNumber - 1; i >= 0; i--) {
                if (Ref.posTop10[i].getScore() < score
                        || Ref.posTop10[i].getID() == null) {
                    this.insertPos = i;
                } else
                    break;
            }
            if (this.insertPos < Ref.tweetsNumber) {
                for (int i = Ref.tweetsNumber - 2; i >= this.insertPos; i--) {
//                    for (int k = Ref.tweetsNumber - 1; k >= this.insertPos+1; k--) {
//                    this.tweetsTime3 = this.timeTrans.transfrom(obj
//                            .getString("created_at"));
//                    tweetsTime1 = tweetsTime3.getTime();
//                    this.tweetsTime = new Timestamp(System.currentTimeMillis());
//                    tweetsTime2 = tweetsTime.getTime();
//                    if ((tweetsTime2 - tweetsTime1) < 86400000)
//                        {Ref.posTop10[k].setTweets(Ref.posTop10[i]);}
//                    else
                    Ref.posTop10[i + 1].setTweets(Ref.posTop10[i]);
//                }
                }
                Ref.posTop10[insertPos].setRetweet_count(obj
                        .getInt("retweet_count"));
                Ref.posTop10[insertPos].setID(obj.getString("id_str"));
                Ref.posTop10[insertPos].setMessage(obj.getString("text"));
                Ref.posTop10[insertPos].setTime(tweetsTime);
                Ref.posTop10[insertPos].setScore(score);
                Ref.version = System.currentTimeMillis();
                // System.out.println("insert a positive message");
                file.updateTweets();
            }
            this.insertPos = Ref.tweetsNumber;
            for (int i = Ref.tweetsNumber - 1; i >= 0; i--) {
                if (Ref.negTop10[i].getScore() > score
                        || Ref.negTop10[i].getID() == null) {
                    this.insertPos = i;
                } else
                    break;
            }
            if (this.insertPos < Ref.tweetsNumber) {
                for (int i = Ref.tweetsNumber - 2; i >= this.insertPos; i--) {
                    Ref.negTop10[i + 1].setTweets(Ref.negTop10[i]);
                }
                Ref.negTop10[insertPos].setRetweet_count(obj
                        .getInt("retweet_count"));
                Ref.negTop10[insertPos].setID(obj.getString("id_str"));
                Ref.negTop10[insertPos].setMessage(obj.getString("text"));
                Ref.negTop10[insertPos].setTime(tweetsTime);
                Ref.negTop10[insertPos].setScore(score);
                Ref.version = System.currentTimeMillis();
                // System.out.println("insert a negative message");
                file.updateNegTweets();
            }
            this.insertPos = Ref.userNumber;
            obj1 = obj.getJSONObject("user");
            for (int i = Ref.userNumber - 1; i >= 0; i--) {
                if (Ref.hotUser[i].getFollowers_count() < obj1
                        .getInt("followers_count")) {
                    this.insertPos = i;
                } else
                    break;
            }
            if (this.insertPos < Ref.userNumber) {
                for (int i = Ref.userNumber - 2; i >= this.insertPos; i--) {
                    Ref.hotUser[i + 1].setUser(Ref.hotUser[i]);
                }
                Ref.hotUser[insertPos].setFollowers_count(obj1
                        .getInt("followers_count"));
                Ref.hotUser[insertPos].setId_str(obj1.getString("id_str"));
                Ref.hotUser[insertPos].setName(obj1.getString("screen_name"));
                Ref.version = System.currentTimeMillis();
                file.updateUser();
            }
            // }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        // for (int i = 0; i < 10; i++) {
        // // System.out.println(i + " = " + Ref.top10[i].getTime());
        // // System.out.println(i + " = " +
        // // Ref.hotUser[i].getFollowers_count());
        // }
    }
}
