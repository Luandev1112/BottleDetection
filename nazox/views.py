from traceback import print_list
from django.http import request
from django.http import HttpResponse
from django.http import JsonResponse
from django.http import HttpResponseRedirect
from django.shortcuts import redirect, render
from django.views import View   
from django.contrib.auth.mixins import LoginRequiredMixin
# from numpy import product
from layouts.models import Product
import uuid
import math
from datetime import datetime

# Dashboard
class DashboardView(LoginRequiredMixin,View):
    def get(self, request):
        print(request.session)
        greeting = {}
        greeting['title'] = "Dashboard"
        greeting['pageview'] = "Nazox"        
        return render(request, 'menu/index.html',greeting)

# Calender
class BrandsView(LoginRequiredMixin,View):
    def get(self, request):
        query = request.GET.get('filecontent')
        print(query)
        # do a check here to make sure search_term exists before attempting write
        if query == None:
            return render(request, 'menu/calendar.html')
        else:
            with open('static/xyzfiles/vodka.names', 'w',newline="") as f:
                f.write(query)

            return render(request, 'menu/calendar.html')

    # def get(self, request):
    #     greeting = {}
    #     greeting['title'] = "Calendar"
    #     greeting['pageview'] = "Nazox"
    #

# Chat
class ComapniesView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Chat"
        greeting['pageview'] = "Nazox"        
        return render(request, 'menu/apps-chat.html',greeting)

class ProductsView(LoginRequiredMixin,View):
    def get(self, request):
        page_list = []
        page_no = int(request.GET.get('page', '1'))
        total_rows = Product.objects.count()
        numbers_per_page = 20
        total_no_of_pages = math.ceil(total_rows / numbers_per_page)
        rows_from = 0
        rows_to = 0

        if total_rows > 0:
            products = Product.objects.all()[(page_no-1)*numbers_per_page : page_no*numbers_per_page].values()
            rows_from = (page_no-1)*numbers_per_page + 1
            if page_no < total_no_of_pages:
                rows_to = page_no * numbers_per_page
            else :
                rows_to = total_rows
        previous_page = page_no - 1;
        if previous_page == 0:
            prev_active = ''
        else:
            prev_active = 'active'

        next_page = page_no + 1;
        if page_no == total_no_of_pages:
            next_active = ''
        else:
            next_active = 'active'

        adjacents = 2

        second_last = total_no_of_pages - 1;

        dot_page = {
            'title' : '...',
            'value' : '',
            'active' : ''
        }

        if total_no_of_pages > 1:
            if total_no_of_pages <= 10 :    
                for i in range(1, total_no_of_pages + 1) : 
                    pg_active = ''
                    if i == page_no:
                        pg_active = 'active'
                    else :
                        pg_active = ''
                    
                    pg ={
                        'title' : str(i),
                        'value' : i ,
                        'active' : pg_active
                    }
                    page_list.append(pg)
            elif total_no_of_pages > 10:
                if page_no <= 4:
                    for i in range (1, 8):
                        if i == page_no:
                            pg_active = 'active'
                        else:
                            pg_active = ''

                        pg ={
                            'title' : str(i),
                            'value' : i ,
                            'active' : pg_active
                        }
                        page_list.append(pg)
                    
                    page_list.append(dot_page)
                    second_last = total_no_of_pages - 1
                    second_last_page = {
                        'title' : str(second_last),
                        'value' : second_last,
                        'active' : ''
                    }
                    page_list.append(second_last_page)
                    
                    last_page = {
                        'title' : str(total_no_of_pages),
                        'value' : total_no_of_pages,
                        'active' : ''
                    }
                    page_list.append(last_page)
                
                elif page_no > 4 and page_no < total_no_of_pages - 4:
                    pg_first = {
                        'title' : '1',
                        'value' : 1,
                        'active' : ''
                    }
                    page_list.append(pg_first)

                    pg_second = {
                        'title' : '2',
                        'value' : 2,
                        'active' : ''
                    }
                    page_list.append(pg_second)
                    page_list.append(dot_page)
                    
                    for i in range(page_no-adjacents, page_no+adjacents+1):

                        if i == page_no:
                            pg_active = 'active'
                        else:
                            pg_active = ''

                        pg ={
                            'title' : str(i),
                            'value' : i ,
                            'active' : pg_active
                        }
                        page_list.append(pg)
                    
                    page_list.append(dot_page)

                    second_last = total_no_of_pages - 1
                    second_last_page = {
                        'title' : str(second_last),
                        'value' : second_last,
                        'active' : ''
                    }
                    page_list.append(second_last_page)
                    
                    last_page = {
                        'title' : str(total_no_of_pages),
                        'value' : total_no_of_pages,
                        'active' : ''
                    }
                    page_list.append(last_page)
                
                else:
                    pg_first = {
                        'title' : '1',
                        'value' : 1,
                        'active' : ''
                    }
                    page_list.append(pg_first)

                    pg_second = {
                        'title' : '2',
                        'value' : 2,
                        'active' : ''
                    }
                    page_list.append(pg_second)
                    page_list.append(dot_page)

                    for i in range(total_no_of_pages-6, total_no_of_pages+1):
    
                        if i == page_no:
                            pg_active = 'active'
                        else:
                            pg_active = ''

                        pg ={
                            'title' : str(i),
                            'value' : i ,
                            'active' : pg_active
                        }
                        page_list.append(pg)
        datas = {
            'products' : products,
            'pages' : page_list,
            'rows_from' : rows_from,
            'rows_to' : rows_to,
            'rows_total' : total_rows,
            'title' : 'Add New Product',
            'pageview' : 'Nazox',
        }      
        return render(request, 'pages/product/product-list.html',datas)
    def post(self,request):
        if request.method == "POST":
            id = request.POST.get('id')
            pro = Product.objects.get(id=id)
            pro.product_name = request.POST.get('product_name')
            pro.description = request.POST.get('description')
            pro.order = request.POST.get('product_order')
            pro.status = request.POST.get('status')
            if request.FILES.get('file'):
                pro.product_photo = request.FILES.get('file')
            pro.updated_at = datetime.now()
            pro.save()
            return HttpResponseRedirect("/products")

