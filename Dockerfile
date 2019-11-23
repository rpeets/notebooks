FROM python:3.7.5-stretch

RUN apt-get update \
    && apt-get install -y vim sudo \
    && pip install --upgrade pip \
    && pip install jupyter pandas xlrd openpyxl pymongo \
    && pip install plotly_express dash cufflinks \
    && pip install requests 

# Run service of Jupyter.
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 8888

CMD [ "jupyter", "--version" ]

# docker image build -f Dockerfile -t jnb .
# docker container run -d -p 8888:8888 -v $PWD/notebooks:/home --name jnb jnb
# docker logs jnb
