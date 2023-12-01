# clean up old video
rm Prague.mp4

# convert to png images
pdftoppm -png -r 240 -progress Prague.pdf Prague

# convert to video
ffmpeg  -ss 00:00:00 -i Prague-%03d.png -ss 00:01:48 -i Die_Moldau_-_Smetana_NATURE_CLASSICS_-_Klassik_die_man_horen_muss_-_--bWcoNzKRnrw.m4a -shortest Prague_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i Prague_raw.mp4 -o Prague.mp4

# clean up
rm Prague-*.png
rm Prague_raw.mp4

# view :)
open Prague.mp4