# Convert an MP4 video file to an MP3 audio file
export def mp4-to-mp3 [input: path, output: path] {
  # This is taken from this article:
  # <https://www.fosslinux.com/44788/how-to-convert-mp4-to-mp3-in-linux.htm>
  #
  # An explanation of the flags is as follows:
  # 
  # - `-i input.mp4` specifies the input file
  # 
  # - `-vn` disables the video stream (we only want audio)
  # 
  # - `-acodec libmp3lame` forces the LAME MP3 encoder
  # 
  # - `-ac 2` sets stereo output (2 channels)
  # 
  # - `-ab 160k` sets the bitrate to 160kbps (good balance of quality and size)
  # 
  # - `-ar 48000` sets the sample rate to 48kHz
  ffmpeg -i $output -vn -acodec libmp3lame -ac 2 -ab 160k -ar 48000 $output
}
