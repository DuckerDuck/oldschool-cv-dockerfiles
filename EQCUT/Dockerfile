FROM mtmiller/octave

RUN octave --eval "pkg install image -forge"
RUN octave --eval "pkg load image"

COPY EQCUT-Matlab-Code/ /EQCUT-Matlab-Code/
COPY 0001-Run-this-in-octave.patch /EQCUT-Matlab-Code/

RUN cd EQCUT-Matlab-Code && patch -p1 < 0001-Run-this-in-octave.patch

RUN cd EQCUT-Matlab-Code && octave --eval "mex SLIC.cpp"
RUN cd EQCUT-Matlab-Code && octave --eval "mex sup2pixel.cpp"
