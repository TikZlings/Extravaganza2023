# clean up old video
rm belafonte.mp4

# convert to png images
pdftoppm -png -r 240 -progress belafonte_repeat.pdf belafonte

# convert to video
ffmpeg  -ss 00:00:00 -i belafonte-%03d.png -ss 00:00:52 -i Harry_Belafonte_-_Day-O_The_Banana_Boat_Song_1956-d-Bwc0wcIKA.m4a -shortest belafonte_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i belafonte_raw.mp4 -o belafonte.mp4

# clean up
rm belafonte-*.png
rm belafonte_raw.mp4

# view :)
open belafonte.mp4