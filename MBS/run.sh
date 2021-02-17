#!/bin/bash

docker run \
    -v "$(pwd)/input:/MBS/input" \
    -v "$(pwd)/output:/MBS/output" \
    mbs:latest octave process_folder.m
