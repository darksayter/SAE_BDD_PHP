import numpy as np
import pandas as pd

i = 0
routes =  []
stri = ""
animestxt = open("animes.txt", "w")
genrestxt = open("genre.txt", "w")
themestxt = open("themes.txt", "w")
with open (r'C:\Users\Utilisateur\Desktop\SAE_capicapi\python\anime.csv', 'r') as f:
    # Le reste de votre code ici
    test = 0
    for line in f:
        if test < 1:
            liste = []
            listedebut = []
            listefinale = []
            liste = line.split('[')
            #liste fait 7 de longueur
            listedebut = liste[0].split(',')
            x = 0
            animestxt.write('INSERT INTO anime VALUES (')
            for t in listedebut:
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
            for s in range(1,6):
            
                animestxt.write('ARRAY[')
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
            # test +=1
        
        
        
        
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


