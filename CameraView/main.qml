import QtQuick 2.5
import QtQuick.Window 2.2
import QtMultimedia 5.6
import QtQuick.Controls 1.4
import qlsoft.car.collisionassist 1.0

Window {
    visible: true

    Rectangle {
        anchors.fill: parent
        color: "black"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
//                camera.imageCapture.capture()
            }
        }

        Camera {
            id: camera

            imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

            exposure {
                exposureCompensation: -1.0
                exposureMode: Camera.ExposurePortrait
            }

            flash.mode: Camera.FlashRedEyeReduction

//            imageCapture {
//                onImageCaptured: {
//                    photoPreview.source = preview
//                }
//            }
        }

        CustomVideoFilter {
            id: customFilter

            onFinished: {
                console.log(result)
            }
        }

        VideoOutput {
            source: camera
            anchors.fill: parent
            focus : visible
            autoOrientation: true
            filters: [customFilter]
        }

        Item {
            id: header
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            ComboBox { // TODO: KC: use a custom ComboBoxStyle (native style for ios is missing in Qt)
                id: cameraChoice
                model: QtMultimedia.availableCameras
                textRole: "displayName"

                onCurrentIndexChanged: {
                    camera.deviceId = QtMultimedia.availableCameras[currentIndex].deviceId
                }
            }

        }

//        Image {
//            id: photoPreview
//        }
    }
}

