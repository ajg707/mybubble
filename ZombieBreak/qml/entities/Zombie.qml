import Felgo 3.0
import QtQuick 2.0

EntityBase {
  id: entity
  entityType: "zombie"
  // the dimensions of this entity result in the dimensions of the zombie image,
  // we define those public, because we will need it for calculations
  property alias zombieWidth : sprite.width
  property alias zombieHeight : sprite.height

  // for collision detection of the zombies
  BoxCollider {
    id: boxCollider
    width: sprite.width
    height: sprite.height
    // zombies should be static
    bodyType: Body.Static
    // after collision (after the bullet fully bounced off) we destroy the zombie
    fixture.onEndContact: {
      gameScene.killedZombies++
      gameScene.breakSound.play()
      entity.removeEntity()
    }
  }

  //the image for the zombie
  Image {
    id: sprite
    source: "../../assets/img/zombie.png"
    anchors.centerIn: boxCollider
  }

}

