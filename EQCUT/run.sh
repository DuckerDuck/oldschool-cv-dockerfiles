#!/bin/bash

docker run \
    -w /EQCUT-Matlab-Code/ \
    -v "$(pwd)/images:/EQCUT-Matlab-Code/images" \
    -v "$(pwd)/output:/EQCUT-Matlab-Code/output" \
    eqcut:latest octave main.m \
