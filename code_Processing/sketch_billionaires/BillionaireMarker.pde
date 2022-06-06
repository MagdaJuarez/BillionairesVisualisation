import java.lang.Math;
import java.text.DecimalFormat;

class BillionaireMarker{
  
  private float initCrd[]; 
  private String name;
  private String imgPath;
  private float wealthAmount2014 = 0;
  private float wealthSum = 0;
  private float radio = 0;
  private List<Wealth> historicWealth;
  private static final int HEIGHT_STACKED_BAR = 30;
  private static final int NUMBER_CHAR_TEXT = 10;
  private static final int MARGIN_RIGHT_BARS = 5; //Constant space between bars
  private static final int WIDTH_STACKED_BAR = 155;
  private final int SECTOR_COLORS[][] = {{12, 123, 220}, {255, 194, 10}, {220, 50, 32}};
  private final int NAME_COLOR[] = {35, 105,35};
  private final int CIRCLE_COLOR[] = {187, 186, 182};
  private static final int MARGIN_TOP_WEALTH = 15;
  private static final int FONT_SIZE_WEALTH = 12;
  public static final int WIDTH_LABEL = 100;
  public static final int HEIGHT_LABEL = 25;
  public static final int MARGIN_TOP_LABEL = 10;


  BillionaireMarker(){
    
  }
  
  BillionaireMarker(float initCrd[], List<Wealth> historicWealth, String name,  String imgPath){
    this.initCrd = initCrd;
    this.historicWealth = historicWealth;
    this.name = name;
    this.imgPath = imgPath;
    wealthAmount2014 = historicWealth.get(0).getWealth();
    wealthSum = getSumWealth(historicWealth);
    radio = CIRCLE_DIAMETER/2;
  }
  
  void drawMarker(){
    int n_sectors = historicWealth.size();
    float c_radio = CIRCLE_DIAMETER/2;
    float init_crd_txt[] = {initCrd[0],initCrd[1]-c_radio - HEIGHT_LABEL- LABEL_MARGIN_Y};
    drawName(init_crd_txt, name);
    drawCircle(initCrd, imgPath);
    drawBarSectors(initCrd, n_sectors, historicWealth);
    drawWealth(initCrd, wealthAmount2014);
    noFill(); 
  }

  void drawName(float initCrd[], String name){
    float xCrdText = initCrd[0] + wealthSum/2;
    float yCrdText = initCrd[1] - radio ;
    float yCrdText2 = yCrdText + HEIGHT_LABEL;
    String firstPartName = name;
    String secondPartName = "";
    int indName = 0;
    if(name.length()>NUMBER_CHAR_TEXT && name.indexOf(" ", NUMBER_CHAR_TEXT) > -1){
      indName = name.indexOf(" ", NUMBER_CHAR_TEXT);
      firstPartName = name.substring(0,indName);
      secondPartName = name.substring(indName);
    }
    textAlign(CENTER);
    textSize(12);
    fill(NAME_COLOR[0], NAME_COLOR[1], NAME_COLOR[2]);
    text(firstPartName, xCrdText, yCrdText);
    if(secondPartName.length() > 0){
       text(secondPartName, xCrdText, yCrdText2);
    }

  }
  
  void drawCircle(float circleCrd[], String imgPath){

    float xCrdCircle = circleCrd[0] + wealthSum/2 - CIRCLE_DIAMETER/2;
    float yCrdCircle = circleCrd[1] - CIRCLE_DIAMETER;    

    noStroke();
    fill(CIRCLE_COLOR[0], CIRCLE_COLOR[1], CIRCLE_COLOR[2]);
    ellipseMode(CORNER);
    circle(xCrdCircle-1, yCrdCircle-1, CIRCLE_DIAMETER+2);
    // create mask
    photo = loadImage(imgPath);
    maskImage = createGraphics(CIRCLE_DIAMETER,CIRCLE_DIAMETER);
    maskImage.beginDraw();
    maskImage.ellipseMode(CORNER);
    maskImage.circle(0, 0, CIRCLE_DIAMETER);
    maskImage.endDraw();
    // apply mask
    photo.mask(maskImage);
    // show masked image
    image(photo, xCrdCircle, yCrdCircle, CIRCLE_DIAMETER, CIRCLE_DIAMETER);
  }
  
   void drawBarSectors(float init_crd[], int n_sectors, List<Wealth> historicWealth){
    float x_bar = init_crd[0];
    float y_bar = init_crd[1];
    noStroke();
    for (int i=0; i<n_sectors; i++){
      fill(SECTOR_COLORS[i][0], SECTOR_COLORS[i][1], SECTOR_COLORS[i][2]);
      rect(x_bar, y_bar, historicWealth.get(i).getWealth(), HEIGHT_STACKED_BAR);
      x_bar = x_bar + historicWealth.get(i).getWealth();
     }
   }
   
   void drawWealth(float initCrd[], float wealth2014){
      DecimalFormat dfZero = new DecimalFormat("0.00");
      float xCrdText = initCrd[0] + wealthSum/2;
      float yCrdText = initCrd[1] + HEIGHT_STACKED_BAR + MARGIN_TOP_WEALTH;
      textAlign(CENTER);
      textSize(FONT_SIZE_WEALTH);
      fill(NAME_COLOR[0], NAME_COLOR[1], NAME_COLOR[2]);
      text("$" + dfZero.format(wealth2014) + "B", xCrdText, yCrdText);
   }
   
   public float [][] calculateInitCrd(float margins[], List<Billionaire> billCountry, int countryIndex, boolean toTheLeft){
    int nBill = billCountry.size();
    float initCrd[][]= new float [nBill][2]; //Initial coordinates of each bar
    float curWealthSum = 0;
    float prevWealthSum = 0;
    float curInnMarginBar = 0;
    float prevInnMarginBar = 0;
    float initXInset =  !toTheLeft ? (Inset.MAX_BILLIONAIRES- nBill) * (WIDTH_STACKED_BAR + MARGIN_RIGHT_BARS) : 0 ;
    float heightMarginInset = Inset.HEIGHT + Inset.MARGIN_TOP;
    
    curWealthSum = billionaireMarker.getSumWealth(billCountry.get(0).getHistoricWealth());
    curInnMarginBar = (BillionaireMarker.WIDTH_STACKED_BAR - curWealthSum)/2;
    initCrd[0][0] = margins[0] + curInnMarginBar + initXInset;
    initCrd[0][1] = margins[1] +  MARGIN_TOP_LABEL + HEIGHT_LABEL + CIRCLE_DIAMETER + countryIndex * heightMarginInset;
    for (int i=1; i<nBill; i++){
       prevWealthSum = getSumWealth(billCountry.get(i-1).getHistoricWealth());
       prevInnMarginBar = (WIDTH_STACKED_BAR - prevWealthSum)/2;
       curWealthSum = getSumWealth(billCountry.get(i).getHistoricWealth());
       curInnMarginBar = (WIDTH_STACKED_BAR - curWealthSum)/2;
       initCrd[i][0] = initCrd[i-1][0] + prevWealthSum + prevInnMarginBar + MARGIN_RIGHT_BARS + curInnMarginBar ;
       initCrd[i][1] = margins[1] + CIRCLE_DIAMETER + HEIGHT_LABEL + MARGIN_TOP_LABEL + countryIndex * heightMarginInset;
    }
    return initCrd;
  }

  public float getSumWealth(List<Wealth> historicWealth){
    float sum = 0;
    for(int i=0; i<historicWealth.size(); i++){
      sum = sum + historicWealth.get(i).getWealth();
    }
    return sum;
  }
  
}
