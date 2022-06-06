class Inset{
  
  public static final int HEIGHT = 155;
  public static final int MARGIN_TOP= 15;
  private static final int FONT_SIZE = 12;
  private static final int MARGIN_RIGHT_LABEL = 40;
  private static final int SPACE_BTW_CHARS = 11;
  private static final int SPACE_BTW_WORDS = 12;
  private final int MARGINS_ALIGN_RIGHT[] = {20, 30};
  private final int MARGINS_ALIGN_LEFT[] = {30, 20};
  private static final float INSET_RADIO = 28;
  public static final int MAX_BILLIONAIRES = 10;
  private final int COUNTRY_NAME_COLOR[] = {230, 97, 0};
  private final int BACKGROUND_COLOR[] = {229, 184, 19, 60};
  private final int POINT_COLOR[] = {216, 42, 82};
  private final int POINT_DIAMETER = 3;
  
  PFont font;
  
  Inset(){
  }

  void drawInset(float initXInset, float initYInset, int nBill,int index, Billionaire billionaire, boolean alignToTheLeft, MapCoordinates geoCrd){
    float yInset = initYInset - MARGIN_TOP;
    float curWealthSum = billionaireMarker.getSumWealth(billionaire.getHistoricWealth());
    float curInnMarginBar = (BillionaireMarker.WIDTH_STACKED_BAR - curWealthSum)/2;
    int margins[] = alignToTheLeft ? MARGINS_ALIGN_LEFT : MARGINS_ALIGN_RIGHT;
    float xInset = initXInset - curInnMarginBar - margins[0];
    float x1Trng = 0;
    float y1Trng = 0;
    float y3Trng = 0;
    pushMatrix();
    noStroke();
    fill(BACKGROUND_COLOR[0], BACKGROUND_COLOR[1], BACKGROUND_COLOR[2], BACKGROUND_COLOR[3]); 
    float widthInset = nBill * (BillionaireMarker.WIDTH_STACKED_BAR + BillionaireMarker.MARGIN_RIGHT_BARS) + margins[0] + margins[1];
    float newYInset = yInset + index*(HEIGHT + MARGIN_TOP) ;
    rect(xInset, newYInset, widthInset, HEIGHT, INSET_RADIO);
    
    x1Trng = xInset+ (alignToTheLeft ? 0 : widthInset);
    y1Trng = newYInset + HEIGHT/3;
    y3Trng = newYInset + HEIGHT*2/3;
    triangle(x1Trng, y1Trng, geoCrd.getXCoordinate(), geoCrd.getYCoordinate(), x1Trng, y3Trng);
    fill(POINT_COLOR[0], POINT_COLOR[1], POINT_COLOR[2]);
    circle(geoCrd.getXCoordinate(), geoCrd.getYCoordinate(), POINT_DIAMETER);
    drawCountryLabel(xInset, newYInset , widthInset, billionaire.getCountry(), alignToTheLeft);
    popMatrix();
  }
  
  void drawCountryLabel(float xInset, float yInset, float widthInset, String name, boolean alignToTheLeft){
    float xCrdText = xInset + (alignToTheLeft ? MARGIN_RIGHT_LABEL: widthInset - MARGIN_RIGHT_LABEL);

    int nChars = name.length();
    String newName = name.toUpperCase();
    String[] splitedName = newName.split("\\s+");
    int nWords = splitedName.length;
    char curChar;
    float marginTopLabel = getMarginTopLabel(splitedName, nWords);
    float yCrdText = yInset + marginTopLabel;
    float initYCrdText = yCrdText; 
    
    font = createFont("Roboto-Bold.ttf", FONT_SIZE);
    textFont(font);
    //textSize(FONT_SIZE);
    fill(COUNTRY_NAME_COLOR[0], COUNTRY_NAME_COLOR[1], COUNTRY_NAME_COLOR[2]);
    for(int j=0; j<nWords; j++){
      nChars = splitedName[j].length();
      for(int i=0; i<nChars; i++){
        curChar = splitedName[j].charAt(i);
        text(curChar, xCrdText, yCrdText);
        yCrdText = yCrdText + SPACE_BTW_CHARS;
      }
      xCrdText = xCrdText + SPACE_BTW_WORDS;
      yCrdText = initYCrdText;
    }
  }
  
  float getMarginTopLabel(String[] countryWords, int nWords){
    float marginTop = 0;
    int nLongestWord = countryWords[0].length(); //Number of characters of longest word
    if( nWords > 1){
      for(int i=1; i<nWords; i++){
        if(countryWords[i].length() > nLongestWord){
          nLongestWord = countryWords[i].length();
        }
      }   
    }
    marginTop = (HEIGHT - (nLongestWord-2) * SPACE_BTW_CHARS)/2;
    return marginTop;
  }

  void drawToTheRight(float xInset, float yInset, int nBill, float rot_angle, int index){
    pushMatrix();
    noStroke();
    rotate(rot_angle);
    fill(BACKGROUND_COLOR[0], BACKGROUND_COLOR[1], BACKGROUND_COLOR[2], BACKGROUND_COLOR[3]); 
    float widthInset = nBill * (BillionaireMarker.WIDTH_STACKED_BAR + BillionaireMarker.MARGIN_RIGHT_BARS);
    float initXInset =  MAX_BILLIONAIRES * (BillionaireMarker.WIDTH_STACKED_BAR + BillionaireMarker.MARGIN_RIGHT_BARS) - widthInset;
    rect(xInset + initXInset, yInset + index*(HEIGHT + MARGIN_TOP), widthInset, HEIGHT);
    
    popMatrix();
  }
}
