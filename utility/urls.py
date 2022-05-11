from django.urls import path
from utility import views


urlpatterns = [
    # Utility
    path('utility/starter-page',views.StarterPageView.as_view(),name='pages-starter'),# Starter Pages
    path('utility/maintenance',views.MaintenanceView.as_view(),name='pages-maintenance'),# Maintenance
    path('utility/coming-soon',views.ComingSoonView.as_view(),name='pages-comingsoon'),# Maintenance
    path('utility/timeline',views.TimelineView.as_view(),name='pages-timeline'),# Timeline
    path('utility/faqs',views.FaqsView.as_view(),name='pages-faqs'),# Faqs
    path('utility/pricing',views.PricingView.as_view(),name='pages-pricing'),# Pricing
    path('utility/error-404',views.Error404View.as_view(),name='pages-404'),# Error 404 
    path('utility/error-500',views.Error500View.as_view(),name='pages-500'),# Error 404 
]
