playArea playArea; //Restrict spawn area
doodle[] Characters; //Array of characters
ArrayList<connections> Relationships = new ArrayList<connections>(); //Array of connections
connector controller;
boolean firstClickHappened = false;
int selected;
int invalidValue = -1;

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
    println(i);
    println(Characters[i].maxConnections);
  }
  while (!allMaxConnections()) {
    connections con = controller.relate(Characters);
    if (con == null) {break;}
    Relationships.add(con);
  }
  selected = 0;
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
  rectMode(CORNER);
  fill(204);
  rect(0, 0, width, height);
  rectMode(CENTER);
  playArea.display();
  for (int i = 0; i < Characters.length; i++) {
   Characters[i].display();
  }
  for (int i= 0; i < Relationships.size(); i++) {
    Relationships.get(i).drawLine();
  }
  println(selected);
}

int selector() {
  for (int i = 0; i < Characters.length; i++) {
    if (Characters[i].mouseOver()) {
      return i;
    }
  }
  return invalidValue;
}

void mousePressed() {
  if (selector() != -1) {
    firstClickHappened = true;
    selected = selector();
    Characters[selected].mouseOffX = mouseX - Characters[selected].posX;
    Characters[selected].mouseOffY = mouseY - Characters[selected].posY;
  }
}

boolean hasSelected() {
  return selected != invalidValue;  
}

void mouseDragged() {
  if (hasSelected()) {
    Characters[selected].drag(); //ISSUE: Stops moving when mouse leaves dimensions
  }
}

void keyPressed() {
  for (int i = 0; i < Relationships.size(); i++) {
    Relationships.get(i).interact();
  }
}