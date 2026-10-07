#!/bin/bash

MOVIES=("nuvve nuvve" "nuvvu naku nachavu" "manasanta nuvve" "ninne pelladata")

echo "first movie: $ {MOVIES[0]}"
echo "final movie: $ {MOVIES[3]}"
echo "all movie: $ {MOVIES[@]}"

