import os
import pandas as pd
import shutil

# Path to the CSV file containing IDs
csv_file = 'price.csv'

# Path to the folder containing images
image_folder = 'images/'

# Path to the folder where you want to copy the images
output_folder = 'output_images/'

# Create the output folder if it doesn't exist
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

# Read the CSV file into a pandas DataFrame
df = pd.read_csv(csv_file)

# Loop through each row in the DataFrame
for index, row in df.iterrows():
    # Extract the ID from the row
    id = row['id']
    
    # Construct the path to the image file
    image_path = os.path.join(image_folder, str(id) + '.jpg')  # Assuming images are in JPEG format
    
    # Check if the image file exists
    if os.path.exists(image_path):
        # Construct the path to the output image file
        output_image_path = os.path.join(output_folder, str(id) + '.jpg')
        
        # Copy the image file to the output folder
        shutil.copyfile(image_path, output_image_path)
        print(f"Image with ID {id} copied successfully.")
    else:
        print(f"No image found for ID {id}.")

print("Copying images complete.")
