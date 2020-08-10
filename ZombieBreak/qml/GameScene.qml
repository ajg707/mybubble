import Felgo 3.0
import QtQuick 2.0

import "entities"

Scene {
  id: gameScene

  // the currently loaded level
  property variant activeLevel
  // the name of the currently loaded level
  property string activeLevelString : "Level1"
  // the sound of dying zombies, public available for the zombies
  property alias breakSound: breakSound
  // the number of zombies killed
  property int killedZombies: 0

  // state of the current game(level), ready/running/finished/failed
  state: "ready"

  // for our entities
  EntityManager {id:entityManager; entityContainer: gameScene}

  // use a high update rate for physic driven games
  PhysicsWorld {updatesPerSecondForPhysics:60}

  // background image is defined by the loaded level
  Image {source:activeLevel.background; anchors.fill:parent}

  // sound for breaking zombies
  SoundEffect {id:breakSound; source:"../assets/snd/ow.wav"}

  // left wall
  Wall {height:parent.height; anchors.right:parent.left}
  // right wall
  Wall {height:parent.height; anchors.left:parent.right}
  // ceiling
  Wall {width:parent.width; anchors.bottom:parent.top}
  // floor, if bullet hits it, the player failed the level
  Wall {
    width: gameScene.width
    anchors.top: parent.bottom
    collision.onBeginContact: {
      levelFailed()
    }
  }

  HUD {
    id: hud
    width: gameScene.width
    height: 30
    cityText: "World: " + activeLevel.city
    killedText: "Covid killed: " + gameScene.killedZombies
  }

  Paddle {
    id: paddle
    width: 90
    height: 30
    x: parent.width/2 - width/2
    y: parent.height - height

    // drag the paddle left and right when touched
    MouseArea {
      id: paddleTouchArea
      // a bigger touch area should be used so the fingers of the user do not block the view
      width: paddle.width*2
      height: paddle.height*2
      anchors.centerIn: paddle
      // the drag should target the paddle
      drag.target: paddle
      // the paddle should move only into X direction
      drag.axis: Drag.XAxis
      // limit the minimum and maximum of the drag area, because the paddle should not move into the wall
      drag.minimumX: 0
      drag.maximumX: gameScene.width-paddle.width
      // the paddle is only enabled if the game is ready or running
      enabled: gameScene.state === "ready" || gameScene.state === "running"
      // additionally, if the game is ready to be started, we start it when the paddle is touched
      onPressed: {
        if(gameScene.state === "ready")
          startGame()
      }
    }
  }

  // the bullet, placed right above the paddle
  Bullet {
    id: bullet
    x: paddle.x + paddle.width/2
    y: paddle.y - 5
  }
  // button to restart the current level if player fails


  // load levels at runtime
  Loader {
    id: loader
    // this binding gets cleared when restart city is pressed
    source: activeLevelString + ".qml"
    onLoaded: {
      activeLevel = item
      item.width = gameScene.width
      item.height = gameScene.height/2
      gameScene.killedZombies = 0
      gameScene.state = "ready"
    }
  }

  // if a zombie is killed, check if all are dead
  onKilledZombiesChanged: {
    if(gameScene.killedZombies === activeLevel.maxZombies)
      levelFinished()
  }

  // button to get to Level2 after finishing Level1
  SimpleButton {
    id: nextCity
    anchors.centerIn: parent;
    text: "Next World"
    visible: false
    onClicked: {
      nextCity.visible = false
      // in multiple levels, increase the level number by 1 here and dont make it hard-coded
      gameScene.activeLevelString = "Level2"
      // this is needed, because the loader.source binding might got cleared when "Restart City" was clicked
      loader.source = gameScene.activeLevelString + ".qml"
    }
  }

  // button to get to Level2 after finishing Level1
  SimpleButton {
    id: nextCity1
    anchors.centerIn: parent;
    text: "Next World"
    visible: false
    onClicked: {
      nextCity1.visible = false
      // in multiple levels, increase the level number by 1 here and dont make it hard-coded
      gameScene.activeLevelString = "Level3"
      // this is needed, because the loader.source binding might got cleared when "Restart City" was clicked
      loader.source = ""
      loader.source = gameScene.activeLevelString + ".qml"
    }
  }
  // button to get to Level2 after finishing Level1

  SimpleButton {
    id: nextCity2
    anchors.centerIn: parent;
    text: "Next World"
    visible: false
    onClicked: {
      nextCity2.visible = false
      // in multiple levels, increase the level number by 1 here and dont make it hard-coded
      gameScene.activeLevelString = "Level4"
      // this is needed, because the loader.source binding might got cleared when "Restart City" was clicked
      loader.source = ""
      loader.source = gameScene.activeLevelString + ".qml"
    }
  }
  // button to restart the current level if player fails
  SimpleButton {
    id: restartCity
    anchors.centerIn: parent;
    text: "Restart?"
    visible: false
    onClicked: {
      restartCity.visible = false
      // forcing the Loader to reaload the current level
      // NOTE: this clears the loader.source binding
      loader.source = ""
      loader.source = gameScene.activeLevelString + ".qml"
    }
  }

  // text displayed when Level2 is finished
  Text {
    id: survived
    color: "white"
    text: "You Survived CovidWorld 2020!"
    anchors.centerIn: parent;
    visible: false
  }

  // launch bullet
  function startGame() {
    bullet.reStart(width/2,height - 50)
    state = "running"
  }

  // reset bullet and display dialog
  function levelFinished() {
    bullet.reset(width/2,height - 50)
    state = "finished"
    if(activeLevelString === "Level1")
      nextCity.visible = true
    else
      if(activeLevelString === "Level2")
          nextCity1.visible = true
      else
          if(activeLevelString === "Level3")
            nextCity2.visible = true
           else
            survived.visible = true
  }

  // reset bullet and display dialog
  function levelFailed() {
    bullet.reset(width/2,height - 50)
    state = "failed"
    restartCity.visible = true
  }
}
