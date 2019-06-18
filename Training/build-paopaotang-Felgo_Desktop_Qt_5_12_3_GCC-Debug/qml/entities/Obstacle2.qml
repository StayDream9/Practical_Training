import QtQuick 2.0
import Felgo 3.0

WallEntityBase{
    id:obstacle2
    entityType: "obstacle2"

    property int rand: Math.random()%3

//    size: 2

//    Item{
//        id:obstimg_house
        MultiResolutionImage{
            height: 15
            width: 15
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
//    }

        BoxCollider{
            anchors.fill: parent
            bodyType: Body.Static
        }
}
