import pandas as pd
import re

# Replace 'your_file.csv' with the actual path to your CSV file
csv_file_path = 'anime.csv'

# Read the CSV file into a pandas DataFrame
df = pd.read_csv(csv_file_path)

# Assuming the 'genres' column contains genres in square brackets
# If the column has other characters or formats, adjust the regex pattern accordingly
pattern = r'\[([^\]]*)\]'

# Extract genres using regex and create a list of all genres
all_genres = [genre.strip().lower() for value in df['genres'] for genre in re.findall(pattern, str(value))]

# Get distinct genres and print duplicates
distinct_genres = set()
duplicate_genres = set()

for genre in all_genres:
    if genre in distinct_genres:
        duplicate_genres.add(genre)
    else:
        distinct_genres.add(genre)

# Print the distinct genres
print("Distinct genres:", distinct_genres)

# Print the duplicate genres
print("Duplicate genres:", duplicate_genres)
