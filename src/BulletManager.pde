public class BulletManager{
  
  private float mapX, mapY;
  // How many milliseconds between shots.
  public float fireRate, bulletSpeed;
  private float lastBulletTime = 0;
  ArrayList<Bullet> bulletList = new ArrayList();
  Character playerInfo;
  
  public BulletManager(float mapX, float mapY, PImage bulletImage, Character player){
    this.mapX = mapX;
    this.mapY = mapY;
    playerInfo = player;
    fireRate = 50;
    bulletSpeed = 5;
    
  }
  
  private void newBulletCheck(){
    
    if (millis() - lastBulletTime > fireRate) {
      float bulletDirection = atan2(mouseY - (height/2), mouseX - width/2); 
      bulletList.add(new Bullet((player.x+(player.img.width/2)), (player.y+(player.img.height/2)), bulletSpeed,bulletImage, bulletDirection));
      lastBulletTime = millis();
    }
  }
  
  private void removeBulletCheck() {
      // Create a copy of the bulletList to avoid ConcurrentModificationException
      ArrayList<Bullet> bulletsToRemove = new ArrayList<Bullet>();
      
      // Iterate over the bulletList manually
      for (int i = 0; i < bulletList.size() - 1; i++) {
          Bullet bullet = bulletList.get(i);
          bullet.update();
          BoundaryChecker boundary = new BoundaryChecker(bullet, mapX, mapY);
          if (boundary.bulletCheck()) {
              // Add bullets to remove to the list
              bulletsToRemove.add(bullet);
          }
      }
      
      // Remove bullets from the bulletList
      for (Bullet bullet : bulletsToRemove) {
          bulletList.remove(bullet);
      }
  }
  
  private void bulletRender(){
    float screenPositionX, screenPositionY;
    for(Bullet bullet : bulletList){
      screenPositionX = bullet.x - playerInfo.x + width/2;
      screenPositionY = bullet.y - playerInfo.y + height/2;
      image(bulletImage,screenPositionX,screenPositionY);
      
    }
  }
  
  private void update(){
    newBulletCheck();
    removeBulletCheck();
    bulletRender();
    
  }
}
