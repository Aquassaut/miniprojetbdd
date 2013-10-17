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
        var selector = document.querySelectorAll('#selectetu .etu-in-' + iutNb);
        for (var i = 0; i < selector.length; i += 1) {
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
        id.setAttribute("name", "etu");
        id.setAttribute("value", nb);
        form.appendChild(id);
    }
    // manif, epr, newEtu, newRes  

    var manif = document.createElement("input");
    manif.setAttribute("type", "hidden");
    manif.setAttribute("name", "manif");
    manif.setAttribute("value", document.getElementById("manId").innerHTML);
    form.appendChild(manif);

    var epr = document.createElement("input");
    epr.setAttribute("type", "hidden");
    epr.setAttribute("name", "epr");
    epr.setAttribute("value", document.getElementById("eprId").innerHTML);
    form.appendChild(epr);
    

    var newEtu = document.createElement("input");
    newEtu.setAttribute("type", "hidden");
    newEtu.setAttribute("name", "newEtu");
    newEtu.setAttribute("value", document.getElementById('input-epDet-etu-' + nb).value);
    form.appendChild(newEtu);


    var newRes = document.createElement("input");
    newRes.setAttribute("type", "hidden");
    newRes.setAttribute("name", "newRes");
    newRes.setAttribute("value", document.getElementById('input-epDet-res-' + nb).value);
    form.appendChild(newRes);

    document.body.appendChild(form);
    
    form.submit();
};
