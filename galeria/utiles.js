.pragma library
function normalizarBytes(bytes){
	var i = 0;
	var temp = bytes;
	var last = bytes;
	while(0 != ~~temp){
		last = temp;
		temp = temp/1024;
		i++;
	}
	return parseFloat(Math.round(last * 100) / 100).toFixed(2)
		+" "
		+ "B_KB_MB_GB_TB".split('_')[i-1];
}

function alpha(color, alpha) {
    // Make sure we have a real color object to work with (versus a string like "#ccc")
    var realColor = Qt.darker(color, 1)

    realColor.a = alpha

    return realColor
}
