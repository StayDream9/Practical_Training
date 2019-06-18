import QtQuick 2.0
import Felgo 3.0

WallEntityBase{
    id:floor
    entityType: "floor"

//    size: 2

//    Item{
//        id:obstimg_house
        MultiResolutionImage{
            height: 20
            width: 20
            source: "../../assets/wall/stoneland.png"
        }
//    }

}
