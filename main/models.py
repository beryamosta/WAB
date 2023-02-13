
import django
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.forms import ModelForm
from django.db import models
from django.db.models.deletion import CASCADE
from django.db.models.fields.related import ForeignKey 

  

class TypeFrais (models.Model):
    FRT_ID=models.AutoField(primary_key=True)
    FRT_NAME= models.CharField(unique=True, max_length=50)

    def __str__(self):
        return self.FRT_NAME

class FicheCode(models.Model):
    FIC_ID = models.AutoField(primary_key=True)
    FIC_DESIGNATION = models.CharField(unique=True, max_length=50)
    FIC_CODE = models.CharField(unique=True, max_length=5)
    
    def __str__(self):
        return self.FIC_CODE

        

class Fournisseur(models.Model):
    FO_ID= models.AutoField(primary_key=True)
    FO_NOM= models.CharField(max_length=100, unique=True)
    FO_ADR= models.TextField(max_length=255)
    FO_TEL=models.CharField(max_length=14)
    FO_MAIL=models.CharField(max_length=100)
    FO_RC= models.CharField(max_length=15)
    FO_AI= models.CharField(max_length=15)
    FO_NIF= models.CharField(max_length=15)
    FO_CODE=models.IntegerField()
    FO_CODE_CHAR = models.CharField(max_length=5, default='foold')
    def __str__(self):
        return str(self.FO_CODE)
    




class Client(models.Model):
    CL_ID= models.AutoField(primary_key=True)
    CL_NOM= models.CharField(max_length=100, unique=True)
    CL_ADR= models.TextField(max_length=255)
    CL_TEL=models.CharField(max_length=14)
    CL_MAIL=models.CharField(max_length=100)
    CL_RC= models.CharField(max_length=15)
    CL_AI= models.CharField(max_length=15)
    CL_NIF= models.CharField(max_length=15)
    CL_CODE=models.IntegerField()
    CL_CODE_CHAR = models.CharField(max_length=5, default='clold')
    
    def __str__(self):
        return str(self.CL_CODE)

class Frais(models.Model):
    FR_ID = models.AutoField(primary_key=True)
    FR_TYPE = models.ForeignKey(TypeFrais, on_delete=CASCADE)
    FR_DESIGNATION = models.TextField(max_length=255)
    FR_MONTANT = models.FloatField(max_length=10)
    FR_DATE = models.DateField()
    FR_CODE = models.IntegerField()
    FR_CODE_REF = models.TextField(max_length=10, unique=True, default="FR_****")
    
    def __str__(self):
        return str(self.FR_CODE)
class META:
    db_table="Frais"

class Article(models.Model):
    AR_ID = models.AutoField(primary_key=True)
    AR_DESIGNATION = models.CharField(unique=True, max_length=50)
    AR_FAMILLE = models.CharField(max_length=50)
    AR_PU_DEF = models.FloatField(default=0)
    AR_STOCK_REEL=models.IntegerField(default=0)
    AR_CODE = models.CharField(max_length=5, default='yaz')
    
    def __str__(self):
        return self.AR_DESIGNATION

class AchatEntete(models.Model):
    ACHENT_ID = models.AutoField(primary_key=True)
    ACHENT_DOC = models.CharField(unique=True,max_length=10)
    ACHENT_DATE = models.DateField(null=True)
    ACHENT_ID_FOURN = models.ForeignKey(Fournisseur, on_delete=CASCADE)
    ACHENT_CODE = models.IntegerField(null=False)
    def __str__(self):
        return str(self.ACHENT_CODE)
        
class VenteEntete(models.Model):
    VNTENT_ID = models.AutoField(primary_key=True)
    VNTENT_DOC = models.CharField(unique=True,max_length=10)
    VNTENT_DATE = models.DateField(null=True)
    VNTENT_ID_CLIENT = models.ForeignKey(Client, on_delete=CASCADE)
    VNTENT_CODE = models.IntegerField(null=False)
    def __str__(self):
        return str(self.VNTENT_CODE)

class AchatLigne(models.Model):
    ACHLIG_ID = models.AutoField(primary_key=True)
    ACHLIG_ID_ACHENT = models.IntegerField()
    ACHLIG_ID_ART = models.ForeignKey(Article, on_delete=CASCADE)
    ACHLIG_QTY = models.IntegerField()
    ACHLIG_PU = models.FloatField()
    ACHLIG_REM = models.FloatField()

    def __str__(self):
        return str(self.ACHLIG_QTY)



class VenteLigne(models.Model):
    VNTLIG_ID = models.AutoField(primary_key=True)
    VNTLIG_ID_VNTENT = models.IntegerField()
    VNTLIG_ID_ART = models.ForeignKey(Article, on_delete=CASCADE)
    VNTLIG_QTY = models.IntegerField()
    VNTLIG_PU = models.FloatField()
    VNTLIG_REM = models.FloatField()

    def __str__(self):
        return str(self.VNTLIG_QTY)

class Famille(models.Model):
    FAM_ID = models.AutoField(primary_key=True)
    FAM_DES = models.CharField(unique=True,max_length=20)
    def __str__(self):
        return str(self.FAM_DES)
