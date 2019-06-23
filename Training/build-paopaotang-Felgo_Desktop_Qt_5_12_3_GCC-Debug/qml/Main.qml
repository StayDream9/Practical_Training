import Felgo 3.0
import QtQuick 2.0
import "menu"

GameWindow {
    id: gameWindow
    screenWidth: 960
    screenHeight: 640

    // create and remove entities at runtime
    EntityManager {
      id: entityManager
      entityContainer: gameScene
      dynamicCreationEntityList: [
          Qt.resolvedUrl("entities/Boom.qml"),
          Qt.resolvedUrl("entities/Fire.qml"),
          Qt.resolvedUrl("entities/Fire1.qml"),
          Qt.resolvedUrl("entities/Fire2.qml"),
          Qt.resolvedUrl("entities/Fire3.qml")
      ]
    }
    FontLoader {
      id: gameFont
      source: "../assets/fonts/akaDylan Plain.ttf"
    }

    // menu scene
    MenuScene {
        id: menuScene
        // listen to the button signals of the scene and change the state according to it
        onSelectLevelPressed: {
            gameWindow.state = "selectLevel"
        }
        onCreditsPressed: gameWindow.state = "credits"
        // the menu scene is our start scene, so if back is pressed there we ask the user if he wants to quit the application
        onBackButtonPressed: {

            nativeUtils.displayMessageBox(qsTr("Really quit the game?"), "", 2);
        }

        // listen to the return value of the MessageBox
        Connections {
            target: nativeUtils
            onMessageBoxFinished: {
                // only quit, if the activeScene is menuScene - the messageBox might also get opened from other scenes in your code
                if(accepted && gameWindow.activeScene === menuScene)
                    Qt.quit()
            }
        }
    }

    // scene for selecting levels
    SelectLevelScene {
        id: selectLevelScene
        onLevelPressed: {
            // selectedLevel is the parameter of the levelPressed signal
            gameScene.topRect.opacity = 0.5
            gameScene.buttomRect.opacity = 0.5
            gameScene.leftRect.opacity = 0.5
            gameScene.rightRect.opacity = 0.5
            gameScene.shootRect.opacity = 0.5
            gameScene.centerRect.opacity = 0.5
            gameScene.setLevel(selectedLevel)
            gameWindow.state = "game"
        }
        onBackButtonPressed:{
//            var toRemoveEntityTypes1 = ["boom", "fire", "fire1", "fire2", "fire3"]
//            entityManager.removeEntitiesByFilter(toRemoveEntityTypes1)
//            entityManager.removeAllEntities()
            gameWindow.state = "menu"
        }
    }

    // credits scene
    CreditsScene {
        id: creditsScene
        onBackButtonPressed: gameWindow.state = "menu"
    }

    // game scene to play a level
    GameScene {
        id: gameScene
        onBackButtonPressed: {
            gameScene.topRect.opacity = 0
            gameScene.buttomRect.opacity = 0
            gameScene.leftRect.opacity = 0
            gameScene.rightRect.opacity = 0
            gameScene.shootRect.opacity = 0
            gameScene.centerRect.opacity = 0

            gameWindow.state = "selectLevel"
        }
    }

    // menuScene is our first scene, so set the state to menu initially
    state: "menu"
    activeScene: menuScene

    // state machine, takes care reversing the PropertyChanges when changing the state, like changing the opacity back to 0
    states: [
        State {
            name: "menu"
            PropertyChanges {target: menuScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: menuScene}
        },
        State {
            name: "selectLevel"
            PropertyChanges {target: selectLevelScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: selectLevelScene}
        },
        State {
            name: "credits"
            PropertyChanges {target: creditsScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: creditsScene}
        },
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: gameScene}
        }
    ]
}

