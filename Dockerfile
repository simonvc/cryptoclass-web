FROM ubuntu

RUN apt-get -y install git-core nginx python
RUN git clone https://github.com/simonvc/cryptoclass-web.git /cryptoclass
EXPOSE 80

ADD serve.sh /serve.sh
CMD '/serve.sh'
