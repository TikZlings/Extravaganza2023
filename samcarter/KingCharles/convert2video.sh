# clean up old video
rm KingCharles.mp4

# convert to png images
pdftoppm -png -r 240 -progress KingCharles.pdf KingCharles

# convert to video
ffmpeg  -ss 00:00:00 -i KingCharles-%03d.png -ss 00:00:15 -i New_British_National_Anthem_-_God_Save_the_King-_BLGUNQAfyQ.m4a -shortest KingCharles_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i KingCharles_raw.mp4 -o KingCharles.mp4

# clean up
rm KingCharles-*.png
rm KingCharles_raw.mp4

# view :)
# open KingCharles.mp4
