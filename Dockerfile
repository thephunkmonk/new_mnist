FROM python:3.11

WORKDIR /code

RUN apt update
RUN apt install -y cron
COPY ml-work-cronjob /etc/cron.d/ml-work-cronjob
RUN crontab /etc/cron.d/ml-work-cronjob

COPY src/mnist/main.py /code/
COPY run.sh /code/run.sh

RUN pip install --no-cache-dir --upgrade git+https://github.com/dMario24/mnist.git@0.5.5

CMD ["sh", "run.sh"]
