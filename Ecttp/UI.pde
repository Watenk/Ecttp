class UI{
  
  UI() {
  }
  
  void update(){
    
    if (keyPressed){
    
      if (key == ESC){
    
      exit();
      }
    
      if (key == ' '){
        
      cubePhysics1.AddForce();
     } 
    }
  }
}
