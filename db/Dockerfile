FROM mysql:8.0.31
EXPOSE 3306
USER root
# sql files within docker-entrypoint-initdb.d are executed automagically on container startup
#COPY ./01-schema.sql /docker-entrypoint-initdb.d/
#COPY ./02-config-data.sql /docker-entrypoint-initdb.d/
#RUN chmod 777 /docker-entrypoint-initdb.d/*.sql
#databased will be initialized and managed through rails:db in vendors api