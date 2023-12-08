import numpy as np
import pandas as pd

# Toy's, Brain's
#remplacer array[] par array['']

i = 0
routes =  []
stri = ""
mangatxt = open("mangas.txt", "w")
genremangatxt = open("genremanga.txt", "w")
thememangatxt = open("themesmanga.txt", "w")
listegenre = []
listetheme = []
with open (r'C:\Users\Utilisateur\Desktop\SAE_capicapi\pythmanga\genre.txt', 'r') as w:
    for linee in w:
        temp = linee.split('\n')
        tempo = temp[0].split(',')
        listegenre.append(tempo)
        
with open (r'C:\Users\Utilisateur\Desktop\SAE_capicapi\pythmanga\themes.txt', 'r') as w:
    for lineee in w:
        temp = lineee.split('\n')
        tempo = temp[0].split(',')
        listetheme.append(tempo)



with open (r'C:\Users\Utilisateur\Desktop\SAE_capicapi\pythmanga\manga.sql', 'r') as f:
    test = 0
    for line in f:  
        if test < 1:
            compteur = 0
            id = 0
            asupprimer = True
            liste = line.split('INSERT INTO manga VALUES (')
            liste2 = liste[1].split('[')
            liste3=liste2[0].split(',')
            # for i in range(0,12):
            #     print(liste3[i])
            id = liste3[0].replace("'", '')
            temporaire = liste2[1].split(']')
            teste = temporaire[0].replace("'", '')
            teste2 = teste.replace(' ', '')
            listegenremanga = teste2.split(',')
            temporaire2 = liste2[2].split(']')
            teste3 = temporaire2[0].replace("'", '')
            teste4 = teste3.replace(' ', '')
            listethememanga = teste4.split(',')
            for gender in listegenremanga:
                if str(gender) == 'Hentai' or str(gender) == 'Erotica':
                    asupprimer = False
            if asupprimer:
                if len(listegenremanga)>3:
                    for gender2 in listegenremanga:
                        for gender3 in listegenre:
                            if str(gender2) == str(gender3[1]):
                                genremangatxt.write('INSERT INTO mangagenre VALUES(')
                                genremangatxt.write(str(id))
                                genremangatxt.write(',')
                                genremangatxt.write(str(gender3[0]))
                                genremangatxt.write(');')
                                genremangatxt.write('\n')
                
                if len(listethememanga)>3:
                    for gender8 in listethememanga:
                        for gender9 in listetheme:
                            if str(gender8) == str(gender9[1]):
                                thememangatxt.write('INSERT INTO mangatheme VALUES(')
                                thememangatxt.write(str(id))
                                thememangatxt.write(',')
                                thememangatxt.write(str(gender9[0]))
                                thememangatxt.write(');')
                                thememangatxt.write('\n')
                
                liste49 = liste2[0].replace("'", '')
                values = liste49.split(',')
                mangatxt.write('INSERT INTO manga VALUES(')
                for s in range(0,12):
                    if s == 0 or s ==3 or s ==4 or s == 6 or s ==7 or s == 10 or s == 11:
                        mangatxt.write(str(values[s]))
                    else :
                        mangatxt.write("'")
                        mangatxt.write(str(values[s]))
                        mangatxt.write("'")
                    mangatxt.write(',')
                listeseinen = liste2[3].split(']')
                if len(listeseinen[0])<3:
                    mangatxt.write("ARRAY['']")
                else : 
                    mangatxt.write("ARRAY[")
                    mangatxt.write(listeseinen[0])
                    mangatxt.write("],")
                listejsp = liste2[4].split(']')
                if len(listejsp[0])<3:
                    mangatxt.write("ARRAY['']")
                else : 
                    mangatxt.write("ARRAY[")
                    mangatxt.write(listejsp[0])
                    mangatxt.write("],")
                listejsp2 = liste2[5].split(']')
                if len(listejsp[0])<3:
                    mangatxt.write("ARRAY['']")
                else : 
                    mangatxt.write("ARRAY[")
                    mangatxt.write(listejsp2[0])
                    mangatxt.write("],")
                mangatxt.write("'")
                jaibesoinliste = listejsp2[1].split("'")
                mangatxt.write(jaibesoinliste[2])
                mangatxt.write("'")
                mangatxt.write(",")
                mangatxt.write("'")
                mangatxt.write(jaibesoinliste[4])
                mangatxt.write("'")
                mangatxt.write(",")
                mangatxt.write("'")
                mangatxt.write(jaibesoinliste[6])
                mangatxt.write("');")
                mangatxt.write("\n")
                       
                
                
                    

            
        test +=0
        
        
        


mangatxt.close()
genremangatxt.close()
thememangatxt.close()


