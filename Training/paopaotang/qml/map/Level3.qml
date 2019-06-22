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

    Player{
        id:player
        x:20
        y:100
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
