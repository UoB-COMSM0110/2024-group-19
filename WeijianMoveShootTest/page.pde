public class Page {
  //page 1
  public void gameStart() {
    image(bground, width / 2, height/ 2, width, height);
    textSize(180);
    text("game 19", (width / 2), 260);
    //image(button2, WIDTH - 70, 70, 100, 100); // leaderboard
    imageMode(CENTER);
    image(button, (width / 2), 500, 400, 110); //start
    textSize(60);
    textAlign(CENTER);
    text("GAME START", (width / 2), 525);
    
  }
  
  public void gameOver() {
    imageMode(CENTER);
    image(bground, width / 2, height/ 2, width, height);
    image(gameover,(width / 2), 260);
  }
  
}
