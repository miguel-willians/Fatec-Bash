#!/bin/bash

read -p "Digite o tempo de execução:" tempo
tempoMin=$[tempo/60]
tempoSeg=$[tempo%60]
echo
echo -e "O tempo de execução é: $tempoMin minutos e $tempoSeg segundos"
