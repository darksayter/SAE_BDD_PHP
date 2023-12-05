import numpy as np
import pandas as pd

i = 0
routes =  []
stri = ""
animestxt = open("animes.txt", "w")
genrestxt = open("genreanime.txt", "w")
themestxt = open("themesanimetxt", "w")
listegenre = []
listetheme = []
with open (r'C:\Users\Utilisateur\Desktop\SAE_capicapi\python\genre.txt', 'r') as w:
    for linee in w:
        temp = linee.split('\n')
        tempo = temp[0].split(',')
        listegenre.append(tempo)
    
    # (5,'Sci-Fi');

print(listegenre[0][1])
    
animestxt.close()
genrestxt.close()
themestxt.close()