# Use uma imagem do Ruby
FROM debian:bullseye

# Configurar o diretório de trabalho no contêiner
WORKDIR /aba-project-rails-api

# Instalar dependências do sistema
RUN apt-get update -qq && \ 
    echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d && \
    apt-get install -y build-essential libvips bash bash-completion libffi-dev tzdata nodejs npm yarn gnupg wget sudo && \
    sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt bullseye-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - && \
    apt-get update && \
    apt-get -y install postgresql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man

# Instalar gems
COPY Gemfile /aba-project-rails-api/Gemfile
COPY Gemfile.lock /aba-project-rails-api/Gemfile.lock
RUN gem install bundler:2.2.26
RUN bundle install

# Copiar o restante do código para o contêiner
COPY . /aba-project-rails-api

# Expor a porta 3000
EXPOSE 3000

# Iniciar o servidor
CMD  ["rails", "server", "-b", "0.0.0.0"]