class ProductAddView(LoginRequiredMixin,View):
    def get(self, request):
        datas = {}
        datas['title'] = "Add New Product"
        datas['pageview'] = "Nazox"    
        return render(request, 'pages/product/product-new.html',datas)
    def post(self,request):
        if request.method == "POST":
            product_name = request.POST.get('product_name')
            product_description = request.POST.get('product_description')
            product_image = request.FILES.get('file')
            product_id = uuid.uuid4()
            row = Product(product_id = product_id, product_name = product_name, product_photo = product_image, description = product_description)
            row.save()
            return render(request, 'pages/product/product-list.html')

class ProductGetView(LoginRequiredMixin,View):
    def get(self, request, id):
        pro = Product.objects.get(id=id)
        datas = {}
        datas['id'] = pro.id 
        datas['product_name'] = pro.product_name
        datas['status'] = pro.status
        datas['description'] = pro.description
        datas['order'] = pro.order
        return JsonResponse(datas)

class ProductEditView(LoginRequiredMixin,View):
    def get(self,request):
        if request.method == "POST":
            id = request.POST.get('id')
            pro = Product.objects.get(id=id)
            pro.product_name = request.POST.get('product_name')
            pro.description = request.POST.get('product_description')
            pro.order = request.POST.get('product_order')
            pro.status = request.POST.get('product_status')
            if request.FILES.get('file'):
                pro.product_photo = request.FILES.get('file')
            pro.updated_at = datetime.now()
            pro.save()
            return HttpResponseRedirect("/products")

class PlanogramsView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Chat"
        greeting['pageview'] = "Nazox"        
        return render(request, 'menu/apps-chat.html',greeting)

class PlanogramAddView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Chat"
        greeting['pageview'] = "Nazox"        
        return render(request, 'menu/apps-chat.html',greeting)
        
class ImageListView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Chat"
        greeting['pageview'] = "Nazox"        
        return render(request, 'menu/apps-chat.html',greeting)
        
class ProcessListView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Chat"
        greeting['pageview'] = "Nazox"        
        return render(request, 'menu/apps-chat.html',greeting)