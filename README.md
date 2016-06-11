# viossat/keeweb-webdav

Free cross-platform password manager compatible with KeePass.
https://keeweb.info/

This image supports WebDAV, this makes possible to store/sync password files on the same container.

Note: Over WebDAV, KeeWeb can update files but can't currently create them, the files must exist.

- Alpine-based, 12.2 MB
- no TLS support, reverse proxy with TLS recommended

## Usage

First, start KeeWeb (`/my/password-files` must contain the password file):
```bash
docker run -d -p 80:80 -e WEBDAV_USERNAME=username -e WEBDAV_PASSWORD=password -v /my/password-files:/var/www/html/webdav viossat/keeweb-webdav
```

Then, go to KeeWeb through your browser, click on `More`, click on `WebDAV` and enter your configuration:
```
URL: https://example.com/webdav/filenanme
Username: username
Password: password
```

