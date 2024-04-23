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
    averageHealth = 2.0+((float)roundNumber * 0.2);
  }
  
  private void numberSpawnedCalcs(){
    leftToSpawn = roundNumber + 5;
  }
  private void roundTimeCalcs(){
    roundTime = leftToSpawn*1100;
  }
  private void enemySpeedCalcs(){
    enemySpeed = min((1 + 0.1*roundNumber),3);
  
  }
  public void spawn(){
    leftToSpawn--;
  }
}
