var prevnb = {};
var restoreFromForm = function(nb) {
    if (typeof prevnb[nb] !== 'undefined') {
        document.getElementById(nb).innerHTML = prevnb[nb];
    }
};
var popForm = function(nb) {
    var lign = document.getElementById(nb);
    prevnb[nb] = lign.innerHTML;
    lign.innerHTML = '' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <select id="input-epDet-iut-' + nb + '" type="text" onchange="filterEtu(' + nb + ')"></select>' +
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <select id="input-epDet-etu-' + nb + '" type="text"></select>' +
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <input id="input-epDet-res-' + nb + '" type="text" placeholder="resultat"></select>' +
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <button class="ym-save ym-button ym-ico-btn" onclick="modRecord(' + nb + ');"></button>' +
        '   <button class="ym-close ym-button ym-ico-btn" onclick="restoreFromForm(' + nb + ')"></button>' +
        '</td>' +
        '';
    document.getElementById('input-epDet-etu-' + nb).innerHTML = document.getElementById('selectetu').innerHTML;
    document.getElementById('input-epDet-iut-' + nb).innerHTML = document.getElementById('selectiut').innerHTML;
};


var filterEtu = function(nb) {
    var iutNb = parseInt(document.getElementById('input-epDet-iut-' + nb).value, 10);
    var selectetu = document.getElementById('input-epDet-etu-' + nb);
    if (iutNb === 0) {
    	selectetu.innerHTML = document.getElementById('selectetu').innerHTML;
    } else {
	selectetu.innerHTML = "";
	console.log("Emptying the select " + nb);
	var selector = document.querySelectorAll('#selectetu .etu-in-' + iutNb);
    	for (var i = 0; i < selector.length; i += 1) {
	    console.log("Adding " + selector.item(i));
	    selectetu.appendChild(selector.item(i));
	}
    }
}

var modRecord = function (nb) {
    var form = document.createElement("form");

    form.setAttribute("method", "post");
    form.setAttribute("action", "");

    var action = document.createElement("input");
    action.setAttribute("type", "hidden");
    action.setAttribute("name", "action");
    action.setAttribute("value", (nb === 0 ? "add" : "modify"));
    form.appendChild(action);

    if (nb !== 0) {
        var id = document.createElement("input");
        id.setAttribute("type", "hidden");
        id.setAttribute("name", "id");
        id.setAttribute("value", nb);
        form.appendChild(id);
    }

    var newIntitule = document.createElement("input");
    newIntitule.setAttribute("type", "hidden");
    newIntitule.setAttribute("name", "newIntitule");
    newIntitule.setAttribute("value", document.getElementById('input-epreuve-intitule-' + nb).value);
    form.appendChild(newIntitule);

    
    document.body.appendChild(form);
    
    form.submit();
};
