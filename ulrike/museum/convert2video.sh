# clean up old video
rm museum.mp4

# convert to png images
pdftoppm -png -r 240 -progress museum.pdf museum

# convert to video
ffmpeg  -ss 00:00:00 -i museum-%03d.png -ss 00:00:40 -i The_Pink_Panther_Theme-0FMpmp7ERHw.m4a -shortest museum_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i museum_raw.mp4 -o museum.mp4

# clean up
rm museum-*.png
rm museum_raw.mp4

# view :)
open museum.mp4
