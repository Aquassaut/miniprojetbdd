
var prevnb = {};
var restoreFromForm = function(nb) {
    if (typeof prevnb[nb] !== 'undefined') {
        document.getElementById(nb).innerHTML = prevnb[nb];
    }
};
var popForm = function(nb) {
    var lign = document.getElementById(nb);
    var manif_nom = "";
    var manif_date = "";
    var manif_nomIUT = "";
    if(nb !== 0)
    {
        var manif_nom = document.getElementById("manif-nom-" + nb).innerHTML;
        var manif_date = document.getElementById("manif-date-" + nb).innerHTML;
        var manif_nomIUT = document.getElementById("manif-nomIUT-" + nb).innerHTML;
    }
    prevnb[nb] = lign.innerHTML;
    lign.innerHTML = '' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <input id="input-manif-nom-' + nb +'" type="text" placeholder="Nom de la manifestation" value="' + manif_nom + '">' +
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <input id="input-manif-date-' + nb + '" type="date" placeholder="Date de la manifestation" value="' + manif_date + '">' +
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <select id="iut-fk-' + nb + '" value="' + manif_nomIUT + '">' +
        '           </select>' +
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <button class="ym-save ym-button ym-ico-btn" onclick="modRecord(' + nb + ')"></button>' +
        '   <button class="ym-close ym-button ym-ico-btn" onclick="restoreFromForm(' + nb + ')"></button>' +
        '</td>' +
        '';
    document.getElementById('iut-fk-' + nb).innerHTML = document.getElementById('iutList').innerHTML;
};

var modRecord = function (nb) {
    var form = document.createElement("form");

    form.setAttribute("method", "post"); //get for debug, post for production
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

    var newNom = document.createElement("input");
    newNom.setAttribute("type", "hidden");
    newNom.setAttribute("name", "newNom");
    newNom.setAttribute("value", document.getElementById('input-manif-nom-' + nb).value);
    form.appendChild(newNom);

    var newAdresse = document.createElement("input");
    newAdresse.setAttribute("type", "hidden");
    newAdresse.setAttribute("name", "newDate");
    newAdresse.setAttribute("value", document.getElementById('input-manif-date-' + nb).value);
    form.appendChild(newAdresse);

    var newCount = document.createElement("input");
    newCount.setAttribute("type", "hidden");
    newCount.setAttribute("name", "noIut");
    newCount.setAttribute("value", document.getElementById('iut-fk-' + nb).value);
    form.appendChild(newCount);

    document.body.appendChild(form);

    form.submit();
};
