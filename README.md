# Lorawan_containerized

This repository contians a containerized LoraWAN(otherwise Chirpstack) solution for developers who want to build and deploy:

- Chirpstack Network Server <br>
- Chirpstack Application Server <br>
- Chirpstack Gateway Bridge <br>
in the same container under the same VPN.

<b>Tools we use for LoraWAN build:</b>
- Redis 
- Mosquitto
- PostgreSQL
- Chirpstack Network Server
- Chirpstack Application Server 
- Chirpstack Gateway Bridge  

## Prerequisites:

- You need to update the lora_server/client.ovpn file with yours .ovpn file. <br> 

Please make sure that your .ovpn file will have the same name as in the shell script.

More information about ChirpStack you may find <a href="https://www.chirpstack.io/">here</a>.
