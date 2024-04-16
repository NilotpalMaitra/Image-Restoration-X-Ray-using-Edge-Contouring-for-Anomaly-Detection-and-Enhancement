import cv2

def image_to_8bit(input_path, output_path):
    # Read the image
    img = cv2.imread(input_path, cv2.IMREAD_GRAYSCALE)

    # Check if the image was loaded successfully
    if img is None:
        print("Error: Unable to load image.")
        return

    # Convert image to 8-bit
    img_8bit = img.astype('uint8')

    # Flatten the 2D array to 1D
    flat_img = img_8bit.flatten()

    # Write 8-bit values to a text file
    with open(output_path, 'w') as file:
        for pixel_value in flat_img:
            file.write(f'{pixel_value}\n')

# Example usage
input_file_path = "D:\\.vscode\\py\\anomaly_image.jpg"
output_file_path = "D:\\.vscode\\py\\outputanomaly.txt"
image_to_8bit(input_file_path, output_file_path)
