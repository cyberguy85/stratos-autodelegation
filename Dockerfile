FROM ubuntu:20.04

# set working directory
WORKDIR /root/


# update and install packages
RUN apt-get update \
  && apt-get update \
  && apt-get install python3 python3-pip git openssh-client apt-utils curl jq wget build-essential gcc jq snapd -y

# install go
RUN wget https://go.dev/dl/go1.17.6.linux-amd64.tar.gz
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"

# copy the stratosd files
RUN mkdir $HOME/stratos
RUN cp stratos
RUN wget https://github.com/stratosnet/stratos-chain/releases/download/v0.6.1/stchaincli
RUN wget https://github.com/stratosnet/stratos-chain/releases/download/v0.6.1/stchaind
RUN chmod +x * && mv * /usr/bin/ && cd

# copy install the requirements
ADD ./stratos-autodelegation.py /root/
ADD ./requirements.txt /root/
RUN pip3 install -r requirements.txt

# run the script
CMD /usr/local/bin/stratos start
