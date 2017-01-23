playArea playArea; //Restrict spawn area
doodle[] Characters; //Array of characters
ArrayList<connections> Relationships = new ArrayList<connections>(); //Array of connections
connector controller;

void setup() {
  size(1024, 512);
  colorMode(RGB, 255, 255, 255);
  playArea = new playArea();
  playArea.display();
  Characters = new doodle[int(playArea.dimensions/51)];
  controller = new connector();
  for (int i = 0; i < Characters.length; i++) {
    int dimensions = int(random(20, 30));
    int dX = int(random(width/2 - playArea.dimensions/2 + dimensions/2, width/2 + playArea.dimensions/2 - dimensions/2));
    int dY = int(random(height/2-playArea.dimensions/2 + dimensions/2, height/2 + playArea.dimensions/2 - dimensions/2));
    Characters[i] = new doodle(dX, dY, dimensions);
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
  for (int i = 0; i < Characters.length; i++) {
   Characters[i].display();
  }
  stroke(0);
  for (int i= 0; i < Relationships.size(); i++) {
    line(Relationships.get(i).Char1.posX, Relationships.get(i).Char1.posY, Relationships.get(i).Char2.posX, Relationships.get(i).Char2.posY);
  }
}