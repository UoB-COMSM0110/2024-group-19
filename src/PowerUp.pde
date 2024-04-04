public class PowerUp extends Entity{
  String powerUpType;
  float timeCreated;
  
  public PowerUp(float x, float y, float speed, PImage img, String type, float time){
    super(x, y, speed, img);
    this.powerUpType = type;
    this.timeCreated = time;
  }
  
  
}
