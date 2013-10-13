
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
        '           <input id="input-epreuve-intitule-' + nb + '" type="text" placeholder="Nom de l\'épreuve">' +
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <button class="ym-save ym-button ym-ico-btn" onclick="modRecord(' + nb + ');"></button>' +
        '   <button class="ym-close ym-button ym-ico-btn" onclick="restoreFromForm(' + nb + ')"></button>' +
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

    var newIntitule = document.createElement("input");
    newIntitule.setAttribute("type", "hidden");
    newIntitule.setAttribute("name", "newIntitule");
    newIntitule.setAttribute("value", document.getElementById('input-epreuve-intitule-' + nb).value);
    form.appendChild(newIntitule);

    
    document.body.appendChild(form);
    
    form.submit();
};