# clean up old video
rm churchoftex.mp4

# convert to png images
pdftoppm -png -r 240 -progress churchoftex_repeat.pdf churchoftex

# convert to video
ffmpeg  -ss 00:00:00 -i churchoftex-%03d.png -ss 00:00:23 -i O_Come_All_Ye_Faithful_Adeste_Fideles_at_Westminster_Abbey-l1wHyMR_SCA.m4a -shortest churchoftex_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i churchoftex_raw.mp4 -o churchoftex.mp4

# clean up
rm churchoftex-*.png
rm churchoftex_raw.mp4

# view :)
open churchoftex.mp4