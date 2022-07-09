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
from layouts.models import Planogram
from layouts.models import PlanogramProduct
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

from json import dumps
from json import loads

from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.db.models import Q
from functools import reduce

def pagination(page_no, total_no_of_pages, page_url):
    page_list = []
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
                    'active' : pg_active,
                    'page_url' : page_url+'page='+str(i)
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
                        'active' : pg_active,
                        'page_url' : page_url+'page='+str(i)
                    }
                    page_list.append(pg)
                
                page_list.append(dot_page)
                second_last = total_no_of_pages - 1
                second_last_page = {
                    'title' : str(second_last),
                    'value' : second_last,
                    'active' : '',
                    'page_url' : page_url+'page='+str(i)
                }
                page_list.append(second_last_page)
                
                last_page = {
                    'title' : str(total_no_of_pages),
                    'value' : total_no_of_pages,
                    'active' : '',
                    'page_url' : page_url+'page='+str(i)
                }
                page_list.append(last_page)
            
            elif page_no > 4 and page_no < total_no_of_pages - 4:
                pg_first = {
                    'title' : '1',
                    'value' : 1,
                    'active' : '',
                    'page_url' : page_url+'page=1'
                }
                page_list.append(pg_first)

                pg_second = {
                    'title' : '2',
                    'value' : 2,
                    'active' : '',
                    'page_url' : page_url+'page=2'
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
                        'active' : pg_active,
                        'page_url' : page_url+'page='+str(i)
                    }
                    page_list.append(pg)
                
                page_list.append(dot_page)

                second_last = total_no_of_pages - 1
                second_last_page = {
                    'title' : str(second_last),
                    'value' : second_last,
                    'active' : '',
                    'page_url' : page_url+'page='+second_last
                }
                page_list.append(second_last_page)
                
                last_page = {
                    'title' : str(total_no_of_pages),
                    'value' : total_no_of_pages,
                    'active' : '',
                    'page_url' : page_url+'page='+total_no_of_pages
                }
                page_list.append(last_page)
            
            else:
                pg_first = {
                    'title' : '1',
                    'value' : 1,
                    'active' : '',
                    'page_url' : page_url+'page=1'
                }
                page_list.append(pg_first)

                pg_second = {
                    'title' : '2',
                    'value' : 2,
                    'active' : '',
                    'page_url' : page_url+'page=2'
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
                        'active' : pg_active,
                        'page_url' : page_url+'page='+str(i)
                    }
                    page_list.append(pg)
    return page_list

def AverageHeight(datas):
    total = 0
    for i in range(0, len(datas)):
        total += int(datas[i][3])
    avg = int(total/len(datas))
    return avg

def ArrangeRow(datalist):
    datalist = SortbyVertical(datalist)
    row_arr = []
    row = []
    avg_height = AverageHeight(datalist) / 2
    row.append(datalist[0])
    if(len(datalist) == 1):
        row_arr.append(row)
    elif len(datalist) > 1:
        for i in range(1, len(datalist)):
            current_data = datalist[i]
            prev_data = datalist[i - 1]
            if int(current_data[1]) + int(current_data[3]) - int(prev_data[1]) - int(prev_data[3]) < avg_height :
                row.append(current_data)
            else:
                row_arr.append(row)
                row = []
                row.append(current_data)
            if(i == len(datalist) - 1):
                row_arr.append(row)
        
    return row_arr  

def SortbyVertical(datalist):
    for i in range(0, len(datalist) - 1):
        for j in range(i + 1, len(datalist)):
            i_data_arr = datalist[i]
            j_data_arr = datalist[j]
            if float(i_data_arr[1]) > float(j_data_arr[1]):
                tmp = datalist[i]
                datalist[i] = datalist[j]
                datalist[j] = tmp     
    return datalist

def ArrangeColumn(row_arr):
    for i in range(0, len(row_arr) - 1):
        for j in range(i + 1, len(row_arr)):
            i_data_arr = row_arr[i]
            j_data_arr = row_arr[j]
            if float(i_data_arr[0]) > float(j_data_arr[0]):
                tmp = row_arr[i]
                row_arr[i] = row_arr[j]
                row_arr[j] = tmp     
    return row_arr

