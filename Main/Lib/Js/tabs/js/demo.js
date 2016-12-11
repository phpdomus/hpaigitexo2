/*
 exercice2 classroom.git
 ph. paille
 version: 01.00.21612
 */
// TOCONFIRM compatible avec MSIE

if ('undefined' == typeof Node)
    Node = { ELEMENT_NODE: 1, TEXT_NODE: 3 };

function addListener(element, baseName, handler) {
    if (element.addEventListener)
        element.addEventListener(baseName, handler, false);
    else if (element.attachEvent)
        element.attachEvent('on' + baseName, handler);
} // addListener

function decorateLabels() {
    var labels = document.getElementsByTagName('label');
    for (var index = 0; index < labels.length; ++index) {
        var label = labels[index];
        if (label.accessKey) {
            var ak = label.accessKey.toUpperCase();
            decorateNodeForAccessKey(label, ak);
        }
        if (label.htmlFor) {
            var elt = document.getElementById(label.htmlFor);
            if (!elt)
                continue;
            if (elt.id.match(/Req/))
                label.className += ' required';
        }
    }
} // decorateLabels

function decorateNodeForAccessKey(elt, key) {
    if (Node.ELEMENT_NODE == elt.nodeType) {
        var node = elt.firstChild;
        while (node && !decorateNodeForAccessKey(node, key))
            node = node.nextSibling;
        // Si node n'est pas null, on a trouve l'AK dans un descendant
        // et on a decore : on renvoie non-null, donc equivalent true
        return node;
    }
    if (Node.TEXT_NODE != elt.nodeType)
        return false;
    var pos = elt.nodeValue.toUpperCase().indexOf(key);
    if (-1 == pos)
        return false;
    var suffix = elt.nodeValue.substring(pos + 1);
    var akSpan = document.createElement('span');
    akSpan.className = 'accessKey';
    akSpan.appendChild(document.createTextNode(elt.nodeValue.charAt(pos)));
    // On evite node.splitText et node.deleteData sur MSIE...  On manipule
    // nodeValue et on cree le deuxieme noeud Texte manuellement.
    elt.nodeValue = elt.nodeValue.substring(0, pos);
    elt.parentNode.appendChild(akSpan);
    elt.parentNode.appendChild(document.createTextNode(suffix));
    // Tres important pour eviter une recursion infinie !
    return true;
} // decorateNodeForAccessKey

addListener(window, 'load', decorateLabels);
