from fpdf import FPDF
from datetime import datetime
import os
import sys
import win32api
import json
from django.http.response import HttpResponse, JsonResponse
from django.urls import reverse
from django.shortcuts import redirect, render
from .forms import FraisForm
from main.models import Frais, TypeFrais, FicheCode, Fournisseur,AchatEntete, Article, AchatLigne, VenteEntete, VenteLigne, Client, Famille
from . import forms
#from . import tempPDF_FA
from django.http import HttpResponseRedirect
from django.db import connection
from django.contrib import messages
from django.template import Context, Template
from turtle import fillcolor, width
import subprocess







import pandas as pd
import numpy as np




def dashboard(request):
    return render(request, 'dashboard.html')
def edition(request):
    return render(request, 'dashboard.html')

def gesfrais(request):
    
    fraistableaux = Frais.objects.all()       # affichage tableaux
    typefrais = TypeFrais.objects.all()       # affichage combobox
    REFIDEN = Frais.objects.latest('FR_ID')   # recuperation du dernier id
    fichecode = FicheCode.objects.filter(FIC_DESIGNATION="FRAIS")[0]
    REFIDENCODE = str(fichecode)+str(int(str(REFIDEN))+1).zfill(7)
    print(REFIDENCODE)
    context ={
        'frais': fraistableaux,           # affichage tableaux
        'typefrais': typefrais,           # affichage combobox    
        'refidencode':REFIDENCODE, 
               # affichage id dans le REF input
    }
    
 ####     BUTTON  REQUESTS  ############################
    if request.method == 'POST':
        designation = request.POST['des_field']
        date = request.POST['date_field']
        montant = request.POST['montant_field']
        if request.POST.get('type_field_select'):
            type = request.POST.get('type_field_select','default error select ')
        #_______________________________________________________________________
        if 'add' in request.POST :
            ADD_GES_FRAIS = Frais(FR_TYPE_id=type,FR_DESIGNATION=designation,FR_MONTANT=montant,FR_DATE=date,FR_CODE=int(str(REFIDEN))+1,FR_CODE_REF=REFIDENCODE)
            ADD_GES_FRAIS.save()
            
            print("********ADD********")
            print("code 0 = "+str(REFIDENCODE))
            print("________________")
            REFIDEN = Frais.objects.latest('FR_ID')
            REFIDENCODE = str(fichecode)+str(int(str(REFIDEN))+1).zfill(7)
            print("code 1 = "+str(REFIDENCODE))
            return render(request, 'gesfrais.html',{'refidencode':REFIDENCODE,'frais': fraistableaux,'typefrais': typefrais})
        elif 'update' in request.POST:
            
            with connection.cursor() as cursor:
                
                iden = int(request.POST['id_field'])
                cursor.execute('UPDATE main_frais SET "FR_DESIGNATION" = %s  WHERE "FR_ID" = %s',[designation,iden])
                return render(request, 'gesfrais.html',context)
        elif 'delete' in request.POST:
            iden = int(request.POST['id_field'])
            with connection.cursor() as cursor:
                cursor.execute('DELETE FROM main_frais WHERE "FR_ID" = %s',[iden])
                return render(request, 'gesfrais.html',context)
        elif 'reset' in request.POST:
            print("******RESET********")
            print("code recuperer"+str(REFIDEN))
            print("code afficher"+str(REFIDENCODE))
    else:
        HttpResponse('ERROR')

    ##### END BUTTONS REQUESYS ##########
         
       
    return render(request, 'gesfrais.html',context)

def deleteFrais(request, id):
    fraisligne = Frais.objects.get(FR_ID=id)
    fraisligne.delete()
    return HttpResponseRedirect(reverse('gesfrais'))


 

