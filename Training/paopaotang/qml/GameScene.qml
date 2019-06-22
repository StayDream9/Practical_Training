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
    property alias gameScene: gameScene
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

//    Player{
//        id:player
//        x:20
//        y:100
//    }

    property var boompoint;

    Rectangle{
        color: "red"
        width:50
        height:50
        anchors.left: parent.right
        anchors.bottom: parent.bottom
        opacity: 0.4

        MouseArea{
            anchors.fill: parent
            onClicked: {
                //炸弹爆炸
                var newEntityProperties = {
////                                 x: (activeLevel.player.x%20>=10)?(activeLevel.player.x/20+1)*20:(activeLevel.player.x/20)*20,
////                                 y: (activeLevel.player.y%20>=10)?(activeLevel.player.y/20+1)*20:(activeLevel.player.y/20)*20
                     x: activeLevel.player.x,
                     y: activeLevel.player.y
                }
                boompoint=newEntityProperties
                entityManager.createEntityFromUrlWithProperties(
                            Qt.resolvedUrl("entities/Boom.qml"),newEntityProperties);
                shotT.start()

                event.accepted = true;
            }
        }

    }

    //向右
    Rectangle {
//        anchors.left: controlcenter.right
        x: -30
        y: 260
        width: 30
        height: 30
        color: "orange"

        MouseArea{
            anchors.fill: parent
            onPressed: {
                controller.xAxis = 1
                activeLevel.player.right_change()
                    }
            onReleased: controller.xAxis = 0
        }
    }

    //向左
    Rectangle{
//        anchors.right: controlcenter.left
//        anchors.centerIn: parent.right
        x: -90
        y: 260
        width: 30
        height: 30
        color: "pink"

        MouseArea{
            anchors.fill: parent
            onPressed: {
                controller.xAxis = -1
                activeLevel.player.left_change()
                    }
            onReleased: controller.xAxis = 0
        }
    }

    //向下
    Rectangle{
//        anchors.top: controlcenter.bottom
//        anchors.centerIn: parent.top
        x: -60
        y: 290
        height: 30
        width: 30
        color: "green"

        MouseArea{
            anchors.fill: parent
            onPressed: {
                controller.yAxis = -1
                activeLevel.player.down_change()
                    }
            onReleased: controller.yAxis = 0
        }
    }

    //向上
    Rectangle{
//        anchors.bottom: controlcenter.top
//        anchors.centerIn: parent.bottom
        x: -60
        y: 230
        height: 30
        width: 30
        color: "blue"

        MouseArea{
            anchors.fill: parent
            onPressed: {
                controller.yAxis = 1
                activeLevel.player.top_change()
                    }
            onReleased: controller.yAxis = 0
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




    Keys.onPressed: {
              if (event.key === Qt.Key_Space) {
                  //炸弹爆炸
                  var newEntityProperties = {
////                                 x: (activeLevel.player.x%20>=10)?(activeLevel.player.x/20+1)*20:(activeLevel.player.x/20)*20,
////                                 y: (activeLevel.player.y%20>=10)?(activeLevel.player.y/20+1)*20:(activeLevel.player.y/20)*20
                       x: activeLevel.player.x,
                       y: activeLevel.player.y
                  }
                  boompoint=newEntityProperties
                  entityManager.createEntityFromUrlWithProperties(
                              Qt.resolvedUrl("entities/Boom.qml"),newEntityProperties);
                  shotT.start()

                  event.accepted = true;
              }
          }

    Timer{
        id:stopshotT
        interval: 1000
        repeat: false

        onTriggered: {
            keepfireT.stop()
        }
    }

    Timer{
        id:keepfireT
        interval: 120
        repeat: true

        onTriggered: {
            fire()
        }
    }

    Timer{
        id:shotT
        interval: 2000
        repeat: false

        onTriggered: {
            fire()
            keepfireT.start()
            stopshotT.start()
        }
    }

    function fire(){
       //火焰向右
            console.debug(boompoint.x,boompoint.y)
        var destination = Qt.point(boompoint.x+44, boompoint.y+2)
        var initpoint = Qt.point(boompoint.x+4, boompoint.y+2)
        var realMoveDuration = 500
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire.qml"), {"initpoint": initpoint,"destination": destination, "moveDuration": realMoveDuration})
        //火焰向左
        var destination1 = Qt.point(boompoint.x-44, boompoint.y+2)
        var initpoint1 = Qt.point(boompoint.x+4, boompoint.y+2)
        var realMoveDuration1 = 500
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire1.qml"), {"initpoint": initpoint1,"destination": destination1, "moveDuration": realMoveDuration1})
        //火焰向上
        var destination2 = Qt.point(boompoint.x+2, boompoint.y-44)
        var initpoint2 = Qt.point(boompoint.x+2, boompoint.y+4)
        var realMoveDuration2 = 500
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire2.qml"), {"initpoint": initpoint2,"destination": destination2, "moveDuration": realMoveDuration2})
        //火焰向下
        var destination3 = Qt.point(boompoint.x+2, boompoint.y+44)
        var initpoint3 = Qt.point(boompoint.x+2, boompoint.y+4)
        var realMoveDuration3 = 500
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire3.qml"), {"initpoint": initpoint3,"destination": destination3, "moveDuration": realMoveDuration3})
    }

}

