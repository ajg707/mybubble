import Felgo 3.0
import QtQuick 2.0

EntityBase {
  entityType: "wall"
  // default width and height
  width: 1
  height: 1

  // make this public so we can check from anywhere if there is a collision,
  // will be needed to check if the bullet hits the floor
  property alias collision: collider.fixture

  // walls should be invisible so we only need to put a collider here for collision detection
  BoxCollider {
    id: collider
    anchors.fill: parent
    // walls should be static
    bodyType: Body.Static
  }
}
