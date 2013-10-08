var popForm = function(nb) {
    var lign = document.getElementById(nb);
    lign.innerHTML = '' + 
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' + 
        '           <input type="text" placeholder="Nom de l\'IUT">' + 
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <input type="text" placeholder="Adresse de l\'IUT">' + 
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <div class="ym-form ym-full">' +
        '       <div class="ym-fbox">' +
        '           <input type="text" placeholder="Nombre d\'étudiants">' +
        '       </div>' +
        '   </div>' +
        '</td>' +
        '<td>' +
        '   <button class="ym-save ym-button" />' +
        '</td>' +
        '';
}
