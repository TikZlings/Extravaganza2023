# clean up old video
rm Titanic.mp4

# convert to png images
pdftoppm -png -r 240 -progress Titanic.pdf Titanic

# convert to video
ffmpeg  -ss 00:00:00 -i Titanic-%03d.png -ss 00:03:25 -i Titanic_My_Heart_Will_Go_On_Celine_Dion-F2RnxZnubCM.m4a -shortest Titanic_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i Titanic_raw.mp4 -o Titanic.mp4

# clean up
rm Titanic-*.png
rm Titanic_raw.mp4

# view :)
open Titanic.mp4