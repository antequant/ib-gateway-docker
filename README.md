# ib-gateway-docker

This builds a Docker image with the latest version of [Interactive Brokers](https://interactivebrokers.com)' [IB Gateway](https://www.interactivebrokers.com/en/index.php?f=5041), the modern [IbcAlpha/IBC](https://github.com/IbcAlpha/IBC) for automation, and a VNC server for debugging purposes. 

## Building

```sh
docker build . -t ib-gateway-docker
```

## Running

```sh
docker run -p 4002:4002 -p 5900:5900 -it --env TWSUSERID=YOUR_USER_ID --env TWSPASSWORD=YOUR_PASSWORD ib-gateway-docker:latest
```

This will expose port 4002 for the TWS API (usable with, e.g., [ib_insync](https://github.com/erdewit/ib_insync)) and 5900 for VNC (with default password `1358`). **Neither are secure for public internet access**, as the expectation is that private, secure services will sit on top and be the only open interface to the internet.