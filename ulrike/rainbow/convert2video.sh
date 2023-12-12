# clean up old video
rm rainbow.mp4

# convert to png images
pdftoppm -png -r 240 -progress rainbow_repeat.pdf rainbow

# convert to video
ffmpeg  -ss 00:00:00 -i rainbow-%03d.png -ss 00:03:48 -i Eric_Clapton_-_Over_the_Rainbow_with_lyrics-iwlFTYT2Fdw.m4a -shortest rainbow_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i rainbow_raw.mp4 -o rainbow.mp4

# clean up
rm rainbow-*.png
rm rainbow_raw.mp4

# view :)
open rainbow.mp4