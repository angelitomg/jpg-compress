jpg-compress
====================
Simple script to compress JPEG images.

Requeriments
--------------------

Commands required:
* convert
* cut
* wc

Usage
--------------------

### Example with single file

**bash jpg-compress.sh photo.jpg 80**

* photo.jpg -> file to compress (original image will be replaced by compressed image)
* 80 -> image quality after compression

### Example with folder

**bash jpg-compress.sh images/ 70**

* images/ -> folder with jpg images (original images will be replaced with compressed images)
* 70 -> images quality after compression

Author
--------------------

Angelito M. Goulart

www.angelitomg.com
