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

    Map_set{

    }
    Wall {height:parent.height; anchors.right:parent.left}
    // right wall
    Wall {height:parent.height; anchors.left:parent.right}
    // ceiling
    Wall {width:parent.width; anchors.bottom:parent.top}
    // floor, if bullet hits it, the player failed the level
    Wall {
      width: gameScene.width
      anchors.top: parent.bottom
    }


    Player{
        id:player
        x: 20
        y:100
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
          player.top_change()
        }
          if(actionName == "left"){
            player.left_change()
          }
          if(actionName == "right"){
              player.right_change()
          }
          if(actionName == "down"){
              player.down_change()
          }
      }
    }

    //放炸弹
    Component{
        id:boomEntityComponent
        EntityBase{
            entityType: "boom"

            Image{
                id:boomImage
                width: 20
                height: 20
                source: "../../assets/wall/tree.png"
            }
            BoxCollider{
                width: 20
                height: 20
                bodyType: Body.Static
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
                                 x: player.x,
                                 y: player.y,
                             }
                             entityManager.createEntityFromComponentWithProperties(
                                         boomEntityComponent,
                                         newEntityProperties);
                         }
        }
    }
}

