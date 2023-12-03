# clean up old video
rm Believers.mp4

# convert to png images
pdftoppm -png -r 240 -progress Believers_repeat.pdf Believers

# convert to video
ffmpeg  -ss 00:00:00 -i Believers-%03d.png -ss 00:00:29 -i ABBA_I_Have_A_Dream-nrmhAvwBfig.m4a -shortest Believers_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i Believers_raw.mp4 -o Believers.mp4

# clean up
rm Believers-*.png
rm Believers_raw.mp4

# view :)
open Believers.mp4