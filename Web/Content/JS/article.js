
var article = document.getElementById("articleEditor");
var content = document.getElementById("contenteditor");
var id = document.getElementById("Id");
var articleAuthor = document.getElementById("articleAuthor");
var articleTitle = document.getElementById("articleTitle");
var articleState = document.getElementById("articleState");
var articleCategoryId = document.getElementById("articleCategoryId");
var submit = document.getElementById("submit");
var gif = document.getElementById("gif");
article.onsubmit = sendArticle;

//Sauvegarde l'article dans la base de donnée. L'utilisateur reste sur la page courante.
function sendArticle() {
  classChange('sectionSub','disabled');
  var ajax = createXhrObject();
  var url = article.getAttribute("action");
  var params = "Content=" + encodeURIComponent(content.innerHTML) + "&Id=" + id.value
    + "&Author=" + encodeURIComponent(articleAuthor.value)
    + "&Title=" + encodeURIComponent(articleTitle.value)
    + "&State=" + encodeURIComponent(articleState.checked)
    + "&CategoryId=" + encodeURIComponent(articleCategoryId.options[articleCategoryId.selectedIndex].value);
  if (!isInTag(articleTags.value)) {
    params += "&Tags=" + encodeURIComponent(articleTags.value);
  }
  ajax.open("post", url, true);
  ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

  ajax.onreadystatechange = function () {
    if (ajax.readyState == 4 && ajax.status == 200) {
    	submit.className = "show";
		  gif.className = "hide";
    }
  }
  ajax.send(params);
  classChange('disabled','sectionSub');
  submit.className = "hide";
  gif.className = "show";
  addTag();
  //location.reload();
  return false;
}

//Insère un élément 'node' au début de la sélection de l'utilisateur.
var rank;
var parent;
function insertHTML(node,range = null) {
  var sel;
  if ((sel = window.getSelection()).rangeCount) {
    if (range == null) {
      range = sel.getRangeAt(0);
      range.collapse(true);
    }
    parent = range.commonAncestorContainer;
    if (isInEditable(parent)) {
      range.insertNode(node);
      range.setStartAfter(node);
    }
  }
}

//Créer l'élément 'section' et essai de l'insérer. Veille à ce que la structure des
//sections
function insertSection() {
  var section = document.createElement("section");
  section.className = "sectionSub";
  var header = document.createElement("H1");
  var text = document.createTextNode(" [Insérer le titre ici]");
  header.appendChild(document.createElement("span"));
  header.appendChild(text);
  section.appendChild(header);
  insertHTML(section);
  var parent = section.parentNode;
  setHierarchy(section, parent);
  var subSecs = document.getElementsByClassName("sectionSub");
  setRanking(subSecs);
  var summary = document.getElementById("summary");
  if (summary != undefined) {
    updateSummary();
  }
}

//Permet la création de l'élément 'summary'.
function insertSummary() {
  updateSummary();
}

//Applique la fonction applyRanking à toutes les sections de sectionList
function setRanking(sectionList) {
  for (var i = 0; i < sectionList.length; ++i) {
    applyRanking(sectionList[i], sectionList[i]);
    applySectionId(sectionList[i]);
  }
}

//Met à jour le summary s'il existe, le créé sinon.
function updateSummary() {
  summary = document.getElementById("summary");
  if (summary != undefined) {
    var children = summary.childNodes;
    while (children.length > 0) {
      summary.removeChild(summary.firstChild);
    }
  } else {
    var summary = document.getElementById("summary");
    summary = document.createElement("div");
    summary.id = "summary";
    summary.setAttribute("contenteditable",false);
    insertHTML(summary);
  }
  var subSecs = document.getElementsByClassName("sectionSub");
  constructSummary(subSecs,summary);
}

//Renvoi vrai si le node est dans la div editable
function isInEditable(node) {
  while (node.nodeName != "HTML") {
    if (node.getAttribute && node.getAttribute("contenteditable")) {
      return true;
    }
    node = node.parentNode;
  }
  return false;
}

