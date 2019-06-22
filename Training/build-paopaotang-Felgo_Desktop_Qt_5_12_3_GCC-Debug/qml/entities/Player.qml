import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: player
    entityType: "player"
    width: 20
    height: 20

    signal contact

    property alias collider: collider
    property alias horizontalVelocity: collider.linearVelocity.x
    property alias verticalVelocity: collider.linearVelocity.y

    TexturePackerAnimatedSprite {
        id: playerleft
        width: 17
        height: 17
        running: true

        source: "../../assets/player/player.json"
        frameNames: ["p1_11.png", "p1_12.png", "p1_13.png", "p1_14.png"]
        interpolate: false
        anchors.fill: parent
        frameRate: 7
    }

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

        categories: Box.Category1
        collidesWith: Box.Category1 /*| Box.Category4 | Box.Category5 | Box.Category6 | Box.Category7*/

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
      if(xAxis == 0) {
        if(Math.abs(player.horizontalVelocity) > 10) player.horizontalVelocity /= 1.5
        else player.horizontalVelocity = 0
      }
      var yAxis = controller.yAxis;
      // if xAxis is 0 (no movement command) we slow the player down until he stops
      if(yAxis == 0) {
        if(Math.abs(player.verticalVelocity) > 10) player.verticalVelocity /= 1.5
        else player.verticalVelocity = 0
      }
    }
    }

    function right_change(){
        playerleft.frameNames = ["p1_11.png", "p1_12.png", "p1_13.png", "p1_14.png"]

    }
    function left_change(){
        playerleft.frameNames = ["p2_11.png", "p2_12.png", "p2_13.png", "p2_14.png"]

    }
    function top_change(){
        playerleft.frameNames = ["p3_11.png", "p3_12.png", "p3_13.png", "p3_14.png"]

    }
    function down_change(){
        playerleft.frameNames = ["p4_11.png", "p4_12.png", "p4_13.png", "p4_14.png"]
    }

}

