FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y curl wget sudo software-properties-common apt-transport-https

RUN curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - && \
    add-apt-repository "$(curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list)"

RUN apt-get update && \
    apt-get -y install mssql-server-is

RUN SSIS_PID=Express ACCEPT_EULA=Y /opt/ssis/bin/ssis-conf -n setup; exit 0