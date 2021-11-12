FROM ruby:3

WORKDIR /usr/src/app

RUN apt-get update && apt-get upgrade -y && apt-get install -y nodejs npm redis-tools

COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN npm install --global yarn

RUN rails db:create db:migrate db:seed
RUN rails webpacker:install

COPY . .

CMD ["rails s -b 0.0.0.0 -p 3000"]
