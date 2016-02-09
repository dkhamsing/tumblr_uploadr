# tumblr_uploadr

CLI to upload photos in batch to your Tumblr :panda_face:

![](http://i.giphy.com/j9ktGGi1AQXFC.gif)

## Installation

```shell
$ git clone https://github.com/dkhamsing/tumblr_uploadr.git
$ cd tumblr_uploadr/
$ rake install # 💰
```

### Credentials

Enter your credentials in `tumblr_uploadr/constants.rb`.

One way to obtain the credentials is using the [`tumblr_client`](https://github.com/tumblr/tumblr_client) console tool. After running it, your information will be in a `.tumblr` file of your home directory.

```shell
$ tumblr
Register an application at: http://www.tumblr.com/oauth/apps
OAuth Consumer key: <consumer key>
OAuth Consumer secret: <consumer secret>

http://www.tumblr.com/oauth/authorize?oauth_token=<token>
Post-redirect, copy the oauth_verifier
OAuth Verifier: <verifier>

        .                                 .o8       oooo
      .o8                                "888       `888
    .o888oo oooo  oooo  ooo. .oo.  .oo.   888oooo.   888  oooo d8b
      888   `888  `888  `888P"Y88bP"Y88b  d88' `88b  888  `888""8P
      888    888   888   888   888   888  888   888  888   888
      888 .  888   888   888   888   888  888   888  888   888    .o.
      "888"  `V88V"V8P' o888o o888o o888o `Y8bod8P' o888o d888b   Y8P
```

## Usage

```
tumblr_uploadr <tumblr> <folder> [caption]
```

`tumblr_uploadr` sends photos to your Tumblr drafts from the command line, `caption` is optional.

### Examples

```shell
$ tumblr_uploadr dkhamsing-travel tokyo16/ 'Tokyo 2016'
```

```shell
# no caption
$ tumblr_uploadr dkhamsing photos/

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
