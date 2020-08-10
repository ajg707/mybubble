import Felgo 3.0
import QtQuick 2.0

EntityBase {
  id: entity
  entityType: "paddle"

  // for collision detection of the paddle, we are using a PolygonCollider to generate skewed edges, so the bullet is reflected differently on the outer parts of the paddle. This is a very important gameplay improvement
  PolygonCollider {
    id: boxCollider
    // the paddle should be static
    bodyType: Body.Static
    vertices: [
      Qt.point(0,5),
      Qt.point(20,0),
      Qt.point(68,0),
      Qt.point(88,5),
      Qt.point(88,34),
      Qt.point(0,34)
    ]
  }

  //the image for the paddle
  Image {
    id: sprite
    source: "../../assets/img/player.png"
    anchors.centerIn: boxCollider
  }
}
