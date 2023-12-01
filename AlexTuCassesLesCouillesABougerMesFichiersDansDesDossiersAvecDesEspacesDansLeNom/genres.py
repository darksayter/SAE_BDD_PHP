import numpy as np
import pandas as pd

i = 0
routes =  []
stri = ""
routestxt = open("animes.txt", "w")
with open ('C:\Users\Utilisateur\Desktop\SAE_capicapi\AlexTuCassesLesCouillesABougerMesFichiersDansDesDossiersAvecDesEspacesDansLeNom\anime-anime.csv' , 'r') as f:
    for line in f:
        liste = []
        liste = line.split('[')
        
        i += 1
        liste = []
        listetempo = []
        listetempo2 = []
        listetempo3 = []
        liste = line.split(',')
        for x in range(0, 8):
            if x != 2 and x != 4:
                listetempo.append(liste[x])
        listetempo.append(i)
        b = 0
        routestxt.write('INSERT INTO #routes# VALUES (')
        for o in listetempo:
            if b == 0 or b ==4:
                    routestxt.write('#')
                    routestxt.write(str(o))
                    routestxt.write('#')
            else:
                routestxt.write(str(o))
            if b != 6:
                routestxt.write(',')
            b+=1
        routestxt.write(');')
        routestxt.write('\n')



routestxt.close()