import java.util.ArrayList;
import java.util.Collections;

public class PageManager {
    int pageNumber;
    EnemyManager enemyManager;
    Character playerInfo;
    ArrayList<Character> name;
    ArrayList<PlayerScore> highScores = new ArrayList<PlayerScore>();
    Integer currentScore;
    StringBuilder nameBuilder = new StringBuilder();
    String playerName = "";
    BulletManager bulletManager;
    

    public PageManager(Character player, int pageNumber, EnemyManager enemyManager, BulletManager bulletManager) {
        this.playerInfo = player;
        this.pageNumber = pageNumber;
        this.enemyManager = enemyManager;
        this.currentScore = null;
        this.bulletManager = bulletManager;
    }
  
  //page 1
  public void gameStart() {
    background(0);
    image(gameStartImage, width / 2, height/ 2, width, height*1.5);
    textSize(width*0.16);
    fill(#ffffff);
    text("The Chase", (width / 2), height*0.325);
    textSize(50);
    text("Group 19",width*0.5, height*0.375);
    //image(button2, WIDTH - 70, 70, 100, 100); // leaderboard
    imageMode(CENTER);
   // image(buttonImage, (width / 2), height*0.625, width*0.3666, height*0.1375); //start
    textSize(60);
    textAlign(CENTER);
    fill(#ffffff);
    text("ENTER TO START", (width / 2), height*0.6425);
   

  }
  
  // Page 2
  public void enterName() {
    background(0);
    image(gameStartImage, width / 2, height/ 2, width, height*1.5);
    textSize(180);
    text("Enter Name", (width / 2), 160);

    playerName = nameBuilder.toString();
    textSize(300);
    // Display the name
    text(playerName + "_".repeat(Math.max(0, 5 - playerName.length())), width / 2, 500);
}

  
  //page 4
  public void homePage(){
    background(0);
   // imageMode(CORNER);
  //  float topLeftX = -(playerInfo.x - (width/2));
   // float topLeftY = -(playerInfo.y - (height/2));
     image(gameStartImage, width / 2, height/ 2, width, height*1.5);
   // image(gameStartImage,topLeftX, topLeftY);
   // imageMode(CENTER);
    textSize(100);
    fill(#ffffff);
    text("INSTRUCTIONS 1/2",width*0.5,height*0.1);
    textSize(30);
    fill(#ffffff);
    text("Press 'M' for menu and instructions",width*0.5,height*0.15);
             // "W", "A", "S", "D" 
  float baseX = width / 2;
  float baseY = height / 2;
  float offset = width/15; 

   oxygenInstr();
   zombieInstr();
   buttonInstr(baseX,baseY,offset);

  textSize(50);
  fill(#ffffff);
 // image(buttonImage, baseX, baseY + 2 * offset + 50, width*0.25, height*0.13);// "Click to Start"
  text("Right arrow \nfor next page\n >>", baseX, baseY + 2 * offset + (height*0.054));
 // imageMode(CORNER);
  }
  
    public void InstructionPage(){
    background(0);
   // imageMode(CORNER);
  //  float topLeftX = -(playerInfo.x - (width/2));
   // float topLeftY = -(playerInfo.y - (height/2));
     image(gameStartImage, width / 2, height/ 2, width, height*1.5);
   // image(gameStartImage,topLeftX, topLeftY);
   // imageMode(CENTER);
    textSize(100);
    fill(#ffffff);
    text("INSTRUCTIONS 2/2",width*0.5,height*0.1);
    textSize(30);
    fill(#ffffff);
    text("Press 'M' for menu and instructions",width*0.5,height*0.15);
             // "W", "A", "S", "D" 
  float baseX = width / 2;
  float baseY = height / 2;
  float offset = width/15; 

  healthInstr();
  speedInstr();
  portalInstr();

  textSize(50);
  fill(#ffffff);
 // image(buttonImage, baseX, baseY + 2 * offset + 50, width*0.25, height*0.13);// "Click to Start"
  text("Enter\n to play", baseX+3*offset, baseY + 2 * offset + (height*0.05));
  text("Left arrow \nto go back\n <<", baseX-3*offset, baseY+2 * offset + (height*0.054));
 // imageMode(CORNER);
  }
  
 
   public void helpPage(){
     background(0);
    //imageMode(CORNER);
    //float topLeftX = -(playerInfo.x - (width/2));
    //float topLeftY = -(playerInfo.y - (height/2));
    image(gameStartImage, width / 2, height/ 2, width, height*1.5);
    //imageMode(CENTER);
    textSize(100);
    fill(#ffffff);
    text("MENU",width*0.5,height*0.1);
    text("INSTRUCTION 1/2", width*0.5, height*0.15);

  float baseX = width / 2;
  float baseY = height / 2;
  float offset = width/15; 
    oxygenInstr();
    zombieInstr();
    buttonInstr(baseX,baseY,offset);

  textSize(40);
  //image(buttonImage, (width/3), height*0.72, width*0.2, height*0.13);// "Enter to Resume"
  textLeading(37);
  fill(#ffffff);
  text("Enter\n to Resume",(width*0.23), height*0.71);
  textSize(40);
  fill(#ffffff);
 // image(buttonImage, (width*0.7), height*0.72, width*0.2, height*0.13);// "Shift to Quit"
  text("Shift\n to Quit", (width*0.8), height*0.71);
  textSize(43);
   text("Right arrow \nfor next page\n >>", (width*0.5), height*0.72);
 // imageMode(CORNER);
  }
     public void MenuTwoPage(){
     background(0);
    //imageMode(CORNER);
    //float topLeftX = -(playerInfo.x - (width/2));
    //float topLeftY = -(playerInfo.y - (height/2));
    image(gameStartImage, width / 2, height/ 2, width, height*1.5);
    //imageMode(CENTER);
    textSize(100);
    fill(#ffffff);
    text("MENU",width*0.5,height*0.1);
    text("INSTRUCTION 1/2", width*0.5, height*0.15);

    healthInstr();
    speedInstr();
    portalInstr();

  textSize(40);
  //image(buttonImage, (width/3), height*0.72, width*0.2, height*0.13);// "Enter to Resume"
  textLeading(37);
  fill(#ffffff);
  text("Enter\n to Resume",(width*0.23), height*0.71);
  textSize(40);
  fill(#ffffff);
 // image(buttonImage, (width*0.7), height*0.72, width*0.2, height*0.13);// "Shift to Quit"
  text("Shift\n to Quit", (width*0.8), height*0.71);
  textSize(43);
   text("Left arrow \n to go back\n <<", (width*0.5), height*0.72);
 // imageMode(CORNER);
  }
  
  public void story (){
    background(0);
    //bakchround
   // imageMode(CORNER);
    //float topLeftX = -(playerInfo.x - (width/2));
    //float topLeftY = -(playerInfo.y - (height/2));
    image(gameStartImage, width / 2, height/ 2, width, height*1.5);
    //grey box 
   // fill(#808080);
    //rect(width*0.1, height*0.25, width*0.8, height*0.5, 28);
    //title 
    textSize(width*0.16);
    fill(#FFFFFF);
    text("The Chase", (width / 2), height*0.2);
    //story
    textSize(47);
    textLeading(50);
    fill(#ffffff);
    textAlign(CENTER);
    text(" Zombies has overrun the city,\n everywhere you go there are more zombies coming your way.\n Being the last human on earth, \nyou aim to survive with just your gun and your instincts.", width*0.49,height*0.45);
    text(" Enter to Continue",width*0.49,height*0.7);
  }
 
  
  
  //page 7
  public void gameOverPage(int previousScore){
    background(0);
    imageMode(CENTER);
    image(gameStartImage, width / 2, height/ 2, width, height*1.5);
    image(gameOverImage,(width / 2), height*0.325);

   // image(buttonImage, width / 2, height / 2 + height*0.125, width*0.2666, height*0.1375); // Restart game button
    textSize(height*0.04);
    fill(#ffffff); // White text color
   // image(buttonImage, (width / 2), height*0.625, width*0.2666, height*0.1375); //start
    textSize(50);
    textAlign(CENTER);
    text("ENTER TO RESTART", (width / 2), height*0.6425);
    text("Score: "+ previousScore ,width / 2, height / 2 );
    
    textSize(50);
    textAlign(CENTER);
    text("Right arrow \nfor leaderboard\n >>", (width*0.5), height*0.72);
  }
  
  // Page 8
  public void leaderboard() {
    background(0);
    image(gameStartImage, width / 2, height/ 2, width, height*1.5);
    textSize(150);
    text("LEADER BOARD", (width / 2), 300);
    int scoreHeight = 320;
    textSize(100);
    for (int i = 0; i < Math.min(5, highScores.size()); i++) {
        PlayerScore ps = highScores.get(i);
        String scoreText = (i + 1) + ". " + ps.playerName + " - " + ps.score;
        text(scoreText, (width / 2), scoreHeight*1.2);
        scoreHeight += 70; 
    }
    
    textSize(50);
    text("Left arrow \nto go back\n <<", (width*0.5), height*0.72); 
}


public void addScore(String playerName, int score) {
    highScores.add(new PlayerScore(playerName, score));
    Collections.sort(highScores); 
}

  
  
  public void keyPressed(){
    
   
     
    if(pageNumber == 7 && keyCode == ENTER ){
      pageNumber = 0;
    }
    
    
    if (keyCode == ENTER){
      pageNumber++;
    }
    
    if(pageNumber == 9){
      pageNumber = 1;
    }
    
    if(pageNumber == 4 && keyCode == RIGHT){
      pageNumber++;
    }
    if(pageNumber == 5 && keyCode == LEFT){
      pageNumber--;
    }
    
    if(pageNumber == 7 && keyCode == RIGHT ){
      pageNumber++;
    }
    
   if(pageNumber == 8 && keyCode == LEFT ){
      pageNumber--;
    } 
    
   if (pageNumber == 2) {
     if ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
        if(nameBuilder.length() < 5) { 
            nameBuilder.append(key); 
        }
     } else if (keyCode == ENTER) {
        playerName = nameBuilder.toString(); // Update global playerName
        pageManager.addScore(playerName, previousScore); 
        nameBuilder.setLength(0); // Clear StringBuilder for future use
       
     } else if ((nameBuilder.length() > 0) && keyCode == BACKSPACE) {
     nameBuilder.deleteCharAt(nameBuilder.length() - 1); 
     }
   }
        
        
  }
  
  public void saveName(String name) {
    System.out.println("Name saved: " + name);
}

  
  private void oxygenInstr(){
    textSize(height*0.045);
    fill(0, 0, 255); // Blue color for oxygen
    rect(width/13, height*0.4, (playerInfo.oxygenLevel * (width * 0.00266)), height/35,height/50);
    fill(#ffffff);
    textLeading(33);
    text("This is your stamina.\n Your can't move if it's empty. \nFreeze to refill.", (width/4.7), height*0.49);
    
  }
    private void healthInstr(){
    textSize(height*0.045);
    image(heartImage, width*0.17, height*0.36, width*0.1, width*0.1);
    fill(#ffffff);
    textLeading(33);
    text("This power up increases \nyour health by 1", width*0.17, height*0.49);
    
  }
  
  private void portalInstr(){
    textSize(height*0.04);
    textAlign(CENTER, CENTER);
    fill(#ffffff);
    textLeading(30);
    image(portalImage, width*0.85, height*0.36, width*0.1, width*0.1);
    text("This power up is a portal \n it will teleport you to a \nrandom spot on the map ", (width*0.85), height*0.49);
  }
  
  private void speedInstr(){
    textSize(height*0.04);
    textAlign(CENTER, CENTER);
    fill(#ffffff);
    textLeading(30);
    image(speedImage, width*0.5, height*0.36, width*0.1, width*0.1);
    text("This power will\n increase your speed ", (width*0.5), height*0.49);
    
  }
  
  private void zombieInstr(){
     textSize(height*0.05);
    textAlign(CENTER, CENTER);
    fill(#ffffff);
    textLeading(30);
    image(zombieImage, width*0.83, height*0.36, width*0.1, width*0.1);
    text("Survive the incoming\n waves of zombies for\n as long as possible. ", (width*0.83), height*0.49);
  }
  
  
  private void buttonInstr(float baseX, float baseY, float offset){
    fill(#ffffff);
  // "W"
  image(buttonImage, width*0.52, height*0.25, height*0.075, height*0.075); // "W"
  text("W", width*0.52, height*0.25);

  // "A"
  image(buttonImage, width*0.475, height*0.32, height*0.075, height*0.075); // "A"
  text("A", width*0.475, height*0.32);

  // "S"
  image(buttonImage, width*0.52, height*0.39, height*0.075, height*0.075); // "S"
  text("S", width*0.52, height*0.39);

  // "D"
  image(buttonImage, width*0.565, height*0.32, height*0.075, height*0.075); // "D"
  text("D", width*0.565, height*0.32);

  textLeading(30);
  textSize(height*0.05);
  text("Use Mouse to aim \nand shoot", width*0.52, height*0.48 );
  }
  
  
  private void scoreDisplay(){
    fill(0);
   textSize(width*0.03);
   text("Score: " + playerInfo.score , (width*(0.8666)),(height*0.0625));
  }
  
  
  private void waveDisplay(){
   fill(0);
   textSize(width*0.03);
   text("Waves spawned: " + enemyManager.waveNumber , (width*(0.8666)),height*0.1);
  }
  
  private void oxygenDisplay(){
    fill(0, 0, 255); // Blue color for oxygen
    rect(width/150, height*0.09, (player.oxygenLevel * (width * 0.00266)), height/35,height*0.02);
  }
  
  private void speedBoostDisplay(){
    fill(0, 255, 255); // Blue color for oxygen
    float timeElapsed = millis() - player.lastSpeedTime;
    float barSize = 100*(1-(timeElapsed/player.speedBoostTimeLimit));
    rect(width/150, height*0.125, (barSize * (width * 0.00266)), height/35,height*0.02);
  }

  private void fireRateBoostDisplay(){
    fill(255, 0, 0); // Blue color for oxygen
    float timeElapsed = millis() - bulletManager.lastFireRateActivate;
    float barSize = 100*(1-(timeElapsed/bulletManager.increasedFireRateTimeLimit));
    rect(width/150, height*0.16, (barSize * (width * 0.00266)), height/35,height*0.02);
  }
  
  private void healthDisplay(){
    for (int i = 0; i < player.health; i++) {
      image(heartImage, (width/60 + (heartImage.width + width*(5/1500)) * i), (height/40)); // Adjust positioning as needed
    }
  }
  
  public void StatisticsDisplay(){
    scoreDisplay();
    waveDisplay();
    oxygenDisplay();
    if(player.speedBoostActive){
      speedBoostDisplay();
    }
    if(bulletManager.increasedFireRateActive){
    fireRateBoostDisplay();
    }
    healthDisplay();
  }
  
  void setName(String name) {
    playerName = name;
}

  void displayPlayerName() {
    fill(255); // Set text color 
    textSize(32); 
     text(playerName, (width*(0.8666)),(height*0.0625)); 
    
}
  
}
