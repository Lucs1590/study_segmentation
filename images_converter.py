import io
import glob
import pyheif
import whatimage
from PIL import Image


def convert_image(image: str = None, output_format: str = 'tiff', output_path: str = None):
    img_name = image.split('/')[-1].split('.')[0]
    image = read_img(image)
    img_format = whatimage.identify_image(image)
    if img_format in ['heic', 'avif']:
        img = pyheif.read_heif(image)
        data = Image.frombytes(
            mode=img.mode,
            size=img.size,
            data=img.data,
            decoder_name='raw'
        )
    else:
        data = Image.open(io.BytesIO(image))

    data.save(
        f'{output_path}/{img_name}.{output_format}',
        format=output_format
    )
    print(f'{img_name} converted!')


def read_img(image: str = None):
    if image:
        with open(image, 'rb') as img_file:
            return img_file.read()
    else:
        raise Exception('No image provided')


files_list = glob.glob('/Users/brito/Documents/Mestrado/Dataset/Odonto/*.HEIC')
for _file in files_list:
    convert_image(
        _file,
        'png',
        '/Users/brito/Documents/Mestrado/Dataset/Odonto/png/'
    )
