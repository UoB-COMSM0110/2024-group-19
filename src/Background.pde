public class Background{
  
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
    
    topLeftX = -(playerInfo.x - (width/2));
    topLeftY = -(playerInfo.y - (height/2));
    image(image, topLeftX, topLeftY);
  }
  
    public float getTopLeftX() {
        return topLeftX;
    }

    public float getTopLeftY() {
        return topLeftY;
    }
  
}
