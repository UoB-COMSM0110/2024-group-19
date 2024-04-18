public class PowerUpManager{
  
  ArrayList<PowerUp> powerUpList = new ArrayList();
  private float mapX, mapY;
  Character playerInfo;
  BulletManager bulletManager;
  // This is the probability that a powerUp will appear (between 0 and 1)
  float spawnProbability;
  int despawnTimeSeconds = 10, powerCollectionDist = 15;
  
  public PowerUpManager(float mapX, float mapY, Character player, float probability, BulletManager bulletManager){
    this.mapX = mapX;
    this.mapY = mapY;
    this.playerInfo = player;
    this.spawnProbability = probability;
    this.bulletManager = bulletManager;
  }
  
  public void powerUpCreate(float x, float y){
    // This will determine what PowerUp is being created and create a new instance of the PowerUp class for it
    // and add it to powerUpList.
    // It will also handle the probability aspect of a PowerUp spawning. 
    // This method will be called fom the CollisionManager class. The x & y parameters represent the coordinates of the dead
    // zombie that triggered the call.
    
    float randomNumberSpawn = random(0.0,1.0);
    if(randomNumberSpawn < spawnProbability){
      PImage img = null;
      String type = null;
      float randomNumberType = random(0.0,1.0);
      
      if(randomNumberType < 0.25){
        img = heartImage;
        type = "health";
      }
      else if(randomNumberType < 0.5){
        img = speedImage;
        type = "speed";
      }
      else if(randomNumberType < 0.75){
        img = rapidFireImage;
        type = "rapidFire";
      }
      else{
        img = portalImage;
        type = "portal";
      }
      
      
      PowerUp newPowerUp = new PowerUp(x,y,0,img,type,millis());
      powerUpList.add(newPowerUp);
    }
    
    
    
  }
  
  public void powerUpRemove(){
    // This will go through the powerUpList and 'despawn' any powerUps that are over x seconds old.
    ArrayList<PowerUp> powerUpToRemove = new ArrayList();
    for(PowerUp power:powerUpList){
      if(millis() - power.timeCreated > (despawnTimeSeconds*1000)){
        powerUpToRemove.add(power);
      }
    }
    
    for(PowerUp power:powerUpToRemove){
      powerUpList.remove(power);
    }
  }
  
  private void powerUpCollect(){

    PowerUp activePowerUp = null;
    float playerXCentre = player.x+(player.img.width/2), playerYCentre = player.y+(player.img.height/2), powerXCentre, powerYCentre;
    
    for(PowerUp power : powerUpList){
      powerXCentre = power.x+(power.img.width/2);
      powerYCentre = power.y+(power.img.height/2);
      if(dist(playerXCentre,playerYCentre,powerXCentre,powerYCentre) < ((player.img.width)/2 + (power.img.width)/2)){
        activePowerUp = power;
        break;
      }
    }
    if(activePowerUp!=null){
      switch(activePowerUp.powerUpType){
        
        case "health":
          player.health++;
          player.health = min(8,player.health);
          break;
          
        case "portal":
          player.randomTeleport();
          break;
        
        case "speed":
          player.speedBoostActivate();
          break;
        
        case "rapidFire":
          bulletManager.increaseFireRate();
          break;
      }
    }
    
    powerUpList.remove(activePowerUp);
  }
  
  private void powerUpRender(){
    // This will draw all powerUps in powerUpList
    
    float screenPositionX, screenPositionY;
    for(PowerUp power : powerUpList){
      screenPositionX = power.x - playerInfo.x + width/2;
      screenPositionY = power.y - playerInfo.y + height/2;
      image(power.img,screenPositionX,screenPositionY);
      
    }
  }
  
  public void update(){
    powerUpCollect();
    powerUpRemove();
    powerUpRender();
    
  }
}
