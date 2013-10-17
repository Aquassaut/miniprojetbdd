
var prevnb = {};
var restoreFromForm = function(nb) {
    if (typeof prevnb[nb] !== 'undefined') {
        document.getElementById(nb).innerHTML = prevnb[nb];
    }
};
var popForm = function(nb) {
    var lign = document.getElementById(nb);
    var iut_nom = "";
    var iut_addr = "";
    var iut_nbEtu = "";
    if(nb !== 0)
    {
        var iut_nom = document.getElementById("iut-nom-" + nb).innerHTML;
        var iut_addr = document.getElementById("iut-addr-" + nb).innerHTML;
        var iut_nbEtu = document.getElementById("iut-nbEtu-" + nb).innerHTML;
    }
    prevnb[nb] = lign.innerHTML;
    lign.innerHTML = '' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <input id="input-iut-nom-' + nb + '" type="text" placeholder="Nom de l\'IUT" value="' + iut_nom + '">' +
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <input id="input-iut-addr-' + nb + '" type="text" placeholder="Adresse de l\'IUT" value="' + iut_addr + '">' +
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <input id="input-iut-nbEtu-' + nb + '" type="text" placeholder="Nombre d\'étudiants" value="' + iut_nbEtu + '">' +
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <button class="ym-save ym-button ym-ico-btn" onclick="modRecord(' + nb + ');"></button>' +
        '   <button class="ym-close ym-button ym-ico-btn" onclick="restoreFromForm(' + nb + ');"></button>' +
        '</td>' +
        '';
};

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

    var newNom = document.createElement("input");
    newNom.setAttribute("type", "hidden");
    newNom.setAttribute("name", "newNom");
    newNom.setAttribute("value", document.getElementById('input-iut-nom-' + nb).value);
    form.appendChild(newNom);

    var newAdresse = document.createElement("input");
    newAdresse.setAttribute("type", "hidden");
    newAdresse.setAttribute("name", "newAdresse");
    newAdresse.setAttribute("value", document.getElementById('input-iut-addr-' + nb).value);
    form.appendChild(newAdresse);

    var newCount = document.createElement("input");
    newCount.setAttribute("type", "hidden");
    newCount.setAttribute("name", "newCount");
    newCount.setAttribute("value", document.getElementById('input-iut-nbEtu-' + nb).value);
    form.appendChild(newCount);

    document.body.appendChild(form);

    form.submit();
};
