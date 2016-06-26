import QtQuick 2.2
import QtGraphicalEffects 1.0
import "utiles.js" as Utiles

Panel{
	id: widget
	elevation: 1
	backgroundColor: "white"
	z: 6
	
	anchors{
		right: parent.right
		rightMargin: __store.offsetmargin
	}
	height: 72
	
	width: parent.width

	property alias source: imagen.source
	property bool showing: false
	property real zoomFactor: 1.0

	Binding on zoomFactor{
		when: !showing
		value: 1.0
	}

	onShowingChanged: {
		if(!showing){
			effectBox.effect = "";
		}
	}


	QtObject{
		id: __store
		property int offsetmargin: header.width
	}

	// Sumidero de clicks
	MouseArea{
		anchors.fill: parent
	}

	state: showing ? "showing" : ""

	states:[
		State{
			name: "showing"
			PropertyChanges{
				target: __store
				offsetmargin: 0
			}
			PropertyChanges{
				target: toolbox
				offsetmargin: 0
			}
		}
	]

	transitions:[
		Transition{
			from: ""
			to: "showing"
			SequentialAnimation{
				NumberAnimation{
					target: __store
					property: "offsetmargin"
					easing.type: Easing.OutExpo
				}
				NumberAnimation{
					target: toolbox
					property: "offsetmargin"
					easing.type: Easing.InOutQuad
				}
			}
		},

		Transition{
			from: "showing"
			to: ""
			NumberAnimation{
				target: __store
				property: "offsetmargin"
				easing.type: Easing.InExpo
			}

		}
	]


	Flickable{
		id: flicker
		anchors.fill: parent
		contentWidth: parent.width* zoomFactor
		contentHeight: parent.height* zoomFactor


		Image{
			id: imagen
			property real zoomFactor: 1.0
			width: flicker.contentWidth
			height: flicker.contentHeight
			anchors.centerIn: parent
			asynchronous: true
			fillMode: Image.PreserveAspectFit
			MouseArea{
				anchors.fill: parent
				onWheel: {
					var temp = zoomFactor + wheel.angleDelta.y/1200;
					if(temp < 1)
						temp = 1;
					zoomFactor = temp;
				}
			}
		}

		EffectBox{
			id: effectBox
			anchors.fill: imagen
			source: imagen
		}
	}
	
	

	BusyIndicator{
		anchors.centerIn: flicker
		running: imagen.status == Image.Loading
		size: 128
	}

	Rectangle{
		id: toolbox
		property int offsetmargin: -height
		anchors{
			bottom: parent.bottom
			bottomMargin: toolbox.offsetmargin
		}
		width: parent.width
		height: 72
		color: Utiles.alpha("#ddd", 0.8)

		Row{
			anchors{
				left: parent.left
				right: parent.right
				margins: 4
				verticalCenter: parent.verticalCenter
			}
			spacing: 4
			IconAction{
				name: "image/blur_on"
				onTriggered: effectBox.effect = "blur"
			}
			IconAction{
				name: "image/filter_b_and_w"
				onTriggered: effectBox.effect = "bw"
			}
			IconAction{
				name: "image/flare"
				onTriggered: effectBox.effect = "flare"
			}
		}

		IconAction{
			anchors{
				right: parent.right
				verticalCenter: parent.verticalCenter
				rightMargin: 4
			}
			name: "content/clear"
			onTriggered: effectBox.effect = ""
		}

	}
}