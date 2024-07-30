---
title: Simple IP Echo
description: A nice and simple whatismyip service with nginx
date: 2010-10-31T09:18:00
tag: nginx
---

Recent projects have given me a need to be able to quickly and easily determine
a public IP address. Although services like whatismyip exist, they are full of
bloat and advertisements.<!--more-->

To streamline this process, many people choose to host their own website that
displays their IP address. This is often achieved by routing the connection
through Apache to PH, using code that resembles the following:

```
<?php
print(getenv(REMOTE_ADDR))
;?>
```

That seems simple and light enough ... but why add PHP into the mix at all?
It's very much so an added bloat. Apache is enough of a bloat without
adding the extra bloat of PHP.

Let's use a real web server and just let the web server do it. The
following is my Nginx configuration file.

```
server {
    server_name ip.lustfield.net;
    location = / {
        default_type text/plain;
        echo $remote_addr;
    }
}
```

I don't think there's a single possible way to get a faster and more
light weight response. Nginx doesn't do any processing aside from seeing
that it's right domain and returning the remote address as plain text.

It's just SO simple and SO pretty.
