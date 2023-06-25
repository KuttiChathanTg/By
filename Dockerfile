FROM anasty17/mltb:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get -qq install mediainfo -y
RUN apt-get install git -y
RUN git clone https://github.com/KuttiChathanTg/Test /usr/src/app
RUN chmod 777 /usr/src/app
WORKDIR /usr/src/app
COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN chmod +x /usr/local/bin/extract && chmod +x /usr/local/bin
COPY .netrc /root/.netrc
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY config.env .
COPY . .

CMD ["bash", "start.sh"]
