# tumblr_uploadr

CLI to upload photos in batch to your Tumblr :panda_face:

![](http://i.giphy.com/j9ktGGi1AQXFC.gif)

## Installation

```shell
$ git clone https://github.com/dkhamsing/tumblr_uploadr.git
```

## Usage

`tumblr_uploadr` sends photos to your Tumblr drafts from the command line.

```
tumblr_uploadr <tumblr> <folder> [caption]
```

`caption` is optional.

### Examples

```shell
$ ruby tumblr_uploadr dkhamsing-travel tokyo16/ 'Tokyo 2016'
```

```shell
$ ruby tumblr_uploadr dkhamsing photos/

uploadr 0.1.0
writing log to tumblr_log
uploading photos/ to dkhamsing.tumblr.com ...
found 49 jpgs
1/49 uploading photos/IMG_5619.JPG ...
# ...
```

## Credits

- [`tumblr_client`](https://github.com/tumblr/tumblr_client)
- [giphy](http://gph.is/19776Kk)

## Alternatives

- [miohtama/tumblr-upload](https://github.com/miohtama/tumblr-upload/) `python`
- [bfred-it/tumblr-upload](https://github.com/bfred-it/tumblr-upload) `node` `js`

## Contact

- [github.com/dkhamsing](https://github.com/dkhamsing)
- [twitter.com/dkhamsing](https://twitter.com/dkhamsing)

## License

This project is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
