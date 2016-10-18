# Set-up

1. Install [Homebrew](http://brew.sh/)
2. Install `imagemagick`

```brew install imagemagick```

3. Install `ffmpeg`

```brew install ffmpeg```

4. Install `rmtrash`

```brew install rmtrash```

# Run

1. Open up your Terminal.app
	- easiest is to hit `command+space`, bring up spotlight, and type in "Terminal"
2. Run the script. Assume you downloaded a zip file to `~/Downloads/auto-logo-and-merge-master.zip` and unzipped the folder `auto-logo-and-merge-master`. Here is a working example.

```
cd ~/Downloads/auto-logo-and-merge-master/
chmod +x run.sh
./run.sh ./img/P1BHs.png ./mp4/video.mp4 ./mp4/merged-ryan.mp4
```

# How it works

```
./run.sh /full/path/to/logo /full/path/to/video.mp4 /full/path/to/audio.mp3 /full/path/to/output.mp4 '999 999 9999' 'www.somewebsite.com'
```

The last two variables are optional. They default to blank.

It is SUPER IMPORTANT that you use FULL paths. For example, relative paths like `/img/P1BHs.png` fail. It MUST be `./img/P1BHs.png` OR `/Users/dnoriega/GitHub/auto-logo-and-merge/img/P1BHs.png`.

This distinction was what kept me from getting the thing to work for like 2 hours. So annoying.