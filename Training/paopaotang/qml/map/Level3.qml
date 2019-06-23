import QtQuick 2.0
import Felgo 3.0
import "../entities"
import "../common" as Common

Common.LevelBase {
    id:scene
    height: gameScene.gridSize * 16 // 32 * 21 = 320
    width: 42 * gameScene.gridSize
    property alias player: player

    MultiResolutionImage {
        width: 480
        height: 320
      source: "../../assets/land/24.16.png"
      anchors.centerIn: gameScene.gameWindowAnchorItem
    }

    Timer{
        id:dieimgstart
        interval: 1
        repeat: false

        onTriggered: {
            playerdie.source = "../../assets/player/playerdie.json"
            dieimgdelete.start()
        }
    }
    Timer{
        id:dieimgdelete
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
        width: 17
        height: 17
        running: true
        loops: 0
        source: ""
        frameNames: ["1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png", "9.png", "10.png"]
        interpolate: false
        frameRate: 5
    }

    Player{
        id:player
        x:20
        y:100

        onDieimg1:{
            dieimgstart.start()
        }
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

}
