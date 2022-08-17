function download_youtubemp3
  youtube-dl -x --embed-thumbnail --audio-format mp3 $argv
end
