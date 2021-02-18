#!/bin/bash

docker run \
    -v "$(pwd)/input:/dense/input" \
    -v "$(pwd)/output:/dense/output" \
    dt:latest /dense/release/DenseTrack /dense/input/input.mp4
