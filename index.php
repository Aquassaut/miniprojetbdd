<?php

require_once "queryUtil.php";
require_once "pageTemplate.php";

/**
 *  printWelcome
 *
 *  Prints a nice and warm welcoming message for people who come to this website
 */

function printWelcome() {
    echo ('
                    <article class="ym-content">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nec placerat turpis. Praesent dui dolor, gravida ut tincidunt eget, porta sit amet risus. In sodales, libero eu tincidunt posuere, nunc massa vehicula eros, at auctor nisi lacus a ligula. Maecenas nec urna ac tellus vestibulum faucibus. Vivamus id mi porta, molestie erat eget, sodales arcu. Etiam ultricies augue eget neque dignissim, quis bibendum eros venenatis. Vivamus semper elementum vestibulum. Integer id posuere ante.</p>

                        <p>Etiam eleifend nibh non nibh fringilla, ac dictum nisl adipiscing. Aenean vulputate nec quam vel viverra. Sed ultricies pellentesque euismod. Mauris est massa, interdum sed mauris et, tempus mollis nunc. Proin rhoncus sed dui eget dignissim. Curabitur varius elementum nisi ac lacinia. Donec arcu tortor, commodo at magna quis, laoreet porttitor nibh. Mauris elementum bibendum auctor. Pellentesque mattis lectus quis mollis fermentum. Aenean ut vehicula velit, id hendrerit sapien. Suspendisse orci neque, tincidunt at pretium in, consequat et justo. Donec et nulla vel purus fermentum tempus id in lorem. Ut placerat aliquet viverra. Nunc accumsan nibh eros, auctor dignissim odio gravida iaculis. Aenean nec felis a leo ullamcorper rhoncus non ac elit. Etiam in rhoncus nulla.</p>

                        <p>Nullam tortor ligula, egestas non aliquam vel, eleifend quis nibh. Proin adipiscing elit nunc, vel tincidunt justo dignissim in. Integer ut condimentum orci, sit amet ultrices leo. Fusce libero magna, auctor quis nibh quis, rhoncus pretium purus. Maecenas eget feugiat massa. Pellentesque in nisl ullamcorper, auctor velit ut, placerat mi. Nulla porttitor, arcu a convallis euismod, purus libero gravida tortor, ut vulputate nibh elit sed orci. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus turpis lorem, eleifend non ultricies vitae, sodales non nisl. Nam ac consequat nibh. Suspendisse potenti.</p>

                        <p>Curabitur euismod volutpat orci, vel eleifend neque suscipit a. Pellentesque sit amet mollis nunc, sed rhoncus est. Nulla ac tellus est. Sed convallis ligula vel tortor accumsan, ac viverra lorem egestas. Donec adipiscing ac magna nec molestie. Donec a arcu lectus. Sed interdum blandit sapien. Donec eu justo porttitor, mollis lectus sodales, volutpat eros. Aliquam vestibulum magna vel ipsum ullamcorper gravida. Mauris congue viverra sollicitudin. Ut vitae condimentum diam. Vestibulum suscipit dignissim diam in pharetra. Integer diam quam, pharetra sed elit non, facilisis pharetra purus.</p>

                        <p>Aliquam consectetur felis consequat ante porttitor vulputate. Duis fermentum et lacus vel dignissim. Maecenas facilisis arcu id nulla ultricies congue. Morbi semper nisi tortor, sed facilisis diam elementum vitae. Maecenas bibendum interdum purus quis posuere. Curabitur libero turpis, auctor eget tincidunt vel, blandit a libero. Vestibulum non cursus quam, ac laoreet turpis. Etiam varius dui eu luctus pretium. Vestibulum dui eros, sagittis sed enim ac, molestie fringilla tellus. In blandit metus rutrum posuere laoreet. In hac habitasse platea dictumst.</p>
                    </article>
    ');
}

pheader("index.php");
printWelcome();
pfooter();

?>
