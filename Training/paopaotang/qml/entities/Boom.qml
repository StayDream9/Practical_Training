import QtQuick 2.0
import Felgo 3.0

Component{
    id:boomEntityComponent

    EntityBase{
        id:boom
        entityType: "boom"
        width: 18;height: 18

        Timer{
            id: boomT
            interval: 2000
            running: true
            repeat: false

            onTriggered: {
                squabySprite1.source = ""
                squabySprite2.source = "../../assets/image/boom1.json"
                squabySprite2.running = true
            }
        }


        TexturePackerAnimatedSprite {
          id: squabySprite1
          width: 17
          height: 17
//          loops: 0
          running: true
          source: "../../assets/image/boom1.json"
          frameNames: ["boom-1.png", "boom-2.png", "boom-3.png"]
          interpolate: false
          anchors.fill: parent
//          reverse: true
          frameRate: 3
        }

        TexturePackerAnimatedSprite {
          id: squabySprite2
          width: 17
          height: 17
          running: false
          loops: 0
          source: ""
          frameNames: ["boom-4.png", "boom-5.png", "boom-6.png", "boom-7.png"]
          interpolate: false
          anchors.fill: parent
//          reverse: true
          frameRate: 3
        }

        BoxCollider{
            anchors.fill: parent
            bodyType: Body.Static
        }
    }
}
