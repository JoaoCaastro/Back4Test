# Use uma imagem Ruby
FROM ruby:3.2.2

# Configurar o diretório de trabalho no contêiner
WORKDIR /aba-project-rails-api

# Instalar dependências do sistema
RUN apt-get update -qq && \ 
    apt-get install -y build-essential autoconf bison zlib1g g++ libvips libncurses5-dev libffi-dev libgdbm-dev libssl-dev bash bash-completion libffi-dev nano tzdata nodejs npm yarn gnupg wget libyaml-dev sudo apt-transport-https ca-certificates gnupg2 curl && \
    echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d && \
    apt-get -y install postgresql postgresql-contrib && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man

# Instalar gems
COPY Gemfile /aba-project-rails-api/Gemfile
COPY Gemfile.lock /aba-project-rails-api/Gemfile.lock
RUN gem install bundler:2.2.26
RUN bundle install
RUN service postgresql start
RUN rails db:migrate

# Copiar o restante do código para o contêiner
COPY . /aba-project-rails-api

# Expor a porta 3000
EXPOSE 3000
EXPOSE 5432

# Iniciar o servidor
CMD  ["rails", "server", "-b", "0.0.0.0"]