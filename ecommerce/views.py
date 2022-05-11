from django.http import request
from django.shortcuts import redirect, render
from django.views import View   
from django.contrib.auth.mixins import LoginRequiredMixin

# Products
class ProductsView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Products"
        greeting['pageview'] = "Ecommerce"        
        return render(request, 'menu/ecommerce/ecommerce-products.html',greeting)

# Product Details
class ProductDetailsView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Product Detail"
        greeting['pageview'] = "Ecommerce"        
        return render(request, 'menu/ecommerce/ecommerce-product-detail.html',greeting)

# Orders
class OrdersView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Orders"
        greeting['pageview'] = "Ecommerce"        
        return render(request, 'menu/ecommerce/ecommerce-orders.html',greeting)

# Customers
class CustomersView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Customers"
        greeting['pageview'] = "Ecommerce"        
        return render(request, 'menu/ecommerce/ecommerce-customers.html',greeting)

# Cart
class CartView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Cart"
        greeting['pageview'] = "Ecommerce"        
        return render(request, 'menu/ecommerce/ecommerce-cart.html',greeting)

# Check-out
class CheckoutView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Checkout"
        greeting['pageview'] = "Ecommerce"        
        return render(request, 'menu/ecommerce/ecommerce-checkout.html',greeting)

# Shops
class ShopsView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Shops"
        greeting['pageview'] = "Ecommerce"        
        return render(request, 'menu/ecommerce/ecommerce-shops.html',greeting)

# Add Product
class AddProductView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Add Product"
        greeting['pageview'] = "Ecommerce"        
        return render(request, 'menu/ecommerce/ecommerce-add-product.html',greeting)
