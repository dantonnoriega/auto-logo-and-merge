# Set-up

1. Install [Homebrew](http://brew.sh/)
2. Install `imagemagick`

```
brew install imagemagick
```

3. Install `ffmpeg`

```
brew install ffmpeg
```

4. Install `rmtrash`

```
brew install rmtrash
```

# Run

1. Open up your Terminal.app
	- easiest is to hit `command+space`, bring up spotlight, and type in "Terminal"
2. Run the script. 
	- Assume you downloaded a zip file to `~/Downloads/auto-logo-and-merge-master.zip` and unzipped the folder `auto-logo-and-merge-master`. Here is a working example.

```
cd ~/Downloads/auto-logo-and-merge-master/
chmod +x run.sh
./run.sh img/P1BHs.png mp4/video-trim-noaudio.mp4 mp4/audio-layer.m4a mp4/merged-ryan.mp4
```

# How it works

It uses the following syntax:

```
./run.sh path/to/logo.png  path/to/video.mp4  path/to/audio.mp3  path/to/output.mp4  "999 999 9999"  "www.somewebsite.com"
```

The last two variables are optional. They default to blank. NOTE: Must use DOUBLE quotes `""`!

It is SUPER IMPORTANT that you use *relative* or *full* paths. For example, *relative* paths like `img/P1BHs.png` or `./img/P1BHs.png` work, as do *full* paths like `/Users/dnoriega/GitHub/auto-logo-and-merge/img/P1BHs.png`. 

But `/img/P1BHs.png` fails because the program assumes *absolute* paths when you start with a `/` and will read it as such. Hence, a *full* path is just an *absolute* path to the file. I recommend using *relative* paths. Just remember: don't start with `/` when using relative paths!

(This distinction was what kept me from getting the thing to work for like 2 hours. So annoying.)

# To-do

You can get imagemagick to use system fonts by following instructions here:
http://gothick.org.uk/2008/03/14/using-os-x-fonts-in-imagemagick/

Once updated, you can change fonts used in the script `gen-logo.sh`. In this particular case, change the `-font Arial` to whatever font you'd like.

```# phone number
convert -size 1280x100 xc:white -font Arial -pointsize 72 -gravity center \
  -stroke black -annotate 0 "$PHONE" \
  ./img/phone.png;
```

You can see the font list typing `convert -list font`.