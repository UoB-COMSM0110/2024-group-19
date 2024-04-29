public class Round{
  
  /*
  
  This class handles the progressively increasing difficulty of the game.
  To do this, all the methods use roundNumber as an argument.
  
  This allows us to increment enemy health, speed and number aswell as making rounds more fast-paced.
  
  This is also where the sepected difficulty has the greatest effect. If the player choses hard move,
  the previously mentioned attributes are amplified.
  */
  
  private final int roundNumber;
  public float averageHealth;
  public int leftToSpawn;
  public int roundTime;
  public float enemySpeed;
  
  public Round(int roundNumber){
    this.roundNumber = roundNumber;
    healthCalcs();
    numberSpawnedCalcs();
    roundTimeCalcs();
    enemySpeedCalcs();
  }
  
  private void healthCalcs(){
    if(hardMode){averageHealth = 2.0+((float)roundNumber * 0.7);}
    else{averageHealth = 2.0+((float)roundNumber * 0.3);}
    
  }
  
  private void numberSpawnedCalcs(){
    if(hardMode){leftToSpawn = roundNumber + 25;}
    else{leftToSpawn = roundNumber + 15;}
    
  }
  private void roundTimeCalcs(){
    if(hardMode){roundTime = leftToSpawn*900;}
    else{roundTime = leftToSpawn*1100;}
    
  }
  private void enemySpeedCalcs(){
    if(hardMode){enemySpeed = min((1 + 0.2*roundNumber),3.2);}
    else{enemySpeed = min((1 + 0.1*roundNumber),3);}

  }
  public void spawn(){
    leftToSpawn--;
  }
}
