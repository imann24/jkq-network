class connector {
  
  connector() {
  }
  
  connections relate(doodle[] Characters) { // Variable named the same for convenience ONLY
    doodle[] Connecteds = new doodle[2];
    for (int i = 0; i < Characters.length ; i++) {
      if (Connecteds[0] == null) {
        if (Characters[i].numConnections < Characters[i].maxConnections) { //Check connections limi
          Connecteds[0] = Characters[i];
          Characters[i].numConnections++;
        }
      } else if (Connecteds[1] == null) {
        if (Characters[i].numConnections < Characters[i].maxConnections) {
          if (Characters[i] != Connecteds[0]) { //Don't pick initial connections
              Connecteds[1] = Characters[i];
              Characters[i].numConnections++;
          }
        }
      } else {
       break; 
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
    return new connections(Connecteds[0], Connecteds[1]);
  }
}