## BEMP (brew nginx mysql php)
Homebrew nginx, PHP5.6  & mysql installation script.

## What it does?
* Install's NGINX, PHP & MYSQL via Homebrew.
* Configures nginx with php-fpm.
* Configures a default nginx virtual host.
* makes `/var/www` your documents root.

##Requirements
 * Homebrew installed
 * XCode CLI installled

##How to install

via curl:
```
curl -L https://raw.githubusercontent.com/thesabbir/bemp/master/install.sh | bash
```

via wget:
```
wget https://raw.githubusercontent.com/thesabbir/bemp/master/install.sh -O - | bash
```

##TODO
* Homebrew & other requirements auto installation.
* Use homebrew service instead of launchctl.

##License

The MIT License

Copyright (c) Sabbir Ahmed

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
