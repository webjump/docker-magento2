#!/bin/bash

# Global variables
CWD=$(pwd)
CONFIG_FILE='config.env'
DOCKER_COMPOSE_FILE='docker-compose.yml'
PROJECT_NAME=$(basename $PWD)
COMMANDS="${@:1}"
CONTAINER_PHP="${PROJECT_NAME}_php_1"

# TODO: MUST fix, make jump global command work in all subfolders of project 
# instead of only project root

CAN_RUN_COMMANDS=true

if [ ! -f $CWD/$CONFIG_FILE ]; then
    echo "No ${CONFIG_FILE} file found on current work directory."
    CAN_RUN_COMMANDS=false
fi

if [ ! -f $CWD/$DOCKER_COMPOSE_FILE ]; then
    echo "No ${DOCKER_COMPOSE_FILE} file found on current work directory."
    CAN_RUN_COMMANDS=false
fi

if [ ! -f $CWD/jump.sh ]; then
    echo 'No jump.sh file found on current work directory.'
    CAN_RUN_COMMANDS=false
fi

if [ ! $(docker inspect -f '{{.State.Running}}' $CONTAINER_PHP) = "true" ]; then 
    echo 'Please start docker container before executing `jump`.'
    echo 'Exiting...'
    exit 1
fi

if [ "$CAN_RUN_COMMANDS" = false ]; then
    echo ''
    echo 'Exiting...'
    exit 1
fi

# If this is the first time executing jump command, set things up!
if [ ! -f /usr/local/bin/jump ]; then

    echo 'Creating jump global command... Root access is required.'
    sudo ln -s "${CWD}/jump.sh" /usr/local/bin/jump
    echo 'Done! You can now use `jump [command]`. Do not delete jump.sh.'

    echo ''

    echo 'Cloning utils into web/utils folder...'
    git clone git@github.com:webjump/docker-magento2-utils.git web/utils
    echo ''

    echo 'Installing utils dependencies...'
    docker exec $CONTAINER_PHP bash -c 'source /opt/.virtualenvs/magento/bin/activate && pip3.6 install -r /var/www/html/utils/requirements.txt'
    echo ''
    echo 'Installation successful. Enjoy! :)'
fi


# All done! Success!
docker exec $CONTAINER_PHP bash -c "source /opt/.virtualenvs/magento/bin/activate && ./utils/util ${COMMANDS}"

exit 0
