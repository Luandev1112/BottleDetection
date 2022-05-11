from django.http import request
from django.shortcuts import redirect, render
from django.views import View   
from django.contrib.auth.mixins import LoginRequiredMixin

# Email-Inbox
class InboxView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Inbox"
        greeting['pageview'] = "Email"        
        return render(request, 'menu/mail/email-inbox.html',greeting)

# Read-Email
class ReadEmailView(LoginRequiredMixin,View):
    def get(self, request):
        greeting = {}
        greeting['title'] = "Read Email"
        greeting['pageview'] = "Email"        
        return render(request, 'menu/mail/email-read.html',greeting)