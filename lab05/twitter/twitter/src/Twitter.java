public class Twitter {

  public String loadTweet()
  {
    try {
      Thread.sleep(4000);
    } catch (InterruptedException e) {}

    double r =  Math.random();
    if (r <= 0.45) {
      return "I am tweet that likes to talk about @me";
    } else if (r <= 0.9) {
      return "Hello to @you";
    } else {
      return null;
    }
  }

  public boolean isMentionned(String name) {
    try{
      String tweet = loadTweet();
      return tweet.contains("@" + name + " ") || (tweet.contains("@" + name) && tweet.length() == (tweet.indexOf("@" + name) + name.length()+1));
    } catch(Exception e) {
      return false;
    }


  }

}