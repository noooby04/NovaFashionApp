import streamlit as st
import pandas as pd

# Sample data
df = pd.read_csv('price.csv')
merged_df = pd.read_csv('merged_file.csv')

def recommend_complementary_ids(input_id, df):
    if input_id not in df['id'].values:
        st.error("Input ID not found in the dataset.")
        return []
    
    input_row = df[df['id'] == input_id].iloc[0]
    gender = input_row['gender']
    season = input_row['season']
    usage = input_row['usage']
    input_subcategory = input_row['subCategory']
    
    filtered_df = df[(df['gender'] == gender) & (df['season'] == season) & (df['usage'] == usage)]
    filtered_df = filtered_df[(filtered_df['id'] != input_id) & (filtered_df['subCategory'] != input_subcategory)]
    
    if len(filtered_df) < 5:
        st.warning("Insufficient data to recommend complementary IDs.")
        return []
    
    complementary_ids = filtered_df.sample(n=5)['id'].tolist()
    
    return complementary_ids

def get_input_id_from_image_filename(filename):
    # Assuming filename is in the format "id.extension"
    try:
        input_id = int(filename.split('.')[0])
        return input_id
    except:
        st.error("Invalid filename format.")
        return None

st.title("Complementary Image Recommender")

uploaded_file = st.file_uploader("Upload an image file", type=["jpg", "png", "jpeg"])

refresh_button = st.button("Refresh Output")

if uploaded_file is not None:
    filename = uploaded_file.name
    st.write("Uploaded file:", filename)
    
    input_id = get_input_id_from_image_filename(filename)
    if input_id is not None:
        st.write("Example input ID extracted from the filename:", input_id)
        
        input_img_row = merged_df.loc[merged_df['id'] == input_id]
        if not input_img_row.empty:
            input_img_url = input_img_row.iloc[0]['url']
            input_price = df.loc[df['id'] == input_id, 'price'].iloc[0]
            st.image(input_img_url, caption=f"Uploaded Image | Price: ₹{input_price}", use_column_width=False, width=200)
            
            total_price = input_price
            if refresh_button:
                st.write("Refreshing output...")
        
            complementary_ids = recommend_complementary_ids(input_id, df)
            if complementary_ids:
                st.write("Recommended complementary IDs:")
                for cid in complementary_ids:
                    img_url = merged_df.loc[merged_df['id'] == cid, 'url'].iloc[0]
                    price = df.loc[df['id'] == cid, 'price'].iloc[0]
                    st.image(img_url, caption=f"ID: {cid} | Price: ₹{price}", use_column_width=False, width=200)
                    total_price += price
                
                # Apply 5% discount
                discount = total_price * 0.05
                discounted_price = total_price - discount
                st.markdown(f"**Total Outfit Price (After 5% Discount): ₹{discounted_price:.2f}**")
        else:
            st.error("Input ID not found in the dataset.")
