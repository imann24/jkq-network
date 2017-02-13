playArea playArea; //Restrict spawn area
doodle[] Characters; //Array of characters
ArrayList<connections> Relationships = new ArrayList<connections>(); //Array of connections
connector controller;
boolean firstClickHappened = false;
int selected;

void setup() {
  size(1024, 512);
  colorMode(RGB, 255, 255, 255);
  playArea = new playArea();
  Characters = new doodle[int(playArea.dimensions/51)];
  controller = new connector();
  int arrayNum;
  for (int i = 0; i < Characters.length; i++) {
    float dimensions = random(20, 30);
    float dX = random(dimensions/2, playArea.dimensions - dimensions/2);
    float dY = random(height/2-playArea.dimensions/2 + dimensions/2, height/2 + playArea.dimensions/2 - dimensions/2);
    arrayNum = i;
    Characters[i] = new doodle(dX, dY, dimensions, arrayNum);
  }
  while (!allMaxConnections()) {
    connections con = controller.relate(Characters);
    if (con == null) {break;}
    Relationships.add(con);
  }
}

boolean allMaxConnections() {
  for (int i = 0; i < Characters.length; i++) {
    if (Characters[i].numConnections < Characters[i].maxConnections) {
      return false;
    }
  }
  return true;
}

void draw() {
  playArea.display();
  for (int i = 0; i < Characters.length; i++) {
   Characters[i].display();
  }
  for (int i= 0; i < Relationships.size(); i++) {
    Relationships.get(i).drawLine();
  }
}

int selector() {
  for (int i = 0; i < Characters.length; i++) {
    if (Characters[i].mouseOver()) {
      return i;
    }
  }
  return -1;
}

void mousePressed() {
  if (selector() != -1) {
    firstClickHappened = true;
    selected = selector();
    Characters[selected].mouseOffX = mouseX - Characters[selected].posX;
    Characters[selected].mouseOffY = mouseY - Characters[selected].posY;
  }
}

void mouseDragged() {
  if (selector() != -1) {
    Characters[selected].drag(); //ISSUE: Stops moving when mouse leaves dimensions
  }
}