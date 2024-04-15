import cv2
import numpy as np

def sobel_edge_detection(image):
    # Convert the image to grayscale
    gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    
    # Apply Gaussian blur to reduce noise
    blurred_image = cv2.GaussianBlur(gray_image, (3, 3), 0)
    
    # Sobel operator for edge detection
    sobel_x = cv2.Sobel(blurred_image, cv2.CV_64F, 1, 0, ksize=3)
    sobel_y = cv2.Sobel(blurred_image, cv2.CV_64F, 0, 1, ksize=3)
    
    # Compute the gradient magnitude
    gradient_magnitude = np.sqrt(np.square(sobel_x) + np.square(sobel_y))
    
    # Normalize the gradient magnitude to the range [0, 255]
    normalized_gradient = np.uint8(255 * gradient_magnitude / np.max(gradient_magnitude))
    
    return normalized_gradient

# Load an image
image_path = "C:\\Users\\tibre\\OneDrive\\Desktop\\XRAY Processing\\output1.jpg"
image = cv2.imread(image_path)

# Apply Sobel edge detection
edge_image = sobel_edge_detection(image)

# Display the original and edge-detected images
cv2.imshow("Original Image", image)
cv2.imshow("Edge-detected Image", edge_image)
output_path ="C:\\Users\\tibre\\OneDrive\\Desktop\\XRAY Processing\\output2.jpg"
cv2.imwrite(output_path, edge_image)

print("Edge-detected image saved successfully at:", output_path)
cv2.waitKey(0)
cv2.destroyAllWindows()
