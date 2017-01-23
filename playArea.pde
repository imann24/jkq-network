class playArea {
  float dimensions = 512;
  
  playArea() {
  }
  
  void display() {
    fill(155);
    noStroke();
    rectMode(CENTER);
    rect(width/2, height/2, dimensions, dimensions);
    fill(255);
    stroke(0);
  }
}