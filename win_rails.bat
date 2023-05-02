@echo off
echo.

if [%1]==[] goto server
docker run --rm -it -v %cd%:/ruby --add-host=host.docker.internal:host-gateway -e WINDIR registry.gitlab.railsformers.com/osu/osu-rails-7 %*
goto :eof

:server
docker run --rm -it -v %cd%:/ruby --add-host=host.docker.internal:host-gateway -e WINDIR -p 3000:3000 registry.gitlab.railsformers.com/osu/osu-rails-7
