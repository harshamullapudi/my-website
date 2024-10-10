FROM ubuntu:bionic
WORKDIR /opt
COPY ./setup.sh .
COPY ./requirements.txt .
COPY src src
RUN chmod +x setup.sh
RUN bash setup.sh
RUN mv setup.sh ./.setup
RUN mv requirements.txt ./.setup
EXPOSE 5005
WORKDIR /opt/src/
CMD ["python3", "script.py"]
