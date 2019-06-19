import QtQuick 2.0
import Felgo 3.0

Component{
    id:boomEntityComponent
    EntityBase{
        entityType: "boom"

        Image{
            id:boomImage
            width: 20
            height: 20
            source: "../../assets/wall/tree.png"
        }

        BoxCollider{
            width: 20
            height: 20
            bodyType: Body.Static
        }
    }
}
