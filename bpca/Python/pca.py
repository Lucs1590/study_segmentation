import numpy as np
import random
from glob import glob
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
import cv2


def select_image(path, specific=False):
    if specific:
        image_path = path
    else:
        image_path = random.choice(glob((path)))
    return image_path


def plot_channels(blue, green, red):
    fig = plt.figure(figsize=(15, 7.2))
    fig.add_subplot(131)

    plt.title("Blue Channel")
    plt.imshow(blue)
    fig.add_subplot(132)

    plt.title("Green Channel")
    plt.imshow(green)
    fig.add_subplot(133)

    plt.title("Red Channel")
    plt.imshow(red)
    plt.show()


def run_PCA(dataframe, n_components=50):
    pca = PCA(n_components=n_components)
    pca.fit(dataframe)
    trans_pca = pca.transform(dataframe)
    return pca, trans_pca


def print_variance(pca):
    return print(
        f"Variance: {sum(pca.explained_variance_ratio_)}"
    )


def plot_variance(pca_b, pca_g, pca_r):
    fig = plt.figure(figsize=(15, 7.2))
    fig.add_subplot(131)

    plt.title("Blue Channel")
    plt.ylabel('Variation explained')
    plt.xlabel('Eigen Value')
    plt.bar(list(range(1, 51)), pca_b.explained_variance_ratio_)

    fig.add_subplot(132)
    plt.title("Green Channel")
    plt.ylabel('Variation explained')
    plt.xlabel('Eigen Value')
    plt.bar(list(range(1, 51)), pca_g.explained_variance_ratio_)

    fig.add_subplot(133)
    plt.title("Red Channel")
    plt.ylabel('Variation explained')
    plt.xlabel('Eigen Value')

    plt.bar(list(range(1, 51)), pca_r.explained_variance_ratio_)
    plt.show()


def run_inverse_transform(pca, trans_pca):
    inverse_b_arr = pca.inverse_transform(trans_pca)
    return inverse_b_arr


def plot_raw_and_compressed(image, img_reduced):
    fig = plt.figure(figsize=(10, 7.2))
    fig.add_subplot(121)
    plt.title("Original Image")
    plt.imshow(image)

    fig.add_subplot(122)
    plt.title("Reduced Image")
    plt.imshow((img_reduced * 255).astype(np.uint8))
    plt.show()


image_path = select_image('/Volumes/SD1/datasets/images/val2017/*.jpg')
print(image_path)

image = cv2.cvtColor(
    cv2.imread(image_path),
    cv2.COLOR_BGR2RGB
)
plt.imshow(image)
plt.show()

blue, green, red = cv2.split(image)
plot_channels(blue, green, red)
print(blue.shape, green.shape, red.shape)

df_blue = blue/255
df_green = green/255
df_red = red/255

pca_b, trans_pca_b = run_PCA(df_blue)
pca_g, trans_pca_g = run_PCA(df_green)
pca_r, trans_pca_r = run_PCA(df_red)

print_variance(pca_b)
print_variance(pca_g)
print_variance(pca_r)
plot_variance(pca_b, pca_g, pca_r)

inverse_b_arr = run_inverse_transform(pca_b, trans_pca_b)
inverse_g_arr = run_inverse_transform(pca_g, trans_pca_g)
inverse_r_arr = run_inverse_transform(pca_r, trans_pca_r)
print(inverse_b_arr.shape, inverse_g_arr.shape, inverse_r_arr.shape)

img_reduced = (cv2.merge((inverse_b_arr, inverse_g_arr, inverse_r_arr)))
print(img_reduced.shape)
plot_raw_and_compressed(image, img_reduced)
print(img_reduced)
