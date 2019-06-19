import QtQuick 2.0
import Felgo 3.0

//红房子障碍物
EntityBase{
    id:obstacle2
    entityType: "obstacle2"

    property int rand/*: Math.random()%3*/

        MultiResolutionImage{
            id: obswall
            height: 20
            width: 20
            property string house0: "../../assets/wall/redhouse.png"
            property string house1: "../../assets/wall/bluehouse.png"
            property string house2: "../../assets/wall/yellowhouse.png"

            source: switch(rand){
                    case 0: house0;break;
                    case 1: house1;break;
                    case 2: house2;break;
                    }
//            source: "../../assets/wall/redhouse.png"
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
        width: gameScene.gridSize * size
        height: gameScene.gridSize
}
