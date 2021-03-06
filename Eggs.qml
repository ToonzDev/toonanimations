//eggs
import QtQuick 2.1

        Item {
            id: egg

            width: 107
            height: 132
            x : ((Math.random() * parent.width)-40);
            y : -140;

            Item {
                id: sprite
                property int framex: randomNumber(0, 3)
                property int framey: randomNumber(0, 1)
                anchors.centerIn: parent
                height: parent.height
                width: parent.width
                clip: true

                function randomNumber(from, to) {
                    return Math.floor(Math.random() * (to - from + 1) + from);
                }

                transform: Rotation {
                   id: rotator
                   origin{
                       x: 53
                       y: 110
                    }
                    angle: 0
                }

                SequentialAnimation {
                    id: shake
                    PropertyAnimation { easing.type: Easing.InQuad; duration: 400; target: rotator; property: "angle"; to: 5 }
                    PropertyAnimation { easing.type: Easing.InQuad; duration: 400; target: rotator; property: "angle"; to: -5 }
                }

                Timer {
                    running: true
                    repeat: true
                    interval: 800
                    onTriggered: {
                        shake.restart();
                    }
                }

                Image {
                id: spriteImage
                source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/eggs3.png"
                y: -parent.height*sprite.framey
                x:-parent.width*sprite.framex
                }
            }

            function randomNumber(from, to) {
                return Math.floor(Math.random() * (to - from + 1) + from);
            }

        property int speed: isNxt ? randomNumber(2, 5) : randomNumber(5, 8)

        Timer {
            interval: 50
            running: true
            repeat: true
            onTriggered: {
                egg.y += speed;
                if (isNxt && (egg.y - egg.height)> 700) {
                   egg.destroy();
                }

                if (!isNxt && (egg.y - egg.height) > 550) {
                   egg.destroy();
                }
          }
         }
}
