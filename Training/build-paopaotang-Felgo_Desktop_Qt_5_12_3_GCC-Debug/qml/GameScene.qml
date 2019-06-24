import Felgo 3.0
import QtQuick 2.0
import "entities"
import "map"
import "common"
//import ""

Scene {
    id: gameScene
    width: 480
    height: 320
    gridSize: 20

    property bool gameover: false
    property bool gamewin: false
    property int cakenum: 5
    property int highscore: 0
    property int mintime: 0
    property int score: 0
    property int time: 0

    property alias rightRect: rightRect
    property alias leftRect: leftRect
    property alias buttomRect: buttomRect
    property alias topRect: topRect
    property alias shootRect: shootRect
    property alias centerRect: centerRect
    property alias gameScene: gameScene
//    property alias loader: loader
    // the filename of the current level gets stored here, it is used for loading the
    property string activeLevelFileName
    // the currently loaded level gets stored here
    property variant activeLevel

//    property int countdown: 0
    // flag indicating if game is running
//    property bool gameRunning: countdown == 0

    //设置当前关卡的名字
    function setLevel(fileName) {
        activeLevelFileName = fileName
    }

    //重置当前关卡
    function resetLevel1(){
        activeLevelFileName = ""
        gameover = false
        gamewin = false
        cakenum = 5
        highscore = 0
        mintime = 0
        entityManager.removeAllEntities()
//        var toRemoveEntityTypes1 = ["boom", "fire", "fire1", "fire2", "fire3", "cake"]
//        entityManager.removeEntitiesByFilter(toRemoveEntityTypes1)
    }


    //加载关卡
    // load levels at runtime
    Loader {
        id: loader
        source: activeLevelFileName != "" ? "map/" + activeLevelFileName : ""
        onLoaded: {
            // since we did not define a width and height in the level item itself, we are doing it here
            gameover = false
            gamewin = false
            cakenum = 5
            highscore = 0
            mintime = 0
            item.width = gameScene.width
            item.height = gameScene.height
            // store the loaded level as activeLevel for easier access
            activeLevel = item
            // restarts the countdown
//            countdown = 3
        }
    }


    Item {
        id: viewPort
        anchors.top: gameScene.gameWindowAnchorItem.top

        PhysicsWorld{
            id:physicsWorld
            gravity:Qt.point(0,0)
//            debugDrawVisible: true // enable this for physics debugging
            z: 1000
        }
    }

    Timer{
        id: checkpropT
        interval: 100
        repeat: true
        running: true

        onTriggered: {
            checkdie()
            checkprop()
        }
    }


    function checkdie(){
        if(gameover == true){
//            data1.score = highscore
//            data1.time = mintime
//            data1.saveData()
            var toRemoveEntityTypes = ["box", "monster", "cake", "flower"]
            entityManager.removeEntitiesByFilter(toRemoveEntityTypes)
        }
    }
    function checkprop(){
            if(cakenum == 0){
                checkpropT.stop()

                gamewin = true //游戏胜利，显示胜利界面
                var toRemoveEntityTypes = ["box", "monster"]
                entityManager.removeEntitiesByFilter(toRemoveEntityTypes)
                gameWindow.state = "gamewin"
            }
    }
//    Timer{
//        interval: 100
//        running: true
//        repeat: true
//        onTriggered: gameWindow.data1.score=highscore,gameWindow.data1.time=mintime,console.log(highscore,mintime),gameWindow.data1.saveData()
//    }


    property var boompoint;

//-------------------------


//-------------------------

//控制
//-------------------------
    //射击
    Rectangle{
        id: shootRect
        radius: 45
        width:90
        height:90
        anchors.left: parent.right
        anchors.bottom: parent.bottom
        opacity: 0

        Image {
            id: shootimg
            source: "../assets/control/shot.png"

            anchors.fill: parent
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                //炸弹爆炸
                var newEntityProperties = {
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
        id: rightRect
        x: -30
        y: 260
        width: 30
        height: 30
        opacity: 0

        Image {
            id: rightimg
            source: "../assets/control/controlright.png"

            anchors.fill: parent
        }

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
        id: leftRect
        x: -90
        y: 260
        width: 30
        height: 30
        opacity: 0

        Image {
            id: leftimg
            source: "../assets/control/controlleft.png"

            anchors.fill: parent
        }

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
        id: buttomRect
        x: -60
        y: 290
        height: 30
        width: 30
        opacity: 0

        Image {
            id: topimg
            source: "../assets/control/controlbuttom.png"

            anchors.fill: parent
        }

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
        id:topRect
        x: -60
        y: 230
        height: 30
        width: 30
        opacity: 0
        Image {
            id: bottomimg
            source: "../assets/control/controltop.png"

            anchors.fill: parent
        }

        MouseArea{
            anchors.fill: parent
            onPressed: {
                controller.yAxis = 1
                activeLevel.player.top_change()
                    }
            onReleased: controller.yAxis = 0
        }
    }

    Rectangle{
        id: centerRect
        x: -60
        y: 260
        height: 30
        width: 30
        opacity: 0
        Image {
            id: centerimg
            source: "../assets/control/controlcenter.png"

            anchors.fill: parent
        }

        MouseArea{
            anchors.fill: parent
            onPressed: {
                controller.yAxis = 1
                activeLevel.player.top_change()
                    }
            onReleased: controller.yAxis = 0
        }
    }
//------------------------------------

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
        var destination = Qt.point(boompoint.x+34, boompoint.y+2)
        var initpoint = Qt.point(boompoint.x+4, boompoint.y+2)
        var realMoveDuration = 500
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire.qml"), {"initpoint": initpoint,"destination": destination, "moveDuration": realMoveDuration})
        //火焰向左
        var destination1 = Qt.point(boompoint.x-34, boompoint.y+2)
        var initpoint1 = Qt.point(boompoint.x+4, boompoint.y+2)
        var realMoveDuration1 = 500
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire1.qml"), {"initpoint": initpoint1,"destination": destination1, "moveDuration": realMoveDuration1})
        //火焰向上
        var destination2 = Qt.point(boompoint.x+2, boompoint.y-34)
        var initpoint2 = Qt.point(boompoint.x+2, boompoint.y+4)
        var realMoveDuration2 = 500
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire2.qml"), {"initpoint": initpoint2,"destination": destination2, "moveDuration": realMoveDuration2})
        //火焰向下
        var destination3 = Qt.point(boompoint.x+2, boompoint.y+34)
        var initpoint3 = Qt.point(boompoint.x+2, boompoint.y+4)
        var realMoveDuration3 = 500
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire3.qml"), {"initpoint": initpoint3,"destination": destination3, "moveDuration": realMoveDuration3})
    }


}

