import pandas as pd

# Load messy CSV
df = pd.read_csv("Sales_Data.csv", header=None)

# Empty list to store all transactions
all_rows = []

# Number of rows per block
block_size = 12

# Process dataset block by block
for start_row in range(0, len(df), block_size):

    # Extract one block
    block = df.iloc[start_row:start_row + block_size]

    # Skip incomplete blocks
    if len(block) < block_size:
        continue

    # First column contains field names
    headers = block.iloc[:, 0].tolist()

    # Remaining columns contain data
    data = block.iloc[:, 1:]

    # Convert each column into one transaction row
    for col in data.columns:

        row_data = data[col].tolist()

        # Skip completely empty columns
        if pd.isna(row_data).all():
            continue

        # Create dictionary
        record = dict(zip(headers, row_data))

        # Append
        all_rows.append(record)

# Create clean dataframe
final_df = pd.DataFrame(all_rows)

# Convert Sale_Date safely from Excel serial format to datetime
final_df["Sale_Date"] = pd.to_datetime(
    pd.to_numeric(final_df["Sale_Date"], errors="coerce"),
    origin="1899-12-30",
    unit="D"
)

# Save cleaned file
final_df.to_csv("clean_sales_dataset.csv", index=False)

print("Dataset cleaned successfully!")
print(final_df.head())