def GetPlanograms(row, planogram):
    flag = 0
    p_counts = 0
    if len(row) >= len(planogram):
        for i in range(0, len(row) - len(planogram)):
            for j in range(0, len(planogram)):
                if i + j + 1 > len(row):
                    break;
                col_data_arr = row[i + j]
                if int(col_data_arr[4]) != planogram[j] :
                    flag = 0
                    break;
                else:
                    flag += 1
                
                if flag == len(planogram) :
                    p_counts += 1
                    i += len(planogram) - 1
                    flag = 0
    return p_counts

def getPlanoIndex(plano):
    products = Product.objects.filter(status = 1)
    idx = 0;
    for product in products:
        if product.id == plano.product_id:
            break;
        else:
            idx += 1
    return idx

def makePlanoArray(planogram):
    plano_arr = []
    planoproducts = PlanogramProduct.objects.order_by('order').filter(planogram_id = planogram.id)
    
    for plano in planoproducts:
        row = []
        for i in range(0, int(plano.rows)):
            row.append(getPlanoIndex(plano))
        plano_arr.append(row)

    return plano_arr

def ArrangeBoxes(cols):
    group_arr = []
    group = cols[0]
    if len(cols) > 1 :
        for i in range(1, len(cols)):
            col = cols[i]
            prev = cols[i-1]
            if group[4] == col[4] and col[0] - (group[0] + group[2]) < col[2] / 2:
                group[2] = col[0] - group[0] + col[2]
                if group[3] < col[3]:
                    group[3] = col[3]
                if group[1] > col[1]:
                    group[1] = col[1]
            else:
                group_arr.append(group)
                group = col
            if i == len(cols) - 1:
                group_arr.append(group)
    else:
        group_arr.append(group) 
    return group_arr

def getPlanogramBlock(planogram, val):
    block = []
    for plano in planogram:
        if val == plano[0]:
            block = plano
            break
        else:
            continue
    str_block = [str(int) for int in block]
    return str_block

def getPlanogramPossiblity(cols, planogram):
    str_plano_arr = []
    if len(cols) > 2:
        for i in range(0, len(cols) - 2):
            col_1 = cols[i]
            col_2 = cols[i+1]
            col_3 = cols[i+2]
            block_1 = getPlanogramBlock(planogram, col_1[4])
            block_2 = getPlanogramBlock(planogram, col_2[4])
            block_3 = getPlanogramBlock(planogram, col_3[4])
            if col_1[4] == col_2[4] or col_2[4] == col_3[4] or col_1[4] == col_3[4]:
                continue

            if len(block_1) == 0 or len(block_2) == 0 or len(block_3) == 0:
                continue
            str_plano = ','.join(block_1) + ',' + ','.join(block_2) + ',' + ','.join(block_3)
            str_plano_arr.append(str_plano)
    return str_plano_arr

def colsToStr(cols):
    result = ''
    i = 0
    for col in cols:
        i += 1
        result += str(col[4])
        if i < len(cols):
            result += ','
    return result

def checkPlanoStr(cols, str_planos, cv2, img):
    strCols = colsToStr(cols)
    result = False
    for strplano in str_planos:
        pos = strCols.find(strplano)
        if pos >= 0:
            result = True
            first_str = ""
            first_idx = 0
            if pos == 0:
                first_str = ""
                first_idx = 0
            else:
                first_str = strCols[:(pos-1)]
                first_idx = len(first_str.split(','))
            first = cols[first_idx]
            last_str = first_str + "," + strplano
            last_index =  len(last_str.split(","))
            last = cols[last_index - 1]
            x = first[0]
            y = first[1]
            w = last[0] - first[0] + last[2]
            h = first[3]
            color = (255, 255, 0)
            font = cv2.FONT_HERSHEY_COMPLEX
            label = "Planogram"
            cv2.rectangle(img, (x, y), (x + w, y + h), color, 5)
            cv2.putText(img, label, (x+20, y + 50), font, 1, (255,255,0), 1, cv2.LINE_AA)
            break;
    return result

