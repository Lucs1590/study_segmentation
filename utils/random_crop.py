import os
from random import randrange
from tqdm import tqdm
from PIL import Image, ImageOps

ORIGINAL_PATH = 'Odonto/png/original'
RESIZED_PATH = 'Odonto/png/resize'
FOLDER = 'Odonto/png'


def random_crop(image, image_name):
    img_size = image.size
    target_size = min(img_size) * 0.25
    x_max = img_size[0] - target_size
    y_max = img_size[1] - target_size

    for idx in range(5):
        random_x = randrange(0, x_max//2 + 1) * 2
        random_y = randrange(0, y_max//2 + 1) * 2

        area = (random_x, random_y, random_x +
                target_size, random_y + target_size)
        c_img = image.crop(area)

        fit_img_h = ImageOps.fit(c_img, (224, 224), Image.ANTIALIAS)
        fit_img_h.save(f'{ORIGINAL_PATH}/{idx}_{image_name}')

        fit_img_l = ImageOps.fit(c_img, (56, 56), Image.ANTIALIAS)
        fit_img_l.save(f'{RESIZED_PATH}/{idx}_{image_name}')


os.mkdir(FOLDER) if not os.path.isdir(FOLDER) else 0
os.mkdir(ORIGINAL_PATH) if not os.path.isdir(ORIGINAL_PATH) else 0
os.mkdir(RESIZED_PATH) if not os.path.isdir(RESIZED_PATH) else 0

img_names = os.listdir(FOLDER)
for img_name in tqdm(img_names):
    try:
        img = Image.open(f'{FOLDER}/{img_name}')
        random_crop(img, img_name)
    except Exception:
        pass
