var prevnb = {};
var restoreFromForm = function(nb) {
    if (typeof prevnb[nb] !== 'undefined') {
        document.getElementById(nb).innerHTML = prevnb[nb];
    }
};
var popForm = function(nb) {
    var lign = document.getElementById(nb);
    var etu_nom = "";
    var etu_age = "";
    var etu_sexe = "";
    if(nb !== 0)
    {
        var etu_nom = document.getElementById("etu-nom-" + nb).innerHTML;
        var etu_age = document.getElementById("etu-age-" + nb).innerHTML;
        var etu_sexe = document.getElementById("etu-sexe-" + nb).innerHTML;
    }
    prevnb[nb] = lign.innerHTML;
    lign.innerHTML = '' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <input id="input-etu-nom-' + nb + '" type="text" placeholder="Nom de l\'étudiant" value="' + etu_nom + '">' +
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <input id="input-etu-age-' + nb + '" type="text" placeholder="Age de l\'étudiant" value="' + etu_age + '">' +
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <select id="input-etu-sexe-' + nb + '" value="' + etu_sexe + '">' +
        '               <option value="F" ' + (etu_sexe === "F" ? 'selected' : '') + '>Femme</option>' +
        '               <option value="M" ' + (etu_sexe === "M" ? 'selected' : '') + '>Homme</option>' +
        '           </select>' +
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
    newNom.setAttribute("value", document.getElementById('input-etu-nom-' + nb).value);
    form.appendChild(newNom);

    var newAge = document.createElement("input");
    newAge.setAttribute("type", "hidden");
    newAge.setAttribute("name", "newAge");
    newAge.setAttribute("value", document.getElementById('input-etu-age-' + nb).value);
    form.appendChild(newAge);

    var newSexe = document.createElement("input");
    newSexe.setAttribute("type", "hidden");
    newSexe.setAttribute("name", "newSexe");
    newSexe.setAttribute("value", document.getElementById('input-etu-sexe-' + nb).value);
    form.appendChild(newSexe);


    var numIut = document.createElement("input");
    numIut.setAttribute("type", "hidden");
    numIut.setAttribute("name", "numIut");
    numIut.setAttribute("value", document.getElementById('etu-noiut').innerHTML);
    form.appendChild(numIut);


    document.body.appendChild(form);

    form.submit();
};
