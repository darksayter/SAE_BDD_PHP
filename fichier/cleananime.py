import numpy as np
import pandas as pd

# Toy's, Brain's
#remplacer array[] par array['']

i = 0
routes =  []
stri = ""
animestxt = open("animesclean.txt", "w")

# INSERT INTO AnimeGenre VALUES(5114,1);


listetheme = []
with open (r'C:\Users\Utilisateur\Desktop\SAE_capicapi\fichier\genreanime.txt', 'r') as w:
    for linee in w:
        if i <10:
            temp = linee.split(',')
            tempoo = temp[0].split('(')
            tempo = temp[1].split(')')
            if tempo[0] == str(20) or tempo[0]== str(21):
                listetheme.append(tempoo[1])
                print(tempoo[1])
            i+=0

with open (r'C:\Users\Utilisateur\Desktop\SAE_capicapi\fichier\animes.sql', 'r') as f:
    test = 0
    ligne = str
    for line in f:
        if test < 6:
            liste = line.split('INSERT INTO anime VALUES (')
            print(liste)
            
            
            
# INSERT INTO anime VALUES (5114,'Fullmetal Alchemist: Brotherhood','TV',9.13,1867867,'Finished Airing',64,'2009-04-05','2010-07-04','Manga',2926579,'204314','24 min per ep','R - 17+ (violence & profanity)',2009,ARRAY['Shounen'],ARRAY['Bones'],ARRAY['Aniplex', 'Square Enix', 'Mainichi Broadcasting System', 'Studio Moriken'],ARRAY['Funimation', 'Aniplex of America']
# ,'After a horrific alchemy experiment goes wrong in the Elric household; brothers Edward and Alphonse are left in a catastrophic new reality. Ignoring the alchemical principle banning human transmutation; the boys attempted to bring their recently deceased mother back to life. Instead; they suffered brutal personal loss: Alphonse s body disintegrated while Edward lost a leg and then sacrificed an arm to keep Alphonse s soul in the physical realm by binding it to a hulking suit of armor. The brothers are rescued by their neighbor Pinako Rockbell and her granddaughter Winry. Known as a bio-mechanical engineering prodigy; Winry creates prosthetic limbs for Edward by utilizing  automail;  a tough; versatile metal used in robots and combat armor. After years of training; the Elric brothers set off on a quest to restore their bodies by locating the Philosopher s Stone—a powerful gem that allows an alchemist to defy the traditional laws of Equivalent Exchange. As Edward becomes an infamous alchemist and gains the nickname  Fullmetal;  the boys  journey embroils them in a growing conspiracy that threatens the fate of the world. (Written by MAL Rewrite)','https://cdn.myanimelist.net/images/anime/1223/96541.jpg
# ');
            
            test +=1
            
            
            
            
            
            
            
            # compteur = 0
            # id = 0
            # liste = []
            # listedebut = []
            # listefinale = []
            # listegenre2 = []
            # listetheme2 = []
            # liste = line.split('[')
            # #liste fait 7 de longueur
            # listedebut = liste[0].split(',')
            # x = 0
            # animestxt.write('INSERT INTO anime VALUES (')
            # for t in listedebut:
            #     if x == 0:
            #         id = t
#                 if x == 0 or x ==3 or x == 4 or x ==6 or x == 10 or x==14:
#                     if len(t) == 0:
#                         animestxt.write('NULL')
#                     else:
#                         animestxt.write(str(t))
#                 elif x <15:
#                     if len(t) == 0:
#                         animestxt.write('NULL')
#                     else:
#                         animestxt.write('#')
#                         animestxt.write(str(t))
#                         animestxt.write('#')
#                 if x < 15:
#                     animestxt.write(',')
#                 x+=1
            
#             liste6 = liste[6].split(']')
#             listedegenredelanime= []
#             listedegenredelanimetemporaire= liste[1].split('],')
#             listedegenredelanimetemporaire2 = listedegenredelanimetemporaire[0].split(',')
#             for o in listedegenredelanimetemporaire2:
#                 tttttt = o.split("'")
#                 if len(tttttt)<2:
#                     pass
#                 else:
#                     listedegenredelanime.append(tttttt[1])
            
#             listedethemedelanime= []
#             listedethemedelanimetemporaire= liste[2].split('],')
#             listedethemedelanimetemporaire2 = listedethemedelanimetemporaire[0].split(',')
#             for o in listedethemedelanimetemporaire2:
#                 tttttt = o.split("'")
#                 if len(tttttt)<2:
#                     pass
#                 else:
#                     listedethemedelanime.append(tttttt[1])
            
#             for s in range(1,6):
#                 if s == 1:
#                     for g in listedegenredelanime:
#                         for m in listegenre:
#                             if g == m[1]:
#                                 compteur = 1
#                                 genreanimetxt.write('INSERT INTO AnimeGenre VALUES(')
#                                 genreanimetxt.write(str(id))
#                                 genreanimetxt.write(',')
#                                 genreanimetxt.write(str(m[0]))
#                                 genreanimetxt.write(');')
#                                 genreanimetxt.write('\n')
#                 elif s == 2:
#                     for j in listedethemedelanime:
#                         for l in listetheme:
#                             if j == l[1]:
#                                 themeanimetxt.write('INSERT INTO AnimeTheme VALUES(')
#                                 themeanimetxt.write(str(id))
#                                 themeanimetxt.write(',')
#                                 themeanimetxt.write(str(l[0]))
#                                 themeanimetxt.write(');')
#                                 themeanimetxt.write('\n')
#                 else :
#                     animestxt.write('ARRAY[')
#                     if len(liste[s])< 4:
#                         animestxt.write('##')
#                     animestxt.write(str(liste[s]))
#                     animestxt.write('')
                    
#             animestxt.write('ARRAY[')
#             animestxt.write(liste6[0])
#             animestxt.write(']')
#             animestxt.write('\n')
#             liste7 = liste6[1].split(',')
#             animestxt.write(',')
#             animestxt.write('#')
#             animestxt.write(liste7[1])
#             animestxt.write('#')
#             animestxt.write(',')
#             animestxt.write('#')
#             animestxt.write(liste7[2])
#             animestxt.write('#')
#             animestxt.write(')')
#             animestxt.write(';')
#             animestxt.write('\n')
#             test +=0
        
        
        
        
#         # i += 1
#         # liste = []
#         # listetempo = []
#         # listetempo2 = []
#         # listetempo3 = []
#         # liste = line.split(',')
#         # for x in range(0, 8):
#         #     if x != 2 and x != 4:
#         #         listetempo.append(liste[x])
#         # listetempo.append(i)
#         # b = 0
#         # routestxt.write('INSERT INTO #routes# VALUES (')
#         # for o in listetempo:
#         #     if b == 0 or b ==4:
#         #             routestxt.write('#')
#         #             routestxt.write(str(o))
#         #             routestxt.write('#')
#         #     else:
#         #         routestxt.write(str(o))
#         #     if b != 6:
#         #         routestxt.write(',')
#         #     b+=1
#         # routestxt.write(');')
#         # routestxt.write('\n')



# animestxt.close()
# genreanimetxt.close()
# themeanimetxt.close()


