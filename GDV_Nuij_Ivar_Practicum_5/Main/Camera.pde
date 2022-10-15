class Camera {

  public PImage currentCameraFrame;

  boolean cameraPlaying;

  int xPos;
  int yPos;
  int Width;
  int Height;
  float pixelSize;
  String mode;

  void Play(int _xPos, int _yPos, int _width, int _height, float _pixelSize, String _mode) {
    xPos= _xPos;
    yPos = _yPos;
    Width = _width;
    Height = _height;
    pixelSize = _pixelSize * displayWidth / 1920;
    mode = _mode;

    String[] cameras = Capture.list();

    if (cameras.length == 0) {
      println("No Connected Cameras Detected");
    } else {
      println("Detected Cameras: (1st cam is default)");
      for (int i=0; i < cameras.length; i++) {
        println(cameras[i]);
      }

      cam = new Capture(Main.this, cameras[0]);
      cam.start();

      cameraPlaying = true;
    }
  }

  void Update() {
    if (cameraPlaying == true) {

      cam.read();
      cam.loadPixels();
      currentCameraFrame = cam.copy();
      image(cam, -1000, -1000);

      PixelImage.Add(currentCameraFrame, xPos, yPos, Width, Height, pixelSize, mode);
    }
  }
}