def getProductCount(product_id, products):
    count = 0
    for product in products:
        if product[4] == product_id:
            count += 1
    return count

def getPage():
    return 
# Dashboard
class DashboardView(LoginRequiredMixin,View):
    def get(self, request):
        datas = {}
        datas['title'] = "Dashboard"
        datas['pageview'] = "Drink"      
        datas['company_count'] = Company.objects.all().count()
        datas['product_count'] = Product.objects.all().count()
        datas['image_count'] = StoreImage.objects.all().count()
        datas['planograms_count'] = 0
        return render(request, 'pages/index.html',datas)

class DeleteAlldata(LoginRequiredMixin,View):
    def get(self, request):
        # Product.objects.all().delete()
        # Company.objects.all().delete()
        StoreImage.objects.all().delete()
        ResultImage.objects.all().delete()
        ProcessResult.objects.all().delete()
        # CompanyProduct.objects.all().delete()
        # Planogram.objects.all().delete()
        # PlanogramProduct.objects.all().delete()
        data = {}
        data['result'] = 'success'
        return JsonResponse(data)

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
        pagelist = []
        page_no = int(request.GET.get('page', '1'))
        search_name = request.GET.get('name', '')
        total_rows = 0
        if search_name == '':
            total_rows = Company.objects.count()
        else:
            total_rows = Company.objects.filter(company_name__contains=search_name).count()
        
        numbers_per_page = 10
        total_no_of_pages = math.ceil(total_rows / numbers_per_page)
        rows_from = 0
        rows_to = 0
        companies = []
        page_url = "/campanies"
        if search_name == '':
            page_url += '?'
        else:
            page_url += '?name=' + search_name + '&';

        if total_rows > 0:
            if search_name == '':
                companies = Company.objects.order_by('-created_at').all()[(page_no-1)*numbers_per_page : page_no*numbers_per_page].values()
            else:
                companies = Company.objects.order_by('-created_at').filter(company_name__contains=search_name)[(page_no-1)*numbers_per_page : page_no*numbers_per_page].values()
            rows_from = (page_no-1)*numbers_per_page + 1
            if page_no < total_no_of_pages:
                rows_to = page_no * numbers_per_page
            else :
                rows_to = total_rows
            pagelist = pagination(page_no, total_no_of_pages, page_url)
        idx = 0
        for company in companies:
            idx += 1
            index = idx + (page_no - 1) * numbers_per_page
            produts_number = Product.objects.filter(company_id=company['id']).count()
            images_number = StoreImage.objects.filter(company_id=company['company_id']).count()
            planograms_number = 0
            company['products_number'] = produts_number
            company['images_number'] = images_number
            company['planograms_number'] = planograms_number
            company['index'] = index
        datas = {
            'companies' : companies,
            'pages' : pagelist,
            'rows_from' : rows_from,
            'rows_to' : rows_to,
            'rows_total' : total_rows,
            'title' : 'Company List',
            'pageview' : 'Drink',
            'search_name' : search_name
        }           
        return render(request, 'pages/company/company-list.html',datas)

    def post(self, request):
        str_companies = request.POST.get('companies')
        companies = loads(str_companies)
        for comp in companies:
            if Company.objects.filter(id=comp['id']).count() > 0:
                company = Company.objects.get(id = comp['id'])
                company.company_name = comp['company_name']
            else:
                company = Company(id=comp['id'], company_name=comp['company_name'])
            company.save()
        data = {}
        data['result'] = 'success'
        return JsonResponse(data)

