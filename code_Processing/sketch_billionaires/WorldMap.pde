class WorldMap {

  PImage image;
  PGraphics mask;
  private int xImage;
  private int yImage;
  private String imgPath;
  private static final int FINAL_WIDTH = 1400;
  private static final int FINAL_HEIGHT = 1300;

  WorldMap(int x_image, int y_image, String imgPath){
    this.xImage = x_image;
    this.yImage = y_image;
    this.imgPath = imgPath;
  }

  void drawMap(){
    // create mask
    image = loadImage(imgPath);
    int originalWidth = image.width;
    int originalHeight = image.height;
    int xCenter = originalWidth/2;
    int yCenter = originalHeight/2;
    mask = createGraphics(originalWidth, originalHeight);
    mask.beginDraw();
    mask.ellipse(xCenter, yCenter, originalWidth, originalHeight);
    mask.endDraw();
    // apply mask
    image.mask(mask);
    // show masked image
    image(image,this.xImage, this.yImage, FINAL_WIDTH, FINAL_HEIGHT);

  }
}
