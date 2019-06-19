import QtQuick 2.0
import Felgo 3.0

//树障碍物
EntityBase{
    id:obstacle1
    entityType: "obstacle1"

        MultiResolutionImage{
            height: 20
            width: 20
            source: "../../assets/wall/tree.png"
        }

        BoxCollider{
            anchors.fill: parent
            bodyType: Body.Static
        }
        property int column: 0
        property int row: 0
        property int size // gets set in Platform.qml and Ground.qml

        x: row * gameScene.gridSize
        y: wall.height - (column+1)*gameScene.gridSize
}