class ComapnyProductView(LoginRequiredMixin,View):
    def get(self, request, company_id):
        page_list = []
        company_products = []
        page_no = int(request.GET.get('page', '1'))
        total_rows = Product.objects.filter(company_id=company_id).count()
        numbers_per_page = 10
        total_no_of_pages = math.ceil(total_rows / numbers_per_page)
        rows_from = 0
        rows_to = 0

        if total_rows > 0:
            company_products = Product.objects.filter(company_id=company_id).order_by('-created_at')[(page_no-1)*numbers_per_page : page_no*numbers_per_page].values()
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
        idx = 0
        for company_product in company_products:
            idx += 1
            index = idx + numbers_per_page * (page_no-1)
            pro_name = company_product['product_name']
            pro_status = company_product['status']
            pro_photo = company_product['product_photo']
            upload_date = company_product['created_at']
            company_product['product_name'] = pro_name
            company_product['status'] = pro_status
            company_product['product_photo'] = pro_photo
            company_product['upload_date'] = upload_date
            company_product['index'] = index
            
        datas = {
            'company_products' : company_products,
            'company_id' : company_id,
            'pages' : page_list,
            'rows_from' : rows_from,
            'rows_to' : rows_to,
            'rows_total' : total_rows,
            'title' : 'Product List',
            'pageview' : 'Drink',
        }      
        return render(request, 'pages/product/company-products.html',datas)

