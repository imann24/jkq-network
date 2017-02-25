class doodle {
  float posX;
  float posY;
  float dimensions;
  int maxConnections;
  int numConnections = 0;
  doodle[] Connections; // List of connections
  int arrayOffal = 0;
  doodle[] ConFixed;
  int plRelationship; // How the doodle feels about the player. Relates to below array: 0=love, 1=like, 2= dislike, 3=hate
  color[] relatColors = {color(230, 46, 242), color(0, 215, 40), color(255, 140, 0), color(232, 0, 0)};
  int charNum; // Which doodle is this???
  float mouseOffX; //Mouse position w/ relation to posX/Y when dragging
  float mouseOffY;

  doodle(float codeX, float codeY, float dim, int order) {
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
    charNum = order;
  }

  boolean mouseOver() {
    if (mouseX > posX-dimensions/2 && mouseX < posX+dimensions/2 &&
      mouseY > posY-dimensions/2 && mouseY < posY+dimensions/2) {
      return true;
    }
    return false;
  }

  boolean pickedMe() {
    if (!firstClickHappened) { //Default selector
      if (charNum == 0) {
        return true;
      }
    } else if (charNum == selected) {
      return true;
    } else {
      return false;
    }
    return false;
  }

  void display() {
    rectMode(CENTER);
    if (pickedMe()) {
      fill(0);
      rect(posX, posY, dimensions+3, dimensions+3);
    } else {
      noStroke();
    }
    if (mouseOver()) {
      stroke(0);
    }
    fill(relatColors[plRelationship]);
    rect(posX, posY, dimensions, dimensions);
  }

  void drag() {
    if (mouseX < playArea.dimensions - dimensions/2) {
      posX = mouseX-mouseOffX;
    } else { posX = playArea.dimensions - dimensions/2; }
      posY = mouseY-mouseOffY;
  }
}