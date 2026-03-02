#    Copyright (c) 2021 Danish_00
#    Improved By @Zylern

from decouple import config

try:
    APP_ID = config("APP_ID", cast=int)
    API_HASH = config("API_HASH")
    BOT_TOKEN = config("BOT_TOKEN")
    DEV = 5868426717
    OWNER = config("OWNER" , "5868426717")
    ffmpegcode = ["-preset veryfast -c:v libx264 -b:a 64k -crf 38 -map 0 -c:s copy"]
    THUMBNAIL = config("THUMBNAIL", default="https://graph.org/file/1cc8d7082dc910c0ccee8.jpg")
except Exception as e:
    print("Environment vars Missing! Exiting App.")
    print(str(e))
    exit(1)
