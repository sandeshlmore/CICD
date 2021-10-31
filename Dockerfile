FROM python:3.8.3
ENV PYTHONUNBUFFERED 1
ENV APP_HOME=/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
RUN apt-get update
RUN python -m pip install --upgrade pip
COPY . $APP_HOME
RUN pip install -r /app/requirements.txt
CMD ["uvicorn", "app:app","--reload", "--host", "0.0.0.0", "--port", "8080"]