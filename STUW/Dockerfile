FROM mtmiller/octave

# Initialize octave packages
RUN octave --eval "pkg install image control signal -forge"

# Setup code
ADD https://sites.google.com/site/leofangyuming/Home/videosaliency/published_code.zip .
RUN unzip published_code.zip && mv /published_code /stuw
#COPY ./published_code /stuw
WORKDIR /stuw

COPY ./.octaverc /stuw
COPY ./octave_imfilter.m .
COPY ./octave_rescale.m .

COPY ./process_folder.m .
COPY ./0001-Run-in-octave.patch .
RUN patch -p1 < 0001-Run-in-octave.patch
