"""nazox URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.urls.conf import include
from nazox import views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    # Menu    
    path('',views.DashboardView.as_view(),name='dashboard'),# Dashboard
    path('campanies',views.ComapniesView.as_view(),name='companies'),# Companies

    path('products',views.ProductsView.as_view(),name='products'),# Products
    path('product/new',views.ProductAddView.as_view(),name='product-new'),# New Product
    path('product/<id>',views.ProductGetView.as_view(),name='product'),# GET Product
    path('product-delete/<id>',views.ProductDeleteView.as_view(),name='product-delete'),# DELETE Product
    path('product-import',views.ProductImportView.as_view(),name='product-import'),# Import Product
    path('product-export',views.ProductExportView.as_view(),name='product-export'),# Import Product

    path('planograms',views.PlanogramsView.as_view(),name='planograms'),# Planograms
    path('planogram/new',views.PlanogramAddView.as_view(),name='planogram-new'),# New Planogram

    path('imagelist',views.ImageListView.as_view(),name='imagelist'),# New Planogram
    path('processlist',views.ProcessListView.as_view(),name='processlist'),# New Planogram

    # Apps 
    path('ecommerce/',include('ecommerce.urls')),# Ecommerce
    path('email/',include('mail.urls')),# Email
    path('layouts/',include('layouts.urls')),# Layout
    path('pages/',include('utility.urls')),# Utility
    path('components/',include('components.urls')),# Components
    path('authentication/',include('authentication.urls')),# Authentication
    
    path('admin/', admin.site.urls),# Admin
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
