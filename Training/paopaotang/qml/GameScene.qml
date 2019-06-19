import Felgo 3.0
import QtQuick 2.0
import "entities"
import "map"

Scene {
    id: gameScene
    width: 480
    height: 320
    gridSize: 20

    MultiResolutionImage {
        width: 480
        height: 320
      source: "../assets/land/24.16.png"
      anchors.centerIn: gameScene.gameWindowAnchorItem
    }

    EntityManager {
      id: entityManager
      entityContainer: gameScene
    }

//    Rectangle {
//      anchors.fill: gameScene.gameWindowAnchorItem
//      color: "black"
//    }

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

    Level1{
        id:map
    }



    Rectangle {
      // you should hide those input controls on desktops, not only because they are really ugly in this demo, but because you can move the player with the arrow keys there
      //visible: !system.desktopPlatform
      //enabled: visible
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
      //行走控制
      MultiPointTouchArea {
        anchors.fill: parent
        onPressed: {
          if(touchPoints[0].x < width/2)
            controller.xAxis = -1
          else
            controller.xAxis = 1
        }
        onUpdated: {
          if(touchPoints[0].x < width/2)
            controller.xAxis = -1
          else
            controller.xAxis = 1
        }
        onReleased: controller.xAxis = 0
      }
    }

    //转方向时切换图片
    Keys.forwardTo: controller
    TwoAxisController {
      id: controller
      onInputActionPressed: {
        console.debug("key pressed actionName " + actionName)
        if(actionName == "up") {
          map.player.top_change()
        }
          if(actionName == "left"){
            map.player.left_change()
          }
          if(actionName == "right"){
              map.player.right_change()
          }
          if(actionName == "down"){
              map.player.down_change()
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
                                 x: map.player.x,
                                 y: map.player.y,
                             }
                             entityManager.createEntityFromComponentWithProperties(

                                         map.boom,newEntityProperties);
                         }
        }
    }
}

