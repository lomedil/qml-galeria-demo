import QtQuick 2.2
import QtGraphicalEffects 1.0

Item{
	id: widget
	property var source
	property var effect: ""


	FastBlur{
		anchors.fill: parent
		source: widget.source
		radius: 0.8
		visible: effect == "blur"
	}

	GammaAdjust {
        anchors.fill: parent
        source: widget.source
        gamma: 0.45
        visible: effect == "flare"
    }

    Desaturate {
        anchors.fill: parent
        source: widget.source
        desaturation: 0.8
        visible: effect == "bw"
    }

}