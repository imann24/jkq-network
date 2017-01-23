class doodle {
 int posX;
 int posY;
 int dimensions;
 int maxConnections;
 int numConnections = 0;
 doodle[] Connections; // List of connections
 int arrayOffal = 0;
 doodle[] ConFixed;
 boolean selected = false;
 int plRelationship; // How the doodle feels about the player. Relates to below array: 0=love, 1=like, 2= dislike, 3=hate
 color[] relatColors = {color(230, 46, 242), color(0, 215, 40), color(255, 140, 0), color(232, 0, 0)};
 
  doodle(int codeX, int codeY, int dim) {
    posX = codeX;
    posY = codeY;
    dimensions = dim;
    maxConnections = int(random(1, 5));
    if (maxConnections == 1) {
      if (random(1) < 0.33) {
        maxConnections++;
      }
    }
    Connections = new doodle[maxConnections];
    plRelationship = int(random(0, 4));
  }
  
  void display() {
     fill(relatColors[plRelationship]);
     if (selected == true) {
       strokeWeight(3);
     }
     rectMode(CENTER);
     rect(posX, posY, dimensions, dimensions);
     strokeWeight(1);
     stroke(0);
  }
}