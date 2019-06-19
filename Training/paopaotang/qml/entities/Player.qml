import QtQuick 2.0
import Felgo 3.0
//import ""


EntityBase {
    id: player
    entityType: "player"
    width: 18
    height: 18

    property alias collider: collider
    property alias horizontalVelocity: collider.linearVelocity.x
    property alias verticalVelocity: collider.linearVelocity.y
    property alias playerimage: playerima.source
    property alias playerimage1: playerima1.source
    property alias playerimage2: playerima2.source
    property alias playerimage3: playerima3.source
    property alias rightT: rightimage.running
    property alias leftT: leftimage.running
    property alias upT: upimage.running
    property alias downT: downimage.running

    MultiResolutionImage {
        id: playerima
        width:20
        height: 20

        property string pic1: "../../assets/player/p1_11.png"
        property string pic2: "../../assets/player/p1_12.png"
        property string pic3: "../../assets/player/p1_13.png"
        property string pic4: "../../assets/player/p1_14.png"
    }
    MultiResolutionImage {
        id: playerima1
        width:20
        height: 20

        property string pic1: "../../assets/player/p2_11.png"
        property string pic2: "../../assets/player/p2_12.png"
        property string pic3: "../../assets/player/p2_13.png"
        property string pic4: "../../assets/player/p2_14.png"
    }
    MultiResolutionImage {
        id: playerima2
        width:20
        height: 20

        property string pic1: "../../assets/player/p3_11.png"
        property string pic2: "../../assets/player/p3_12.png"
        property string pic3: "../../assets/player/p3_13.png"
        property string pic4: "../../assets/player/p3_14.png"
    }
    MultiResolutionImage {
        id: playerima3
        width:20
        height: 20

        property string pic1: "../../assets/player/p4_11.png"
        property string pic2: "../../assets/player/p4_12.png"
        property string pic3: "../../assets/player/p4_13.png"
        property string pic4: "../../assets/player/p4_14.png"
    }

    property int index: 0
    Timer {
        id: rightimage
        interval: 100
        running: true
        repeat: true

        onTriggered: {
            index++
            switch(index%4){
                case 0:playerima.source = playerima.pic1 ;break;
                case 1:playerima.source = playerima.pic2 ;break;
                case 2:playerima.source = playerima.pic3 ;break;
                case 3:playerima.source = playerima.pic4 ;break;
            }
        }
    }
    Timer {
        id: leftimage
        interval: 100
        running: true
        repeat: true

        onTriggered: {
            index++
            switch(index%4){
            case 0:playerima1.source = playerima1.pic1 ;break;
            case 1:playerima1.source = playerima1.pic2 ;break;
            case 2:playerima1.source = playerima1.pic3 ;break;
            case 3:playerima1.source = playerima1.pic4 ;break;
            }
        }
    }
    Timer {
        id: upimage
        interval: 100
        running: true
        repeat: true

        onTriggered: {
            index++
            switch(index%4){
            case 0:playerima2.source = playerima2.pic1 ;break;
            case 1:playerima2.source = playerima2.pic2 ;break;
            case 2:playerima2.source = playerima2.pic3 ;break;
            case 3:playerima2.source = playerima2.pic4 ;break;
            }
        }
    }
    Timer {
        id: downimage
        interval: 100
        running: true
        repeat: true

        onTriggered: {
            index++
            switch(index%4){
            case 0:playerima3.source = playerima3.pic1 ;break;
            case 1:playerima3.source = playerima3.pic2 ;break;
            case 2:playerima3.source = playerima3.pic3 ;break;
            case 3:playerima3.source = playerima3.pic4 ;break;
            }
        }
    }

    BoxCollider {
        id: collider
        height: 18
        width: 18
        anchors.horizontalCenter: parent.horizontalCenter
        // this collider must be dynamic because we are moving it by applying forces and impulses
        bodyType: Body.Dynamic // this is the default value but I wanted to mention it ;)
        fixedRotation: true // we are running, not rolling...
        bullet: true // for super accurate collision detection, use this sparingly, because it's quite performance greedy
        sleepingAllowed: false
        // apply the horizontal value of the TwoAxisController as force to move the player left and right
        force: Qt.point(controller.xAxis*170*32,-controller.yAxis*170*32)

        // limit the horizontal velocity
        onLinearVelocityChanged: {
          if(linearVelocity.x > 170) linearVelocity.x = 170
          if(linearVelocity.x < -170) linearVelocity.x = -170
          if(linearVelocity.y > 170) linearVelocity.y = 170
          if(linearVelocity.y < -170) linearVelocity.y = -170

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
        rightT = true
        leftT = false
        upT = false
        downT = false
        playerimage1 = ""
        playerimage2 = ""
        playerimage3 = ""
        playerimage = "../../assets/player/p1_11.png"
    }
    function left_change(){
        leftT = true
        rightT = false
        upT = false
        downT = false
        playerimage = ""
        playerimage2 = ""
        playerimage3 = ""
        playerimage1 = "../../assets/player/p2_11.png"
    }
    function top_change(){
        upT = true
        downT = false
        rightT = false
        leftT = false
        playerimage1 = ""
        playerimage = ""
        playerimage3 = ""
        playerimage2 = "../../assets/player/p3_11.png"
    }
    function down_change(){
        downT = true
        rightT = false
        leftT = false
        upT = false
        playerimage1 = ""
        playerimage2 = ""
        playerimage = ""
        playerimage3 = "../../assets/player/p4_11.png"
    }

//    EntityManager {
//      id: entityManager
//      entityContainer: scene
//    }

//    Scene{
//        id:scene


//    }

//    function boom(){
//        console.debug(player.x)
//        console.debug(player.y)
//        var newEntityProperties = {
//                             x: 20,
//                             y: 100,
//                         }
//                         entityManager.createEntityFromComponentWithProperties(
//                                     boomEntityComponent,
//                                     newEntityProperties);

//    }

}

