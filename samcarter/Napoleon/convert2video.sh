# clean up old video
rm Napoleon.mp4

# convert to png images
pdftoppm -png -r 240 -progress Napoleon_repeat.pdf Napoleon

# convert to video
ffmpeg  -ss 00:00:00 -i Napoleon-%03d.png -ss 00:00:50 -i Sauron_s_March_-_Lord_Of_Mordor-P3bQ7wL1f0o.m4a -shortest Napoleon_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i Napoleon_raw.mp4 -o Napoleon.mp4

# clean up
rm Napoleon-*.png
rm Napoleon_raw.mp4

# view :)
open Napoleon.mp4
