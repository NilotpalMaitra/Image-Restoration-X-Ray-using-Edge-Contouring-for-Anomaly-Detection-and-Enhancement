import cv2
import numpy as np

img = cv2.imread(r"D:\.vscode\py\anomaly_image.jpg", 0)
if img is None:
    print("Error: Unable to load image.")
else:
    print(img.shape)
    height, width = img.shape[:2]
    print(height)
    print(width)
    print(np.binary_repr(230, width=8))
    file = open("anomalyimage.txt", 'w')
    for i in range(height):
        for j in range(width):
            file.write(np.binary_repr(img[i][j], width=8))
        file.write("\n")
    file.close()

    # Display the image using OpenCV (uncomment if needed)
    # cv2.imshow("test image", img)
    # cv2.waitKey(0)
    # cv2.destroyAllWindows()
    #"D:\.vscode\py\anomaly_image.jpg"
