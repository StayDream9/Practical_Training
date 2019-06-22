import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: player
    entityType: "player"
    width: 20
    height: 20

    signal contact
    signal dieimg1

    property alias collider: collider
//    property alias playerdie: playerdie
    property alias horizontalVelocity: collider.linearVelocity.x
    property alias verticalVelocity: collider.linearVelocity.y

    Timer{
        id:dieimg
        interval: 1
        repeat: false

        onTriggered: {
            playerdie.source = "../../assets/player/playerdie.json"
        }
    }

    TexturePackerAnimatedSprite {
        id: playermove
        width: 17
        height: 17
        running: true

        source: "../../assets/player/player.json"
        frameNames: ["p1_1.png", "p1_2.png", "p1_3.png", "p1_4.png"]
        interpolate: false
        anchors.fill: parent
        frameRate: 7
    }

//    TexturePackerAnimatedSprite{
//        id: playerdie
//        width: 17
//        height: 17
//        running: true
//        loops: 0
//        source: ""
//        frameNames: ["1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png", "9.png", "10.png"]
//        interpolate: false
//        anchors.fill: parent
//        frameRate: 3
//    }

    CircleCollider {
        id: collider
        radius: player.width/2-1

        anchors.centerIn: parent
        anchors.horizontalCenter: parent.horizontalCenter
        // this collider must be dynamic because we are moving it by applying forces and impulses
        bodyType: Body.Dynamic // this is the default value but I wanted to mention it ;)
        fixedRotation: true // we are running, not rolling...
        bullet: true // for super accurate collision detection, use this sparingly, because it's quite performance greedy
        sleepingAllowed: false
        // apply the horizontal value of the TwoAxisController as force to move the player left and right
        force: Qt.point(controller.xAxis*30*32,-controller.yAxis*30*32)

        categories: Circle.Category1
        collidesWith: Circle.Category1 | Circle.Category3 | Box.Category4 | Box.Category5 | Box.Category6 | Box.Category7 | Circle.Category8 | Circle.Category9 | Circle.Category10 | Circle.Category11 | Circle.Category12

        fixture.onBeginContact: {
            var collidedEntity = other.getBody().target

            if(collidedEntity.entityType === "fire" || collidedEntity.entityType === "fire1" || collidedEntity.entityType === "fire2" || collidedEntity.entityType === "fire3") {
//                dieimg.start();
                dieimg1()
                collidedEntity.removeEntity()
                // remove the monster
                removeEntity()
            }
        }

        // limit the horizontal velocity
        onLinearVelocityChanged: {
          if(linearVelocity.x > 30) linearVelocity.x = 30
          if(linearVelocity.x < -30) linearVelocity.x = -30
          if(linearVelocity.y > 30) linearVelocity.y = 30
          if(linearVelocity.y < -30) linearVelocity.y = -30

        }
    }

    // this timer is used to slow down the players horizontal movement. the linearDamping property of the collider works quite similar, but also in vertical direction, which we don't want to be slowed
    Timer {
    id: updateTimer
    // set this interval as high as possible to improve performance, but as low as needed so it still looks good
    interval: 10
    running: true
    repeat: true
    onTriggered: {
      var xAxis = controller.xAxis;
      // if xAxis is 0 (no movement command) we slow the player down until he stops
      if(xAxis === 0) {
        if(Math.abs(player.horizontalVelocity) > 10) player.horizontalVelocity /= 1.5
        else player.horizontalVelocity = 0
      }
      var yAxis = controller.yAxis;
      // if xAxis is 0 (no movement command) we slow the player down until he stops
      if(yAxis === 0) {
        if(Math.abs(player.verticalVelocity) > 10) player.verticalVelocity /= 1.5
        else player.verticalVelocity = 0
      }
    }
    }

    function right_change(){
        playermove.frameNames = ["p1_1.png", "p1_2.png", "p1_3.png", "p1_4.png"]

    }
    function left_change(){
        playermove.frameNames = ["p2_1.png", "p2_2.png", "p2_3.png", "p2_4.png"]

    }
    function top_change(){
        playermove.frameNames = ["p3_1.png", "p3_2.png", "p3_3.png", "p3_4.png"]

    }
    function down_change(){
        playermove.frameNames = ["p4_1.png", "p4_2.png", "p4_3.png", "p4_4.png"]
    }

}

