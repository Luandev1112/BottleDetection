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
from layouts.models import Company
from layouts.models import StoreImage
from layouts.models import ResultImage
from layouts.models import Planogram
from layouts.models import PlanogramProduct
import uuid
import math
from datetime import datetime
from django.core.files.storage import FileSystemStorage
import os
from django.conf import settings
from django.core.files import File
from json import dumps
from json import loads

def ArrangeRow(datalist):
    row_arr = []
    for i in range(0, len(datalist) - 1):
        data = datalist[i]
        data_arr = data.split(" ")
        if i == 0:
            row = []
            row.append(data)
        up_data = datalist[i + 1]
        up_data_arr = up_data.split(" ")
        avg_h = (int(data_arr[3]) + int(up_data_arr[3])) / 2 
        if abs(float(data_arr[1]) - float(up_data_arr[1])) > avg_h :
            row_arr.append(row)
            row = []
            row.append(up_data)
        else :
            row.append(up_data)
        if(i == len(datalist) - 2):
            row_arr.append(row)
    return row_arr 

def ArrangeColumn(row_arr):
    for i in range(0, len(row_arr) - 1):
        for j in range(i + 1, len(row_arr)):
            i_data = row_arr[i]
            i_data_arr = i_data.split(" ")
            j_data = row_arr[j]
            j_data_arr = j_data.split(" ")
            if float(i_data_arr[0]) > float(j_data_arr[0]):
                tmp = row_arr[i]
                row_arr[i] = row_arr[j]
                row_arr[j] = tmp     
    GetPlanograms(row_arr, [3, 3])
    return row_arr

def GetPlanograms(row, planogram):
    flag = 0
    p_counts = 0
    for i in range(0, len(row) - len(planogram)):
        for j in range(0, len(planogram)):
            col = row[i + j]
            col_data_arr = col.split(" ")
            if int(col_data_arr[4]) != planogram[j] :
                break;
            flag += 1
            if flag == len(planogram) :
                p_counts += 1
                i += len(planogram) - 1
                flag = 0
    print(p_counts)

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
        numbers_per_page = 10
        total_no_of_pages = math.ceil(total_rows / numbers_per_page)
        rows_from = 0
        rows_to = 0

        if total_rows > 0:
            products = Product.objects.order_by('-status', 'order').all()[(page_no-1)*numbers_per_page : page_no*numbers_per_page].values()
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
            'title' : 'Product List',
            'pageview' : 'Drink',
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
            return HttpResponseRedirect("/products")

class ProductImportView(LoginRequiredMixin,View):
    def post(self,request):
        folder='media/dataset/' 
        if request.method == "POST" and request.FILES['file']:
            name_file = request.FILES.get('file')
            fs = FileSystemStorage(location=folder) #defaults to   MEDIA_ROOT  
            path = folder + name_file.name 
            if os.path.isfile(path):
                os.remove(path)
            filename = fs.save(name_file.name, name_file)
            order = 0
            with open(os.path.join(settings.MEDIA_ROOT + 'dataset/', filename)) as namesfile:
                names = namesfile.readlines()
                Product.objects.filter(status = 1).delete()    
                for name in names:
                    order += 1
                    product_id = uuid.uuid4()
                    row = Product(product_id = product_id, product_name = name, status = 1, description = '', order = order)
                    row.save()
            return HttpResponseRedirect("/products")

class ProductExportView(LoginRequiredMixin,View):
    def get(self,request):
        file_path = os.path.join(settings.MEDIA_ROOT + 'dataset/', 'vodka.names')
        if os.path.isfile(file_path):
            os.remove(file_path)
        verified_products = Product.objects.filter(status = 1)
        f = open(file_path, 'a', encoding='utf8')
        names_file = File(f)
        for pro in verified_products:
            names_file.write(pro.product_name.strip())
            names_file.write('\n')
        names_file.close
        f.close
        data = {}
        data['result'] = 'success'
        return JsonResponse(data)

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

