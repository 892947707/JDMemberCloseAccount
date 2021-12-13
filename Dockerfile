FROM python:3.9-slim

WORKDIR /code
COPY . .
RUN pwd && ls && apt-get update && apt-get install gnupg2 -y \
    && dpkg -i google-chrome-stable_95.0.4638.54-1_amd64.deb || apt-get update && apt-get -y --fix-broken install && dpkg -i google-chrome-stable_95.0.4638.54-1_amd64.deb && google-chrome --version \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1657198823E52A61  \
    && apt-get clean \
    && cat requirements.txt |grep -vE "easyocr|baidu"|awk -F "~" '{print $1}'|xargs pip3 install --no-cache-dir

CMD [ "python" ,"main.py"]