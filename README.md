# Minimal Node
The minimal node docker image

![badge](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/johnitvn/7dc952f2c1e7f007191b59518d148b99/raw/minimal-node_image_size.json)
![badge](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/johnitvn/7dc952f2c1e7f007191b59518d148b99/raw/minimal-node_size_saved.json)


By default node:alpine will install node with npm and yarn. But with some application deploy with module bundler like webpack don't need package manager so we will make image without it.

This image is base on node:alpine. But we try to make it more lighter