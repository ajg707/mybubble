import Felgo 3.0
import QtQuick 2.0

import "entities"
Item {
  id: titleScreenInfo

  // background image for the menu
  Image {source:"../assets/img/info1.png"; anchors.fill:parent}

  // background music for the menu
  BackgroundMusic {id: backgroundMusic; source:"../assets/snd/ZombieBreakTheme.mp3"}


SimpleButton {
    id: titleScreenback
    text: "Back"

  }
}