def gesachat(request):

    

    REFIDEN_FR = Frais.objects.latest('FR_ID')   # recuperation du dernier id
    fichecode_FR = FicheCode.objects.filter(FIC_DESIGNATION="FRAIS")[0]
    REFIDENCODE_FR = str(fichecode_FR)+str(int(str(REFIDEN_FR))+1).zfill(7)

    ART_ATCP = Article.objects.all()
    ComboFour = Fournisseur.objects.all()
    REFIDEN = AchatEntete.objects.latest('ACHENT_CODE')     # recuperation du dernier id
    REFIDENAFF = int(str(REFIDEN))+1
    fichecode = FicheCode.objects.filter(FIC_DESIGNATION="FACTURE ACHAT")[0]
    REFIDENCODE = str(fichecode)+str(int(str(REFIDEN))+1).zfill(6)
    LIGNETABLE = AchatLigne.objects.filter(ACHLIG_ID_ACHENT=-1)
    #refarticle=request.POST['reftableauarticle']
    #FILTERART = Article.objects.select_related(refarticle)
    achlig_id_doc=0
    ARRQTY= pd.DataFrame()
  
    
    matrice = []
    matrice_article = []
    matrice_calcul = []

    with connection.cursor() as cursor1:
        matrice.clear()
        array=[]
        cursor1.execute('select "ACHLIG_ID_ART_id","AR_DESIGNATION","ACHLIG_QTY","ACHLIG_PU", "ACHLIG_REM","ACHLIG_ID" from "main_achatligne","main_article" where"main_achatligne"."ACHLIG_ID_ART_id"="main_article"."AR_ID" and "ACHLIG_ID_ACHENT"= -1 ')
        print('****')
        for record in cursor1:
            matrice.append(list(record))  
            
        matricedataframe = pd.DataFrame(matrice,columns=['REF','DESIGNATION','QTY','PU','REMISE','ID'])
        matricedataframe['TOTAL']=(matricedataframe['QTY']*matricedataframe['PU'])+(matricedataframe['QTY']*matricedataframe['PU']*matricedataframe['REMISE'] / 100)
        
        jsonrecords = matricedataframe.reset_index().to_json(orient='records')
        
        array = json.loads(jsonrecords)
        print(matricedataframe)
   
    context ={     
        'combofour': ComboFour,           # affichage combobox 
        'refidencode':REFIDENCODE, 
        'refiden':REFIDENAFF,
        'articleautocomplete':ART_ATCP,
        'artdisplay':LIGNETABLE,
        'd':array,
        
        
        #'fltart':FILTERART,
       
    }
    
       
    if (request.method == 'POST') :
        achent_fourn = request.POST.get('combofour','error')

        achlig_id_doc = REFIDENAFF
        achlig_id_art = request.POST['ACH_ID_AR']   
        #achlig_des_art = request.POST['ACH_DES_AR'] 
        achent_id = request.POST.get('ACH_ENT_ID','error') 
        achlig_qty = request.POST['ACH_QTY_AR'] 
        achlig_pu = request.POST['ACH_PU_AR']
        achlig_rem = request.POST['ACH_REM_AR']
        achent_doc = request.POST['ACHT_ENT_NDOC']
        achent_date = request.POST['ACH_DES_AR1']
        achent_date_real = request.POST['ACH_ENT_DATE']
        achent_fournid = Fournisseur.objects.filter(FO_NOM=achent_fourn).values_list('pk', flat=True).first()
        if request.POST.get('combofourn'):
            fourn_name = request.POST.get('combofourn','default error select')
        
        if 'ACHADD' in request.POST :   
            with connection.cursor() as cursor:
                cursor.execute('INSERT INTO public.main_achatligne ("ACHLIG_ID_ACHENT", "ACHLIG_QTY", "ACHLIG_PU", "ACHLIG_REM", "ACHLIG_ID_ART_id")VALUES (%s, %s, %s, %s, %s)',[-1,achlig_qty,achlig_pu,achlig_rem,Article.objects.get(AR_DESIGNATION=achent_date).AR_ID])
            #____________select le tableau d'affichagE__________________
            with connection.cursor() as cursor1:
                matrice.clear()
                cursor1.execute('select "ACHLIG_ID","ACHLIG_ID_ART_id","AR_DESIGNATION","ACHLIG_QTY","ACHLIG_PU", "ACHLIG_REM" from "main_achatligne","main_article" where"main_achatligne"."ACHLIG_ID_ART_id"="main_article"."AR_ID" and "ACHLIG_ID_ACHENT"= -1 ')
                print('****')
                for record in cursor1:
                    matrice.append(list(record))     
                matricedataframe = pd.DataFrame(matrice,columns=['ID','REF','DESIGNATION','QTY','PU','REMISE'])
                matricedataframe['TOTAL']=(matricedataframe['QTY']*matricedataframe['PU'])+(matricedataframe['QTY']*matricedataframe['PU']*matricedataframe['REMISE'] / 100)
                jsonrecords = matricedataframe.reset_index().to_json(orient='records')
                array = json.loads(jsonrecords)
                print(matrice) 
                return render(request, 'gesachat.html',{'combofour': ComboFour,'refidencode':REFIDENCODE,'refiden':REFIDENAFF, 'articleautocomplete':ART_ATCP,'artdisplay':LIGNETABLE,'d':array}) 
            #____________________________________
        if 'ACHRESET' in request.POST:
            
            
           
            #matricedataframe.drop([0])            
            #pdf.output(name='test01.pdf')
            #os.system('test01.pdf') # to open the PDF if you want to open it in another tab make sure 
                        # your browser is the default app to open the pdf

            #with connection.cursor() as cursor2:
            #    cursor2.execute('DELETE FROM public.main_achatligne where "ACHLIG_ID_ACHENT"=-1 ')    
            #return FileResponse(buf, as_attachment=True, filename=achent_doc+'.pdf')
            return render(request,'gesachat.html',context)
        
        if 'ACHSAVE' in request.POST:
            
            print('date achat')
            print (achent_date_real)
            # RECUPERATION DES DONNEES POUR L'AJOUT AU DEPENSES
            with connection.cursor() as cursor7:
                cursor7.execute('SELECT "AR_ID","ACHLIG_QTY","ACHLIG_PU","ACHLIG_REM" FROM public.main_article, public.main_achatligne where "AR_ID" = "ACHLIG_ID_ART_id" and "ACHLIG_ID_ACHENT" = -1') 
                for record in cursor7:
                    matrice_calcul.append(list(record))
            mat_tot_dt_fr = pd.DataFrame(matrice_calcul,columns=['REF','QTY_ACHETE','PrixU','REM'])
            mat_tot_dt_fr['TOTAL'] = (mat_tot_dt_fr['QTY_ACHETE']*mat_tot_dt_fr['PrixU'])+(mat_tot_dt_fr['QTY_ACHETE']*mat_tot_dt_fr['PrixU']*mat_tot_dt_fr['REM'] / 100)
            total_achat = mat_tot_dt_fr['TOTAL'].sum()
            designation_achat='facture d_achat N° : '+ achent_doc +'.'
            ## INSERTION LE TOTAL DE LA FACTURE DANS LA TABLE FRAIS COMME DEPENSES
            ADD_GES_FRAIS_ACHAT = Frais(FR_TYPE_id=4,FR_DESIGNATION=designation_achat,FR_MONTANT=total_achat,FR_DATE=achent_date_real,FR_CODE=int(str(REFIDEN_FR))+1,FR_CODE_REF=REFIDENCODE_FR)
            ADD_GES_FRAIS_ACHAT.save()
            
            # CALLING PDF FUNCTION
            pdffactureachat(request)
            # RECUPERATION DES DONNES POUR MODIFIER LE STOCK
            with connection.cursor() as cursor4:
                cursor4.execute('SELECT "AR_ID", "AR_STOCK_REEL","ACHLIG_QTY" FROM public.main_article, public.main_achatligne where "AR_ID" = "ACHLIG_ID_ART_id" and "ACHLIG_ID_ACHENT" = -1') 
                for record in cursor4:
                    matrice_article.append(list(record))     
            mat_art_dt_fm = pd.DataFrame(matrice_article,columns=['REF', 'STOCK','QTY_ACHETE'])
            mat_art_dt_fm['STOCK_CAL'] = mat_art_dt_fm['STOCK'] + mat_art_dt_fm['QTY_ACHETE']
            print('**-------------------**')
            print(mat_art_dt_fm)
            print('**-------------------**')
           ##   UPDATE QUERY TO SET THE NEW STOCK ##
            with connection.cursor() as cursor5:
                for index, row in mat_art_dt_fm.iterrows():
                    cursor5.execute('UPDATE public.main_article SET "AR_STOCK_REEL"= '+str(row['STOCK_CAL'])+'  where "AR_ID"='+str(row['REF'])+'')
                  
           #########################################
           ##    INSERTION DANS TABLE ENTETE
            with connection.cursor() as cursor3:
               cursor3.execute('INSERT INTO public.main_achatentete("ACHENT_DOC", "ACHENT_DATE", "ACHENT_ID_FOURN_id","ACHENT_CODE") VALUES (%s, %s, %s,%s)',[achent_doc,achent_date_real,int(achent_fournid), REFIDENAFF])
            #   FIN INSERTION DANS TABLE ENTETE
            
            ## affectation la table ligne a la table entete
            AchatLigne.objects.filter(ACHLIG_ID_ACHENT=-1).update(ACHLIG_ID_ACHENT=REFIDENAFF)
            ## FIN D'AFFECTATION DES LIGNE NB: PAS DE -1
            
            # RAFRAICHIR LE TABLEAU DES ARTICLES
            with connection.cursor() as cursor1:
                array=[]
                cursor1.execute('select "ACHLIG_ID_ART_id","AR_DESIGNATION","ACHLIG_QTY","ACHLIG_PU", "ACHLIG_REM","ACHLIG_ID" from "main_achatligne","main_article" where"main_achatligne"."ACHLIG_ID_ART_id"="main_article"."AR_ID" and "ACHLIG_ID_ACHENT"= -1 ')
                print('****')
                for record in cursor1:
                    matrice.append(list(record))  
                    
                matricedataframe = pd.DataFrame(matrice,columns=['REF','DESIGNATION','QTY','PU','REMISE','ID'])
                matricedataframe['TOTAL']=(matricedataframe['QTY']*matricedataframe['PU'])+(matricedataframe['QTY']*matricedataframe['PU']*matricedataframe['REMISE'] / 100)
                
                jsonrecords = matricedataframe.reset_index().to_json(orient='records')
                
                array = json.loads(jsonrecords)
                
            # RAFRAICHIR L'ID ET LE CODE DU DOCUMENT
            REFIDEN = AchatEntete.objects.latest('ACHENT_CODE')     # recuperation du dernier id
            REFIDENAFF = int(str(REFIDEN))+1
            fichecode = FicheCode.objects.filter(FIC_DESIGNATION="FACTURE ACHAT")[0]
            REFIDENCODE = str(fichecode)+str(int(str(REFIDEN))+1).zfill(6)
            # FIN RAFRAICHIR L'ID ET LE CODE DU DOCUMENT
            return render(request,'gesachat.html',{'combofour': ComboFour,'refidencode':REFIDENCODE, 'refiden':REFIDENAFF,'articleautocomplete':ART_ATCP,'artdisplay':LIGNETABLE,})   
        else :
            HttpResponse('ERROR')
    return render(request, 'gesachat.html', context)


