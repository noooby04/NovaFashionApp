import pandas as pd
import os

# Step 1: Read the CSV file into a Pandas DataFrame
csv_file = "price.csv"  # Replace "data.csv" with your CSV file name
df = pd.read_csv('price.csv')

# Step 2: Get a set of IDs present in the DataFrame
ids_in_csv = set(df['id'])

# Step 3: List all the image files in the folder
image_folder = "images"  # Replace "images" with your image folder name
image_files = os.listdir(image_folder)

# Step 4: Iterate over the image files, check if their ID is not present in the DataFrame, and delete them
for image_file in image_files:
    # Extract ID from image filename
    image_id, _ = os.path.splitext(image_file)
    # Check if the ID is not present in the DataFrame
    if image_id not in ids_in_csv:
        # Construct the full path to the image
        image_path = os.path.join(image_folder, image_file)
        # Delete the image
        os.remove(image_path)
        print(f"Deleted: {image_file}")
