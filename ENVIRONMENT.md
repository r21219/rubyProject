# Ruby on Rails

## Spuštění serveru - http://localhost:3000/

```
# win power shell
$ .\win_rails.bat
$ docker run --rm -it -v ${PWD}:/ruby --add-host=host.docker.internal:host-gateway -e WINDIR -p 3000:3000 registry.gitlab.railsformers.com/osu/osu-rails-7

# win cmd
$ win_rails.bat
$ docker run --rm -it -v %cd%:/ruby --add-host=host.docker.internal:host-gateway -e WINDIR -p 3000:3000 registry.gitlab.railsformers.com/osu/osu-rails-7

# win git bash
$ winpty bash ./win_bash_rails.bat
$ winpty docker run --rm -it -v "/$(pwd -W):/ruby" --add-host=host.docker.internal:host-gateway -e WINDIR -p 3000:3000 registry.gitlab.railsformers.com/osu/osu-rails-7

# linux bash
$ ./linux_rails.sh
$ docker run --rm -it -v $PWD:/ruby --add-host=host.docker.internal:host-gateway -p 3000:3000 -u $(id -u):$(id -g) registry.gitlab.railsformers.com/osu/osu-rails-7
```

## Spuštení interaktivní konzole nebo příkazu

```
# win power shell
$ .\win_rails.bat rails c
$ docker run --rm -it -v ${PWD}:/ruby --add-host=host.docker.internal:host-gateway -e WINDIR registry.gitlab.railsformers.com/osu/osu-rails-7 rails c

# win cmd
$ win_rails.bat rails c
$ docker run --rm -it -v %cd%:/ruby --add-host=host.docker.internal:host-gateway -e WINDIR registry.gitlab.railsformers.com/osu/osu-rails-7 rails c

# win git bash
$ winpty bash ./win_bash_rails.bat rails c
$ winpty docker run --rm -it -v "/$(pwd -W):/ruby" --add-host=host.docker.internal:host-gateway -e WINDIR registry.gitlab.railsformers.com/osu/osu-rails-7 rails c

# linux bash
$ ./linux_rails.sh rails c
$ docker run --rm -it -v $PWD:/ruby --add-host=host.docker.internal:host-gateway -u $(id -u):$(id -g) registry.gitlab.railsformers.com/osu/osu-rails-7 rails c
```

## Testy lze spustit příkazem
```
# win power shell
$ .\win_rails.bat rspec
$ docker run --rm -it -v ${PWD}:/ruby --add-host=host.docker.internal:host-gateway -e WINDIR registry.gitlab.railsformers.com/osu/osu-rails-7 rspec

# win cmd
$ win_rails.bat rspec
$ docker run --rm -it -v %cd%:/ruby --add-host=host.docker.internal:host-gateway -e WINDIR registry.gitlab.railsformers.com/osu/osu-rails-7 rspec

# win git bash
$ winpty bash ./win_bash_rails.bat rspec
$ winpty docker run --rm -it -v "/$(pwd -W):/ruby" --add-host=host.docker.internal:host-gateway -e WINDIR registry.gitlab.railsformers.com/osu/osu-rails-7 rspec

# linux bash
$ ./linux_rails.sh rspec
$ docker run --rm -it -v $PWD:/ruby --add-host=host.docker.internal:host-gateway -u $(id -u):$(id -g) registry.gitlab.railsformers.com/osu/osu-rails-7 rspec
```

## MailHog - http://localhost:8025/
```
docker run --rm -p 8025:8025 -p 1025:1025 mailhog/mailhog
```
