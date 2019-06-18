import QtQuick 2.0
import Felgo 3.0

WallEntityBase{
    id:obstacle1
    entityType: "obstacle1"

//    size: 2

//    Item{
//        id:obstimg_house
        MultiResolutionImage{
            height: 20
            width: 20
            source: "../../assets/wall/bluehouse.png"
        }
//    }

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
