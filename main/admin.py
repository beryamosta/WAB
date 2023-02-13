from django.contrib import admin
from django.contrib.admin.filters import ListFilter
from .models import AchatLigne, Article, Client, FicheCode, Fournisseur, Frais, TypeFrais,AchatEntete,AchatLigne, VenteEntete, VenteLigne,Famille

class FraisAdmin(admin.ModelAdmin):
    
    list_display = ('FR_ID', 'FR_DESIGNATION','FR_TYPE','FR_MONTANT','FR_DATE','FR_CODE','FR_CODE_REF')
    list_display_links = ('FR_ID', 'FR_DESIGNATION')
    
admin.site.register(Frais, FraisAdmin)
class TypeFraisAdmin(admin.ModelAdmin):
    
    list_display = ('FRT_ID', 'FRT_NAME')
    list_display_links = ('FRT_ID', 'FRT_NAME')
admin.site.register(TypeFrais,TypeFraisAdmin)

class ClientAdmin(admin.ModelAdmin):
    list_display= ('CL_ID', 'CL_NOM', 'CL_TEL', 'CL_MAIL')
    list_display_links = ('CL_ID', 'CL_NOM')
admin.site.register(Client, ClientAdmin)

class FournisseurAdmin(admin.ModelAdmin):
    list_display= ('FO_ID', 'FO_NOM', 'FO_TEL', 'FO_MAIL')
    list_display_links = ('FO_ID', 'FO_NOM')
admin.site.register(Fournisseur, FournisseurAdmin)

class FicheCodeAdmin(admin.ModelAdmin):
    list_display= ('FIC_ID', 'FIC_DESIGNATION', 'FIC_CODE')
    list_display_links = ('FIC_ID', 'FIC_DESIGNATION')
admin.site.register(FicheCode, FicheCodeAdmin)

class ArticleAdmin(admin.ModelAdmin):
    list_display= ('AR_ID', 'AR_DESIGNATION', 'AR_FAMILLE', 'AR_PU_DEF', 'AR_STOCK_REEL')
    list_display_links = ('AR_ID', 'AR_DESIGNATION')
admin.site.register(Article, ArticleAdmin)

class AchatEnteteAdmin(admin.ModelAdmin):
    list_display= ('ACHENT_ID', 'ACHENT_DOC', 'ACHENT_ID_FOURN')
    list_display_links = ('ACHENT_ID', 'ACHENT_DOC')
admin.site.register(AchatEntete, AchatEnteteAdmin)

class AchatLigneAdmin(admin.ModelAdmin):
    list_display= ('ACHLIG_ID', 'ACHLIG_QTY', 'ACHLIG_PU', 'ACHLIG_REM')
    list_display_links = ('ACHLIG_ID', 'ACHLIG_QTY')
admin.site.register(AchatLigne, AchatLigneAdmin)

class VenteEnteteAdmin(admin.ModelAdmin):
    list_display= ('VNTENT_ID', 'VNTENT_DOC', 'VNTENT_ID_CLIENT')
    list_display_links = ('VNTENT_ID', 'VNTENT_DOC')
admin.site.register(VenteEntete, VenteEnteteAdmin)

class VenteLigneAdmin(admin.ModelAdmin):
    list_display= ('VNTLIG_ID', 'VNTLIG_QTY', 'VNTLIG_PU', 'VNTLIG_REM')
    list_display_links = ('VNTLIG_ID', 'VNTLIG_QTY')
admin.site.register(VenteLigne, VenteLigneAdmin)

class FamilleAdmin(admin.ModelAdmin):
    list_display = ('FAM_ID','FAM_DES')
    list_display_links = ('FAM_ID','FAM_DES')
admin.site.register(Famille, FamilleAdmin)