class ProductsView(LoginRequiredMixin,View):
    def get(self, request):
        page_list = []
        page_no = int(request.GET.get('page', '1'))
        product_search = request.GET.get('product', '');
        company_search= request.GET.get('company', '');
        total_rows = 0
        numbers_per_page = 25
        import operator
        queries = []
        products = []
        url_addtions = []
        page_url = "/products"
        if product_search == '' and company_search == '':
            total_rows = Product.objects.count()
            if total_rows > 0:
                products = Product.objects.order_by('-status', 'order').all()[(page_no-1)*numbers_per_page : page_no*numbers_per_page]
        else:
            if product_search != '':
                queries.append(Q(product_name__contains=product_search))
                url_addtions.append('product='+product_search)
            if company_search != '':
                companies = Company.objects.filter(company_name__contains=company_search)
                url_addtions.append('company='+company_search)
                if companies.count() > 0:
                    company_ids = []
                    for c in companies.filter():
                        company_ids.append(c.id)
                    queries.append(Q(company_id__in=company_ids))
            total_rows = Product.objects.filter(reduce(operator.and_, queries)).count()
            if total_rows > 0:
                products = Product.objects.order_by('-status', 'order').filter(reduce(operator.and_, queries))[(page_no-1)*numbers_per_page : page_no*numbers_per_page]
        total_no_of_pages = math.ceil(total_rows / numbers_per_page)
        rows_from = 0
        rows_to = 0
        if total_rows > 0:
            rows_from = (page_no-1)*numbers_per_page + 1
            if page_no < total_no_of_pages:
                rows_to = page_no * numbers_per_page
            else :
                rows_to = total_rows
        if len(url_addtions) > 0:
            str_url_addition = '&'.join(url_addtions)
            page_url += '?' + str_url_addition + '&'
        else:
            page_url += '?'

        page_list = pagination(page_no, total_no_of_pages, page_url)

        if len(products) > 0:
            idx = 0
            for product in products:
                company_name = product.productcompany(product.company_id)
                product.company_name = company_name
                idx += 1
                index = idx + (page_no - 1) * numbers_per_page
                product.index = index

        companies = Company.objects.all().values()


                        
        datas = {
            'products' : products,
            'companies' : companies,
            'pages' : page_list,
            'rows_from' : rows_from,
            'rows_to' : rows_to,
            'rows_total' : total_rows,
            'title' : 'Product List',
            'pageview' : 'Drink',
            'product_search' : product_search,
            'company_search' : company_search
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
            pro.company_id = request.POST.get('company_id')
            if request.FILES.get('file'):
                pro.product_photo = request.FILES.get('file')
            pro.updated_at = datetime.now()
            pro.save()
            return HttpResponseRedirect("/products")

class ProductAddView(LoginRequiredMixin,View):
    def get(self, request):
        datas = {}
        datas['title'] = "Add New Product"
        datas['pageview'] = "Drink"    
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
        datas['company_id'] = pro.company_id
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
        planograms = []

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
        page_list = []
        page_no = int(request.GET.get('page', '1'))
        total_rows = StoreImage.objects.count()
        numbers_per_page = 25
        total_no_of_pages = math.ceil(total_rows / numbers_per_page)
        rows_from = 0
        rows_to = 0
        images = []
        if total_rows > 0:
            images = StoreImage.objects.order_by('-created_at').all()[(page_no-1)*numbers_per_page : page_no*numbers_per_page].values()
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
        idx = 0
        for image in images:
            idx += 1
            index = (page_no-1)*numbers_per_page + idx
            results = ProcessResult.objects.filter(store_image_id = image['id'])
            if len(results) > 0:
                resultprocess = results[0]
                image['result_status'] = resultprocess.result
                if resultprocess.result == 1:
                    result_image = ResultImage.objects.get(result_id = resultprocess.id)
                    image['result_photo'] = result_image.result_image_name
                else :
                    image['result_photo'] = ""
            else:
                image['result_photo'] = ""
                image['result_status'] = 0
            company_name = ''
            if Company.objects.filter(id = image['company_id']).count() > 0:
                company_name = Company.objects.get(id = image['company_id']).company_name
            image['company_name'] = company_name
            image['index'] = index
        datas = {
            'images' : images,
            'pages' : page_list,
            'rows_from' : rows_from,
            'rows_to' : rows_to,
            'rows_total' : total_rows,
            'title' : 'Images List',
            'pageview' : 'Drink',
        }      
        return render(request, 'pages/image/image-list.html',datas)
        
class ProcessListView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Process"
        greeting['pageview'] = "Drink"        
        return render(request, 'menu/apps-chat.html',greeting)

class AddImageView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Add Image"
        greeting['pageview'] = "Drink"     
        # datalist = ["346.5 280.0 29 96 1", "346.0 277.5 30 91 1", "369.5 283.5 33 75 3", "369.5 283.5 31 75 3", "370.0 286.5 32 77 3", "370.0 286.0 32 76 3", "387.0 416.5 32 77 5", "385.5 416.0 33 76 5", "351.0 537.5 60 79 4", "350.5 541.5 61 87 4", "129.5 566.5 35 77 4", "128.5 566.0 37 76 4", "132.5 567.0 33 78 4", "131.0 565.0 36 74 4", "158.0 566.0 32 82 3", "156.5 562.0 35 74 3", "160.5 565.0 29 82 3", "159.5 560.5 31 73 3", "336.5 653.0 59 102 6", "335.5 658.0 61 106 6", "87.0 140.0 186 114 8", "94.0 140.0 172 112 8", "93.5 139.5 175 111 8", "95.5 141.0 181 114 8", "96.0 139.0 180 110 9", "348.0 147.5 88 121 6", "352.5 138.5 79 103 6", "356.5 144.0 71 114 6", "75.5 300.0 267 122 5", "345.5 278.0 31 94 5", "347.0 278.0 28 94 5", "368.5 280.5 35 69 5", "369.5 282.5 33 73 6", "369.0 284.0 32 74 5", "370.0 284.5 32 75 7", "283.5 421.0 113 104 7", "291.0 421.0 98 104 7", "291.0 423.0 98 108 3", "70.0 452.5 226 129 3", "75.5 455.0 217 134 3", "77.5 454.5 223 135 3", "82.0 454.5 214 135 1", "286.5 422.0 107 104 1", "292.0 421.0 98 102 1", "291.5 424.5 97 109 1", "384.0 411.5 38 71 2", "386.0 414.0 34 74 2", "349.5 538.5 63 79 2", "350.5 536.5 61 75 2", "349.0 543.0 64 88 3", "127.0 563.0 40 70 3", "128.5 565.5 37 75 3", "130.5 561.0 37 70 5", "131.0 564.5 34 75 5", "155.5 563.0 37 78 5", "157.5 562.0 33 76 6", "330.5 650.5 71 93 6", "335.0 650.0 64 94 6", "334.0 653.5 66 99 7", "96.0 155.5 168 143 8", "92.5 145.5 175 125 8", "98.5 149.5 173 129 8", "92.0 140.5 186 117 4", "356.5 146.5 75 109 4", "81.0 303.5 260 129 4", "63.5 303.0 295 128 3", "74.0 455.0 220 132 3", "58.5 454.5 251 133 3", "92.0 458.5 192 141 3", "70.5 456.0 235 138 2", "291.0 425.0 98 104 2", "348.0 542.5 62 81 2", "336.0 658.0 62 100 2"] 
        # total_arr = ArrangeRow(datalist)
        # for row in total_arr:
        #     arrange_row = ArrangeColumn(row)
        #     print(arrange_row)   
        return render(request, 'pages/image/add-image.html',greeting)

    def post(self,request):
        if request.method == "POST":
            user_id = request.POST.get('user_id')
            company_id = request.POST.get('company_id')
            company_name = request.POST.get('company_name')
            store_image = request.FILES.get('file')
            program_id = request.POST.get('program_id')
            program_name = request.POST.get('program_name')

            # get planograms
            plano_arr = []
            planograms = Planogram.objects.filter(status = 1)
            if planograms.count() > 0:
                for plano in planograms:
                    pl = makePlanoArray(plano)
                    plano_arr.append(pl)

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
            net = cv2.dnn.readNet(os.path.join(settings.MEDIA_ROOT, 'dataset/yolov4-custom_best.weights'), os.path.join(settings.MEDIA_ROOT, 'dataset/yolov4-custom.cfg'))
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
            products = []
            new_classes = []
            new_boxes = []
            font = cv2.FONT_HERSHEY_COMPLEX

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

            indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.5, 0.4)

            for i in range(len(boxes)):
                if i in indexes:
                    x, y, w, h = boxes[i]
                    products.append([x, y, w, h, int(class_ids[i])])


            rows = ArrangeRow(products)

            for plano in plano_arr:
                planocount = 0
                for row in rows:
                    cols = ArrangeColumn(row)
                    groups = ArrangeBoxes(cols)
                    str_planos = getPlanogramPossiblity(groups, plano)
                    strCols = colsToStr(cols)
                    if checkPlanoStr(strCols, str_planos):
                        planocount += 1

            for row in rows:
                cols = ArrangeColumn(row)
                groups = ArrangeBoxes(cols)
                i = 0
                for group in groups:
                    x, y, w, h, idx = group
                    i += 1
                    label = str(classes[idx])
                    color = colors[idx]
                    cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
                    cv2.putText(img, label, (x, y + i*13), font, 0.5, (255,255,255), 1, cv2.LINE_AA)

                    product = Product.objects.get(product_name=label)
                    # print(product)
                    if CompanyProduct.objects.filter(company_id=company_row.id, product_id = product.id).count() == 0:
                        company_product = CompanyProduct(company_id=company_row.id, product_id = product.id)
                        company_product.save()

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
            data['result_image'] = result_image
            return render(request, 'pages/image/show-image.html',data)

