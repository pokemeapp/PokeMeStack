#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit;
fi


unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine="Linux";;
    Darwin*)    machine="Mac";;
    CYGWIN*)    machine="Cygwin";;
    MINGW*)     machine="MinGw";;
    *)          machine="UNKNOWN:${unameOut}"
esac

# Check docker installation
if which -s docker; then
    echo "✔ Docker is installed"
else
    echo "✘ Install docker!"
    exit;
fi

# Check docker-compose installation
if which -s docker-compose; then
    echo "✔ Docker-compose is installed"
else
    echo "✘ Install docker-compose!"
    exit;
fi

# Start the docker containers!
{
  docker-compose up -d
} &> /dev/null

echo "✔ Docker containers are up now"


if which -s pma; then
    echo "✔ pma is installed"
else
    if [ "$machine" == "Mac" ];
    then
        cp pma /usr/local/bin/pma
    fi

    if [ "$machine" == "Linux" ];
    then
        cp pma /usr/bin/pma
    fi
fi

if which -s pmc; then
    echo "✔ pmc is installed"
else
    if [ "$machine" == "Mac" ];
    then
        cp pmc /usr/local/bin/pmc
    fi

    if [ "$machine" == "Linux" ];
    then
        cp pmc /usr/bin/pmc
    fi
fi

if [ ! -f app/.env ]; then
    cp app/.env.example app/.env  
else
    echo "✔ .env exists"
fi

pmc install

pma key:generate
pma vendor:publish
pma passport:install
pma l5-swagger:publish