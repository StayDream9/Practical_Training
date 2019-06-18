import Felgo 3.0
import QtQuick 2.0
import "entities"
import "map"

Scene {
    id: gameScene
    width: 480
    height: 320
    gridSize: 20

    EntityManager {
      id: entityManager
    }

    Rectangle {
      anchors.fill: gameScene.gameWindowAnchorItem
      color: "black"
    }

    Item {
        id: viewPort
        anchors.top: gameScene.gameWindowAnchorItem.top

        PhysicsWorld{
            id:physicsWorld
            gravity:Qt.point(0,0)
            debugDrawVisible: true // enable this for physics debugging
            z: 1000

//            onPreSolve: {
//              //this is called before the Box2DWorld handles contact events
//              var entityA = contact.fixtureA.getBody().target
//              var entityB = contact.fixtureB.getBody().target
//              if(entityB.entityType === "platform" && entityA.entityType === "player" &&
//                  entityA.y + entityA.height > entityB.y) {
//                //by setting enabled to false, they can be filtered out completely
//                //-> disable cloud platform collisions when the player is below the platform
//                contact.enabled = false
//              }
//            }
        }
    }

    Map_set{

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
      anchors.right: parent.right
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
}
