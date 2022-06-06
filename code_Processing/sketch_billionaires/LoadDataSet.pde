import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.Collections;

class LoadDataSet{
  
  private Table table;
  private String filePath;
  private Map<String, List> countries;
  private Map<String, List> topTenBillionaires;
  private List<Billionaire> billionaires;
  private static final int NUMBER_BILLIONAIRES = 10;
  private static final int LAST_YEAR = 2014;
  
  LoadDataSet(String filePath){
    this.filePath = filePath;
  }

  void load() {
    String country = "";
    table = loadTable(filePath, "header");
  
    println(table.getRowCount() + " total rows in table");
    countries = new HashMap();

    for (TableRow row : table.rows()) {
      country = row.getString("location.citizenship");
      Billionaire bill = new Billionaire(row.getString("name"), row.getInt("year"), row.getInt("rank"), 
      country, row.getFloat("wealth.worth in billions"));
      
      if (!countries.containsKey(country)){
        billionaires  = new ArrayList();
      }else{
        billionaires = countries.get(country);
      }
      
      billionaires.add(bill);
      countries.put(country, billionaires);
    }
    
    filterTopTenBill();
  }
  
  private void filterTopTenBill(){
    List<Billionaire> lastBillionaires ;
    topTenBillionaires = new HashMap();
    for(String keyCountry: countries.keySet()){
          //println(" Key: " + keyCountry);
          List<Billionaire> listBill = countries.get(keyCountry);
          lastBillionaires = getBillPerYear(LAST_YEAR, listBill);
          Collections.sort(lastBillionaires);
          lastBillionaires = getTopTenBill(lastBillionaires, listBill);
          topTenBillionaires.put(keyCountry, lastBillionaires);
    }
    //printCountries(topTenBillionaires);
  }
  
  private List<Billionaire> getBillPerYear(int year,  List<Billionaire> allBillionaires){
    List<Billionaire> lastBillionaires = new ArrayList();
    for(Billionaire bill: allBillionaires){
      if(bill.getYear() == year){
        lastBillionaires.add(bill);
      } 
    }
    return lastBillionaires;
  }
  
  private List<Wealth> getDataPrevYears(Billionaire bill, List<Billionaire> allBillionaires){
    List<Wealth> prevBillWealth = new ArrayList();
    Wealth hWealth;
    for(Billionaire origBill: allBillionaires){
      if(bill.getFullName().trim().compareTo(origBill.getFullName().trim()) == 0){
        hWealth = new Wealth(origBill.getWealth(), origBill.getYear());
        prevBillWealth.add(hWealth);
      }
    }
    return prevBillWealth;
  }
  
  
  private List<Billionaire> getTopTenBill(List<Billionaire> billionaires, List<Billionaire> allBillionaires){
    List<Billionaire> topTenBill = new ArrayList();
    List<Wealth> historicWealth = new ArrayList();
    Billionaire bill;
    int nbill = NUMBER_BILLIONAIRES < billionaires.size() ? NUMBER_BILLIONAIRES : billionaires.size();
    for(int i=0; i<nbill; i++){
      bill = billionaires.get(i);
      historicWealth = getDataPrevYears(bill, allBillionaires);
      Collections.sort(historicWealth);
      bill.addHistoricWealth(historicWealth);
      topTenBill.add(bill);
    }
    return topTenBill;
  }
  
  void printCountries(){
    printCountries(topTenBillionaires);
  }
  
  void printCountries(Map<String, List> billCountries){
    println("Number of countries: " + countries.size());
    for (String key: countries.keySet()){
      println(" Key: " + key);
      List<Billionaire> listBill = billCountries.get(key);
      for(Billionaire bill: listBill){
        println(bill.toString());
      }
    }
  }
  
  Map<String, List> getTopTenBillionaires(){
    return topTenBillionaires;
  }
}
