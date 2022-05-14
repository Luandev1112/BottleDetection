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
from layouts.models import ProcessResult
from layouts.models import CompanyProduct
import uuid
import math
from datetime import datetime
from django.core.files.storage import FileSystemStorage
import os
from django.conf import settings
from django.core.files import File
import base64

import cv2
import numpy as np

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
        previous_page = page_no - 1
        if previous_page == 0:
            prev_active = ''
        else:
            prev_active = 'active'

        next_page = page_no + 1
        if page_no == total_no_of_pages:
            next_active = ''
        else:
            next_active = 'active'

        adjacents = 2

        second_last = total_no_of_pages - 1

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
            with open(os.path.join(settings.MEDIA_ROOT + 'dataset/', filename), encoding='utf8') as namesfile:
                names = namesfile.readlines()
                Product.objects.filter(status = 1).delete()    
                for name in names:
                    order += 1
                    product_id = uuid.uuid4()
                    row = Product(product_id = product_id, product_name = name.strip(), status = 1, description = '', order = order)
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

class AddImageView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Add Image"
        greeting['pageview'] = "Nazox"        
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
            if Company.objects.filter(company_id=company_id).count() > 0:
                company_row = Company.objects.get(company_id=company_id)
                company_row.company_name = company_name
                company_row.save()
            else :
                company_row = Company(company_id=company_id, company_name=company_name)
                company_row.save()
            # add to store_image table
            store_row = StoreImage(user_id=user_id, company_id=company_id, photo_name = store_image)
            store_row.save()

            # Detect images
            net = cv2.dnn.readNet("media/dataset/yolov4-custom_best.weights", "media/dataset/yolov4-custom.cfg")
            classes = []
            classname_path = os.path.join(settings.MEDIA_ROOT + 'dataset/', 'vodka.names')
            with open(classname_path, "r", encoding='utf8') as f:
                classes = [line.strip() for line in f.readlines()]
            layer_names = net.getLayerNames()
            output_layers = [layer_names[i - 1] for i in net.getUnconnectedOutLayers()]
            colors = np.random.uniform(0, 255, size=(len(classes), 3))

            img = cv2.imread(os.path.join(settings.BASE_DIR + store_row.photo_name.url))
            img = cv2.resize(img, None, fx=0.4, fy=0.4)
            height, width, channels = img.shape

            # Detecting objects
            blob = cv2.dnn.blobFromImage(img, 0.00392, (448, 448), (0, 0, 0), True, crop=False)
            net.setInput(blob)
            outs = net.forward(output_layers)

            # Showing informations on the screen
            class_ids = []
            confidences = []
            boxes = []
            new_classes = []
            new_boxes = []

            for out in outs:
                for detection in out:
                    scores = detection[5:]
                    class_id = np.argmax(scores)
                    confidence = scores[class_id]
                    if confidence > 0.7:
                        # Object detected
                        center_x = int(detection[0] * width)
                        center_y = int(detection[1] * height)
                        w = int(detection[2] * width)
                        h = int(detection[3] * height)

                        x = int(center_x - w / 2)
                        y = int(center_y - h / 2)
                        # cv2.rectangle(img, (x, y),(x + w ,y + h),(0, 255, 0), 2)

                        boxes.append([x, y, w, h])
                        confidences.append(float(confidence))
                        class_ids.append(class_id)

                        class_name = classes[class_id]
                        print(class_name)
                        product = Product.objects.get(product_name=class_name)
                        print(product)
                        if CompanyProduct.objects.filter(company_id=company_row.id, product_id = product.id).count() == 0:
                            company_product = CompanyProduct(company_id=company_row.id, product_id = product.id)
                            company_product.save()

            indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.5, 0.4)
            # font = cv2.FONT_HERSHEY_PLAIN

            for i in range(len(boxes)):
                if i in indexes:
                    x, y, w, h = boxes[i]
                    label = str(classes[class_ids[i]])
                    color = colors[class_ids[i]]
                    cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
                    cv2.putText(img, label, (x, y + 15), cv2.FONT_HERSHEY_PLAIN, 1, (255, 255, 255), 1)
            result_image_name = store_row.photo_name.name.replace('store/', '')
            cv2.imwrite(os.path.join(settings.MEDIA_ROOT + 'result/', result_image_name), img)
            cv2.waitKey(0)
            cv2.destroyAllWindows()
            data = {}
            with open(os.path.join(settings.MEDIA_ROOT + 'result/', result_image_name), 'rb') as image_file:
                process_result = ProcessResult(store_image_id = store_row.id, result=1)
                process_result.save()
                result_image = ResultImage(result_id = process_result.id, result_image_name = 'result/'+result_image_name)
                result_image.save()
            data['img'] = "img"
            return JsonResponse(data)