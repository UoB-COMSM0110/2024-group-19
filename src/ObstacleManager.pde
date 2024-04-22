import processing.data.JSONObject;
import processing.data.JSONArray;

public class ObstacleManager {
    ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
    float screenPositionX;
    float screenPositionY;

    public ObstacleManager(String jsonFilename) {
        // Load the JSON file
        JSONObject json = loadJSONObject(jsonFilename);
        JSONArray obstaclesArray = json.getJSONArray("obstacles");

        // Loop over each object in the array
        for (int i = 0; i < obstaclesArray.size(); i++) {
            JSONObject obstacleJson = obstaclesArray.getJSONObject(i);
            String type = obstacleJson.getString("type");
            float x = obstacleJson.getFloat("x")*mapX;
            float y = obstacleJson.getFloat("y")*mapY;
            float Owidth = obstacleJson.getFloat("width");
            float Oheight = obstacleJson.getFloat("height");
            
            PImage img = loadImage("../Assets/ruins/"+type + ".png"); // Assumes image file names match the "type"
            
            
            Obstacle obstacle = new Obstacle(img, x,y, Owidth, Oheight);
            obstacles.add(obstacle);
        }
        
        for (Obstacle obstacle : obstacles) {
            obstacle.image.resize((int)obstacle.imgWidth*4, (int)obstacle.imgHeight*4);
        }
    }

    public void displayAll() {
        for (Obstacle obstacle : obstacles) {
            //obstacle.display();
            screenPositionX = obstacle.x- player.x + width/2;
            screenPositionY = obstacle.y- player.y + height/2;
           //obstacle.image.resize(width/5,width/5);
           imageMode(CORNER);
           image(obstacle.image,screenPositionX,screenPositionY);
        }
    }

    // Additional methods such as collision detection, removing obstacles, etc.
}
