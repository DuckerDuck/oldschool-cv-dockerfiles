#!/bin/bash

docker run \
    -v "$(pwd)/input:/stuw/input" \
    -v "$(pwd)/output:/stuw/output" \
    stuw:latest octave process_folder.m
