public class EnemyManager{
  
  Character playerInfo;
  PImage zombieImage;
  int waveNumber = 0, safeDistance = 150;
  float lastRoundTime = 0, lastEnemySpawned = 0;
  float mapX, mapY;
  ArrayList<Enemy> enemyList = new ArrayList();
  // We'll track which enemies are on screen to reduce the collision detection calculations
  public ArrayList<Enemy> enemyListOnScreen;
  Round currentRound;
  
  public EnemyManager(float mapX, float mapY, Character player, PImage zombieImage){
    
    this.playerInfo = player;
    this.zombieImage = zombieImage;
    this.mapX = mapX;
    this.mapY = mapY;
   
  
  }
  
  private void roundHandler(){
    if (waveNumber == 0 || millis() - lastRoundTime > currentRound.roundTime || (enemyList.size() == 0 && player.oxygenLevel==100)) { 
      currentRound = new Round(++waveNumber);
      lastRoundTime = millis();
    }
  }
  
  private void enemySpawner(){
    if(millis()-lastEnemySpawned > 200 && currentRound.leftToSpawn > 0){
      spawnEnemy();
      lastEnemySpawned = millis();
      currentRound.spawn();
    }
  }
  
  private void spawnEnemy(){float enemyX, enemyY;
    do {
      enemyX = random(width/2, (mapX-width/2));
      enemyY = random(height/2, (mapY-height/2));
    } while (dist(enemyX, enemyY, player.x, player.y) < safeDistance); // Ensure enemy spawns away from player
  
      enemyList.add(new Enemy(enemyX, enemyY, currentRound.enemySpeed, zombieImage, currentRound.averageHealth, player));
  }
  
  private void updatePosition(){
    
    for(Enemy zombie : enemyList){
      zombie.update();
    }
  }
  
  private void enemyOnScreen(){
    
    enemyListOnScreen = new ArrayList();
    
    for(Enemy zombie : enemyList){
      if(abs(player.x - zombie.x) < width/2 ||
         abs(player.y - zombie.y) < height/2){
         enemyListOnScreen.add(zombie);
       }
    }
  }
  
  private void enemyRender(){
    float screenPositionX, screenPositionY;
    for(Enemy zombie : enemyList){
      screenPositionX = zombie.x - playerInfo.x + width/2;
      screenPositionY = zombie.y - playerInfo.y + height/2;
      image(zombieImage,screenPositionX,screenPositionY);
      
    }
  }
  
  public void update(){
    roundHandler();
    enemySpawner();
    updatePosition();
    enemyOnScreen();
    //println(enemyListOnScreen.size() + " out of " + enemyList.size());
    //println("FPS: " + frameRate);
    enemyRender();
  }

}
