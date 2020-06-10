#!/usr/bin/env python3

from PIL import Image, ImageDraw, ImageFont
from sys import argv

def convert(infile, outfile, text):
    im = Image.open(infile)
    draw = ImageDraw.Draw(im)
    font = ImageFont.truetype(r'C:\Windows\Fonts\arial.ttf', 30) 
    draw.text((380, 20), text, fill='grey', font = font)
    im.putalpha(255)
    data = im.tobytes('raw')
    f = open(outfile,'wb')
    f.write(bytes.fromhex('56 54 46 00 07 00 00 00 02 00 00 00 50 00 00 00 00 04 00 04 00 23 00 00 01 00 00 00 00 00 00 00 90 68 B0 3E 19 87 B9 3E 36 21 BC 3E 00 00 00 00 00 00 80 3F 0C 00 00 00 01 FF FF FF FF 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00'))
    f.write(data)

if __name__=='__main__':
    if len(argv)<3:
        print('usage: png2vtf.py infile outfile text')
    else:
        infile = argv[1]
        outfile = argv[2]
        text = argv[3] if len(argv)>3 else ''
        print('converting ', infile, outfile, text)
        convert(infile, outfile, text)

