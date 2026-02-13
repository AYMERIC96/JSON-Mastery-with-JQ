#!/bin/bash

# variable de mon fichier source
fichier="exos.json"

echo "Liste de tous les prénoms"
jq -r '.users[].firstname' $fichier

echo -e "\n Utilisateurs actifs uniquement"
jq '.users[] | select(.active == true)' $fichier

echo -e "\n les noms des utilisateurs actifs"
jq -r '.users[] | select (.active == true) | .lastname' $fichier

echo -e "\n Nombre de dev"
jq '[.users[] | select(.role == "developer")] | length' $fichier

echo -e "\n les noms des dev"
jq '.users[] | select (.role == "developer") | .lastname' $fichier

echo -e "\n Noms complets (triés alphabétiquement)"
jq -r '.users[] | "\(.firstname) \(.lastname)"' $fichier | sort

echo -e "\n Utilisateur avec ID = 3"
jq '.users[] | select(.id == 3)' $fichier

echo -e "\n Développeurs actifs uniquement"
jq '.users[] | select(.role == "developer" and .active == true)' $fichier