def deleteALigne(request, id):
    achatligne = AchatLigne.objects.get(ACHLIG_ID=id)
    achatligne.delete()
    return HttpResponseRedirect(reverse('gesachat'))


def gesvente(request):

    

    REFIDEN_FR = Frais.objects.latest('FR_ID')   # recuperation du dernier id
    fichecode_FR = FicheCode.objects.filter(FIC_DESIGNATION="FRAIS")[0]
    REFIDENCODE_FR = str(fichecode_FR)+str(int(str(REFIDEN_FR))+1).zfill(7)

    ART_ATCP = Article.objects.all()
    ComboClient = Client.objects.all()
    REFIDEN = VenteEntete.objects.latest('VNTENT_CODE')     # recuperation du dernier id
    REFIDENAFF = int(str(REFIDEN))+1
    fichecode = FicheCode.objects.filter(FIC_DESIGNATION="FACTURE VENTE")[0]
    REFIDENCODE = str(fichecode)+str(int(str(REFIDEN))+1).zfill(6)
    LIGNETABLE = VenteLigne.objects.filter(VNTLIG_ID_VNTENT=-1)
    #refarticle=request.POST['reftableauarticle']
    #FILTERART = Article.objects.select_related(refarticle)
    vntlig_id_doc=0
    ARRQTY= pd.DataFrame()
  
    
    matrice = []
    matrice_article = []
    matrice_calcul = []

    with connection.cursor() as cursor1:
        matrice.clear()
        array=[]
        cursor1.execute('select "VNTLIG_ID_ART_id","AR_DESIGNATION","VNTLIG_QTY","VNTLIG_PU", "VNTLIG_REM","VNTLIG_ID" from "main_venteligne","main_article" where"main_venteligne"."VNTLIG_ID_ART_id"="main_article"."AR_ID" and "VNTLIG_ID_VNTENT"= -1 ')
        print('****')
        for record in cursor1:
            matrice.append(list(record))  
            
        matricedataframe = pd.DataFrame(matrice,columns=['REF','DESIGNATION','QTY','PU','REMISE','ID'])
        matricedataframe['TOTAL']=(matricedataframe['QTY']*matricedataframe['PU'])+(matricedataframe['QTY']*matricedataframe['PU']*matricedataframe['REMISE'] / 100)
        
        jsonrecords = matricedataframe.reset_index().to_json(orient='records')
        
        array = json.loads(jsonrecords)
        print(matricedataframe)
   
    context ={     
        'comboClient': ComboClient,           # affichage combobox 
        'refidencode':REFIDENCODE, 
        'refiden':REFIDENAFF,
        'articleautocomplete':ART_ATCP,
        'artdisplay':LIGNETABLE,
        'd':array,
        
        
        #'fltart':FILTERART,
       
    }
    
   # if (request.method == 'POST' && ):
        #delete_iden = request.DELETE['delete_id']
      #  print ( delete_iden)
       # if 'delete_btn' in request.POST : 
            #VenteLigne.objects.get(pk=int(delete_iden)).delete()
            #print ( "id de la ligne est :  "+delete_iden)
    
         
    if (request.method == 'POST') :
        vntent_client = request.POST.get('comboClient','error')

        vntlig_id_doc = REFIDENAFF
        vntlig_id_art = request.POST['VNT_ID_AR']   
        #achlig_des_art = request.POST['ACH_DES_AR'] 
        vntent_id = request.POST.get('VNT_ENT_ID','error') 
        vntlig_qty = request.POST['VNT_QTY_AR'] 
        vntlig_pu = request.POST['VNT_PU_AR']
        vntlig_rem = request.POST['VNT_REM_AR']
        vntent_doc = request.POST['VNT_ENT_NDOC']
        vntent_date = request.POST['VNT_DES_AR1']
        vntent_date_real = request.POST['VNT_ENT_DATE']
        vntent_clientid = Client.objects.filter(CL_NOM=vntent_client).values_list('pk', flat=True).first()
        if request.POST.get('comboClient'):
            client_name = request.POST.get('comboClient','default error select')
        
        if 'VNTADD' in request.POST :   
            with connection.cursor() as cursor:
                cursor.execute('INSERT INTO public.main_venteligne ("VNTLIG_ID_VNTENT", "VNTLIG_QTY", "VNTLIG_PU", "VNTLIG_REM", "VNTLIG_ID_ART_id")VALUES (%s, %s, %s, %s, %s)',[-1,vntlig_qty,vntlig_pu,vntlig_rem,Article.objects.get(AR_DESIGNATION=vntent_date).AR_ID])
            #____________select le tableau d'affichagE__________________
            with connection.cursor() as cursor1:
                matrice.clear()
                cursor1.execute('select "VNTLIG_ID","VNTLIG_ID_ART_id","AR_DESIGNATION","VNTLIG_QTY","VNTLIG_PU", "VNTLIG_REM" from "main_venteligne","main_article" where"main_venteligne"."VNTLIG_ID_ART_id"="main_article"."AR_ID" and "VNTLIG_ID_VNTENT"= -1 ')
                print('****')
                for record in cursor1:
                    matrice.append(list(record))     
                matricedataframe = pd.DataFrame(matrice,columns=['ID','REF','DESIGNATION','QTY','PU','REMISE'])
                matricedataframe['TOTAL']=(matricedataframe['QTY']*matricedataframe['PU'])+(matricedataframe['QTY']*matricedataframe['PU']*matricedataframe['REMISE'] / 100)
                jsonrecords = matricedataframe.reset_index().to_json(orient='records')
                array = json.loads(jsonrecords)
                print(matrice) 
                return render(request, 'gesvente.html',{'comboClient': ComboClient,'refidencode':REFIDENCODE,'refiden':REFIDENAFF, 'articleautocomplete':ART_ATCP,'artdisplay':LIGNETABLE,'d':array}) 
            #____________________________________
        if 'VNTRESET' in request.POST:
            
            
           
            #matricedataframe.drop([0])            
            #pdf.output(name='test01.pdf')
            #os.system('test01.pdf') # to open the PDF if you want to open it in another tab make sure 
                        # your browser is the default app to open the pdf

            #with connection.cursor() as cursor2:
            #    cursor2.execute('DELETE FROM public.main_achatligne where "ACHLIG_ID_ACHENT"=-1 ')    
            #return FileResponse(buf, as_attachment=True, filename=achent_doc+'.pdf')
            return render(request,'gesachat.html',context)
        
        if 'VNTSAVE' in request.POST:
            
            print('date vente')
            print (vntent_date_real)
            # RECUPERATION DES DONNEES POUR L'AJOUT AU DEPENSES
            with connection.cursor() as cursor7:
                cursor7.execute('SELECT "AR_ID","VNTLIG_QTY","VNTLIG_PU","VNTLIG_REM" FROM public.main_article, public.main_venteligne where "AR_ID" = "VNTLIG_ID_ART_id" and "VNTLIG_ID_VNTENT" = -1') 
                for record in cursor7:
                    matrice_calcul.append(list(record))
            mat_tot_dt_fr = pd.DataFrame(matrice_calcul,columns=['REF','QTY_ACHETE','PrixU','REM'])
            mat_tot_dt_fr['TOTAL'] = (mat_tot_dt_fr['QTY_ACHETE']*mat_tot_dt_fr['PrixU'])+(mat_tot_dt_fr['QTY_ACHETE']*mat_tot_dt_fr['PrixU']*mat_tot_dt_fr['REM'] / 100)
            total_achat = mat_tot_dt_fr['TOTAL'].sum()
            designation_achat='facture de vente N° : '+ vntent_doc +'.'
            ## INSERTION LE TOTAL DE LA FACTURE DANS LA TABLE FRAIS COMME DEPENSES
            #ADD_GES_FRAIS_ACHAT = Frais(FR_TYPE_id=2,FR_DESIGNATION=designation_achat,FR_MONTANT=total_achat,FR_DATE=achent_date_real,FR_CODE=int(str(REFIDEN_FR))+1,FR_CODE_REF=REFIDENCODE_FR)
            #ADD_GES_FRAIS_ACHAT.save()
            
            # CALLING PDF FUNCTION
            pdffacturevente(request)
            # RECUPERATION DES DONNES POUR MODIFIER LE STOCK
            with connection.cursor() as cursor4:
                cursor4.execute('SELECT "AR_ID", "AR_STOCK_REEL","VNTLIG_QTY" FROM public.main_article, public.main_venteligne where "AR_ID" = "VNTLIG_ID_ART_id" and "VNTLIG_ID_VNTENT" = -1') 
                for record in cursor4:
                    matrice_article.append(list(record))     
            mat_art_dt_fm = pd.DataFrame(matrice_article,columns=['REF', 'STOCK','QTY_ACHETE'])
            mat_art_dt_fm['STOCK_CAL'] = mat_art_dt_fm['STOCK'] - mat_art_dt_fm['QTY_ACHETE']
            print('**-------------------**')
            print(mat_art_dt_fm)
            print('**-------------------**')
           ##   UPDATE QUERY TO SET THE NEW STOCK ##
            with connection.cursor() as cursor5:
                for index, row in mat_art_dt_fm.iterrows():
                    cursor5.execute('UPDATE public.main_article SET "AR_STOCK_REEL"= '+str(row['STOCK_CAL'])+'  where "AR_ID"='+str(row['REF'])+'')
                  
           #########################################
           ##    INSERTION DANS TABLE ENTETE
            with connection.cursor() as cursor3:
               cursor3.execute('INSERT INTO public.main_venteentete("VNTENT_DOC", "VNTENT_DATE", "VNTENT_ID_CLIENT_id","VNTENT_CODE") VALUES (%s, %s, %s,%s)',[vntent_doc,vntent_date_real,int(vntent_clientid), REFIDENAFF])
            #   FIN INSERTION DANS TABLE ENTETE
            
            ## affectation la table ligne a la table entete
            VenteLigne.objects.filter(VNTLIG_ID_VNTENT=-1).update(VNTLIG_ID_VNTENT=REFIDENAFF)
            ## FIN D'AFFECTATION DES LIGNE NB: PAS DE -1
            
            # RAFRAICHIR LE TABLEAU DES ARTICLES
            with connection.cursor() as cursor1:
                array=[]
                cursor1.execute('select "VNTLIG_ID_ART_id","AR_DESIGNATION","VNTLIG_QTY","VNTLIG_PU", "VNTLIG_REM","VNTLIG_ID" from "main_venteligne","main_article" where"main_venteligne"."VNTLIG_ID_ART_id"="main_article"."AR_ID" and "VNTLIG_ID_VNTENT"= -1 ')
                print('****')
                for record in cursor1:
                    matrice.append(list(record))  
                    
                matricedataframe = pd.DataFrame(matrice,columns=['REF','DESIGNATION','QTY','PU','REMISE','ID'])
                matricedataframe['TOTAL']=(matricedataframe['QTY']*matricedataframe['PU'])+(matricedataframe['QTY']*matricedataframe['PU']*matricedataframe['REMISE'] / 100)
                
                jsonrecords = matricedataframe.reset_index().to_json(orient='records')
                
                array = json.loads(jsonrecords)
                
            # RAFRAICHIR L'ID ET LE CODE DU DOCUMENT
            REFIDEN = VenteEntete.objects.latest('VNTENT_CODE')     # recuperation du dernier id
            REFIDENAFF = int(str(REFIDEN))+1
            fichecode = FicheCode.objects.filter(FIC_DESIGNATION="FACTURE VENTE")[0]
            REFIDENCODE = str(fichecode)+str(int(str(REFIDEN))+1).zfill(6)
            # FIN RAFRAICHIR L'ID ET LE CODE DU DOCUMENT
            return render(request,'gesvente.html',{'comboClient': ComboClient,'refidencode':REFIDENCODE, 'refiden':REFIDENAFF,'articleautocomplete':ART_ATCP,'artdisplay':LIGNETABLE,})   
        else :
            HttpResponse('ERROR')
    return render(request, 'gesvente.html', context)

