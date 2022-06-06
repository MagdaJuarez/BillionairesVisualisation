import java.lang.Comparable;
import java.lang.Override;

class Billionaire implements Comparable{
  
  private String fullName;
  private int year;
  private int rank;
  private String country;
  private float wealth;
  private List<Wealth> historicWealth;
  
  Billionaire(String fullName, int year, int rank, String country, float wealth){
    this.fullName = fullName;
    this.year = year;
    this.rank = rank;
    this.country = country;
    this.wealth = wealth;
  }
  
  public void addHistoricWealth(List<Wealth> historicWealth){
    this.historicWealth = historicWealth;
  }
  
  public String getFullName(){
    return this.fullName;
  }
  
  public int getYear(){
    return this.year;
  }
  
  public int getRank(){
    return this.rank;
  }
  
  public String getCountry(){
    return this.country;
  }
  
  public float getWealth(){
    return this.wealth;
  }
  
  public List<Wealth>getHistoricWealth(){
    return this.historicWealth;
  }
  
  @Override
  public int compareTo(Object billionaire){
    int compareRank = ((Billionaire) billionaire).getRank();
    return this.rank - compareRank;
  }
  
  @Override
  public String toString() {
    return "[ Billionaire=" + this.fullName + ", year=" + this.year + ", country= " + this.country + ", rank= " + this.rank + 
    ", wealth=" + this.wealth + ", historic wealth = "+ this.historicWealth.toString() + "]";
  }
  
}
