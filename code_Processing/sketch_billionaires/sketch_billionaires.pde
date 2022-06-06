import processing.pdf.*;
import processing.svg.*;
import java.lang.Math;
import java.util.LinkedHashMap;


private static final int X_LEFT_WORLD = 1795; //final position
private static final int Y_LEFT_WORLD = 1420;
private static final int X_RIGHT_WORLD = 6742; //final position
private static final int Y_RIGHT_WORLD = 1420;
private static final int CIRCLE_DIAMETER = 50;
private static final int LABEL_MARGIN_Y = 5; // Margin between label and circle
private static final String IMAGE_PATH = "50x50/";
private static final int BACKGROUND_COLOR[] = {241, 241, 237};
private static float margins[][] = {{125, 1410}, {3261, 60}, {5077, 660}, {8208, 660}}; // Margins per each region

PImage photo;
PGraphics maskImage;
WorldMap leftWorldMap;
WorldMap rightWorldMap;
BillionaireMarker billionaireMarker;
Inset inset;
LoadDataSet loadDataSet;
private Map<String, List> topTenBillionaires;

private Map<String, MapCoordinates> americaMap;
private Map<String, MapCoordinates> europeMap;
private Map<String, MapCoordinates> africaMap;
private Map<String, MapCoordinates> asiaOceaniaMap;


void setup() {
  
  size(9933,4500);//9993 X 7016 at 300ppi. 2384X1684 at 72ppi
  //size(5000,7016);//9993 X 7016 at 300ppi. 2384X1684 at 72ppi
  noLoop();
  beginRecord(PDF, "BillionairesVis.pdf");
  leftWorldMap = new WorldMap(X_LEFT_WORLD, Y_LEFT_WORLD, "AmericaEurope.png");
  rightWorldMap = new WorldMap(X_RIGHT_WORLD, Y_RIGHT_WORLD, "AfricaAsia.png");
  billionaireMarker = new BillionaireMarker();
  inset = new Inset();
  loadBillionaires();
  initializaMaps();
  
}

void initializaMaps(){
  americaMap = new LinkedHashMap();
  
  americaMap.put("Canada", new MapCoordinates(2085, 1640));
  americaMap.put("United States", new MapCoordinates(2130, 1900));
  americaMap.put("Mexico", new MapCoordinates(2125, 2050));
  americaMap.put("Venezuela", new MapCoordinates(2310, 2180));
  americaMap.put("Colombia", new MapCoordinates(2270, 2215));
  americaMap.put("Brazil", new MapCoordinates(2355, 2316));
  americaMap.put("Peru", new MapCoordinates(2260, 2330));
  americaMap.put("Chile", new MapCoordinates(2285, 2465));
  americaMap.put("Argentina", new MapCoordinates(2310, 2545));

  europeMap = new LinkedHashMap();
  
  europeMap.put("Ireland", new MapCoordinates(2590, 1742));
  europeMap.put("Norway", new MapCoordinates(2670, 1625));  
  europeMap.put("United Kingdom", new MapCoordinates(2620, 1730));
  europeMap.put("Sweden", new MapCoordinates(2710, 1570));
  europeMap.put("Denmark", new MapCoordinates(2672, 1705));
  europeMap.put("Finland", new MapCoordinates(2755, 1610));
  europeMap.put("Netherlands", new MapCoordinates(2658, 1740)); //From here
  europeMap.put("Lithuania", new MapCoordinates(2745, 1700));  
  europeMap.put("Russia", new MapCoordinates(2880, 1630));
  europeMap.put("Poland", new MapCoordinates(2720, 1747));
  europeMap.put("Germany", new MapCoordinates(2675, 1760));  
  europeMap.put("Ukraine", new MapCoordinates(2780, 1788));  
  europeMap.put("Georgia", new MapCoordinates(2839, 1864));   
  europeMap.put("Belgium", new MapCoordinates(2650, 1765));
  europeMap.put("Czech Republic", new MapCoordinates(2705, 1778));    
  europeMap.put("Romania", new MapCoordinates(2750, 1830));  
  europeMap.put("Austria", new MapCoordinates(2695, 1800)); 
  europeMap.put("Cyprus", new MapCoordinates(2790, 1935));  
  europeMap.put("Greece", new MapCoordinates(2740, 1900)); 
  europeMap.put("Italy", new MapCoordinates(2690, 1850));  
  europeMap.put("Switzerland", new MapCoordinates(2668, 1810));    
  europeMap.put("Monaco", new MapCoordinates(2663, 1848));  
  europeMap.put("Guernsey", new MapCoordinates(2625, 1770));    
  europeMap.put("France", new MapCoordinates(2640, 1820));
  europeMap.put("Spain", new MapCoordinates(2610, 1880));
  europeMap.put("Portugal", new MapCoordinates(2587, 1900));

  africaMap = new LinkedHashMap();
  
  africaMap.put("United Arab Emirates", new MapCoordinates(7263, 2092));
  africaMap.put("Kuwait", new MapCoordinates(7222, 2040));
  africaMap.put("Turkey", new MapCoordinates(7143, 1957));
  africaMap.put("Lebanon", new MapCoordinates(7146, 1998));
  africaMap.put("Israel", new MapCoordinates(7141, 2020));
  africaMap.put("Saudi Arabia", new MapCoordinates(7200, 2100));
  africaMap.put("Egypt", new MapCoordinates(7105, 2072));
  africaMap.put("Morocco", new MapCoordinates(6878, 2024));
  africaMap.put("Algeria", new MapCoordinates(6938, 2057));
  africaMap.put("Oman", new MapCoordinates(7280, 2124));
  africaMap.put("Nigeria", new MapCoordinates(6970, 2215));
  africaMap.put("Uganda", new MapCoordinates(7125, 2272));
  africaMap.put("Angola", new MapCoordinates(7030, 2395));
  africaMap.put("Tanzania", new MapCoordinates(7140, 2344));
  africaMap.put("South Africa", new MapCoordinates(7075, 2552));  
  africaMap.put("Swaziland", new MapCoordinates(7120, 202)); 
  
  asiaOceaniaMap = new LinkedHashMap();
  
  asiaOceaniaMap.put("Kazakhstan", new MapCoordinates(7350, 1852)); 
  asiaOceaniaMap.put("Nepal", new MapCoordinates(7455, 2045));  
  asiaOceaniaMap.put("India", new MapCoordinates(7427, 2105));  
  asiaOceaniaMap.put("China", new MapCoordinates(7584, 1984));  
  asiaOceaniaMap.put("South Korea", new MapCoordinates(7737, 1967));  
  asiaOceaniaMap.put("Hong Kong", new MapCoordinates(7647, 2100)); 
  asiaOceaniaMap.put("Japan", new MapCoordinates(7807, 1980)); 
  asiaOceaniaMap.put("Macau", new MapCoordinates(7643, 2103)); 
  asiaOceaniaMap.put("Taiwan", new MapCoordinates(7690, 2092));  
  asiaOceaniaMap.put("Thailand", new MapCoordinates(7564, 2162)); 
  asiaOceaniaMap.put("Philippines", new MapCoordinates(7700, 2194));   
  asiaOceaniaMap.put("Vietnam", new MapCoordinates(7590, 2182));  
  asiaOceaniaMap.put("Indonesia", new MapCoordinates(7647, 2292));   
  asiaOceaniaMap.put("Malaysia", new MapCoordinates(7570, 2242));  
  asiaOceaniaMap.put("Australia", new MapCoordinates(7780, 2498)); 
  asiaOceaniaMap.put("Singapore", new MapCoordinates(7582, 2273));  
}

