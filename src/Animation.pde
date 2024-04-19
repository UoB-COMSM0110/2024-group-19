public class Animation{
  
  ArrayList<ArrayList<PImage>> imageArrays;
  ArrayList<PImage> activeArray;
  PImage activeImage;
  public int activeImageIndex = 0, activeArrayIndex = 0;
  
  public Animation(ArrayList<ArrayList<PImage>> imageArrays){
    
    this.imageArrays = imageArrays;
    activeArray = imageArrays.get(activeArrayIndex);
    activeImage = activeArray.get(activeImageIndex);
    
  }
  
  public void nextImage(){
    
    activeImageIndex=(activeImageIndex+1)%activeArray.size();
    activeImage = activeArray.get(activeImageIndex);
    
  }
  
  public void selectImageArrayCharacter(boolean[] keys){
    // This will simply look at all the permutations of keys and pick the appropriate image array
    ArrayList<Integer> trueIndex = new ArrayList();
    
    for (int i = 0; i < keys.length; i++) {
            if (keys[i]) {  // Check if the value is true
                trueIndex.add(i);  // Add the index to the ArrayList
            }
      }
     /*
     Animation indicies
     Index 0 - Stationary images
     Index 1 - Forward images
     Index 2 - Right images
     Index 3 - Backward images
     Index 4 - Left images
     */
     
     /*
     Key indicies:
     Index 0 = W
     Index 1 = A
     Index 2 = S
     Index 3 = D
     */
     switch(trueIndex.size()){
       case 0:
          //If there is no movement we want stationary array
         activeArrayIndex = 0;
         break;
       case 1:
         switch(trueIndex.get(0)){
           case 0:
           // W
             activeArrayIndex = 3;
             break;
           case 1:
           // A
             activeArrayIndex = 4;
             break;
           case 2:
           // S
             activeArrayIndex = 1;
             break;
           case 3:
           // D
             activeArrayIndex = 2;
             break;
         }
         break;
         
       case 2:
       // Right movement
         if(trueIndex.get(1) == 3 && trueIndex.get(0) != 1){
           activeArrayIndex = 2;
         }
         // Left movement
         else if((trueIndex.get(0) == 0 && trueIndex.get(1) == 1) || (trueIndex.get(0) == 1 && trueIndex.get(1) == 2)){
           activeArrayIndex = 4;
         }
         else{
           activeArrayIndex = 0;
         }
         break;
         
       case 3:
         if(trueIndex.get(0) == 0 && trueIndex.get(1) == 1 && trueIndex.get(2) == 2){
           activeArrayIndex = 4;
         }
         else if(trueIndex.get(0) == 0 && trueIndex.get(1) == 1 && trueIndex.get(2) == 3){
           activeArrayIndex = 3;
         }
         else if(trueIndex.get(0) == 0 && trueIndex.get(1) == 2 && trueIndex.get(2) == 3){
           activeArrayIndex = 2;
         }
         else if(trueIndex.get(0) == 1 && trueIndex.get(1) == 2 && trueIndex.get(2) == 3){
           activeArrayIndex = 1;
         }
         break;
       default:
         activeArrayIndex = 0;
     }
     
     activeArray = imageArrays.get(activeArrayIndex);
    
  }

}
