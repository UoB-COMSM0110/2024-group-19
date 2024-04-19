public class EnemyManager{
  
  Character playerInfo;
  PImage enemyImage;
  int waveNumber = 0, safeDistance = 150;
  float lastRoundTime = 0, lastEnemySpawned = 0;
  float mapX, mapY;
  ArrayList<Enemy> enemyList = new ArrayList();
  // We'll track which enemies are on screen to reduce the collision detection calculations
  public ArrayList<Enemy> enemyListOnScreen;
  Round currentRound;
  
  public EnemyManager(float mapX, float mapY, Character player, PImage enemyImage){
    
    this.playerInfo = player;
    this.enemyImage = enemyImage;
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
  
      enemyList.add(new Enemy(enemyX, enemyY, currentRound.enemySpeed, enemyImage, currentRound.averageHealth, player));
  }
  
  private void updatePosition(){
    float prevX, prevY;
    
    for(Enemy enemy : enemyList){
      prevX = enemy.x;
      prevY = enemy.y;
      enemy.update();
      
    }
    EnemyEnemySeparation();
    // To prevent enemies from coalescing we are going to try and implement the seperation part of the boid algorithm. 
  }
  
  private void EnemyEnemySeparation(){
    
    if(enemyListOnScreen == null){return;}
    
    float yClose, xClose, protectedDistance = enemyImage.width/2, direction;
    int collisions;
    // These track the net distance between a given enemy (enemyOne) and all other enemies in its protected radius
    // Rather than stopping them from moving when they get to close to one another (which causes large groups of enemies to effectively become 'stuck'
    // we'll insted encourage them to go in a different direction.
    
    for(Enemy enemyOne : enemyListOnScreen){
      yClose = 0;
      xClose = 0;
      collisions = 0;
      for(Enemy enemyTwo : enemyListOnScreen){
        if(enemyOne.equals(enemyTwo)){
          continue;
        }
        else{
          // Accumulate the net vectors of all enemies within the protected radius
          if(dist(enemyOne.centreX,enemyOne.centreY,enemyTwo.centreX,enemyTwo.centreY) < protectedDistance){
              yClose += enemyOne.centreY - enemyTwo.centreY;
              xClose += enemyOne.centreX - enemyTwo.centreX;
              collisions++;
          }
        }
      }
      // Move the current enemy away from that. 
      if(collisions!=0){
        direction = atan2(yClose, xClose);
        enemyOne.specificMovement(direction);
      }
    }
  }
  
  
  private void enemyOnScreen(){
    
    enemyListOnScreen = new ArrayList();
    
    for(Enemy enemy : enemyList){
      if(abs(player.x - enemy.x) < width/2 ||
         abs(player.y - enemy.y) < height/2){
         enemyListOnScreen.add(enemy);
       }
    }
  }
  
  private void enemyRender(){
    float screenPositionX, screenPositionY;
    for(Enemy enemy : enemyList){
      screenPositionX = enemy.x - playerInfo.x + width/2;
      screenPositionY = enemy.y - playerInfo.y + height/2;
      image(enemy.img,screenPositionX,screenPositionY);
      
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
