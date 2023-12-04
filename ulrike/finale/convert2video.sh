# clean up old video
rm finale.mp4

# convert to png images
pdftoppm -png -r 240 -progress finale.pdf finale

# convert to video
ffmpeg  -ss 00:00:00 -i finale-%03d.png -ss 00:00:30 -i Joy_to_the_World_2017_-_Gabriel_Trumpet_Ensemble_The_Tabernacle_Choir-7r3VVMUhAxU.m4a -shortest finale_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i finale_raw.mp4 -o finale.mp4

# clean up
rm finale-*.png
rm finale_raw.mp4

# view :)
open finale.mp4
