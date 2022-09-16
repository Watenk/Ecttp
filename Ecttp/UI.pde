class UI{
  
  public boolean spacebar;
  
  UI() {
  }
  
  void update(){
    
    //Performance
    text(int(smoothFrameRate), 10, 20);
    
    if (smoothFrameRate < 50){
      text("Game Slowed Down", 100, 20);
      
      if (smoothFrameRate < 30){
        text("!", 215, 20);
      }
    }
    
    //Keys
    if (key == ESC){
    exit();
    }
  
    if (key == ' '){
       spacebar = true; 
     }
     else{
       spacebar = false;
     }
  }
}
