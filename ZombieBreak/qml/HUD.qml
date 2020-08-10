import Felgo 3.0
import QtQuick 2.0

Item {
  // our GameScene will set the texts, so we make them public accessible
  property alias killedText : killed.text
  property alias cityText : city.text

  // display number of killed zombies
  Text {
    id: killed
    color: "white"
  }

  // display city name
  Text {
    id: city
    color: "white"
    anchors.right: parent.right
  }
}
