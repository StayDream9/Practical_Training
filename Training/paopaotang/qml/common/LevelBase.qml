import QtQuick 2.0
import Felgo 3.0
import "../entities"
import "../"

Item{
    id: levelBaseScene

//    property alias timetext: timetext.text
//    property alias scoretext: scoretext.text
    property alias player: player

//    signal gameover

    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

    Timer{
        id:dieimgstartT
        interval: 1
        repeat: false

        onTriggered: {
            playerdie.source = "../../assets/player/playerdie.json"
            dieimgdeleteT.start()
        }
    }
    Timer{
        id:dieimgdeleteT
        interval: 2000
        repeat: false

        onTriggered: {
            playerdie.source = ""
        }
    }

    TexturePackerAnimatedSprite{
        id: playerdie
        x:player.x
        y:player.y
        z:3
        width: 17
        height: 17
        running: true
        loops: 0
        source: ""
        frameNames: ["1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png", "9.png", "10.png"]
        interpolate: false
        frameRate: 5
    }

    property int currenttime: 0

    Timer{
        id:settimeT
        interval: 1000
        running: true
        repeat: true

        onTriggered: {
            currenttime++
            timetext.text = "time:\n  "+currenttime

//            gameWindow.data1.score = highscore
//            gameWindow.data1.time = currenttime
//            data1.saveData()
        }
    }

    Timer{
        id:setscoreT
        interval: 10
        repeat: false

        onTriggered: {
            scoretext.text = "score:\n   "+gameScene.highscore
            if(gameScene.gamewin === true){
                settimeT.stop()
                gameScene.mintime = currenttime
                gameWindow.data1.time = currenttime//保存时间到json中
                gameWindow.data1.score = gameScene.highscore
                gameWindow.data1.saveData()
            }
        }
    }


    Player{
        id:player
        x:20
        y:100
        z:1

        onDieimg1:{
            dieimgstartT.start()
        }
        onEatcake: {
            setscoreT.start()
        }
        onPlayerdie: {
            settimeT.stop()
            gameScene.mintime = currenttime
            gameWindow.data1.score = gameScene.highscore
            gameWindow.data1.time = gameScene.mintime

            gameWindow.data1.saveData()
            gameScene.gameover = true
            settimeT.running = false
            if(gameWindow.state === "gameover")
                return
            gameWindow.state = "gameover"
        }
    }
//    Timer{
//        interval: 1000
//        running: true;repeat: true
//        onTriggered: gameWindow.data1.saveData(),console.log(gameWindow.data1.score)
//    }

    Rectangle{
        id:showtime
        width: 65
        height: 70
        x:-70
        y: 50
        radius: 10

        color: "white"

        Text {
            id: timetext
            width: parent.width
            height: parent.height/4
            font.family: gameFont.name
            text: "time:\n  0"
            font.pixelSize: 16
        }
    }
    Rectangle{
        id:showscore
        width: 70
        height: 70
        x:500
        y: 50
        radius: 10

        color: "white"

        Text {
            id:scoretext
            width: parent.width
            height: parent.height/4
            font.family: gameFont.name
            text: "score:\n   0"
            font.pixelSize: 16
        }
    }

    MenuButton {
        x:-70
        text: "back"
        label.height: 40
        label.width: 40

        color: "white"
        z: 10
        anchors.right: gameWindowAnchorItem.right
        anchors.verticalCenter: gameWindowAnchorItem.verticalCenter
        onClicked: {
            resetLevel()
            gameScene.backButtonPressed()
        }
    }

    function resetLevel(){
        activeLevelFileName = ""
        entityManager.removeAllEntities()
//        var toRemoveEntityTypes1 = ["boom", "fire", "fire1", "fire2", "fire3", "cake"]
//        entityManager.removeEntitiesByFilter(toRemoveEntityTypes1)
    }

}
