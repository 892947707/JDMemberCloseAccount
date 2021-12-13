FROM python:3.9-slim

ENV TZ=Asia/Shanghai
ENV LANG C.UTF-8
WORKDIR /code
COPY . .
RUN apt-get update && apt-get install gnupg2 -y \
    && dpkg -i google-chrome-stable_95.0.4638.54-1_amd64.deb && google-chrome --version \
    && cat requirements.txt |grep -vE "easyocr|baidu"|awk -F "~" '{print $1}'|xargs pip3 install --no-cache-dir

CMD [ "jd_wstool" ]
ENTRYPOINT [ "python" ,"main.py" ]