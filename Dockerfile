# Dockerfile
FROM ruby:3.0.2

# Instalar dependencias necesarias
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Configurar directorio de trabajo
WORKDIR /sammystore

# Copiar Gemfile y Gemfile.lock
COPY Gemfile* ./

# Instalar gems
RUN bundle install

# Copiar el resto del código de la aplicación
COPY . .

# Precompilar activos si estás utilizando Rails con Asset Pipeline
# RUN bundle exec rake assets:precompile

# Configurar la ejecución de la aplicación
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
