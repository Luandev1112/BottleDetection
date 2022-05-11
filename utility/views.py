from django.shortcuts import render
from django.views import View


# Starter Page
class StarterPageView(View):
    def get(self,request):
        greeting = {}
        greeting['title'] = "Starter Page"
        greeting['pageview'] = "Utility"
        return render(request,'pages/utility/pages-starter.html',greeting)

# Maintenance
class MaintenanceView(View):
    def get(self,request):
        greeting = {}
        greeting['title'] = "Maintenance"
        greeting['pageview'] = "Utility"
        return render(request,'pages/utility/pages-maintenance.html',greeting)
        
# Coming-Soon
class ComingSoonView(View):
    def get(self,request):
        greeting = {}
        greeting['title'] = "Coming Soon"
        greeting['pageview'] = "Utility"
        return render(request,'pages/utility/pages-comingsoon.html',greeting)

# Timeline
class TimelineView(View):
    def get(self,request):
        greeting = {}
        greeting['title'] = "Timeline"
        greeting['pageview'] = "Utility"
        return render(request,'pages/utility/pages-timeline.html',greeting)

# Faqs
class FaqsView(View):
    def get(self,request):
        greeting = {}
        greeting['title'] = "FAQs"
        greeting['pageview'] = "Utility"
        return render(request,'pages/utility/pages-faqs.html',greeting)

# Pricing
class PricingView(View):
    def get(self,request):
        greeting = {}
        greeting['title'] = "Pricing"
        greeting['pageview'] = "Utility"
        return render(request,'pages/utility/pages-pricing.html',greeting)

# Error 404
class Error404View(View):
    def get(self,request):
        greeting = {}
        greeting['title'] = "Error 404"
        greeting['pageview'] = "Utility"
        return render(request,'pages/utility/pages-404.html',greeting)

# Error 500
class Error500View(View):
    def get(self,request):
        greeting = {}
        greeting['title'] = "Error 500"
        greeting['pageview'] = "Utility"
        return render(request,'pages/utility/pages-500.html',greeting)