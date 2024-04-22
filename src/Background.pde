public class Background{
  /*
  
  The primary function of this class is to draw the map in an appropriate position 
  relative to the user's position to create the illusion of movement.
  
  */
  private Character playerInfo;
  private PImage image;
  private float mapX, mapY;
  private float topLeftX, topLeftY;
  
  public Background(Character player, float mapX, float mapY, PImage backgroundImage){
    this.playerInfo = player;
    this.mapX = mapX;
    this.mapY = mapY;
    this.image = backgroundImage;
  }
  
  public void update(){
    background(0);
    topLeftX = -(playerInfo.x - (width/2));
    topLeftY = -(playerInfo.y - (height/2));
    image(image, topLeftX, topLeftY, width*9, height*9);
  }
  
    public float getTopLeftX() {
        return topLeftX;
    }

    public float getTopLeftY() {
        return topLeftY;
    }
  
}