# APIs
@method_decorator(csrf_exempt, name='dispatch')
class APIProductsView(View):
    def get(self, request):
        productlist = []
        media_url = "http://168.119.55.26/media/" 
        products = Product.objects.order_by('order').filter(status=1)
        for product in products:
            pro = {}
            pro['id'] = product.id
            pro['order'] = product.order
            pro['status'] = product.status
            pro['product_name'] = product.product_name
            if product.product_photo != "":
                pro['photo'] = media_url + str(product.product_photo)
            else:
                pro['photo'] = ""
            productlist.append(pro)

        data = {
            'products' : productlist,
        }      
        return JsonResponse(data)

@method_decorator(csrf_exempt, name='dispatch')
class APIPlanogramsView(View):
    def get(self, request):
        planolist = []
        media_url = "http://168.119.55.26/media/" 
        planograms = Planogram.objects.order_by('order').filter(status=1)
        for planogram in planograms:
            plano = {}
            plano['id'] = planogram.id
            plano['status'] = planogram.status
            plano['name'] = planogram.planogram_name

            planoproducts = PlanogramProduct.objects.order_by('order').filter(planogram_id = planogram.id)
            productlist = []
            for planopro in planoproducts:
                product = Product.objects.get(id=planopro.product_id)
                pro = {}
                pro['id'] = product.id
                pro['name'] = product.product_name
                pro['index'] = planopro.order
                pro['count'] = planopro.rows
                productlist.append(pro)
            plano['products'] = productlist
            planolist.append(plano)

        data = {
            'planograms' : planolist,
        }      
        return JsonResponse(data)

