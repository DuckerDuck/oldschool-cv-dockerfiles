FROM schickling/opencv as opencv

FROM mtmiller/octave

# Copy compiled opencv
COPY --from=opencv /usr/local/include/opencv /usr/local/include/opencv
COPY --from=opencv /usr/local/include/opencv2 /usr/local/include/opencv2
COPY --from=opencv /usr/local/lib/ /usr/local/lib
COPY --from=opencv /etc/ld.so.conf.d/opencv.conf /etc/ld.so.conf.d/opencv.conf
RUN ldconfig

# Initialize octave packages
RUN octave --eval "pkg install image -forge"
RUN octave --eval "pkg load image"

# Setup MBS code
COPY ./MBS /MBS
WORKDIR /MBS

COPY ./process_folder.m .
COPY ./0001-Run-in-octave.patch .
RUN patch -p1 < 0001-Run-in-octave.patch

# Compile mex
RUN cd mex && octave compile.m && mv MBS.mex ../
