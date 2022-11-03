class Camera {

  int camFPSAmount = 10;
  int camFPS;

  public PixelImage PixelImage;
  public PImage currentCameraFrame;
  boolean cameraPlaying;

  int xPos;
  int yPos;
  int Width;
  int Height;
  float pixelSize;
  String mode;

  void Play(int _xPos, int _yPos, int _width, int _height, float _pixelSize, String _mode) {

    PixelImage = new PixelImage();

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
      
      HandDetection.Start();
    }
  }

  void Update() {
    if (cameraPlaying == true) {
      if (camFPS >= 60 / camFPSAmount) {
        if (cam.available())
        cam.read();
        cam.loadPixels();
        image(cam, -1000, -1000); 
        currentCameraFrame = cam.copy();

        PixelImage.Add(currentCameraFrame, xPos, yPos, Width, Height, pixelSize, mode);
        camFPS = 0;
      }
      PixelImage.Draw();
    }
    camFPS += 1;
  }
}
