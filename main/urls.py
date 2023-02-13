from django.urls import path, include
from . import views


urlpatterns = [
    path('', views.dashboard, name='dashboard'),
    path('gesfrais/', views.gesfrais, name='gesfrais'),
    path('gesvente/', views.gesvente, name='gesvente'),
    path('gesachat/', views.gesachat, name='gesachat'),
    path('gesprod/', views.gesprod, name='gesprod'),
    path('gesarticle/', views.gesarticle, name='gesarticle'),
    path('gesfourn/', views.gesfourn, name='gesfourn'),
    path('gesclient/', views.gesclient, name='gesclient'),
    path('gesemp/', views.gesemp, name='gesemp'),
    path('EP/', views.edition, name='edition'),
    path('deleteALigne/<int:id>', views.deleteALigne, name='delete'),  # delete a record in gesachat def
    path('deleteVLigne/<int:id>', views.deleteVLigne, name='Vdelete'),  # delete a record in gesvente def
    path('deleteFrais/<int:id>', views.deleteFrais, name='fraisdelete'),  # delete a record in gesfrais def
    path('deleteArticle/<int:id>', views.deleteArticle, name='Articledelete'),  # delete a record in gesvarticle def
    path('deleteFournisseur/<id>', views.deleteFournisseur, name='Fournisseurdelete'),  # delete a record in gesfournisseur def
    path('deleteClient/<id>', views.deleteClient, name='Clientdelete'),  # delete a record in gesclient def
    
    ]
