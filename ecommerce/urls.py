from django.urls import path
from ecommerce import views
urlpatterns = [
    # Ecommerce
    path('products',views.ProductsView.as_view(),name='ecommerce-products'),# Products
    path('product-details',views.ProductDetailsView.as_view(),name='ecommerce-product-detail'),# Product Details
    path('orders',views.OrdersView.as_view(),name='ecommerce-orders'),# Orders
    path('customers',views.CustomersView.as_view(),name='ecommerce-customers'),# Cusomers
    path('cart',views.CartView.as_view(),name='ecommerce-cart'),# Cart
    path('check-out',views.CheckoutView.as_view(),name='ecommerce-checkout'),# Checkout
    path('shops',views.ShopsView.as_view(),name='ecommerce-shops'),# Shops
    path('add-product',views.AddProductView.as_view(),name='ecommerce-add-product'),# Shops

]
