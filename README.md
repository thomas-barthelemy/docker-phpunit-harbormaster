# PHP Unit Docker for Harbormaster / Drydock (Phabricator CI)

## Build

    docker build -t webridge/phpunit-project1 ./

## Run

    docker run -v $(pwd):/code/ -v ~/.composer/cache/:/root/composer/cache/ webridge/phpunit-project1
    
## Step-by-step setup of DryDock and HarborMaster

[http://thomas-barthelemy.github.io/2015/09/11/phpunit-phabricator-drydock-harbormaster/](http://thomas-barthelemy.github.io/2015/09/11/phpunit-phabricator-drydock-harbormaster/)