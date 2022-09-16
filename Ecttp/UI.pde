class UI{
  
  public boolean spacebar;
  public boolean w;
  public boolean d;
  public boolean s;
  public boolean a;
  
  UI() {
  }
  
  void draw(){ // for keyPressed and keyReleased to work
  }
  
  void update(){
    
    //Performance
    if (smoothFrameRate < 30){
      fill(255, 0, 0);
      text(int(smoothFrameRate), 10, 20);
      text("Game Slowed", 40, 20);
      text("Considerably", 122, 20);
    }
    if (smoothFrameRate <= 50 && smoothFrameRate >= 30){
      fill(215, 115, 0);
      text(int(smoothFrameRate), 10, 20);
      text("Game Slowed", 40, 20);
    }
    if (smoothFrameRate >= 60){
      fill(0, 100, 0);
      text(int(smoothFrameRate), 10, 20);
    }
  }
  
  void keyPressed(){
    println("keyPressed");
    if (key == 'a'){
      a = true;
    }
    
    if (key == 'd'){
      d = true;
    }
      
    if (key == 'w'){
      w = true;
    }
      
    if (key == 's'){
      s = true;
    }
    
    if (key == ' '){
      spacebar = true; 
    }
    
    
    if (key == ESC){
      exit();
    }
  }
  
  void keyReleased(){
    println("keyreleased");
    if (key == 'a'){
      a = false;
    }
    
    if (key == 'd'){
      d = false;
    }
      
    if (key == 'w'){
      w = false;
    }
      
    if (key == 's'){
      s = false;
    }
    
    if (key == ' '){
      spacebar = false; 
    }
  }
}
