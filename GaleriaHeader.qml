import QtQuick 2.2

Panel{
	id: header
	
	property alias mostrarBotonBack: botonBack.visible
	property alias texto: tituloLabel.text

	signal backTriggered()


	anchors{
		top: parent.top
		left: parent.left
		right: parent.right
	}
	height: 72

	elevation: 2


	IconAction{
		id: botonBack
		name: "image/navigate_before"
		
		anchors{
			left: parent.left
			margins: 16
			verticalCenter: parent.verticalCenter
		}
		onTriggered: backTriggered()

		visible: mostrandoImagen
	}

	Label{
		id: tituloLabel
		anchors{
			verticalCenter: parent.verticalCenter
			left: parent.left
			leftMargin: 16+(botonBack.visible ? 48+16 : 0)
			Behavior on leftMargin{
				NumberAnimation{
					easing.type: Easing.InOutQuad
					duration: 200
				}
			}
			right: parent.right
			rightMargin: 16
		}
		text: "Galeria"
		style: "display1"
		
	}
}