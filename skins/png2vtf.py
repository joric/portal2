#!/usr/bin/env python3

from PIL import Image, ImageDraw, ImageFont
from sys import argv

def convert(infile, outfile, text, fancy=True):
    im = Image.open(infile)
    draw = ImageDraw.Draw(im)
    x,y,fs = 380,20,16
    font = ImageFont.truetype(r'C:\Windows\Fonts\arial.ttf', fs)

    if fancy:
        fw, fh = fs*4//5, fs
        w,h,spacing = fw+4,fh-1,2
        for i in range(len(text)):
            draw.rectangle((x, y, x + w, y + h), fill='black')
            draw.text((x+(w-fw), y+(h-fh)), text[i], fill='white', bg='black', font = font)
            x += w + spacing
    else:
        draw.text((380, 20), text, fill='grey', font = font)

    data = im.tobytes('raw')
    f = open(outfile,'wb')
    f.write(bytes.fromhex('56 54 46 00 07 00 00 00 02 00 00 00 50 00 00 00 00 04 00 04 00 03 00 00 01 00 00 00 00 00 00 00 1A 68 B0 3E EE 05 B9 3E A3 75 BC 3E 00 00 00 00 00 00 80 3F 02 00 00 00 01 FF FF FF FF 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00'))
    f.write(data)

if __name__=='__main__':
    if len(argv)<3:
        print('usage: png2vtf.py infile outfile text')
    else:
        convert(argv[1], argv[2], argv[3] if len(argv)>3 else '')

