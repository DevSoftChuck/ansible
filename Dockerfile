FROM ubuntu:noble
ARG TAGS
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt update && \
    apt install -y curl git ansible build-essential

COPY . .

# USER root
# # Create a new user
# RUN addgroup group1 
# RUN adduser chuckie --ingroup group1 --home /home/chm
# RUN chown -R chuckie:group1 /usr/local/bin
#
# USER chuckie
# CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
