from django.shortcuts import redirect, render
from django.views import View
from authentication.forms import UserRegistrationForm,UserLoginForm,RecoverPasswordForm,LockScreenForm
from django.http import JsonResponse,HttpResponse
from django.template.loader import render_to_string
from django.core.mail import send_mail
from django.contrib.auth.models import User
from django.contrib import auth
from django.core.mail import BadHeaderError
from django.utils.http import urlsafe_base64_encode
from django.contrib.auth.tokens import default_token_generator
from django.utils.encoding import force_bytes
from django.db.models.query_utils import Q
from django.contrib import messages


# Login
class LoginView(View):
    username = [];
    def get(self,request):
        if 'username' in request.session:
            return redirect('dashboard')
        else:
            greeting={}
            greeting['form'] = UserLoginForm
            return render(request,'pages/authentication/auth-login.html',greeting)

    def post(self,request):
        if(request.method == "POST"):
            username = request.POST.get('username')
            password = request.POST.get('password')

            if(username != '' and password != ''):
                user = auth.authenticate(username=username, password=password)
                if user is not None:       
                    request.session['username'] = username
                    auth.login(request, user)
                    request.session.set_expiry(300)
                    LoginView.username.append(username)
                    data={}
                    data['success_message'] ='Successfully login'
                    return JsonResponse(data,safe=False)
                else:
                    data={}
                    data['error_message'] ='Invalid Credentials'
                    return JsonResponse(data,safe=False)
            else:
                data={}
                data['error_message'] ='Some field is empty'
                return JsonResponse(data,safe=False)
        else:
            return redirect('auth-login')

# Registration
class RegisterView(View):
    def get(self,request):
        greeting={}
        greeting['form'] = UserRegistrationForm
        auth.logout(request)
        return render(request,'pages/authentication/auth-register.html',greeting)
    def post(self,request):
        if request.method == "POST":
            email = request.POST.get('email')
            username = request.POST.get('username')
            password = request.POST.get('password1')
            password1 = request.POST.get('password2')
            
            if(email != '' and username != '' and password != '' and password1 != '' ):
                if User.objects.filter(username=username).exists():
                    data={}
                    data['error_message'] = 'Username Is Already Exists'
                    return JsonResponse(data,safe=False)
                elif User.objects.filter(email=email).exists():
                    data={}
                    data['error_message'] ='Email Is Already Exists'
                    return JsonResponse(data,safe=False)
                elif(password == password1):
                    form = UserRegistrationForm(request.POST)
                    if form.is_valid():
                        subject = "Welcome to Nazox  Membership"
                        email_template_name = "pages/authentication/register-email.txt"
                        c = {
                            'username': username,
                            'password': password
                        }
                        email_1 = render_to_string(email_template_name, c)
                        send_mail(subject, email_1, 'nazox@nazox.com',
                                [email], fail_silently=False)
                        user = User.objects.create_user(username=username, email=email, password=password)
                        user.save()
                        data={'success_message' : "Successfully registered please login"}
                        return JsonResponse(data,safe=False)
                else:
                    data={}
                    data['error_message'] ='password and confirm password is not match'
                    return JsonResponse(data,safe=False)
            else:
                data={}
                data['error_message'] ='Some field is empty'
                return JsonResponse(data,safe=False)
        else:
            return redirect('auth-login')


# Recover Password
class RecoverPasswordView(View):
    template_name = 'pages/authentication/auth-recoverpw.html'

    def get(self, request):
        if 'username' in request.session:
            return redirect('dashboard')
        else:
            return render(request, self.template_name, {'form': RecoverPasswordForm})

    def post(self, request):
        if request.method == "POST":
            email = request.POST.get("email", "default value")
            if User.objects.filter(email=email).exists():
                obj = User.objects.filter(email=email)
                for i in obj:
                    user_details = {'username':i.username }
                    username = user_details['username']
                password_reset_form = RecoverPasswordForm(request.POST)
                if password_reset_form.is_valid():
                    data = password_reset_form.cleaned_data['email']
                    associated_users = User.objects.filter(Q(email=data))
                    if associated_users.exists():
                        for user in associated_users:
                            subject = "Password Reset Requested"
                            email_template_name = "pages/authentication/email.txt"
                            c = {
                                "username": user.username,
                                "email": user.email,
                                'domain': '127.0.0.1:8000',
                                'site_name': 'Website',
                                "uid": urlsafe_base64_encode(force_bytes(user.pk)),
                                "user": user,
                                'token': default_token_generator.make_token(user),
                                'protocol': 'http',
                            }
                            email = render_to_string(email_template_name, c)
                            try:
                                send_mail(subject, email, 'admin@example.com',
                                          [user.email], fail_silently=False)
                            except BadHeaderError:
                                messages.info(request, "Email Doesn't Exists ")
                                return redirect('pages-recoverpw')
                            return redirect("password_reset_done")
                password_reset_form = RecoverPasswordForm()
                return render(request=request, template_name="more/authentication/auth-recoverpw.html", context={"password_reset_form": password_reset_form})
            else:
                if email == "":
                    messages.info(request, 'Please Enter Your Email')
                    return redirect('auth-recoverpw')
                else:
                    messages.info(request, "Email doesn't  exist")
                    return redirect('auth-recoverpw')
        else:
            return render(request, self.template_name, {'form': RecoverPasswordForm})


#  Confirm Mail
class ConfirmmailView(View):
    def get(self, request):
        return render(request, 'pages/authentication/auth-confirm-mail.html')

#  Email Verification
class EmailVerificationView(View):
    def get(self, request):
        return render(request, 'pages/authentication/auth-email-verification.html')

#  Two Step Verification
class TwoStepVerificationView(View):
    def get(self, request):
        return render(request, 'pages/authentication/auth-two-step-verification.html')


# Lock-Screen
class LockScreenView(LoginView,View):
    def get(self, request):
        if(self.username):
            greeting = {}
            username = self.username[0]
            greeting['heading'] = username
            greeting['form'] = LockScreenForm
            return render(request, 'pages/authentication/auth-lock-screen.html',greeting)
        else:
            return redirect("auth-login")
    def post (self, request):
        if request.method == "POST":
            password = request.POST['password']

            if(self.username):
                username = self.username[0]

                p_len =len(username)
                if(p_len<6):
                    user = auth.authenticate(username=username, password=password)
                    if user is not None:    
                        request.session['username'] = username
                        auth.login(request, user)
                        data={}
                        data['success_message'] ='Successfully unlock-screen'
                        return JsonResponse(data,safe=False)
                    else:
                        data={}
                        data['error_message'] = 'invalid creditional'
                        return JsonResponse(data,safe=False)
                else:
                    data={}
                    data['error_message'] = 'Password must be at least 6 characters'
                    return JsonResponse(data,safe=False)
            else:
                data={}
                data['session_timeout'] = 'Time-out Please Login'
                return JsonResponse(data,safe=False)        
        else:
            return redirect('auth-lock-screen')

# Logout
def logout(request):
    auth.logout(request)
    return render(request,'pages/authentication/auth-logout-done.html')
