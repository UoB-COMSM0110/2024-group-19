public class Background{
  
  PImage backgroundImage;
  Character player;
  float backgroundWidth, backgroundHeight;
  float screenX, screenY;
  float cornerDistanceX, cornerDistanceY;
  float gameWidth = 4000, gameHeight = 2000;
  
  public Background(Character player, PImage img, float screenX, float screenY){
    this.player = player;
    backgroundImage = img;
    backgroundWidth = img.width;
    backgroundHeight = img.height;
    this.screenX = screenX; 
    this.screenY = screenY;

  }
  
  public void update(){
    
    // This prints an updated section of the map using the image() method.

    
    float upperCornerX, upperCornerY;
    System.out.println("BEFORE MAP: " + player.mapX+","+player.mapY);
    System.out.println("BEFORE PLACE: " + player.x+","+player.y);
    
    outOfBoundsCheck();
    

    
    upperCornerX = player.mapX;
    upperCornerY = player.mapY;
    image(backgroundImage,upperCornerX,upperCornerY);
    image(player.characterImg,width/2,height/2);
    
    
    
    
  }
  
  private void outOfBoundsCheck(){
    
    if(player.y<(height/2) || player.mapY < 0){
      player.y = height/2;
      player.mapY = 0;
      System.out.println("AFTER1: " + player.mapX+","+player.mapY);
      System.out.println("AFTER PLACE: " + player.x+","+player.y);
    }
    
    if(player.y>(backgroundHeight-(height/2))){
      player.y = (backgroundHeight-(height/2));
      player.mapY = backgroundHeight-height;
      System.out.println("AFTER2: " + player.mapX+","+player.mapY);
      System.out.println("AFTER PLACE: " + player.x+","+player.y);
    }
    
    if(player.x<(width/2) || player.mapX < 0){
      player.x = width/2;
      player.mapX = 0;
      System.out.println("AFTER3: " + player.mapX+","+player.mapY);
      System.out.println("AFTER PLACE: " + player.x+","+player.y);
    }
    
    if(player.x>(backgroundWidth-(width/2))){
      player.x = (backgroundWidth-(width/2));
      player.mapX = backgroundWidth-width;
      System.out.println("AFTER4: " + player.mapX+","+player.mapY);
      System.out.println("AFTER PLACE: " + player.x+","+player.y);
    }
  }
}
