#!/bin/bash

echo "Updating the total dataset"
 Rscript -e "source('./data_raw/data_refresh.R')"

if [[ "$(git status --porcelain)" != "" ]]; then
    git config --global user.name 'RamiKrispin'
    git config --global user.email 'ramkrisp@umich.edu'
    git add csv/covid19swiss.csv
    git add data/covid19swiss.rda
    git commit -m "Auto update coronavirus data"
    git push
fi
