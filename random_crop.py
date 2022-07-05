from PIL import Image, ImageOps
from random import randrange
from tqdm import tqdm
import os

target_size = 448
original_path = '/Odonto/png/original'
resize_path = '/Odonto/png/resize'
folder = '/Odonto/png'


def random_crop(image, image_name):
    img_size = image.size
    x_max = img_size[0] - target_size
    y_max = img_size[1] - target_size

    for idx in range(5):
        random_x = randrange(0, x_max//2 + 1) * 2
        random_y = randrange(0, y_max//2 + 1) * 2

        area = (random_x, random_y, random_x + target_size, random_y + target_size)
        c_img = image.crop(area)

        fit_img_h = ImageOps.fit(c_img, (224, 224), Image.ANTIALIAS)
        fit_img_h.save(f'{original_path}/{idx}_{image_name}')

        fit_img_l = ImageOps.fit(c_img, (56, 56), Image.ANTIALIAS)
        fit_img_l.save(f'{resize_path}/{idx}_{image_name}')


img_names = os.listdir(folder)
for img_name in tqdm(img_names):
    try:
        img = Image.open(f'{folder}/{img_name}')
        random_crop(img, img_name)
    except:
        pass
