import numpy as np
import pandas as pd

i = 0
routes =  []
stri = ""
animestxt = open("animes.txt", "w")
genreanimetxt = open("genreanime.txt", "w")
themeanimetxt = open("themesanime.txt", "w")
listegenre = []
listetheme = []
with open (r'C:\Users\Utilisateur\Desktop\SAE_capicapi\python\genre.txt', 'r') as w:
    for linee in w:
        temp = linee.split('\n')
        tempo = temp[0].split(',')
        listegenre.append(tempo)
        
with open (r'C:\Users\Utilisateur\Desktop\SAE_capicapi\python\themes.txt', 'r') as w:
    for lineee in w:
        temp = lineee.split('\n')
        tempo = temp[0].split(',')
        listetheme.append(tempo)



with open (r'C:\Users\Utilisateur\Desktop\SAE_capicapi\python\anime.csv', 'r') as f:
    # Le reste de votre code ici
    test = 0
    for line in f:
        if test < 5:
            compteur = 0
            id = 0
            liste = []
            listedebut = []
            listefinale = []
            listegenre2 = []
            listetheme2 = []
            liste = line.split('[')
            #liste fait 7 de longueur
            listedebut = liste[0].split(',')
            x = 0
            animestxt.write('INSERT INTO anime VALUES (')
            for t in listedebut:
                if x == 0:
                    id = t
                if x == 0 or x ==3 or x == 4 or x ==6 or x == 10 or x==14:
                    animestxt.write(str(t))
                elif x <15:
                    animestxt.write('#')
                    animestxt.write(str(t))
                    animestxt.write('#')
                if x < 15:
                    animestxt.write(',')
                x+=1
            
            liste6 = liste[6].split(']')
            listedegenredelanime= []
            listedegenredelanimetemporaire= liste[1].split('],')
            listedegenredelanimetemporaire2 = listedegenredelanimetemporaire[0].split(',')
            for o in listedegenredelanimetemporaire2:
                tttttt = o.split("'")
                if len(tttttt)<2:
                    pass
                else:
                    listedegenredelanime.append(tttttt[1])
            
            listedethemedelanime= []
            listedethemedelanimetemporaire= liste[2].split('],')
            listedethemedelanimetemporaire2 = listedethemedelanimetemporaire[0].split(',')
            for o in listedethemedelanimetemporaire2:
                tttttt = o.split("'")
                if len(tttttt)<2:
                    pass
                else:
                    listedethemedelanime.append(tttttt[1])
            
            for s in range(1,6):
                if s == 1:
                    for g in listedegenredelanime:
                        for m in listegenre:
                            if g == m[1]:
                                compteur = 1
                                genreanimetxt.write('INSERT INTO AnimeGenre VALUES(')
                                genreanimetxt.write(str(id))
                                genreanimetxt.write(',')
                                genreanimetxt.write(str(m[0]))
                                genreanimetxt.write(');')
                                genreanimetxt.write('\n')
                elif s == 2:
                    for j in listedethemedelanime:
                        for l in listetheme:
                            if j == l[1]:
                                themeanimetxt.write('INSERT INTO AnimeTheme VALUES(')
                                themeanimetxt.write(str(id))
                                themeanimetxt.write(',')
                                themeanimetxt.write(str(l[0]))
                                themeanimetxt.write(');')
                                themeanimetxt.write('\n')
                else :
                    animestxt.write('ARRAY[')
                    if len(liste[s])< 4:
                        animestxt.write('##')
                    animestxt.write(str(liste[s]))
                    animestxt.write('')
                    
            animestxt.write('ARRAY[')
            animestxt.write(liste6[0])
            animestxt.write(']')
            animestxt.write('\n')
            liste7 = liste6[1].split(',')
            animestxt.write(',')
            animestxt.write('#')
            animestxt.write(liste7[1])
            animestxt.write('#')
            animestxt.write(',')
            animestxt.write('#')
            animestxt.write(liste7[2])
            animestxt.write('#')
            animestxt.write(')')
            animestxt.write(';')
            animestxt.write('\n')
            test +=0
        
        
        
        
        # i += 1
        # liste = []
        # listetempo = []
        # listetempo2 = []
        # listetempo3 = []
        # liste = line.split(',')
        # for x in range(0, 8):
        #     if x != 2 and x != 4:
        #         listetempo.append(liste[x])
        # listetempo.append(i)
        # b = 0
        # routestxt.write('INSERT INTO #routes# VALUES (')
        # for o in listetempo:
        #     if b == 0 or b ==4:
        #             routestxt.write('#')
        #             routestxt.write(str(o))
        #             routestxt.write('#')
        #     else:
        #         routestxt.write(str(o))
        #     if b != 6:
        #         routestxt.write(',')
        #     b+=1
        # routestxt.write(');')
        # routestxt.write('\n')



animestxt.close()
genreanimetxt.close()
themeanimetxt.close()


