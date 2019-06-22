import QtQuick 2.0
import Felgo 3.0

//草障碍物
EntityBase{
    id:obstacle3
    entityType: "obstacle3"

    MultiResolutionImage{
        id: grassimg
        height: 20
        width: 20
        source: "../../assets/wall/grass.png"
    }
    CircleCollider{
        radius: grassimg.width/2
        anchors.centerIn: parent
        bodyType: Body.Static

//        categories: Box.Category10
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
