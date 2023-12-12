################################################################################
#
# stitching together the videos with transitions
# call with `python3 merge_videos.py`
# 
################################################################################
from moviepy.editor import *
import os

# duration of the transitions between the videos
padding = 1.5

# change volumn VideoFileClip("../samcarter/KingCharles/KingCharles.mp4").volumex(1.0),  
video_clips = [
  VideoFileClip("../intermissions/title.mp4"),
  # Christmas Rocks
  VideoFileClip("../intermissions/KingCharles.mp4"),
  VideoFileClip("../samcarter/KingCharles/KingCharles.mp4"),  
  VideoFileClip("../intermissions/Napoleon.mp4"),
  VideoFileClip("../samcarter/Napoleon/Napoleon.mp4"),    
  VideoFileClip("../intermissions/churchoftex.mp4"),
  VideoFileClip("../ulrike/churchoftex/churchoftex.mp4"),  
  VideoFileClip("../intermissions/Prague.mp4"),
  VideoFileClip("../samcarter/Prague/Prague.mp4"),    
  VideoFileClip("../intermissions/belafonte.mp4"),
  VideoFileClip("../ulrike/belafonte/belafonte.mp4"),  
  VideoFileClip("../intermissions/silentnight.mp4"),
  VideoFileClip("../ulrike/silentnight/silentnight.mp4"),  
  VideoFileClip("../intermissions/Titanic.mp4"),
  VideoFileClip("../samcarter/Titanic/Titanic.mp4"),  
  VideoFileClip("../intermissions/IoT.mp4"),
  VideoFileClip("../samcarter/IoT/IoT.mp4"),  
  VideoFileClip("../intermissions/commercialbreak.mp4"),
  VideoFileClip("../ulrike/commercialbreak/companion.mp4"),  
  VideoFileClip("../intermissions/Believers.mp4"),
  VideoFileClip("../carlatex/Believers/Believers.mp4"),    
  VideoFileClip("../intermissions/rainbow.mp4"),
  VideoFileClip("../ulrike/rainbow/rainwbow.mp4"),  
  VideoFileClip("../intermissions/museum.mp4"),
  VideoFileClip("../ulrike/museum/museum.mp4"),  
  VideoFileClip("../intermissions/finale.mp4"),
  VideoFileClip("../ulrike/finale/finale.mp4"),  
  VideoFileClip("../intermissions/credits.mp4"),
]

################################################################################
#
# merge title and first intermission to get continious audio
#
################################################################################

video_fx_list = []
idx = 0
for video in video_clips[0:2]:
    video_fx_list.append(video.set_start(idx).crossfadein(padding).crossfadeout(padding).audio_fadein(padding).audio_fadeout(padding))
    idx += video.duration - padding

merged_video = CompositeVideoClip(video_fx_list)
duration = merged_video.end

audioclip = AudioFileClip("../intermissions/christmas-music-box-music.m4a").subclip(2,duration+2)
merged_video = merged_video.set_audio(audioclip)

################################################################################
#
# adding rest of the scenes
#
################################################################################

video_fx_list = []
idx = 0

# adding the merged video first
video_fx_list.append(merged_video.set_start(idx).crossfadein(padding).crossfadeout(padding).audio_fadein(padding).audio_fadeout(padding))
idx += merged_video.duration - padding

# rest of the videos
for video in video_clips[2:]:
    video_fx_list.append(video.set_start(idx).crossfadein(padding).crossfadeout(padding).audio_fadein(padding).audio_fadeout(padding))
    idx += video.duration - padding

final_video = CompositeVideoClip(video_fx_list)
final_video.write_videofile("Extravaganza_raw.mp4") 

os.system("HandBrakeCLI --crop 0:0:0:0 -i Extravaganza_raw.mp4 -o Extravaganza.mp4") 
os.system("rm Extravaganza_raw.mp4")