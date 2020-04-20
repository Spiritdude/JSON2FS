# JSON2FS - Mapping JSON as a File System

Mapping JSON to a file system . . . because it's possible, and because how it should be done - bridging datasets to different views.

![JSON2FS Concept](images/json2fs-example.png)

```
% more test.json
{  
   "a": "hello world",
   "b": {
   },
   "c": "something else",
   "d": [
      "test",
      {  
         "a": "1212",
         "b": {
            "even deeper": 42
         }
      }
   ],
   "e": "last entry"
}

% json2fs test.json

% cd test/

% ls
a  b/  c  d/  e

% more a
hello world

% more d/1/b/even\ deeper
42

```

## Support
- Debian/Ubuntu 18.04/LTS

## Limitations
- highly experimental (unstable)
- read only (see next "Todo")

## Todo
- content which clashes with UNIX filename notion:
  - large or long content
  - \r \n or general non-printable content (e.g. binary)
- "write" support
- deal with huge JSON datasets (and long wait times):
  
## Download
```
% git clone https://github.com/Spiritdude/JSON2FS
% cd JSON2FS
```

## Install

On Debian/Ubuntu 18.04:
```
% sudo make requirements
% make install
```
Note: it just installs `json2fs` to your local `~/bin/`.

## Use 
```
% ./json2fs test.json

% cd test/

% ls -R
.:
a  b/  c  d/  e

./b:

./d:
0  1/

./d/1:
a  b/

./d/1/b:
'even deeper'

$ more d/1/b/even\ deeper 
42
```

## Exit & Unmount
```
% sudo umount test/
```

## Extended Use

Add in `/etc/fuse.conf`:
```
user_allow_other
```

so other users, like a web-server (lighttpd/apache/nginx) can access those mounted database/directories as well.
