set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

build:
    docker build -t paddlepaddle/paddle-lite -f lite/tools/Dockerfile.mobile.dockerfile .

bash:
    docker run -it --rm \
    -v "${PWD}:/lite" \
    paddlepaddle/paddle-lite bash
