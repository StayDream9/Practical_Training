import QtQuick 2.0
import Felgo 3.0
import "../common"
import"../"

EntityBase {
    id: wallEntity
    property alias boom: boom
    property alias fire: fire
    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

    x: row * gameScene.gridSize
    y: wall.height - (column+1)*gameScene.gridSize
    width: gameScene.gridSize * size
    height: gameScene.gridSize

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


