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
    int dimensions = int(random(20, 30));
    int dX = int(random(width/2 - playArea.dimensions/2 + dimensions/2, width/2 + playArea.dimensions/2 - dimensions/2));
    int dY = int(random(height/2-playArea.dimensions/2 + dimensions/2, height/2 + playArea.dimensions/2 - dimensions/2));
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

void mouseClicked() { //Need click variable for selection?
  if (selector() != -1) {
    firstClickHappened = true;
    selected = selector();
  }
}