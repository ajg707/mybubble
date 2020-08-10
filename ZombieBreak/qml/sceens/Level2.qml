import Felgo 3.0
import QtQuick 2.0

import "entities"

Item {
  id: level2

  // number of total zombies
  property int maxZombies : 12
  // path to background image for this level
  property string background: "../assets/img/nyc.png"
  // name of the city will be displayed in the HUD
  property string city: "MaskWorld"

  // add some zombies
  Zombie {x:zombieWidth*1; y:zombieHeight*1;}
  Zombie {x:zombieWidth*2; y:zombieHeight*1;}
  Zombie {x:zombieWidth*1; y:zombieHeight*2;}
  Zombie {x:zombieWidth*2; y:zombieHeight*2;}
  Zombie {x:zombieWidth*7; y:zombieHeight*1;}
  Zombie {x:zombieWidth*8; y:zombieHeight*1;}
  Zombie {x:zombieWidth*7; y:zombieHeight*2;}
  Zombie {x:zombieWidth*8; y:zombieHeight*2;}
  Zombie {x:zombieWidth*3; y:zombieHeight*1;}
  Zombie {x:zombieWidth*8; y:zombieHeight*1;}
  Zombie {x:zombieWidth*6; y:zombieHeight*2;}
  Zombie {x:zombieWidth*4; y:zombieHeight*1;}
}