//Assure que la hiérarchie de nos structures de nodes est respectée (remonte le node cible pour qu'il
// soit à sa place)
function setHierarchy(node, parent) {
  if (!(parent.className.includes("sectionSub")) && parent.getAttribute("id") != "contenteditor")  {
    parent.removeChild(node);
    return setHierarchy(parent.parentNode.insertBefore(node, parent), parent.parentNode);
  }
  parent.insertBefore(document.createElement("p"), node);
  parent.insertBefore(document.createElement("p"), node.nextSibling);
  return true;
}

//Donne le numéro approprié à la section selon la structure de nodes.
var length;
var rank;
function applyRanking(text, node) {
  var parentNode =  node.parentNode;
  var previous = null;
  while (node.previousSibling != null) {
    node = node.previousSibling;
    if (node.nodeName == 'SECTION') {
      previous = node;
      break;
      //à faire plus joli!
    }
  }
  if (previous == null) {
    if (parentNode.nodeName == "SECTION") {
      var toSplit = parentNode.firstChild.firstChild.textContent;
      return text.firstChild.firstChild.textContent = toSplit + "." + 1;
    } else {
      if (parentNode.getAttribute("id") == "contenteditor") {
        return text.firstChild.firstChild.textContent = 1;
      }
    }
  }
  if (parentNode.getAttribute("id") == "contenteditor") {
    var content = previous.firstChild.firstChild.textContent;
    content++;
    return text.firstChild.firstChild.textContent = content;
  }
  var toSplit = previous.firstChild.firstChild.textContent;
  toSplit = toSplit.split(".");
  var last = toSplit[toSplit.length - 1];
  last++;
  toSplit.pop();
  var begining = toSplit.join(".");
  return text.firstChild.firstChild.textContent = begining + '.' + last;
}

//Applique à l'Id des span des sections le numéro qui leur est propre. Ce numéro
// est intercalé de 's' au lieu des '.'
function applySectionId(node) {
  var id;
  var list;
  id = node.firstChild.firstChild.textContent;
  list = id.split(".");
  id = list.join("s");
  node.firstChild.setAttribute("id", id);
}

// Créer le text à appliquer au Summary en fonction de la structure des sections.
// Entreposé dans une div non-editable, le summary possède des liens à chaque
// section différente
function constructSummary(nodeList, summary) {
  var i;
  for (i = 0; i < nodeList.length; ++i) {
    var section = document.createElement("p");
    var link = document.createElement("a");
    var bookmark = nodeList[i].firstChild.getAttribute("id");
    link.setAttribute("href", "#" + bookmark);
    link.appendChild(document.createTextNode(nodeList[i].firstChild.textContent));
    section.appendChild(link);
    summary.appendChild(section);
  }
  return summary;
}

// Change la classe d'un élément.
function classChange(oldchar,newchar) {
  var element = document.getElementsByClassName(oldchar);
  var x;
  while (element.length > 0) {
    element[0].className = newchar;
  }
}
//Ajoute les '\' nécessaire au bon fonctionnement de la conversion latex->mathml
function addNecessaryBackSlashes(latex) {
  return latex.replace(/\\/g, "\\\\\\");
}

//Fonction ajax mettant à jour le mathml provenant du latex
function updateMathml(node) {
  var url = document.getElementById("whereToConvertLatex").value;
  var ajax = createXhrObject();
  ajax.open("post", url, true);
  ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  ajax.onreadystatechange = function () {
    if (ajax.readyState == 4 && ajax.status == 200) {
      node.originalTarget.nextSibling.innerHTML = ajax.responseText;
    }
  }
  ajax.send("data="+encodeURIComponent(addNecessaryBackSlashes(node.originalTarget.textContent)));
}

