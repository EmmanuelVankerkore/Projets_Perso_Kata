Option Explicit
Option Base 0

' Renvoie True si le résultat de la division euclidienne de {dividende} par {diviseur} est 0, False sinon.
Public Function Est_multiple(ByVal dividende As Integer, ByVal diviseur As Integer) As Boolean
    Est_multiple = False
    If dividende Mod (diviseur) = 0 Then
        Est_multiple = True
    End If
End Function

' Renvoie le nombre de multiples que posséde l'entier {nombre_entier}.
Public Function Nombre_de_multiples(ByVal nombre_entier As Integer) As Integer
    Dim i, compteur As Integer
    compteur = 0
    For i = 1 To nombre_entier Step 1
        If Est_multiple(nombre_entier, i) = True Then
            compteur = compteur + 1
        End If
    Next
    Nombre_de_multiples = compteur
End Function

' Renvoie True si {entier} a un nombre de multiples égal à 2, False sinon.
Public Function Est_un_nombre_premier(ByVal entier As Integer) As Boolean
    Est_un_nombre_premier = False
    If Nombre_de_multiples(entier) = 2 Then
        Est_un_nombre_premier = True
    End If
End Function

' Renvoie un tableau contenant les {quantite] premiers nombres premiers.
Public Function Construire_tableau_n_first_nombres_premiers(ByVal quantite As Integer) As Variant
    Dim tableau_nombres_premiers() As Integer
    Dim indice As Integer
    Dim entier As Integer
    ReDim tableau_nombres_premiers(quantite)
    tableau_nombres_premiers(0) = 1
    indice = 1
    entier = 2
    Do While indice <= (quantite - 1)
        If Est_un_nombre_premier(entier) = True Then
            tableau_nombres_premiers(indice) = entier
            indice = indice + 1
        End If
        entier = entier + 1
    Loop
    Construire_tableau_n_first_nombres_premiers = tableau_nombres_premiers
End Function

' Renvoie une chaine de caractères correspondant à une liste d'éléments contenus dans {tableau}.
Public Function Construire_message_pour_affichage(ByVal tableau As Variant)
    Dim message As String
    Dim i As Integer
    message = "["
    For i = 0 To UBound(tableau) - 1 Step 1
        If i <> UBound(tableau) - 1 Then
            message = message + CStr(tableau(i)) + ", "
        ElseIf i = UBound(tableau) - 1 Then
            message = message + CStr(tableau(i)) + "]"
        End If
    Next
    Construire_message_pour_affichage = message
End Function

' Affiche la liste des {quantite} premiers nombres premiers.
Public Sub Afficher_les_n_first_nombres_premiers(ByVal quantite As Integer)
    MsgBox Construire_message_pour_affichage(Construire_tableau_n_first_nombres_premiers(quantite))
End Sub

' Affiche le résultat de quelques tests unitaires.
Public Sub tests_unitaires()
    MsgBox ("2 est un multiple de 5 : " & Est_multiple(5, 2))
    MsgBox ("3 est un multiple de 6 : " & Est_multiple(6, 3))
    MsgBox ("Nombre de multiples de 6 : " & Nombre_de_multiples(6))
    MsgBox ("Nombre de multiples de 7 : " & Nombre_de_multiples(7))
    MsgBox ("3 est un nombre premier : " & Est_un_nombre_premier(3))
    MsgBox ("8 est un nombre premier : " & Est_un_nombre_premier(8))
    MsgBox ("Les 5 premiers nombres premiers : " & Construire_message_pour_affichage(Construire_tableau_n_first_nombres_premiers(5)))
    MsgBox ("Les 10 premiers nombres premiers : " & Construire_message_pour_affichage(Construire_tableau_n_first_nombres_premiers(10)))
    Afficher_les_n_first_nombres_premiers (100)
    Afficher_les_n_first_nombres_premiers (2)
    Afficher_les_n_first_nombres_premiers (1)
End Sub