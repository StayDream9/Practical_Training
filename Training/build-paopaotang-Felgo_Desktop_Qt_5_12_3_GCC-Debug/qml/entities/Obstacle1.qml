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

//    BoxCollider {
//      anchors.fill: parent
//      bodyType: Body.Static
//      fixture.onBeginContact: {
//        var otherEntity = other.getBody().target
//        if(otherEntity.entityType === "player") player.contacts++
//      }
//      fixture.onEndContact: {
//        var otherEntity = other.getBody().target
//        if(otherEntity.entityType === "player") player.contacts--
//      }
//    }
}
