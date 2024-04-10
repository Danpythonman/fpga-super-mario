# ==============================================================================
# You need the opencv-pthon and Pillow packages to run this code. If you don't
# have, you can install them with these commands:
#
#   pip install opencv-python
#   pip install Pillow
#
# After that, just change the image file name and output Verilog module name.
# below.
#
# Also PNGs work the best :)
# ==============================================================================

from PIL import Image
import cv2
import math

# ----- Change this filename to your image -----
im = Image.open('mario.png')
# ----- ----- ----- ----- ----- ----- ----- -----

# ----- Change this filename to your image -----
moduleName = "VgaMarioDrawer"
# ----- ----- ----- ----- ----- ----- ----- -----

# im = im.resize((40, 40))
im.save("image.png", "png")

im = cv2.imread("image.png")
div = 64
quantized = im // div * div + div // 2
cv2.imwrite('image.png', quantized)

im = Image.open("image.png")

imageSizeW, imageSizeH = im.size

BLOCK_WIDTH = 40
BLOCK_HEIGHT = 40

pixelWidth = int(imageSizeW / BLOCK_WIDTH)
pixelHeight = int(imageSizeH / BLOCK_HEIGHT)

blockPixels = []

pixelDict = dict()
pixelDict[(0, 0, 0, 0)] = "NULL"

colorCounter = 1

for i in range(1, imageSizeW):
    if i % pixelWidth == 0:
        blockPixels.append([])
        for j in range(1, imageSizeH):
            if j % pixelHeight == 0:
                if im.getpixel((i,j))[-1] == 0:
                    blockPixels[-1].append((0, 0, 0, 0))
                else:
                    blockPixels[-1].append(im.getpixel((i,j)))
                    if im.getpixel((i,j)) not in pixelDict:
                        pixelDict[im.getpixel((i,j))] = "COLOR" + str(colorCounter)
                        colorCounter += 1

with open(moduleName + ".sv", "w") as f:
    vString = "module " + moduleName + "\n(\n"
    vString += "\tinput [31:0] x,\n"
    vString += "\tinput [31:0] y,\n"
    vString += "\tinput byte background [11:0][16:0],\n"
    vString += "\tinput [3:0] background_red,\n"
    vString += "\tinput [3:0] background_green,\n"
    vString += "\tinput [3:0] background_blue,\n"
    vString += "\toutput reg [3:0] red,\n"
    vString += "\toutput reg [3:0] green,\n"
    vString += "\toutput reg [3:0] blue\n"
    vString += ");\n\n"
    for i in range(len(pixelDict.values())):
        vString += 	"\tlocalparam " + list(pixelDict.values())[i] + " = " + str(i) + ";\n"
    vString += "\n"
    vString += "\treg [" + str(int(math.ceil(math.log2(colorCounter)))) + ":0] pattern [" + str(len(blockPixels)-1) + ":0" + "][" + str(len(blockPixels[0])-1) + ":0] = '{\n"
    for i in range(len(blockPixels)):
        pixelRow = blockPixels[i]
        vString += "\t\t'{\n"
        for j in range(len(pixelRow)):
            pixel = pixelRow[j]
            vString += "\t\t\t" + pixelDict[pixel]
            # if pixel[-1] == 0:
            #     vString += "\t\t\tNULL"
            # elif str(pixel) == "(174, 126, 0, 255)":
            #     vString += "\t\t\tBROWN"
            # elif str(pixel) == "(255, 162, 70, 255)":
            #     vString += "\t\t\tORANGE"
            # elif str(pixel) == "(248, 55, 0, 255)":
            #     vString += "\t\t\tRED"
            # else:
            #     vString += "\t\t\tNULL"
            if j < len(pixelRow) - 1:
                vString += ",\n"
            else:
                vString += "\n"
        if i < len(blockPixels) - 1:
            vString += "\t\t},\n"
        else:
            vString += "\t\t}\n"
    vString += "\t};\n\n"
    vString += "\talways @(x, y) begin\n"
    for i, key in enumerate(pixelDict.keys()):
        colorName = pixelDict[key]
        red = int(round((key[0] / 255) * 15))
        green = int(round((key[1] / 255) * 15))
        blue = int(round((key[2] / 255) * 15))
        if i == 0:
            vString += "\t\tif "
        else:
            vString += "else if "
        vString += "(pattern[x][y] == " + colorName + ") begin\n"
        if colorName == "NULL":
            vString += "\t\t\tred   <= background_red;\n"
            vString += "\t\t\tgreen <= background_green;\n"
            vString += "\t\t\tblue  <= background_blue;\n"
        else:
            vString += "\t\t\tred   <= 4'd" + str(red) + ";\n"
            vString += "\t\t\tgreen <= 4'd" + str(green) + ";\n"
            vString += "\t\t\tblue  <= 4'd" + str(blue) + ";\n"
        vString += "\t\tend"
        if i < len(pixelDict.values()) - 1:
            vString += " "
        else:
            vString + "\n"
    vString += "\tend\n\n"
    vString += "endmodule\n"
    f.write(vString)
