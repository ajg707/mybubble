import Felgo 3.0
import QtQuick 2.0

Scene {
  id: menuScene

  // listen to the start button from anywhere, we use this to change the state in the GameWindow
  signal startPressed

  // background image for the menu
  Image {source:"../assets/img/titleScreen.png"; anchors.fill:parent}

  // background music for the menu
  BackgroundMusic {id: backgroundMusic; source:"../assets/snd/ZombieBreakTheme.mp3"}

  // custom play button
  Image {
    anchors.centerIn: parent
    source: "../assets/img/playButton.png"
    MouseArea {
      // the mouse area fills the whole image
      anchors.fill: parent
      // when pressed we stop the music and call the signal startPressed
      onPressed: {
        backgroundMusic.stop()
        startPressed()
      }
    }
  }
   SimpleButton {
      id: infogo
      anchors.bottomMargin: parent;
      text: "INFO"
      visible: true
      onClicked: {
      infogo.visible = false
      // in multiple levels, increase the level number by 1 here and dont make it hard-coded
      loader.source = ""
      menuScene.activeLevel = "titleScreenInfo"
           // this is needed, because the loader.source binding might got cleared when "Restart City" was clicked
      loader.source = menuScene.activeLevelString + ".qml"
        }
      }
  }


