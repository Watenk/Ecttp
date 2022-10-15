class PixelVideo {

  public PImage currentMovieFrame;
  
  boolean videoPlaying;
  int xPos;
  int yPos;
  int Width;
  int Height;
  float pixelSize;
  String mode;

  PixelVideo() {
  }

  void Play(String _video, int _xPos, int _yPos, int _width, int _height, float _pixelSize, String _mode) {
    xPos= _xPos;
    yPos = _yPos;
    Width = _width;
    Height = _height;
    pixelSize = _pixelSize * displayWidth / 1920;
    mode = _mode;

    movie = new Movie(Main.this, _video);
    movie.play();
    videoPlaying = true;
  }

  void Update() {
    if (videoPlaying) {

      movie.read();
      movie.loadPixels();
      currentMovieFrame = movie.copy();
      image(movie, -1000, -1000);

      PixelImage.Add(currentMovieFrame, xPos, yPos, Width, Height, pixelSize, mode);
    }
  }
}
