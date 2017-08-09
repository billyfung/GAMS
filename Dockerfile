FROM ubuntu:16.04

RUN apt-get update && apt-get install -y
RUN apt-get install curl -y

# Download appropriate GAMS-Version
RUN curl -SL https://d37drm4t2jghv5.cloudfront.net/distributions/24.8.5/linux/linux_x64_64_sfx.exe -o ./linux_x64_64_sfx.exe

RUN chmod 755 ./linux_x64_64_sfx.exe
RUN ./linux_x64_64_sfx.exe
