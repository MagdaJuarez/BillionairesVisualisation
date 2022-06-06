class MapCoordinates{
  
  private int x_coordinate;
  private int y_coordinate;
  
  MapCoordinates(int x_coordinate, int y_coordinate){
     this.x_coordinate = x_coordinate;
     this.y_coordinate = y_coordinate;
  }
  
  public int getXCoordinate(){
    return x_coordinate;
  }
  
  public int getYCoordinate(){
    return y_coordinate;
  }
  
  public void setXCoordinate(int x_coordinate){
    this.x_coordinate = x_coordinate;
  }
  
  public void setYCoordinate(int y_coordinate){
    this.y_coordinate = y_coordinate;
  }
  
}
