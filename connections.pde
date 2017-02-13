class connections {
 doodle Char1;
 doodle Char2;
 int relationship; //How the connected doodles feel about each other. Relates to below array: 0=love, 1=like, 2= dislike, 3=hate
 color[] relatColors = {color(230, 46, 242), color(0, 215, 40), color(255, 140, 0), color(232, 0, 0)};
  
  
  connections(doodle Char1, doodle Char2) {
    this.Char1 = Char1;
    this.Char2 = Char2;
    relationship = int(random(0, 4));
  }
  
  void drawLine() {
    stroke(relatColors[relationship]);
    strokeWeight(1);
    line(Char1.posX, Char1.posY, Char2.posX, Char2.posY);
    noStroke();
  }
}