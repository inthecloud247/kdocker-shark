kdocker-shark
=============

shark on spark on a single node. Great for local dev and testing. :-)

To build:

```bash
docker build -t=inthecloud247/kdocker-shark:latest .
```

echo "sharkserver=127.0.1.1" >> /etc/profile.d/shark.sh
echo "127.0.1.1                sharkserver" >> /etc/hosts

Running Sharkserver:

```bash
docker run -i -name="sharkserver" -h sharkserver -p $sharkserver:10000:10000 -p $sharkserver:4040:4040 -p $sharkserver:44:22 -v /data:/data inthecloud247/kdocker-shark:latest supervisord -n
```

echo "sharkclient=127.0.1.2" >> /etc/profile.d/shark.sh
echo "127.0.1.2                sharkclient" >> /etc/hosts

Running Sharkclient:

mkdir -p /mnt/sharkclient/{data,logs}

```bash
docker run -i -name="sharkclient" -h sharkclient -p $sharkclient:10000:10000 -v /mnt/sharkclient/data:/data -v /mnt/sharkclient/logs:/logs -p $sharkclient:4040:4040 -p $sharkclient:44:22 inthecloud247/kdocker-shark:latest supervisord -n
```
