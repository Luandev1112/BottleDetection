from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm,PasswordChangeForm,PasswordResetForm,SetPasswordForm


class UserRegistrationForm(UserCreationForm):
    email=forms.EmailField(label='Email',widget=forms.EmailInput(attrs={'placeholder': 'Enter your email', 'id':'user_email', 'class':'form-control'}),max_length=50,required=True,help_text='Required.add valid email address')
    username=forms.CharField(label='Username',widget=forms.TextInput(attrs={'placeholder': 'Enter your username', 'id':'user_name', 'class':'form-control'}),max_length=50,required=True,help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.')
    password1=forms.CharField(label='Password',widget=forms.PasswordInput(attrs={'placeholder': 'Enter your password', 'id':'user_password', 'class':'form-control'}),max_length=50,required=True,help_text='Your password must contain at least 8 characters.')
    password2=forms.CharField(label='Confirm Password',widget=forms.PasswordInput(attrs={'placeholder': 'Enter confirm password', 'id':'confirm_password', 'class':'form-control'}),max_length=50,required=True,help_text='Enter the same password as before, for verification.')
    class Meta:
        model=User
        fields=['username','email','password1','password2']
class UserLoginForm(forms.Form):
    username=forms.CharField(label='Username',widget=forms.TextInput(attrs={'placeholder': 'Enter your username', 'id':'user_name', 'class':'form-control'}),max_length=50)
    password=forms.CharField(label='Password',widget=forms.PasswordInput(attrs={'placeholder': 'Enter your password', 'id':'user_password', 'class':'form-control'}),max_length=50,required=True)
    class Meta:
        model = User
        fields = ['username','password']
class ChangePasswordForm(PasswordChangeForm):
    old_password = forms.CharField(label='Old password',widget=forms.PasswordInput(attrs={'placeholder':'Enter your old password','class':'form-control'}),max_length=10,min_length=6,required=True)
    new_password1 = forms.CharField(label='New password',widget=forms.PasswordInput(attrs={'placeholder':'Enter your new password','class':'form-control'}),max_length=10,min_length=6,required=True)
    new_password2 = forms.CharField(label='Confirm new password',widget=forms.PasswordInput(attrs={'placeholder':'Confirm new password','class':'form-control'}),max_length=10,min_length=6,required=True)
    class Meta:
        model = PasswordChangeForm
        fields = ['old_password','new_password1','new_password2']

class RecoverPasswordForm(PasswordResetForm):
    email=forms.EmailField(label='Email',widget=forms.EmailInput(attrs={'placeholder': 'Enter your email', 'id':'user_email', 'class':'form-control'}),max_length=50,required=True,help_text='Required.add valid email address')
    class Meta:
        models= PasswordResetForm
        fields = ['email']
class ResetPasswordForm(SetPasswordForm):
    new_password1 = forms.CharField(label='New password',widget=forms.PasswordInput(attrs={'placeholder':'Enter your old password'}),max_length=10,min_length=2,required=True)
    new_password2 = forms.CharField(label='Confirm new password',widget=forms.PasswordInput(attrs={'placeholder':'Enter your old password'}),max_length=10,min_length=2,required=True)
    class Meta:
        model=SetPasswordForm
        fields=['new_password1','new_password2']

class LockScreenForm(forms.Form):
    password=forms.CharField(label='Password',widget=forms.PasswordInput(attrs={'placeholder': 'Enter your password', 'id':'user_password', 'class':'form-control'}),max_length=50,required=True)
    class Meta:
        model = User
        fields = ['password']