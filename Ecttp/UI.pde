class UI{
  
  UI() {
  }
  
  void update(){
    //Performance
    if (smoothFrameRate < 30){
      fill(255, 0, 0);
      text(int(smoothFrameRate), 10, 20);
      text("Game Slowed", 40, 20);
      text("Considerably", 122, 20);
    }
    if (smoothFrameRate <= 60 && smoothFrameRate >= 30){
      fill(215, 115, 0);
      text(int(smoothFrameRate), 10, 20);
      text("Game Slowed", 40, 20);
    }
    if (smoothFrameRate >= 60){
      fill(0, 100, 0);
      text(int(smoothFrameRate), 10, 20);
    }
  }
}
