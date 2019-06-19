import QtQuick 2.0
import Felgo 3.0

//树障碍物
WallEntityBase{
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
}
