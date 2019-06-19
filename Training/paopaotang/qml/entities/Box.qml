import QtQuick 2.0
import Felgo 3.0

WallEntityBase{
    id:box
    entityType: "box"

    MultiResolutionImage{
        height: 20
        width: 20
        source: "../../assets/wall/box.png"
    }
    BoxCollider{
        anchors.fill: parent
        bodyType: Body.Static
    }
}
