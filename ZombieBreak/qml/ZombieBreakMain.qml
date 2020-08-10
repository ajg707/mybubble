import Felgo 3.0
import QtQuick 2.0

GameWindow {
  id: gameWindow

  // You get free licenseKeys from https://felgo.com/licenseKey
  // With a licenseKey you can:
  //  * Publish your games & apps for the app stores
  //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
  //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
  //licenseKey: "<generate one from https://felgo.com/licenseKey>"

  MenuScene {
    id:menuScene
    // we define all scenes as invisible by default
    opacity:0
    // if the start button in the MenuScene is pressed we set the state to game
    // this will hide the menuScene and make the gameScene visible
    onStartPressed: gameWindow.state = "game"
  }


  GameScene {id:gameScene; opacity: 0}

  // default state is "menu"
  state: "menu"

  //state machine, used to set only one scene visible at a time
  states: [
    State {
      name: "menu"
      // by switching the opacity property to 1, which is by default set to 0 above,
      // the Behavior defined in SceneBase takes care of animating the opacity of the new Scene from 0 to 1,
      // and any other Scene back to its default value (in our case from 1 to 0)
      PropertyChanges { target: menuScene; opacity: 1}
    },
    State {
      name: "game"
      PropertyChanges { target: gameScene; opacity: 1}
    }
  ]
}

