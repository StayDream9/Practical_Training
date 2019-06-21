import QtQuick 2.0
import Felgo 3.0
import "../entities"
//import "../common"

Item{
    id: levelBaseScene

    property alias boom: boom
    property alias fire: fire
    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

//    x: row * gameScene.gridSize
//    y: scene.height - (column+1)*gameScene.gridSize
//    width: gameScene.gridSize * size
//    height: gameScene.gridSize

    MenuButton {
        text: "back"
        label.height: 45
        label.width: 45
//        label.source: "../../assets/img/Back.png"
        color: "transparent"
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
    }

    Box{

    }

    Fire{
        id:fire

    }

    Boom{
        id: boom
    }

    Obstacle1{

    }

    Obstacle2{

    }
    Obstacle3{

    }

    Player{
        id:player1
    }

    Wall{

    }

}