void loadBillionaires(){
  
  loadDataSet = new LoadDataSet("billionaires.csv");
  loadDataSet.load();
  topTenBillionaires = loadDataSet.getTopTenBillionaires();
  
}

void draw() {

  pushMatrix();
  
  background(BACKGROUND_COLOR[0], BACKGROUND_COLOR[1], BACKGROUND_COLOR[2]);
  fill(102);
  stroke(255);
  strokeWeight(2);
  beginShape();
  
  leftWorldMap.drawMap();
  rightWorldMap.drawMap();
  drawBillCountries(margins[0], americaMap, false);
  drawBillCountries(margins[1], europeMap, true);
  drawBillCountries(margins[2], africaMap, false);
  drawBillCountries(margins[3], asiaOceaniaMap, true);
  
  endShape(CLOSE);
  popMatrix();

  println("Finished.");
  endRecord();

}

void drawBillCountries(float margins[], Map<String, MapCoordinates> countriesMap, boolean alignToTheLeft ){
  float matrInitCrd[][];
  int nBill = 0;
  int i = 0;

  for(String key: countriesMap.keySet()){
      List<Billionaire> billCountry = topTenBillionaires.get(key);
      nBill = billCountry.size();
      matrInitCrd= new float[nBill][2];
      matrInitCrd = billionaireMarker.calculateInitCrd(margins, billCountry, i, alignToTheLeft);
      inset.drawInset(matrInitCrd[0][0], margins[1], nBill, i, billCountry.get(0), alignToTheLeft, countriesMap.get(key));
      for (int j=0; j<nBill; j++){
        billionaireMarker = new BillionaireMarker(matrInitCrd[j], billCountry.get(j).getHistoricWealth(), billCountry.get(j).getFullName(), this.getImagePath(billCountry.get(j)));
        pushMatrix();
        billionaireMarker.drawMarker();  
        popMatrix();
      }
      i++;
  }
}

String getImagePath(Billionaire billionaire){
  String imagePath = IMAGE_PATH + billionaire.getCountry() + "/" + billionaire.getFullName() + ".png";
  return imagePath;
}