@method_decorator(csrf_exempt, name='dispatch')
class APICompanyView(View):
    def get(self, request, id):
        productlist = []
        media_url = "http://168.119.55.26/media/" 
        products = Product.objects.order_by('order').filter(status=1).filter(company_id=id)
        for product in products:
            pro = {}
            pro['id'] = product.id
            pro['order'] = product.order
            pro['status'] = product.status
            pro['product_name'] = product.product_name
            if product.product_photo != "":
                pro['photo'] = media_url + str(product.product_photo)
            else:
                pro['photo'] = ""
            productlist.append(pro)

        data = {
            'products' : productlist,
        }      
        return JsonResponse(data, status=200)

@method_decorator(csrf_exempt, name='dispatch')
class APIProcessingView(View):
    def post(self,request):
        if request.method == "POST":
            media_url = "http://168.119.55.26/media/" 
            user_id = request.POST.get('user_id')
            company_id = request.POST.get('company_id')
            result_id = request.POST.get('result_id')
            product_str_ids = request.POST.get('product_ids')
            product_ids = product_str_ids.split(',')
            matched_number = request.POST.get('matched_number')
            store_image = request.FILES.get('file')
            planogram_id = request.POST.get('planogram_id')

            # add to store_image table
            store_row = StoreImage(user_id=user_id, company_id=company_id, photo_name = store_image)
            store_row.save()

            # Detect images
            net = cv2.dnn.readNet(os.path.join(settings.MEDIA_ROOT, 'dataset/yolov4-custom_best.weights'), os.path.join(settings.MEDIA_ROOT, 'dataset/yolov4-custom.cfg'))
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
            blob = cv2.dnn.blobFromImage(img, 0.00392, (512, 512), (0, 0, 0), True, crop=False)
            net.setInput(blob)
            outs = net.forward(output_layers)

            # Showing informations on the screen
            class_ids = []
            confidences = []
            boxes = []
            products = []
            new_classes = []
            new_boxes = []
            font = cv2.FONT_HERSHEY_COMPLEX
            total_count = 0

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

            indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.5, 0.4)

            for i in range(len(boxes)):
                if i in indexes:
                    x, y, w, h = boxes[i]
                    products.append([x, y, w, h, int(class_ids[i])])

            for pro_id in product_ids:
                cnt = getProductCount(int(pro_id), products)
                
                company_product = CompanyProduct(company_id=company_id, product_id = pro_id, detected_count=cnt, store_id=store_row.id)
                company_product.save()
                total_count += cnt
            result_status = ''
            if len(products) == 0:
                rate = 0
                result_status = 'rejected'
            else:
                rate = cnt * 100 / len(products) 
                rate = int(rate * 100) / 100
                result_status = 'approved'
            rows = []
            if len(products) > 0:
                rows = ArrangeRow(products)
            pl = Planogram.objects.get(id=planogram_id)
            plano = makePlanoArray(pl)
            planocount = 0
            for row in rows:
                cols = ArrangeColumn(row)
                groups = ArrangeBoxes(cols)
                str_planos = getPlanogramPossiblity(groups, plano)
                if checkPlanoStr(cols, str_planos, cv2, img):
                    planocount += 1
            print(planocount)

            for row in rows:
                cols = ArrangeColumn(row)
                groups = ArrangeBoxes(cols)
                i = 0
                for group in groups:  
                    x, y, w, h, idx = group
                    i += 1
                    label = str(classes[idx])
                    color = colors[idx]
                    cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
                    cv2.putText(img, label, (x, y + i*10), font, 0.3, (255,255,255), 1, cv2.LINE_AA)
                    product = Product.objects.get(product_name=label)

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
            data['result_image'] = media_url + 'result/'+result_image_name
            data['count'] = total_count
            data['detection_rate'] = rate
            data['result_id'] = result_id
            data['planogram_count'] = planocount
            data['status'] = result_status
            return JsonResponse(data, status=200)