//Insère les nodes d'édition du latex et de l'affichage du mathml dans la sélection
function insertLatex() {
  var math = document.createElement("div");
  math.setAttribute("contenteditable",false);
  var mathml = document.createElement("div");
  mathml.className = "mathmlCode";
  mathml.setAttribute("contenteditable",false);
  var killdiv = document.createElement("div");
  killdiv.className = "killDiv closeItemLatex";
  killdiv.addEventListener("click", killDiv);
  killdiv.innerHTML = "[Supprimer la formule]";
  var latex = document.createElement("div");
  latex.className = "latexCode";
  latex.innerHTML = "[...]";
  latex.setAttribute("contenteditable",true);
  math.appendChild(latex);
  math.appendChild(mathml);
  math.appendChild(killdiv);
  math.className = "mathFormula";
  insertHTML(math);
  latex.addEventListener("input", updateMathml, false);
}

//Ajoute des eventListeners à tous les éléments latex
function setAllUpdateLatex() {
  var divs = document.getElementsByClassName("latexCode");
  for (var i = 0; i < divs.length; ++i) {
    divs[i].addEventListener("input", updateMathml, false);
  }
}

//Enlève les éléments mathml et latex en enlevant leur node parent
function killDiv(node) {
  node.originalTarget.parentNode.parentNode.removeChild(node.originalTarget.parentNode);
}
function setDivKillers() {
  var dk = document.getElementsByClassName("killDiv");
  for (var i = 0; i < dk.length; ++i ) {
    dk[i].addEventListener("click", killDiv);
  }
}

//Ajoute des eventListeners à tous les éléments tag
function setTagKillers() {
  var tk = document.getElementsByClassName("tagKill");
  for (var i = 0; i < tk.length; ++i ) {
    tk[i].addEventListener("click", killtag);
  }
}

//Enlève tous les tags correspondant au node envoyé en paramètre
function killtag(node) {
  node = node.originalTarget;
  var allTags = document.getElementsByClassName("tag");
  var allText = "";
  for (var i = 0; i < allTags.length; ++i) {
    allText += allTags[i].innerText;
  }
  var reg = new RegExp(node.previousSibling.nodeValue,"g");
  var todel= allText.replace(reg, "");
  var todel = todel.split("[X]");
  todel = todel.join(";")
  var url = document.getElementById("whereToKillTag").value;
  var id = document.getElementById("Id").value;
  var ajax = createXhrObject();
  ajax.open("post", url, true);
  ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  ajax.send("Tags="+todel+"&Id="+id);
  var parent = node.parentNode;
  parent.parentNode.removeChild(parent);
}

//Vérifie si le tag existe deja dans tagsList
function isInTag(text) {
  var tagsList = document.getElementById("tagsList");
  var i;
  var node;
  for (i = 1; i < tagsList.childNodes.length; ++i) {
    node = tagsList.childNodes[i].firstChild;
    if (node != null && node.nodeValue == text) {
      return true;
    }
  }
  return false;
}

//Ajoute un tag 'temporaire' correspondant au tag envoyé à la base de donnée.
//Donne à la vue
function addTag() {
  if (articleTags.value != "") {
    var tagsList = document.getElementById("tagsList");
    if (!isInTag(articleTags.value)){
      var tag = document.createElement("li");
      tag.className = "tag";
      var text = document.createTextNode(articleTags.value);
      tag.appendChild(text);
      var tagkiller = document.createElement('span');
      tagkiller.className = "tagKill closeItemTag";
      tagkiller.innerText = "[X]";
      tagkiller.addEventListener("click", killtag);
      tagsList.appendChild(tag);
      tag.appendChild(tagkiller);      
    }
  }
  articleTags.value = '';
}



//Créé un élément a en fonction de l'élément de la sélection
function makeLink() {
  sel = window.getSelection();
  sel.anchorNode.data.replace("http://","");
  if (sel != '') {
    var link = document.createElement("a");
    console.log(link);
    link.setAttribute("href", "http://" + sel);
    link.innerText = sel;
    console.log(link);
    insertHTML(link);
    link.parentNode.removeChild(link.nextSibling);
  }
}