class ProductDeleteView(LoginRequiredMixin,View):
    def get(self, request, id):
        pro = Product.objects.get(id=id)
        pro.delete()
        data = {}
        data['result'] = 'success'
        return JsonResponse(data)

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
        page_list = []
        page_no = int(request.GET.get('page', '1'))
        total_rows = Planogram.objects.count()
        numbers_per_page = 10
        total_no_of_pages = math.ceil(total_rows / numbers_per_page)
        rows_from = 0
        rows_to = 0

        if total_rows > 0:
            planograms = Planogram.objects.order_by('-status', 'created_at').all()[(page_no-1)*numbers_per_page : page_no*numbers_per_page].values()
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
            'planograms' : planograms,
            'pages' : page_list,
            'rows_from' : rows_from,
            'rows_to' : rows_to,
            'rows_total' : total_rows,
            'title' : 'Planograms List',
            'pageview' : 'Drink',
        }            
        return render(request, 'pages/planogram/planogram-list.html',datas)

class PlanogramDeleteView(LoginRequiredMixin,View):
    def get(self, request, id):
        plano = Planogram.objects.get(id=id)
        plano.delete()
        PlanogramProduct.objects.filter(planogram_id = id).delete()
        data = {}
        data['result'] = 'success'
        return JsonResponse(data)

class PlanogramAddView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Add New Planogram"
        greeting['pageview'] = "Bottle"
        verified_products = Product.objects.order_by('order').filter(status = 1)
        products = []
        idx = 0
        for pro in verified_products:
            product = {}
            product['id'] = pro.id 
            product['name'] = pro.product_name.strip() 
            product['index'] = idx
            products.append(product)
            idx += 1
        greeting['json_products'] = dumps(products)
        greeting['products'] = products
        return render(request, 'pages/planogram/planogram-new.html',greeting)

    def post(self,request):
        if request.method == "POST":
            planogram_name = request.POST.get('planogram_name')
            planogram_description = request.POST.get('planogram_description')
            status = request.POST.get('status')
            products = loads(request.POST.get('products'))
            planogram_id = uuid.uuid4()
            row = Planogram(planogram_id = planogram_id, planogram_name = planogram_name, status = status, description = planogram_description)
            row.save()
            
            order = 0
            for product in products:
                order += 1
                pp_row = PlanogramProduct(planogram_id = row.id, product_id = product['id'], rows = product['count'], order = order)
                pp_row.save()
            data = {}
            data['result'] = 'success'
            return JsonResponse(data)

class PlanogramEditView(LoginRequiredMixin,View):
    def get(self, request, id):
        planogram = Planogram.objects.get(id=id)
        planoproducts = PlanogramProduct.objects.order_by('order').filter(planogram_id = id)
        productlist = []
        for plano in planoproducts:
            product = Product.objects.get(id=plano.product_id)
            pro = {}
            pro['id'] = product.id
            pro['name'] = product.product_name
            pro['index'] = plano.order
            pro['count'] = plano.rows
            productlist.append(pro)
        print(productlist)
        verified_products = Product.objects.order_by('order').filter(status = 1)
        datas = {}
        products = []
        idx = 0
        for pro in verified_products:
            product = {}
            product['id'] = pro.id 
            product['name'] = pro.product_name.strip() 
            product['index'] = idx
            products.append(product)
            idx += 1
        datas['json_products'] = dumps(products)
        datas['products'] = products
        datas['title'] = "Edit Planogram"
        datas['pageview'] = "Bottle"
        datas['planogram'] = planogram
        datas['planoproducts'] = dumps(productlist)   
        datas['statuslist'] = [
            {'value': 0, 'title': "Unverified"},
            {'value': 1, 'title': "Verified"}
        ]     
        return render(request, 'pages/planogram/planogram-edit.html',datas)
    def post(self, request, id):
        planogram = Planogram.objects.get(id = id)

        planogram_name = request.POST.get('planogram_name')
        planogram_description = request.POST.get('planogram_description')
        status = request.POST.get('status')
        products = loads(request.POST.get('products'))
        planogram.planogram_name = planogram_name
        planogram.description = planogram_description
        planogram.status = status
        planogram.save();
        PlanogramProduct.objects.filter(planogram_id = id).delete()
        order = 0
        for product in products:
            order += 1
            pp_row = PlanogramProduct(planogram_id = id, product_id = product['id'], rows = product['count'], order = order)
            pp_row.save()

        data = {}
        data['result'] = 'success'
        return JsonResponse(data)
        
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

