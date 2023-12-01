import pandas as pd
import ast

# Chargement du fichier CSV
data = pd.read_csv('anime.csv')

# Création d'une liste pour stocker les genres
genres_list = []

# Parcours de chaque ligne du fichier CSV
for index, row in data.iterrows():
    genres = ast.literal_eval(row['genres'])  # Convertir la chaîne de genres en une liste Python
    for genre in genres:
        genres_list.append((row['mal_id'], genre))  # Ajouter le couple (ID, genre) à la liste des genres

# Création d'un DataFrame pour les genres
genres_df = pd.DataFrame(genres_list, columns=['mal_id', 'genre'])

# Suppression de la colonne 'genres' du DataFrame original
data.drop(columns=['genres'], inplace=True)

# Fusion des DataFrames pour avoir les genres associés à chaque ID
merged_data = pd.merge(data, genres_df, on='mal_id')

# Affichage des premières lignes pour vérification
print(merged_data.head())

# Enregistrement du nouveau fichier CSV avec les genres séparés
merged_data.to_csv('nouveau_fichier.csv', index=False)
