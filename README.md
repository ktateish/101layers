# 101layers - Docker image that have more than 101 layers

This image is not useful at all.

## Usage

Pull the image

```
$ docker pull ktateish/101layers
```

Inspect the number of layers

```
$ docker  history -q ktateish/101layers:latest  |wc -l
122
```

Yes, it actually has 122 layers to make sure of that.
