FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    curl \
    software-properties-common \
    git \
    ftp \
    python3-pip \
    build-essential python3-dev

# Download appropriate GAMS-Version
RUN curl -SL https://d37drm4t2jghv5.cloudfront.net/distributions/24.9.1/linux/linux_x64_64_sfx.exe -o ./linux_x64_64_sfx.exe

RUN chmod 755 ./linux_x64_64_sfx.exe
RUN ./linux_x64_64_sfx.exe

# set alias for gams
RUN alias gams=/gams24.9_linux_x64_64_sfx/gams
RUN alias gamslib=/gams24.9_linux_x64_64_sfx/gamslib

# activate the api
RUN cd gams24.9_linux_x64_64_sfx/apifiles/Python/api_34/
RUN python3.4 setup.py install

RUN export LD_LIBRARY_PATH=/gams24.9_linux_x64_64_sfx:$LD_LIBRARY_PATH
RUN export PATH=/gams24.9_linux_x64_64_sfx:$PATH