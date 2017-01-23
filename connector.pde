class connector {
  doodle[] Connecteds = new doodle[2];
  
  connector() {
  }
  
  connections relate(doodle[] Characters) { // Variable named the same for convenience ONLY
    for (int i = 0; i < Characters.length ; i++) {
      if (Connecteds[0] == null) {
        if (Characters[i].numConnections < Characters[i].maxConnections) { //Check connections limi
        }
      } else if (Connecteds[1] == null) {
        if (Characters[i].numConnections < Characters[i].maxConnections) {
          if (Characters[i] != Connecteds[0]) { //Don't pick initial connections
              Connecteds[1] = Characters[i];
              Characters[i].numConnections++;
          }
        }
      }
    }
    if (Connecteds[1] == null) { //Prevent loners
      for (int i = 0; i < Characters.length; i++) {
        if (Characters[i] != Connecteds[0]) {
            Connecteds[1] = Characters[i];
            Characters[i].numConnections++;
        }
      }
    }
    if (Connecteds[0]==null || Connecteds[1]==null) {
      return null;
    }
    append(Connecteds[0].Connections, Connecteds[1]);
    append(Connecteds[1].Connections, Connecteds[0]);
    line(Connecteds[0].posX, Connecteds[0].posY, Connecteds[1].posX, Connecteds[1].posY);
    return new connections(Connecteds[0], Connecteds[1]);
  }
}