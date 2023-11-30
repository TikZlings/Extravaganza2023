# clean up old video
rm companion.mp4

# convert to png images
pdftoppm -png -r 240 -progress companion_repeat.pdf companion

# convert to video
# ffmpeg  -ss 00:00:00 -i companion-%03d.png -ss 00:00:10 -i Music.m4a -shortest companion_raw.mp4
ffmpeg  -ss 00:00:00 -i companion-%03d.png companion_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i companion_raw.mp4 -o companion.mp4

# clean up
rm companion-*.png
rm companion_raw.mp4

# view :)
open companion.mp4
