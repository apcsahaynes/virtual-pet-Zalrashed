public class Beat {
  private String name;
  private int weightDecr;
  private int happinessDecr;
 
  public Beat(String name, int weightDecr, int happinessDecr){
    this.name = name;
    this.weightDecr = weightDecr;
    this.happinessDecr = happinessDecr;
  }
 
  public String getName() {
        return this.name;
    }
 
  public int getHappinessDecr() {
        return this.happinessDecr;
    }
   
  public int getWeightDecr() {
        return this.weightDecr;
    }
}
