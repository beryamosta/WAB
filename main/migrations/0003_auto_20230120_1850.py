# Generated by Django 3.2.5 on 2023-01-20 17:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0002_famille_venteentete_venteligne'),
    ]

    operations = [
        migrations.AlterField(
            model_name='achatentete',
            name='ACHENT_DOC',
            field=models.CharField(max_length=12, unique=True),
        ),
        migrations.AlterField(
            model_name='frais',
            name='FR_CODE_REF',
            field=models.TextField(default='FR_****', max_length=12, unique=True),
        ),
        migrations.AlterField(
            model_name='venteentete',
            name='VNTENT_DOC',
            field=models.CharField(max_length=12, unique=True),
        ),
    ]
