from pyexpat import model
from statistics import mode
from typing import OrderedDict
from xml.etree.ElementInclude import default_loader
from django.db import models
from django.forms import NullBooleanField
from numpy import true_divide
import os
import uuid

def get_products_path(directory_str, filename):
    ext = filename.split('.')[-1]
    filename = "%s.%s" % (uuid.uuid4(), ext)
    return os.path.join('products/', filename)

# Create your models here.
class Company(models.Model):
    id=models.AutoField(primary_key=True)
    company_id=models.IntegerField(default=0)
    company_name=models.CharField(max_length=255, default=None)
    created_at=models.DateTimeField(auto_now=True)
    updated_at=models.DateTimeField(auto_now=True)

class Product(models.Model):
    id=models.AutoField(primary_key=True)
    product_id=models.CharField(max_length=255, default=None)
    product_name=models.CharField(max_length=255, default=None)
    product_photo=models.ImageField(upload_to=get_products_path)
    description=models.TextField(default=None)
    order=models.IntegerField(default=0)
    status=models.IntegerField(default=0)
    created_at=models.DateTimeField(auto_now=True)
    updated_at=models.DateTimeField(auto_now=True)

class ComanyProduct(models.Model):
    id=models.AutoField(primary_key=True)
    company_id=models.IntegerField(default=0)
    product_id=models.IntegerField(default=0)
    created_at=models.DateTimeField(auto_now=True)
    updated_at=models.DateTimeField(auto_now=True)

class Planogram(models.Model):
    id=models.AutoField(primary_key=True)
    planogram_id=models.IntegerField(default=0)
    planogram_name=models.CharField(max_length=255, default=None)
    planogram_photo=models.ImageField(upload_to='planograms')
    description=models.TextField(default=None)
    order=models.IntegerField(default=0)
    status=models.IntegerField(default=0)
    created_at=models.DateTimeField(auto_now=True)
    updated_at=models.DateTimeField(auto_now=True)

class CompanyPlanogram(models.Model):
    id=models.AutoField(primary_key=True)
    company_id=models.IntegerField(default=0)
    planogram_id=models.IntegerField(default=0)
    created_at=models.DateTimeField(auto_now=True)
    updated_at=models.DateTimeField(auto_now=True)

class PlanogramProduct(models.Model):
    id=models.AutoField(primary_key=True)
    product_id=models.IntegerField(default=0)
    planogram_id=models.IntegerField(default=0)
    rows=models.IntegerField(default=0)
    order=models.IntegerField(default=0)
    created_at=models.DateTimeField(auto_now=True)
    updated_at=models.DateTimeField(auto_now=True)

class StoreImage(models.Model):
    id=models.AutoField(primary_key=True)
    company_id=models.IntegerField(default=0)
    user_id=models.IntegerField(default=0)
    photo_name=models.ImageField(upload_to='images')
    created_at=models.DateTimeField(auto_now=True)
    updated_at=models.DateTimeField(auto_now=True)

class ProcessResult(models.Model):
    id=models.AutoField(primary_key=True)
    store_image_id=models.IntegerField(default=0)
    result=models.IntegerField(default=0)
    created_at=models.DateTimeField(auto_now=True)
    updated_at=models.DateTimeField(auto_now=True)

class ResultImage(models.Model):
    id=models.AutoField(primary_key=True)
    result_id=models.IntegerField(default=0)
    result_image_name=models.ImageField(upload_to='resultimages')
    created_at=models.DateTimeField(auto_now=True)
    updated_at=models.DateTimeField(auto_now=True)
