# How to
## Pulling image
```
docker pull m0rf30/simonpi
```

## Running container

Please run
```
docker run -ti --privileged -v /dev:/dev -v /root/.simonpi:/root/.simonpi m0rf30/simonpi simonpi rpi-3 -s 2
```
to generate a Raspberry Pi 3 image 

Next fire up your RPI3 container with:
```
docker run -ti --privileged -v /dev:/dev -v /root/.simonpi:/root/.simonpi m0rf30/simonpi
```
