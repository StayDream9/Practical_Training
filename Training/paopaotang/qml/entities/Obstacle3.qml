import QtQuick 2.0
import Felgo 3.0

//草障碍物
WallEntityBase{
    id:obstacle3
    entityType: "obstacle3"

    MultiResolutionImage{
        height: 20
        width: 20
        source: "../../assets/wall/grass.png"
    }
    BoxCollider{
        anchors.fill: parent
        bodyType: Body.Static
    }
}
