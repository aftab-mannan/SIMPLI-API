 FROM maven:3.6.3-jdk-11
# FROM ubuntu


# WORKDIR /usr/src/app


RUN apt-get update        
RUN apt-get install -y git
RUN mkdir /home/sampleTest      
RUN cd /home/sampleTest
WORKDIR /home/sampleTest    
# RUN git clone https://github.com/hawisback/karate.git
# WORKDIR /home/sampleTest/karate
RUN git clone https://github.com/jagadish12/SampleTest.git
WORKDIR /home/sampleTest/SampleTest

# CMD mvn -e test
# RUN mvn install:install-file -DgroupId="com.intuit.karate" -DartifactId="karate-parent" -Dversion="1.1.0" -Dpackaging="jar" -Dfile="karate-parent-1.1.0.jar"
#  CMD mvn test