def deleteVLigne(request, id):
    Venteligne = VenteLigne.objects.get(VNTLIG_ID=id)
    Venteligne.delete()
    return HttpResponseRedirect(reverse('gesvente'))
    ###################################################################################################################################
def gesprod(request):
    return render(request, 'gesprod.html')
def gesemp(request):
    return render(request, 'gesemp.html')
def pdffacturevente(request):
    REFIDEN = VenteEntete.objects.latest('VNTENT_CODE')     # recuperation du dernier id
    fichecode = FicheCode.objects.filter(FIC_DESIGNATION="FACTURE VENTE")[0]
    REFIDENCODE = str(fichecode)+str(int(str(REFIDEN))+1).zfill(6)
    vntent_date_real = request.POST['VNT_ENT_DATE']
    matrice_Client= []
    matrice_v_ligne = []
    # GET FOURNISSEUR DATA
    vntent_Client = request.POST.get('comboClient','error')
    vntent_Clientid = Client.objects.filter(CL_NOM=vntent_Client).values_list('pk', flat=True).first()
    if request.POST.get('comboClient'):
        Client_name = request.POST.get('comboClient','default error select')
    with connection.cursor() as cursor7:
        sql = 'SELECT * FROM public.main_Client where "CL_ID" = '+str(vntent_Clientid) +''
        cursor7.execute( sql) 
        for record in cursor7:
            matrice_Client.append(list(record))
        matricedataframe_CL = pd.DataFrame(matrice_Client,columns=['ID','NOM','ADR','TEL','MAIL','RC','AI','NIF','CODE','CODE_CHAR'])
        print(matricedataframe_CL)        
    

    with connection.cursor() as cursor1:
                array=[]
                cursor1.execute('select "VNTLIG_ID_ART_id","AR_DESIGNATION","VNTLIG_QTY","VNTLIG_PU", "VNTLIG_REM","VNTLIG_ID" from "main_venteligne","main_article" where"main_venteligne"."VNTLIG_ID_ART_id"="main_article"."AR_ID" and "VNTLIG_ID_VNTENT"= -1 ')
                print('****')
                for record in cursor1:
                    matrice_v_ligne.append(list(record))  
                    
                matricedataframe = pd.DataFrame(matrice_v_ligne,columns=['REF','DESIGNATION','QTY','PU','REMISE','ID'])
                matricedataframe['TOTAL']=(matricedataframe['QTY']*matricedataframe['PU'])+(matricedataframe['QTY']*matricedataframe['PU']*matricedataframe['REMISE'] / 100)
                
                
             



    #-- 'L' pour landscape and 'P' for portrait
    #pdf = FPDF('P', 'mm', 'A4')
    pdf = FPDF('P', 'mm', 'A4')
    #-- set auto page break "saut de page" 
    pdf.set_auto_page_break(auto=True, margin=5)
    #--add a page
    pdf.alias_nb_pages()
    pdf.add_page()
    pdf.ln(1)  
    pdf.set_font('times','B',14)
    pdf.set_fill_color(200)
    pdf.cell(40,25,'',fill=1)
    pdf.image('./static/images/logo.png', 10, 10 , 30)
    pdf.cell(0,15, 'EURL BERRACUIR',fill=1)
    pdf.set_font('times','',10)
    
    pdf.ln(15)
    pdf.set_font('times','',12)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(60,7, 'Z.A OUED TLILET LOT N° 02:',fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(0,7, 'NIF : 001731011690289:',ln=1,fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(60,7, 'ORAN, ALGERIE',fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(0,7, 'ART : 31111710174',ln=1,fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(60,7, 'Tel: 00 213 670 372 542',fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(0,7, 'RC : 17B0116902-31/00',ln=1,fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(60,7, '@ : berracuirdz@gmail.com',fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(0,7, 'NIS : 0 017 3111 00096 59',ln=1,fill=1)
    
    pdf.ln(10)
    pdf.set_font('times','BU',22)
    
    pdf.cell(150,10, 'FACTURE VENTE',ln=1,align='R')
    pdf.set_font('times','B',11)
    pdf.cell(80,10, '')
    pdf.cell(35,7, 'N° FACTURE',border=1,align='C',)
    pdf.cell(35,7, 'DATE',ln=1,border=1,align='C')
    pdf.cell(80,10, '')
    pdf.cell(35,7, REFIDENCODE,border=1,align='C',)
    pdf.cell(35,7, vntent_date_real,border=1,align='C',)

    #-- specify font
    #--fonts : ( 'times', 'courier', 'helvetica','symbol','zpfdingbats')
    #-- 'B' for Bold,'U' for underline, 'I' for Italics, '' for regular,combination (i.e, (BU) bold and underlined),   
    pdf.set_font('times', '',12)


    #-- add text in cell
    #-- w = width   put 0 for max width
    #-- h = height  put 0 for max height
    #-- ln = true pour le saut de ligne
    #-- border = true pour dessiner la bordure utilisation dans les tableaux

    pdf.ln(10)
    text01='    Code Client : '+ str(matricedataframe_CL.iloc[0]['CODE_CHAR'])+'        Client : '+ matricedataframe_CL.iloc[0]['NOM']+'         Tel:'+ str(matricedataframe_CL.iloc[0]['TEL'])+' \n '
    text01+='   Adresse : '+matricedataframe_CL.iloc[0]['ADR']+'. \n'
    text01+='    RC: '+ matricedataframe_CL.iloc[0]['RC']+'           AI: '+ matricedataframe_CL.iloc[0]['AI']+'      NIF : '+ matricedataframe_CL.iloc[0]['NIF']+'\n'

    pdf.multi_cell(0, 10, text01,border=1)

    # PRINT ARTICLES LINES
    pdf.set_font('times', '',11)
    pdf.ln(20)
    pdf.set_font('times', 'BU',12)
    pdf.cell(20, 10,'Ref' ,border=1,align='C')
    pdf.cell(80, 10,'Désignation' ,border=1,align='C')
    pdf.cell(15, 10,'Qte' ,border=1,align='C')
    pdf.cell(25, 10,'PU' ,border=1,align='C')
    pdf.cell(15, 10,'Remise' ,border=1,align='C')
    pdf.cell(25, 10,'Total' ,border=1,align='C',ln=1)

    pdf.set_font('times', '',11)
    for i in matricedataframe.index :
        pdf.cell(20, 10,str(matricedataframe.iloc[i]['REF']) ,border=1,align='C')
        pdf.cell(80, 10,str(matricedataframe.iloc[i]['DESIGNATION'] ) ,border=1,align='C')
        pdf.cell(15, 10,str(matricedataframe.iloc[i]['QTY'])  ,border=1,align='C')
        pdf.cell(25, 10,str(matricedataframe.iloc[i]['PU'])  ,border=1,align='C')
        pdf.cell(15, 10,str(matricedataframe.iloc[i]['REMISE'])  ,border=1,align='C')
        pdf.cell(25, 10,str(matricedataframe.iloc[i]['TOTAL'] ) ,border=1,align='C',ln=1)

    #-- draw a line to separate the footer from the body
    pdf.cell(-25)
    pdf.set_line_width(0.5)
    pdf.line(3,265,200,265)
    
    #-- set the footer 15 mm from the bottom 
    pdf.set_y(-30) 
    #-- set font
    pdf.set_font('times','', 8)
    
    pdf.cell(0,5, 'EURL BERRACUIR, Zone d''activité Oued Tlelat, N° 84, Oran Algérie',ln=1,align='C')
    pdf.cell(0,5, 'Tel : +213 674 722 611 || RC : ########### || IF : ############',ln=1,align='C')
    pdf.cell(0,5, 'Compte BDL N° : @@@@@@@@@@@@@@@@@',ln=1,align='C')
    #-- page number
    pdf.cell(0,10,f'Page {pdf.page_no()}/{{nb}}',align='C') 

    output_for_FV = "doc/VT/"+str(REFIDENCODE)+".pdf"
    pdf.output(name=output_for_FV)
    os.system('C:\\Users\\hp\\Documents\\DEV\\wab\\doc\\VT\\'+str(REFIDENCODE)+'.pdf')
def pdffactureachat(request):
    REFIDEN = AchatEntete.objects.latest('ACHENT_CODE')     # recuperation du dernier id
    fichecode = FicheCode.objects.filter(FIC_DESIGNATION="FACTURE ACHAT")[0]
    REFIDENCODE = str(fichecode)+str(int(str(REFIDEN))+1).zfill(6)
    achent_date_real = request.POST['ACH_ENT_DATE']
    matrice_Fournisseur= []
    matrice_a_ligne = []
    # GET FOURNISSEUR DATA
    achent_fournisseur = request.POST.get('combofour','error')
    achent_Fournisseurid = Fournisseur.objects.filter(FO_NOM=achent_fournisseur).values_list('pk', flat=True).first()
    if request.POST.get('combofour'):
        Fournisseur_name = request.POST.get('combofour','default error select')
    with connection.cursor() as cursor7:
        sql = 'SELECT * FROM public.main_Fournisseur where "FO_ID" = '+str(achent_Fournisseurid) +''
        cursor7.execute( sql) 
        for record in cursor7:
            matrice_Fournisseur.append(list(record))
        matricedataframe_FO = pd.DataFrame(matrice_Fournisseur,columns=['ID','NOM','ADR','TEL','MAIL','RC','AI','NIF','CODE','CODE_CHAR'])
        print(matricedataframe_FO)        
    print(matrice_Fournisseur)

    with connection.cursor() as cursor1:
                array=[]
                cursor1.execute('select "ACHLIG_ID_ART_id","AR_DESIGNATION","ACHLIG_QTY","ACHLIG_PU", "ACHLIG_REM","ACHLIG_ID" from "main_achatligne","main_article" where"main_achatligne"."ACHLIG_ID_ART_id"="main_article"."AR_ID" and "ACHLIG_ID_ACHENT"= -1 ')
                print('****')
                for record in cursor1:
                    matrice_a_ligne.append(list(record))  
                    
                matricedataframe = pd.DataFrame(matrice_a_ligne,columns=['REF','DESIGNATION','QTY','PU','REMISE','ID'])
                matricedataframe['TOTAL']=(matricedataframe['QTY']*matricedataframe['PU'])+(matricedataframe['QTY']*matricedataframe['PU']*matricedataframe['REMISE'] / 100)
                
                
            



    #-- 'L' pour landscape and 'P' for portrait
    #pdf = FPDF('P', 'mm', 'A4')
    pdf = FPDF('P', 'mm', 'A4')
    #-- set auto page break "saut de page" 
    pdf.set_auto_page_break(auto=True, margin=5)
    #--add a page
    pdf.alias_nb_pages()
    pdf.add_page()
    pdf.ln(1)  
    pdf.set_font('times','B',14)
    pdf.set_fill_color(200)
    pdf.cell(40,25,'',fill=1)
    pdf.image('./static/images/logo.png', 10, 10 , 30)
    pdf.cell(0,15, 'EURL BERRACUIR',fill=1)
    pdf.set_font('times','',10)
    
    pdf.ln(15)
    pdf.set_font('times','',12)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(60,7, 'Z.A OUED TLILET LOT N° 02:',fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(0,7, 'NIF : 001731011690289:',ln=1,fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(60,7, 'ORAN, ALGERIE',fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(0,7, 'ART : 31111710174',ln=1,fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(60,7, 'Tel: 00 213 670 372 542',fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(0,7, 'RC : 17B0116902-31/00',ln=1,fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(60,7, '@ : berracuirdz@gmail.com',fill=1)
    pdf.cell(30,7,'',fill=1)
    pdf.cell(0,7, 'NIS : 0 017 3111 00096 59',ln=1,fill=1)
    
    pdf.ln(10)
    pdf.set_font('times','BU',22)
    
    pdf.cell(150,10, 'FACTURE ACHAT',ln=1,align='R')
    pdf.set_font('times','B',11)
    pdf.cell(80,10, '')
    pdf.cell(35,7, 'N° FACTURE',border=1,align='C',)
    pdf.cell(35,7, 'DATE',ln=1,border=1,align='C')
    pdf.cell(80,10, '')
    pdf.cell(35,7, REFIDENCODE,border=1,align='C',)
    pdf.cell(35,7, achent_date_real,border=1,align='C',)

    #-- specify font
    #--fonts : ( 'times', 'courier', 'helvetica','symbol','zpfdingbats')
    #-- 'B' for Bold,'U' for underline, 'I' for Italics, '' for regular,combination (i.e, (BU) bold and underlined),   
    pdf.set_font('times', '',12)


    #-- add text in cell
    #-- w = width   put 0 for max width
    #-- h = height  put 0 for max height
    #-- ln = true pour le saut de ligne
    #-- border = true pour dessiner la bordure utilisation dans les tableaux

    pdf.ln(10)
    text01='    Code Fournisseur : '+ str(matricedataframe_FO.iloc[0]['CODE_CHAR'])+'        Fournisseur : '+ matricedataframe_FO.iloc[0]['NOM']+'         Tel:'+ str(matricedataframe_FO.iloc[0]['TEL'])+' \n '
    text01+='   Adresse : '+matricedataframe_FO.iloc[0]['ADR']+'. \n'
    text01+='    RC: '+ matricedataframe_FO.iloc[0]['RC']+'           AI: '+ matricedataframe_FO.iloc[0]['AI']+'      NIF : '+ matricedataframe_FO.iloc[0]['NIF']+'\n'

    pdf.multi_cell(0, 10, text01,border=1)

    # PRINT ARTICLES LINES
    pdf.set_font('times', '',11)
    pdf.ln(20)
    pdf.set_font('times', 'BU',12)
    pdf.cell(20, 10,'Ref' ,border=1,align='C')
    pdf.cell(80, 10,'Désignation' ,border=1,align='C')
    pdf.cell(15, 10,'Qte' ,border=1,align='C')
    pdf.cell(25, 10,'PU' ,border=1,align='C')
    pdf.cell(15, 10,'Remise' ,border=1,align='C')
    pdf.cell(25, 10,'Total' ,border=1,align='C',ln=1)

    pdf.set_font('times', '',11)
    for i in matricedataframe.index :
        pdf.cell(20, 10,str(matricedataframe.iloc[i]['REF']) ,border=1,align='C')
        pdf.cell(80, 10,str(matricedataframe.iloc[i]['DESIGNATION'] ) ,border=1,align='C')
        pdf.cell(15, 10,str(matricedataframe.iloc[i]['QTY'])  ,border=1,align='C')
        pdf.cell(25, 10,str(matricedataframe.iloc[i]['PU'])  ,border=1,align='C')
        pdf.cell(15, 10,str(matricedataframe.iloc[i]['REMISE'])  ,border=1,align='C')
        pdf.cell(25, 10,str(matricedataframe.iloc[i]['TOTAL'] ) ,border=1,align='C',ln=1)

    #-- draw a line to separate the footer from the body
    pdf.cell(-25)
    pdf.set_line_width(0.5)
    pdf.line(3,265,200,265)
    
    #-- set the footer 15 mm from the bottom 
    pdf.set_y(-30) 
    #-- set font
    pdf.set_font('times','', 8)
    
    pdf.cell(0,5, 'EURL BERRACUIR, Zone d''activité Oued Tlelat, N° 84, Oran Algérie',ln=1,align='C')
    pdf.cell(0,5, 'Tel : +213 674 722 611 || RC : ########### || IF : ############',ln=1,align='C')
    pdf.cell(0,5, 'Compte BDL N° : @@@@@@@@@@@@@@@@@',ln=1,align='C')
    #-- page number
    pdf.cell(0,10,f'Page {pdf.page_no()}/{{nb}}',align='C') 

    output_for_FA = "doc/FA/"+str(REFIDENCODE)+".pdf"
    pdf.output(name=output_for_FA)
    os.system('C:\\Users\\hp\\Documents\\DEV\\wab\\doc\\FA\\'+str(REFIDENCODE)+'.pdf')

def gesarticle(request):
    ComboFamille= Famille.objects.all()

    matrice = []
    with connection.cursor() as cursor1:
        matrice.clear()
        ArrayArticle=[]
        cursor1.execute('select "AR_ID","AR_DESIGNATION","AR_FAMILLE","AR_PU_DEF","AR_STOCK_REEL","AR_CODE" from "main_article" ')
        print('****')
        for record in cursor1:
            matrice.append(list(record))  
            
        matricedataframe = pd.DataFrame(matrice,columns=['REF','DESIGNATION','FAMILLE','PU','STOCK_REEL','CODE'])
        
        jsonrecords = matricedataframe.reset_index().to_json(orient='records')
        
        ArrayArticle = json.loads(jsonrecords)
        print(matricedataframe) 
    context ={     
        'comboFamille': ComboFamille,
        'ArrayArticle': ArrayArticle,
    }

    if (request.method == 'POST') :
        print('METHODE == POST')
        designation_field = request.POST['AR_DESIGNATION_TXT']
        qty_field = request.POST['AR_QTY_TXT']
        pu_field = request.POST['AR_PU_TXT']
        famille = request.POST.get('comboFamille','error')
        FAMILLE_id = Famille.objects.filter(FAM_DES=famille).values_list('pk', flat=True).first()
        if request.POST.get('comboFamille'):
            famille_name = request.POST.get('comboFamille','default error select')
        

        if 'ART_ADD' in request.POST :
            print('IF DE ART_ADD REQUEST')
            with connection.cursor() as cursor:
                cursor.execute('INSERT INTO public.main_article ( "AR_DESIGNATION", "AR_FAMILLE", "AR_STOCK_REEL", "AR_PU_DEF","AR_CODE")VALUES (%s, %s, %s, %s, %s)',[designation_field,famille_name,qty_field,pu_field,'test'])
            with connection.cursor() as cursor1:
                matrice.clear()
                ArrayArticle=[]
                cursor1.execute('select "AR_ID","AR_DESIGNATION","AR_FAMILLE","AR_PU_DEF","AR_STOCK_REEL","AR_CODE" from "main_article" ')
                print('****')
                for record in cursor1:
                    matrice.append(list(record))  
                    
                matricedataframe = pd.DataFrame(matrice,columns=['REF','DESIGNATION','FAMILLE','PU','STOCK_REEL','CODE'])
                
                jsonrecords = matricedataframe.reset_index().to_json(orient='records')
                
                ArrayArticle = json.loads(jsonrecords)
                
            return render(request, 'gesarticle.html',{'comboFamille': ComboFamille,'ArrayArticle': ArrayArticle})
        return render(request, 'gesarticle.html',context)
    


    return render(request, 'gesarticle.html',context)

def deleteArticle(request, id):
    articleligne = Article.objects.get(AR_ID=id)
    articleligne.delete()
    return HttpResponseRedirect(reverse('gesarticle'))

def gesfourn(request):
    code_fourn = Fournisseur.objects.latest('FO_CODE')
    fiche_code_fournisseur = FicheCode.objects.filter(FIC_DESIGNATION="FOURNISSEUR")[0]
    code_char_fournisseur = str(fiche_code_fournisseur) + str(int(str(code_fourn))+1).zfill(3)
    matrice = []
    ArrayFournisseur = []
    with connection.cursor() as cursor1:
        matrice.clear()
        ArrayFournisseur=[]
        cursor1.execute('select "FO_CODE_CHAR","FO_NOM","FO_TEL","FO_MAIL" from "main_fournisseur" ')
        for record in cursor1:
            matrice.append(list(record))  
            
        matricedataframe = pd.DataFrame(matrice,columns=['REF','NOM','TEL','EMAIL'])
        
        jsonrecords = matricedataframe.reset_index().to_json(orient='records')
        
        ArrayFournisseur = json.loads(jsonrecords)
    context ={  
        'code_char_fournisseur':code_char_fournisseur,
        'ArrayFournisseur': ArrayFournisseur,   
    }
    if (request.method == 'POST') :
       
        code_fournisseur = request.POST['code_fourn_txt']
        nom = request.POST['nom_txt']
        adr = request.POST['adr_txt']
        tel = request.POST['tel_txt']
        mail = request.POST['mail_txt']
        rc = request.POST['rc_txt']
        nif = request.POST['nif_txt']
        ai = request.POST['ai_txt']
        code = int(str(code_fourn))+1
        if 'FOURN_ADD' in request.POST :
            fournisseur_query = Fournisseur(FO_NOM=nom, FO_ADR=adr, FO_TEL=tel, FO_MAIL=mail, FO_RC=rc, FO_AI=ai, FO_NIF=nif, FO_CODE = code ,FO_CODE_CHAR=code_char_fournisseur )
            fournisseur_query.save()
            code_fourn = Fournisseur.objects.latest('FO_CODE')
            fiche_code_fournisseur = FicheCode.objects.filter(FIC_DESIGNATION="FOURNISSEUR")[0]
            code_char_fournisseur = str(fiche_code_fournisseur) + str(int(str(code_fourn))+1).zfill(3)
            with connection.cursor() as cursor1:
                matrice.clear()
                ArrayFournisseur=[]
                cursor1.execute('select "FO_CODE_CHAR","FO_NOM","FO_TEL","FO_MAIL" from "main_fournisseur" ')
                for record in cursor1:
                    matrice.append(list(record))      
                matricedataframe = pd.DataFrame(matrice,columns=['REF','NOM','TEL','EMAIL'])
                jsonrecords = matricedataframe.reset_index().to_json(orient='records')
                ArrayFournisseur = json.loads(jsonrecords)
            return render(request, 'gesfourn.html',{'code_char_fournisseur':code_char_fournisseur,'ArrayFournisseur': ArrayFournisseur})
        return render(request, 'gesfourn.html',{'code_char_fournisseur':code_char_fournisseur,'ArrayFournisseur': ArrayFournisseur})
    return render(request, 'gesfourn.html',{'code_char_fournisseur':code_char_fournisseur,'ArrayFournisseur': ArrayFournisseur,})

def deleteFournisseur(request, id):
    suppfournisseur = Fournisseur.objects.get(FO_CODE_CHAR=id)
    suppfournisseur.delete()
    return HttpResponseRedirect(reverse('gesfourn'))

def gesclient(request):
    code_cli = Client.objects.latest('CL_CODE')
    fiche_code_client = FicheCode.objects.filter(FIC_DESIGNATION="CLIENT")[0]
    code_char_client = str(fiche_code_client) + str(int(str(code_cli))+1).zfill(3)
    matrice = []
    ArrayClient = []
    with connection.cursor() as cursor1:
        matrice.clear()
        ArrayClient=[]
        cursor1.execute('select "CL_CODE_CHAR","CL_NOM","CL_TEL","CL_MAIL" from "main_client" ')
        for record in cursor1:
            matrice.append(list(record))  
            
        matricedataframe = pd.DataFrame(matrice,columns=['REF','NOM','TEL','EMAIL'])
        
        jsonrecords = matricedataframe.reset_index().to_json(orient='records')
        
        ArrayClient = json.loads(jsonrecords)
    context ={  
        'code_char_client':code_char_client,
        'ArrayClient': ArrayClient,   
    }
    if (request.method == 'POST') :
       
        code_client = request.POST['code_client_txt']
        nom = request.POST['nom_txt']
        adr = request.POST['adr_txt']
        tel = request.POST['tel_txt']
        mail = request.POST['mail_txt']
        rc = request.POST['rc_txt']
        nif = request.POST['nif_txt']
        ai = request.POST['ai_txt']
        code = int(str(code_cli))+1
        if 'CLIENT_ADD' in request.POST :
            client_query = Client(CL_NOM=nom, CL_ADR=adr, CL_TEL=tel, CL_MAIL=mail, CL_RC=rc, CL_AI=ai, CL_NIF=nif, CL_CODE = code ,CL_CODE_CHAR=code_char_client )
            client_query.save()
            code_cli = Client.objects.latest('CL_CODE')
            fiche_code_client = FicheCode.objects.filter(FIC_DESIGNATION="CLIENT")[0]
            code_char_client = str(fiche_code_client) + str(int(str(code_cli))+1).zfill(3)
            with connection.cursor() as cursor1:
                matrice.clear()
                ArrayClient=[]
                cursor1.execute('select "CL_CODE_CHAR","CL_NOM","CL_TEL","CL_MAIL" from "main_client" ')
                for record in cursor1:
                    matrice.append(list(record))      
                matricedataframe = pd.DataFrame(matrice,columns=['REF','NOM','TEL','EMAIL'])
                jsonrecords = matricedataframe.reset_index().to_json(orient='records')
                ArrayClient = json.loads(jsonrecords)
            return render(request, 'gesclient.html',{'code_char_client':code_char_client,'ArrayClient': ArrayClient})
        return render(request, 'gesclient.html',{'code_char_client':code_char_client,'ArrayClient': ArrayClient})
    return render(request, 'gesclient.html',{'code_char_client':code_char_client,'ArrayClient': ArrayClient})

def deleteClient(request, id):
    suppclient = Client.objects.get(CL_CODE_CHAR=id)
    suppclient.delete()
    return HttpResponseRedirect(reverse('gesclient'))


