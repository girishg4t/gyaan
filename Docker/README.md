### Entry point and command

Cmd is use to run any command in docker container
eg. sleep 5 or bash etc

with cmd if you pass any other command through run command while running the docker container then it will overwrite the container command

Entry point - is use run any command or script inside the container, entry point command will allways be run even you pass any argummend with docker run command and "CMD" which is specified if any will be run after the entry point command

e.g  
FROM Ubuntu  
CMD ["sleep", 5]  

if we run docker run test - it will sleep for 5 second and die 


### Docker networking

3 types of network 
1) bridg - is used to communicate between host and docker container
2) none - no networking is possibe
3) host - it will use the host network and on the host it is mapped it can not use other network

We can create our own network with "docker network create" command

we can see the existing docker container network and ip address with 
"docker inspect container_name"



Order matters for caching :=
1) in Dockerfile add order from least to most freqently changing content, for example

FROM debian  
⛔️COPY ./app  
RUN apt-get update  
RUN apt-get -y install openjdk-8-jdk ssh vim  
COPY ./app  
CMD ["java", "-jar", "/app/target/app.jar"]  

2) more specific copy to limit cache busts ( only copy what's needed. Avoid "COPY ." if possible)
3) use apt-get update and install in one command
4) remove unncessary dependencies (--no-install-recommends)
5) remove package manager cache ( rm -rf /var/lib/apt/lists/*)


### Maintainability
1) user official images where possible eg.  
⛔️FROM debian  
⛔️RUN apt-get update  
⛔️RUN apt-get -y install openjdk-8-jdk ssh vim  
FROM openjdk  
COPY ./app  
CMD ["java", "-jar", "/app/target/app.jar"]  

2) use more specific tags e.g.  
FROM openjdk:  
the latest tag is a rolling tag. Be specifc to prevent unexpected changes in your base image  


Reproducibility  
the dockerfile as blueprint, source code the source of truth  

Multi-stage builds come from a simple idea: “I don’t need to include the C or Go compiler and the whole build toolchain in my final application image

