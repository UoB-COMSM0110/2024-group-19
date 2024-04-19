public class Round{
  
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
