/**
 * Fonction qui renvoie le caractère de {chaine} selon son {indice} si l'indice se trouve dans chaine
 * sinon renvoie 'z'
 * @param {*} chaine 
 * @param {*} indice 
 */

const identifierChar = (chaine, indice) => {
    if (indice <= chaine.length-1 && indice >= 0){
        return chaine.substr(indice,1);
    }
    else {
        return 'z';
    }
}

/**
 * Fonction qui détermine le nombre d'occurence successive d'un caractére
 * @param {*} chaine 
 * @param {*} indiceStart 
 */

const combienSuccessionIdentique = (chaine, indiceStart) => {
    let charActuel = identifierChar(chaine, indiceStart);
    let incrementIndice = 1;
    while (identifierChar(chaine, indiceStart+incrementIndice)==charActuel){
        incrementIndice++;
    }
    return incrementIndice;
}

/**
 * Fonction qui ajoute la caractère de la quantité et celui du caractère
 * @param {*} chaine 
 * @param {*} chaineSource 
 * @param {*} indice 
 */

const ajouterQuantificateurUnite = (chaine, chaineSource, indice) => {
    chaine += combienSuccessionIdentique(chaineSource,indice);
    chaine += identifierChar(chaineSource, indice);
    return chaine;
}

/**
 * Fonction qui détermine quelle est l'indice du prochain caractère à identifier
 * @param {*} chaine 
 * @param {*} indiceStart 
 */

const nouvelIndiceDeLecture = (chaine, indiceStart) => {
    let charActuel = identifierChar(chaine, indiceStart);
    let incrementIndice = 1;
    while (identifierChar(chaine, indiceStart+incrementIndice)==charActuel){
        incrementIndice++;
    }
    return indiceStart+incrementIndice;
}

/**
 * Fonction qui détermine la suite suivante à partir d'une chaine de caractère
 * @param {*} chaine 
 */

const determineEtapeApres = (chaine) => {
    let indiceActuel = 0;
    let chaineApres = "";
    while (indiceActuel!=chaine.length){
        chaineApres = ajouterQuantificateurUnite(chaineApres, chaine, indiceActuel);
        indiceActuel = nouvelIndiceDeLecture(chaine, indiceActuel);
    }
    return chaineApres;
}

/**
 * Fonction qui affiche la suite de Conway
 * @param {*} chaine 
 * @param {*} start 
 * @param {*} occurence 
 */

const recursiveSuiteBizzare = (chaine, start, occurence) => {
    if (start <= occurence){
        start++;
        console.log(chaine)
        recursiveSuiteBizzare(determineEtapeApres(chaine),start, occurence);
    }
}

recursiveSuiteBizzare("1",1 ,10);


/*
Tests unitaires:

console.log("identifierChar : "+ identifierChar("121113",5));
console.log("combienSuccessionIdentique : " +combienSuccessionIdentique("121113",1));
console.log("ajouterQuantificateurUnite : " + ajouterQuantificateurUnite("","2",0))
console.log("nouvelIndiceDeLecture : " + nouvelIndiceDeLecture("121113",2));
console.log("determineEtapeApres : " + determineEtapeApres("1211"));

*/