FROM ruby:3.2-alpine
# vips-dev
RUN apk add bash git build-base tzdata nodejs yarn sqlite sqlite-dev imagemagick-dev imagemagick sassc graphviz ttf-dejavu postgresql-dev postgresql-client

WORKDIR /ruby
COPY Gemfile /ruby/Gemfile
COPY Gemfile.lock /ruby/Gemfile.lock

RUN bundle config
RUN bundle config frozen false

RUN echo 'gem: --no-ri --no-rdoc' > ~/.gemrc

RUN gem install pagy kaminari will_paginate
RUN gem install cancancan pundit action_policy
RUN gem install devise rails-i18n
RUN gem install pg haml-rails html2haml

RUN bundle install -j8

EXPOSE 3000
ENTRYPOINT ["bash", "entrypoint.sh"]
CMD ["bundle", "exec", "bin/dev"]
