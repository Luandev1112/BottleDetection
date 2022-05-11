from django.urls import path
from authentication import views
from django.contrib.auth import views as auth_views
urlpatterns = [
    # Authentication
    path('login',views.LoginView.as_view(),name='auth-login'),# Auth-Login
    path('register',views.RegisterView.as_view(),name='auth-register'),# Auth-Register
    path('recover-password',views.RecoverPasswordView.as_view(),name='auth-recoverpw'),# Auth-Recover-Password
    path('confirm-mail', views.ConfirmmailView.as_view(), name="auth-confirm-mail"),# Confirm-mail
    path('email-verification', views.EmailVerificationView.as_view(), name="auth-email-verification"),#Email Verification
    path('two-step-verification', views.TwoStepVerificationView.as_view(), name="auth-two-step-verification"),# Two Step Verification
    # Change Password
    path('password_change/',auth_views.PasswordChangeView.as_view(template_name='pages/authentication/auth-change-password.html'),name='change_password'),# Change password view
    path('password_change_done/',auth_views.PasswordChangeDoneView.as_view(template_name='pages/authentication/auth-change-password-done.html'),name='password_change_done'),# change password done
    # Reset Password
    path('password_reset/done/',auth_views.PasswordResetDoneView.as_view(template_name='pages/authentication/auth-password-reset-done.html'),name='password_reset_done'),# Reset Password Link send
    path('reset/<uidb64>/<token>/',auth_views.PasswordResetConfirmView.as_view(template_name='pages/authentication/auth-password-reset-confirm.html'),name='password_reset_confirm'),# Reset password confirmation 
    path('reset/done/',auth_views.PasswordResetCompleteView.as_view(template_name='pages/authentication/auth-password-reset-complete.html'),name='password_reset_complete'),# Reset Password complate
        
    path('lock-screen',views.LockScreenView.as_view(),name='auth-lock-screen'),# Auth-Lock-Screen
    path('logout',views.logout,name ='auth-logout'),# Logout
]
