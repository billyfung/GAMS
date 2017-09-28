FROM ubuntu:16.04

RUN apt-get update && apt-get install -y
RUN apt-get install curl -y
 apt-get install software-properties-common
 add-apt-repository ppa:fkrull/deadsnakes
 apt-get install python3.4

# Download appropriate GAMS-Version
RUN curl -SL https://d37drm4t2jghv5.cloudfront.net/distributions/24.9.1/linux/linux_x64_64_sfx.exe -o ./linux_x64_64_sfx.exe

RUN chmod 755 ./linux_x64_64_sfx.exe
RUN ./linux_x64_64_sfx.exe

RUN alias gams=/gams24.9_linux_x64_64_sfx/gams
RUN alias gamslib=/gams24.9_linux_x64_64_sfx/gamslib

cd /gams24.9_linux_x64_64_sfx/apifiles/Python/api_34
python3.4 setup.py install