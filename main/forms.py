from django.forms import ModelForm
from django import forms
from django.db.models import fields
from .models import Frais, TypeFrais

class FraisForm(forms.Form):
    class Meta:
        model = Frais
        fields = ['FR_ID','FR_TYPE','FR_DESIGNATION','FR_MONTANT','FR_DATE','FR_CODE']