import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.IOException;

public class PageManager {
    int pageNumber;
    EnemyManager enemyManager;
    Character playerInfo;
    ArrayList<PlayerScore> highScores = new ArrayList<>();//sets up an empty list holding PlayerScore objects
    StringBuilder nameBuilder = new StringBuilder();
    //String playerName = "";
    BulletManager bulletManager;
    String scoreFile = "highscores.txt";
    //File scoreFile = new File("highscores.txt");

    public PageManager(Character player, int pageNumber, EnemyManager enemyManager, BulletManager bulletManager) {
        this.playerInfo = player;
        this.pageNumber = pageNumber;
        this.enemyManager = enemyManager;
        this.bulletManager = bulletManager;
        createScoreFile();
        loadScores();
        Collections.sort(highScores);
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
    //image(button2, WIDTH - 70, 70, 100, 100); 
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
  fireRateInstr();

  textSize(50);
  fill(#ffffff);
 // image(buttonImage, baseX, baseY + 2 * offset + 50, width*0.25, height*0.13);// "Click to Start"
  text("Enter\n to play", baseX+3*offset, baseY + 2 * offset + (height*0.05));
  text("Left arrow \nto go back\n <<", baseX-3*offset, baseY+2 * offset + (height*0.054));
 // imageMode(CORNER);
  }
  
  public void difficultySelection(){
    background(0);
    imageMode(CENTER);
    image(gameStartImage, width / 2, height/ 2, width, height*1.5);
    textSize(100);
    textAlign(CENTER, CENTER);
    fill(#ffffff);
    text("SELECT DIFFICULTY", width*0.5, height*0.25);
    textSize(80);
    text("EASY", width*0.33, height*0.5);
    text("HARD", width*0.66, height*0.5);
    textSize(50);
    text("On hard mode zombies will: \n - Have more health \n -  Move faster \n \n The rounds will: \n - Be faster \n - Have more zombies", width*0.5, height*0.75);
    textSize(80);
    fill(#ff0000);
    
    if(dist(mouseX,mouseY,width*0.33, height*0.5) < width*0.04){
      text("EASY", width*0.33, height*0.5);
      if (mousePressed){
        hardMode = false;
        pageNumber++;
        
      }
    }
    else if(dist(mouseX,mouseY,width*0.66, height*0.5) < width*0.04){
      text("HARD", width*0.66, height*0.5);
      if (mousePressed){
        hardMode = true;
        pageNumber++;
      }
    }
  }
  
  
  
  public void MenuTwoPage(){
    background(0);
    imageMode(CENTER);
    image(gameStartImage, width / 2, height/ 2, width, height*1.5);
    textSize(100);
    fill(#ffffff);
    text("GAME PAUSED",width*0.5,height*0.1);

    healthInstr();
    speedInstr();
    portalInstr();
    fireRateInstr();

    

  textSize(40);
  textLeading(37);
  fill(#ffffff);
  text("Enter\n to Resume",(width*0.23), height*0.85);
  textSize(40);
  fill(#ffffff);
  text("Shift\n to Quit", (width*0.8), height*0.85);
  
  textSize(100);
    text("LEADERBOARD", width / 2, height/1.6);
    int textSize = 60;
    textSize(textSize);
    float y = height/1.47;  // Start position for player scores
       
     // Loops through the top 5 scores stored in highScores
    for (int i = 0; i < Math.min(5, highScores.size()); i++) {
        PlayerScore ps = highScores.get(i);// Retrieves the i-th player score.
        text((i + 1) + ". " + ps.toString(), width / 2, y);
        y += textSize;  // Move down for the next score
    }
    
    text(playerName + "'s current Score: \n" + playerInfo.score, (width*0.8), height*0.71);
    
    
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
  
 private void createScoreFile() {
        //createif it doesn't exist
        File file = new File(sketchPath(scoreFile));
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                System.out.println("Failed to create score file: " + e.getMessage());
            }
        }
    }

    private void loadScores() {
        highScores.clear();
        File file = new File(sketchPath(scoreFile));
        try (Scanner scanner = new Scanner(file)) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] parts = line.split(",");
                if (parts.length == 3) {
                    String name = parts[0].trim();
                    int score = Integer.parseInt(parts[1].trim());
                    String difficulty = parts[2].trim();
                    highScores.add(new PlayerScore(name, score, difficulty));
                }
            }
            Collections.sort(highScores, Collections.reverseOrder()); // Assuming PlayerScore implements Comparable
        } catch (IOException e) {
            System.out.println("Error reading from score file: " + e.getMessage());
        }
    }

    public void addScore() {
        String difficulty;
      
        if(hardMode){
          difficulty = "(Hard)";
        }
        else{
          difficulty = "(Easy)";
        }
        
        highScores.add(new PlayerScore(playerName, previousScore, difficulty));
        Collections.sort(highScores);
        for(PlayerScore sc: highScores){
          sc.toString();
        }
        saveScores();
         
    }

   private void saveScores() {
     String difficulty;
      
        if(hardMode){
          difficulty = "(Hard)";
        }
        else{
          difficulty = "(Easy)";
        }
        try (PrintWriter pw = new PrintWriter(new FileWriter(sketchPath(scoreFile), false))) {
            for (PlayerScore ps : highScores) {
                pw.println(ps.playerName + "," + ps.score + "," + difficulty);
            }
        } catch (IOException e) {
            System.out.println("Error writing to score file: " + e.getMessage());
        }
    }


  
  
  public void keyPressed(){
    
   
     
    if((pageNumber == 9 || pageNumber == 8) && keyCode == ENTER ){
      pageNumber = 1;
    }
    
    else if(pageNumber == 5 && keyCode == RIGHT){
      pageNumber++;
    }
    else if(pageNumber == 6 && keyCode == LEFT){
      pageNumber--;
    }
    
    else if(pageNumber == 8 && keyCode == RIGHT ){
      pageNumber++;
    }
    
   else if(pageNumber == 9 && keyCode == LEFT ){
      pageNumber--;
    } 
    
   else if (pageNumber == 2) {
     if ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
        if(nameBuilder.length() < 5) { 
            nameBuilder.append(key); 
            playerName = nameBuilder.toString(); // Update global playerName
            //System.out.println("Debug: Added score for " + playerName);
        }
     } else if (keyCode == ENTER) {
        playerName = nameBuilder.toString(); 
        pageNumber++;
        
        nameBuilder.setLength(0); // Clear StringBuilder for future use
       
     } else if ((nameBuilder.length() > 0) && keyCode == BACKSPACE) {
       //System.out.println("Debug: Added score for " + playerName);
     nameBuilder.deleteCharAt(nameBuilder.length() - 1); 
     }
   }
   
   else if (keyCode == ENTER && pageNumber !=3){
      pageNumber++;
    }
  } 
  
   public void leaderboard() {
     background(0);
        image(gameStartImage, width / 2, height / 2, width, height * 1.5);
        textSize(100);
        text("LEADERBOARD", width / 2, 140);
        textSize(70);
        int y = 200;  // Start position for player scores
       
        // Loops through the top 5 scores stored in highScores
        for (int i = 0; i < Math.min(5, highScores.size()); i++) {
            PlayerScore ps = highScores.get(i);// Retrieves the i-th player score.
            text((i + 1) + ". " + ps.toString(), width / 2, y);
            y += 50;  // Move down for the next score
    }

    textSize(50);
    text("Left arrow \nto go back\n <<", (width * 0.5), height * 0.72);
}

  
  private void oxygenInstr(){
    textSize(height*0.045);
    fill(0, 0, 255); // Blue color for oxygen
    rect(width/13, height*0.4, (playerInfo.oxygenLevel * (width * 0.00266)), height/35,height/50);
    fill(#ffffff);
    textLeading(33);
    text("This is your stamina.\n Your can't move if it's empty. \n Stand still to refill.", (width/4.7), height*0.49);
    
  }
    private void healthInstr(){
    float widthPos = 0.15;
    textSize(height*0.045);
    image(heartImage, width*widthPos, height*0.36, width*0.1, width*0.1);
    fill(#ffffff);
    textLeading(33);
    text("This power up \n increases your \n health by 1", width*widthPos, height*0.49);
    
  }
  
  private void portalInstr(){
    float widthPos = 0.37;
    textSize(height*0.04);
    textAlign(CENTER, CENTER);
    fill(#ffffff);
    textLeading(30);
    image(portalImage, width*widthPos, height*0.36, width*0.05, width*0.1);
    text("This power up is a \n portal it will teleport \n you to a random \n spot on the map ", (width*widthPos), height*0.51);
  }
  
  private void speedInstr(){
    float widthPos = 0.59;
    textSize(height*0.04);
    textAlign(CENTER, CENTER);
    fill(#ffffff);
    textLeading(30);
    image(speedImage, width*widthPos, height*0.36, width*0.1, width*0.1);
    text("This power will\n increase your \n speed ", (width*widthPos), height*0.49);
    
  }
  
  private void fireRateInstr(){
    float widthPos = 0.81;
    textSize(height*0.04);
    textAlign(CENTER, CENTER);
    fill(#ffffff);
    textLeading(30);
    image(rapidFireImage, width*widthPos, height*0.36, width*0.15, width*0.038);
    text("This power will\n increase your \n rate of fire ", (width*widthPos), height*0.49);
    
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

  void displayPlayerName() {
    fill(255); // Set text color 
    textSize(32); 
     text(playerName, (width*(0.8666)),(height*0.0625)); 
    
}
  
}
