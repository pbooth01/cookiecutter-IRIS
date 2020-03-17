FROM python:3.7

#install pipenv
RUN pip install pipenv

#add the pipenv.lock file
ADD Pipfile* /

RUN pipenv install

ADD ./Templates /Templates
ADD ./generate.py /

CMD pipenv run python generate.py