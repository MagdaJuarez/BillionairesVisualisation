class Wealth implements Comparable{
  
  private float wealth;
  private int year;
  
  Wealth(float wealth, int year){
    this.wealth = wealth;
    this.year = year;
  }
  
  public float getWealth(){
    return this.wealth;
  }
  
  public int getYear(){
    return this.year;
  }
  
  @Override
  public int compareTo(Object wealth){
    int compareYear = ((Wealth) wealth).getYear();
    return compareYear - this.year;
  }

  @Override
  public String toString() {
    return "[ Wealth=" + wealth + ", year=" + year + "]";
  }
}
