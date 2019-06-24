import QtQuick 2.0
import Felgo 3.0

//草障碍物
EntityBase{
    id:obstacle3
    entityType: "obstacle3"

    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

    x: row * gameScene.gridSize
    y: scene.height - (column+1)*gameScene.gridSize
    width: gameScene.gridSize * size
    height: gameScene.gridSize

    MultiResolutionImage{
        id: grassimg
        height: 20
        width: 20
        source: "../../assets/wall/grass.png"
    }

    Timer{
        id:disapp1T

        interval: 10
        repeat: false
        onTriggered: {
            removeT.start()
            grassimg.source = ""
            hlsimg.source = "../../assets/wall/disapp.json"
        }
    }

    Timer{
        id:removeT
        interval: 2000
        repeat: false
        onTriggered: {
            removeEntity()
        }
    }

    TexturePackerAnimatedSprite{
        id: hlsimg //消失动画
        height: parent.height
        width: parent.width

        running: true
        source: ""
        frameNames: ["disapp-0.png", "disapp-1.png", "disapp-2.png", "disapp-3.png"]
        interpolate: false
        frameRate: 3
    }


    CircleCollider{
        radius: grassimg.width/2
        anchors.centerIn: parent
        bodyType: Body.Static

        categories: Circle.Category8
        collidesWith: Circle.Category1 | Box.Category4 | Box.Category5 | Box.Category6 | Box.Category7 | Circle.Category9

        fixture.onBeginContact: {
            var collidedEntity = other.getBody().target
            if(collidedEntity.entityType === "fire" || collidedEntity.entityType === "fire1" || collidedEntity.entityType === "fire2" || collidedEntity.entityType === "fire3") {
                collidedEntity.removeEntity()
                // remove the monster

                disapp1T.start()
            }
        }
    }


}