class AddImageView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Add Image"
        greeting['pageview'] = "Nazox"  
        datalist = ["346.5 280.0 29 96 1", "346.0 277.5 30 91 1", "369.5 283.5 33 75 3", "369.5 283.5 31 75 3", "370.0 286.5 32 77 3", "370.0 286.0 32 76 3", "387.0 416.5 32 77 5", "385.5 416.0 33 76 5", "351.0 537.5 60 79 4", "350.5 541.5 61 87 4", "129.5 566.5 35 77 4", "128.5 566.0 37 76 4", "132.5 567.0 33 78 4", "131.0 565.0 36 74 4", "158.0 566.0 32 82 3", "156.5 562.0 35 74 3", "160.5 565.0 29 82 3", "159.5 560.5 31 73 3", "336.5 653.0 59 102 6", "335.5 658.0 61 106 6", "87.0 140.0 186 114 8", "94.0 140.0 172 112 8", "93.5 139.5 175 111 8", "95.5 141.0 181 114 8", "96.0 139.0 180 110 9", "348.0 147.5 88 121 6", "352.5 138.5 79 103 6", "356.5 144.0 71 114 6", "75.5 300.0 267 122 5", "345.5 278.0 31 94 5", "347.0 278.0 28 94 5", "368.5 280.5 35 69 5", "369.5 282.5 33 73 6", "369.0 284.0 32 74 5", "370.0 284.5 32 75 7", "283.5 421.0 113 104 7", "291.0 421.0 98 104 7", "291.0 423.0 98 108 3", "70.0 452.5 226 129 3", "75.5 455.0 217 134 3", "77.5 454.5 223 135 3", "82.0 454.5 214 135 1", "286.5 422.0 107 104 1", "292.0 421.0 98 102 1", "291.5 424.5 97 109 1", "384.0 411.5 38 71 2", "386.0 414.0 34 74 2", "349.5 538.5 63 79 2", "350.5 536.5 61 75 2", "349.0 543.0 64 88 3", "127.0 563.0 40 70 3", "128.5 565.5 37 75 3", "130.5 561.0 37 70 5", "131.0 564.5 34 75 5", "155.5 563.0 37 78 5", "157.5 562.0 33 76 6", "330.5 650.5 71 93 6", "335.0 650.0 64 94 6", "334.0 653.5 66 99 7", "96.0 155.5 168 143 8", "92.5 145.5 175 125 8", "98.5 149.5 173 129 8", "92.0 140.5 186 117 4", "356.5 146.5 75 109 4", "81.0 303.5 260 129 4", "63.5 303.0 295 128 3", "74.0 455.0 220 132 3", "58.5 454.5 251 133 3", "92.0 458.5 192 141 3", "70.5 456.0 235 138 2", "291.0 425.0 98 104 2", "348.0 542.5 62 81 2", "336.0 658.0 62 100 2"] 
        total_arr = ArrangeRow(datalist)
        for row in total_arr:
            arrange_row = ArrangeColumn(row)
            print(arrange_row)

        return render(request, 'pages/image/add-image.html',greeting)
    def post(self,request):
        if request.method == "POST":
            user_id = request.POST.get('user_id')
            company_id = request.POST.get('company_id')
            company_name = request.POST.get('company_name')
            store_image = request.FILES.get('file')
            program_id = request.POST.get('program_id')
            program_name = request.POST.get('program_name')
            # add to company table
            company_row = Company(company_id=company_id, company_name=company_name);
            company_row.save()
            # add to store_image table
            store_row = StoreImage(user_id=user_id, company_id=company_id, photo_name = store_image)
            store_row.save()

            return HttpResponseRedirect("/products")