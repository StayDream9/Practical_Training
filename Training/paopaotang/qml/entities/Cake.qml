import QtQuick 2.0
import Felgo 3.0

EntityBase{
    id:box
    entityType: "box"

    MultiResolutionImage{
        id:boximg
        height: 15
        width: 15
        source: "../../assets/wall/box.png"
    }
    CircleCollider{
        radius: boximg.width/2
        anchors.centerIn: parent
        bodyType: Body.Static

//        categories: Box.Category3
//        collidesWith: Box.Category1 | Box.Category4 | Box.Category5 | Box.Category6 | Box.Category7
    }
    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

    x: row * gameScene.gridSize
    y: scene.height - (column+1)*gameScene.gridSize
    width: gameScene.gridSize * size
    height: gameScene.gridSize
}
