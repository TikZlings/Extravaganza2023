# clean up old video
rm IoT.mp4

# convert to png images
pdftoppm -png -r 240 -progress IoT.pdf IoT

# convert to video
ffmpeg  -ss 00:00:00 -i IoT-%03d.png -ss 00:00:10 -i The_Paragons_-_The_Tide_Is_High_Official_Audio-SQXqkiKXiHc.m4a -shortest IoT_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i IoT_raw.mp4 -o IoT.mp4

# clean up
rm IoT-*.png
rm IoT_raw.mp4

# view :)
open IoT.mp4