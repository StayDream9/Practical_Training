import Felgo 3.0
import QtQuick 2.0
import "entities"
import "map"
import "common"

Scene {
    id: gameScene
    width: 480
    height: 320
    gridSize: 20

    // the filename of the current level gets stored here, it is used for loading the
    property string activeLevelFileName
    // the currently loaded level gets stored here
    property variant activeLevel
    property int countdown: 0
    // flag indicating if game is running
    property bool gameRunning: countdown == 0

    //设置当前关卡的名字
    function setLevel(fileName) {
        activeLevelFileName = fileName
    }

    //加载关卡
    // load levels at runtime
    Loader {
        id: loader
        source: activeLevelFileName != "" ? "map/" + activeLevelFileName : ""
        onLoaded: {
            // since we did not define a width and height in the level item itself, we are doing it here
            item.width = gameScene.width
            item.height = gameScene.height
            // store the loaded level as activeLevel for easier access
            activeLevel = item
            // restarts the countdown
            countdown = 3
        }
    }

    EntityManager {
      id: entityManager
      entityContainer: gameScene
    }

    Item {
        id: viewPort
        anchors.top: gameScene.gameWindowAnchorItem.top

        PhysicsWorld{
            id:physicsWorld
            gravity:Qt.point(0,0)
            debugDrawVisible: true // enable this for physics debugging
            z: 1000
        }
    }

    Rectangle {
//      // you should hide those input controls on desktops, not only because they are really ugly in this demo, but because you can move the player with the arrow keys there
//      //visible: !system.desktopPlatform
//      //enabled: visible
      anchors.left: parent.left
      anchors.bottom: parent.bottom
      height: 50
      width: 150
      color: "blue"
      opacity: 0.4

      Rectangle {
        anchors.centerIn: parent
        width: 1
        height: parent.height
        color: "white"
      }
    }

    //转方向时切换图片
    Keys.forwardTo: controller
    TwoAxisController {
      id: controller
      onInputActionPressed: {
        console.debug("key pressed actionName " + actionName)
        if(actionName == "up") {
          activeLevel.player.top_change()
        }
          if(actionName == "left"){
            activeLevel.player.left_change()
          }
          if(actionName == "right"){
              activeLevel.player.right_change()
          }
          if(actionName == "down"){
              activeLevel.player.down_change()
          }
      }
    }

    Rectangle{
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 50
        width: 50
        color: "red"
        opacity: 0.4

        Text {
          anchors.centerIn: parent
          text: "boom"
          color: "white"
          font.pixelSize: 9
        }
        MouseArea {
            anchors.fill: parent
                         onClicked: {
                             // if you click the scene, a new entity is created
                             var newEntityProperties = {
//                                 x: activeLevel.player.x + 10,
//                                 y: activeLevel.player.y + 10,
                                  x: activeLevel.player.x,
                                  y: activeLevel.player.y,
                             }
                             entityManager.createEntityFromComponentWithProperties(

                                         activeLevel.boom,newEntityProperties);
                         }
        }
    }
}

