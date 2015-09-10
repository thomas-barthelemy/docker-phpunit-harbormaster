# PHP Unit Docker for Harbormaster / Drydock (Phabricator CI)

## Build

    docker build -t webridge/phpunit-project1 ./

## Run

    docker run -v $(pwd):/code/ -v ~/.composer/cache/:/root/composer/cache/ webridge/phpunit-project1
    
## Step-by-step setup of DryDock and HarborMaster

*Comming soon...*