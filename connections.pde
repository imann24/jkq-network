class connections {
 doodle Char1;
 doodle Char2;
  
  
  connections(doodle Char1, doodle Char2) {
    this.Char1 = Char1;
    this.Char2 = Char2;
  }
  
  void drawLine() {
    line(Char1.posX, Char1.posY, Char2.posX, Char2.posY);
  }
}