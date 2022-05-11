from django.urls import path
from mail import views

urlpatterns = [
    # Email
    path('inbox',views.InboxView.as_view(),name='email-inbox'),#Inbox
    path('read-email',views.ReadEmailView.as_view(),name='email-read'),#Read Email
]


