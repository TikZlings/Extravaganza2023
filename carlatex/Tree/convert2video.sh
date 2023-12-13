# clean up old video
rm Xmas_duck_tree.mp4

# convert to png images
pdftoppm -png -r 240 -progress Xmas_duck_tree_repeat.pdf Xmas_duck_tree

# convert to video
ffmpeg  -ss 00:00:00 -i Xmas_duck_tree-%03d.png -ss 00:00:05 -i Rockin_Around_The_Christmas_Tree-Brenda_Lee-O1x-hOOrl5E.m4a -shortest Xmas_duck_tree_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i Xmas_duck_tree_raw.mp4 -o Xmas_duck_tree.mp4

# clean up
rm Xmas_duck_tree-*.png
rm Xmas_duck_tree_raw.mp4

# view :)
open Xmas_duck_tree.mp4