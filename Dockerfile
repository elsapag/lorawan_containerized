FROM ubuntu 

#Bypass the question about "Geographic area" while building the docker
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y sudo openssh-server wget systemctl telnet-ssl iputils-ping vim openvpn curl arp-scan net-tools mosquitto mosquitto-clients apt-transport-https dirmngr &&\
    apt-get install -y postgresql redis-server redis-tools &&\
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1CE2AFD36DBCCA00 &&\
    echo "deb https://artifacts.chirpstack.io/packages/3.x/deb stable main" | sudo tee /etc/apt/sources.list.d/chirpsstack.list &&\
    apt-get update  &&\
    apt-get install -y chirpstack-gateway-bridge chirpstack-network-server chirpstack-application-server


COPY bash_script/. /etc/openvpn/
COPY openvpn_configuration/. /etc/openvpn/
COPY configuration/chirpstack-gateway-bridge/. /etc/chirpstack-gateway-bridge/
COPY configuration/chirpstack-network-server/. /etc/chirpstack-network-server/
COPY configuration/chirpstack-application-server/. /etc/chirpstack-application-server/
COPY configuration/eclipse-mosquitto/. /etc/mosquitto/

ENV POSTGRES_PASSWORD=root 

WORKDIR /etc/openvpn  

CMD ["./start.sh"]
