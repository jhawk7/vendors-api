FROM ruby:3.1.3-alpine3.17
EXPOSE 3000
ENTRYPOINT rails db:create && rails db:migrate && rails db:seed && bundle exec puma -C config/puma.rb
RUN mkdir /home/webapp
WORKDIR /home/webapp
COPY . ./
RUN apk add --update --no-cache \
build-base \
ruby-dev \
tzdata \
gcompat \
mariadb-dev && \
bundle install && \
rm -rf /var/cache/apk/*