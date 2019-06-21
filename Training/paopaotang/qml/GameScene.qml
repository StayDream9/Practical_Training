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

//    signal shooted()

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
      dynamicCreationEntityList: [
          Qt.resolvedUrl("entities/Boom.qml"),
          Qt.resolvedUrl("entities/Fire.qml"),
          Qt.resolvedUrl("entities/Fire1.qml"),
          Qt.resolvedUrl("entities/Fire2.qml"),
          Qt.resolvedUrl("entities/Fire3.qml")
      ]
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

//    Rectangle{

//    }

//    Rectangle {
////      // you should hide those input controls on desktops, not only because they are really ugly in this demo, but because you can move the player with the arrow keys there
////      //visible: !system.desktopPlatform
////      //enabled: visible
//      anchors.left: parent.left
//      anchors.bottom: parent.bottom
//      height: 50
//      width: 150
//      color: "blue"
//      opacity: 0.4

//      Rectangle {
//        anchors.centerIn: parent
//        width: 1
//        height: parent.height
//        color: "white"
//      }
//      MultiPointTouchArea {
//        anchors.fill: parent
//        onPressed: {
//          if(touchPoints[0].x < width/2)
//            controller.xAxis = -1
//          else
//            controller.xAxis = 1
//        }
//        onUpdated: {
//          if(touchPoints[0].x < width/2)
//            controller.xAxis = -1
//          else
//            controller.xAxis = 1
//        }
//        onReleased: controller.xAxis = 0
//      }
//    }

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

    Keys.onPressed: {
              if (event.key == Qt.Key_Space) {
                  //炸弹爆炸
                  var newEntityProperties = {
////                                 x: (activeLevel.player.x%20>=10)?(activeLevel.player.x/20+1)*20:(activeLevel.player.x/20)*20,
////                                 y: (activeLevel.player.y%20>=10)?(activeLevel.player.y/20+1)*20:(activeLevel.player.y/20)*20
                       x: activeLevel.player.x,
                       y: activeLevel.player.y
                  }
                  people=newEntityProperties
                  entityManager.createEntityFromUrlWithProperties(
                              Qt.resolvedUrl("entities/Boom.qml"),newEntityProperties);
                  shot.start()

                  event.accepted = true;
              }
          }
    property var people;
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
                     //炸弹爆炸
                     var newEntityProperties = {
                          x: activeLevel.player.x,
                          y: activeLevel.player.y
                     }
                     people=newEntityProperties
                     entityManager.createEntityFromUrlWithProperties(
                                 Qt.resolvedUrl("entities/Boom.qml"),newEntityProperties);
                     shot.start()

                    }
        }
    }
    Timer{
        id:shot
        interval: 3000
        repeat: false

        onTriggered: {
            fire()
        }
    }

    function fire(){
       //火焰向右
            console.log(people.x,people.y)
        var destination = Qt.point(people.x+45, people.y+3)
        var initpoint = Qt.point(people.x, people.y)
        var realMoveDuration = 1000
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire.qml"), {"initpoint": initpoint,"destination": destination, "moveDuration": realMoveDuration})
        //火焰向左
        var destination1 = Qt.point(people.x-45, people.y+3)
        var initpoint1 = Qt.point(people.x, people.y)
        var realMoveDuration1 = 1000
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire1.qml"), {"initpoint": initpoint1,"destination": destination1, "moveDuration": realMoveDuration1})
        //火焰向上
        var destination2 = Qt.point(people.x+3, people.y-45)
        var initpoint2 = Qt.point(people.x, people.y)
        var realMoveDuration2 = 1000
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire2.qml"), {"initpoint": initpoint2,"destination": destination2, "moveDuration": realMoveDuration2})
        //火焰向下
        var destination3 = Qt.point(people.x+3, people.y+45)
        var initpoint3 = Qt.point(people.x, people.y)
        var realMoveDuration3 = 1000
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire3.qml"), {"initpoint": initpoint3,"destination": destination3, "moveDuration": realMoveDuration3})
    }

}

