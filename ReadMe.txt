Nazox Installation in Django Python

>>>Installation Python
 ->https://www.python.org/downloads/

>>For Windows OS 
 -Download python  from windows store
 -Select the Python's version to download.
 -Click on the Install Now
 -Installation in Process

>>For Linux OS
 -sudo apt update
 -sudo apt install python3
	
>>>Open terminal
 -python --version
 
>>>To check pip version  
  -py -m pip --version
  -upgread pip 
  -py -m pip install --upgrade pip

>>>Installing virtualenv	
  #linux & mac os
   ->python3 -m pip install --user virtualenv
  #Windows
  ->py -m pip install --user virtualenv


>>>Create Virtual Environment
  #linux & mac os
  ->python3 -m venv environment_name
  #Windows
  ->python -m venv environment_name

>>>Activate Environment
  #Linux & mac os
  ->source environment_name/bin/activate
  #Windows
  ->environment_name\Scripts\activate
 
>>>Install Django
 #linux & mac os
 ->pip3 install django
 #Windows
 ->pip install django
 
>>>First please check Django properly Installed or not
 #Linux/macOS
 python3 -m django --version
 #Windows
 python  -m django --version

>>>Open terminal 
 -Goto project directory using cd command
 

>>>Install few libraries
->pip install django-embed-video
->pip install django-session-timeout
->pip install django-password-validators
->pip install django-js-routes
->pip install django-crispy-forms

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.#databaseservername#',
        'NAME': 'Your Database Name',
        'USER' : 'Database User Name',
        'PASSWORD' : 'Your Password',
        'HOST' : "Write down Host",
        'PORT' : 'Write down port',
                
    }
}
>>>To Create superuser 
->python manage.py createsuperuser
	enter username = your_username
	enter your Email Address
	enter your password
	enter your password again 
-> Windows:-python manage.py migrate
-> Linux:-python3 manage.py migrate

>>>To load Static Files:-
>Go to Skote/setings.py
-Add following command:-
STATIC_URL = '/static/'
STATICFILES_DIRS = [os.path.join(BASE_DIR,'static')]
STATIC_ROOT= os.path.join(BASE_DIR,'assets')

>Run Command In Terminal
-python manage.py collectstatic

>>>Authentication Configuration
Windwos:-Install Package:-pip install Django-Verify-Email
Linux:-Install Package:-pip3 install Django-Verify-Email
-Goto settings.py of Main Directory

-SMTP CONFIGURATION
	EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
	EMAIL_HOST = 'smtp.gmail.com'
	EMAIL_PORT = 587
	EMAIL_USE_TLS = True
	EMAIL_HOST_USER = '#####YOUR EMAIL ADDRESS########'
	EMAIL_HOST_PASSWORD = '#####YOUR HOST Password########'
	DEFAULT_FROM_EMAIL = '#####YOUR EMAIL ADDRESS########'
	SERVER_EMAIL = '#####YOUR EMAIL ADDRESS########'
	 
     
>>>To Set Default Layout
 >Goto templates/partial/base.html
 
<!--=================================================================================================================================================-->
                                                            <!--Vertical Layout View-->
<!--=================================================================================================================================================-->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> add attribute into the body tag [data-sidebar="dark"]
		Example -> <body data-sidebar="dark"">
Step - 3 -> Comment this code {% include 'partials/hori-header.html' %} and {% include 'partials/hori-sidebar.html' %}
Step - 4 -> Uncomment this code {% include 'partials/header.html' %} and {% include 'partials/sidebar.html' %}

						<!-- (Light Sidebar) -->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Add data attribute data-topbar="dark" body element to have light sidebar.
            Example -> <body data-sidebar="dark"">

						<!-- (Dark Sidebar) -->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Add data attribute data-sidebar="dark" body element to have dark sidebar.
            Example -> <body data-sidebar="dark">

						<!-- (Colored Sidebar) -->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Add data attribute data-sidebar="colored" body element to have colored sidebar.
            Example -> <body data-sidebar="colored">

						<!-- (Compact Sidebar) -->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Add data attribute data-sidebar="dark" data-sidebar-size="small" body element to have Compact sidebar.
            Example -> <body data-sidebar="dark" data-sidebar-size="small">

						<!-- (Icon Sidebar) -->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Add data attribute data-sidebar="dark" data-keep-enlarged="true" class="vertical-collpsed" body element to have Icon sidebar.


						<!-- (Boxed Layout) -->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Add data attribute  data-sidebar="dark" data-keep-enlarged="true" class="vertical-collpsed" data-layout-size="boxed"  body element to have boxed layout.
            Example -> <body data-sidebar="dark" data-keep-enlarged="true" class="vertical-collpsed" data-layout-size="boxed">

<!--=================================================================================================================================================-->


<!--=================================================================================================================================================-->
                                                            <!--Horizontal Body View-->
<!--=================================================================================================================================================-->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Add attribute into the body tag [data-topbar="dark" data-layout="horizontal"]
		Example -> <body data-topbar="dark" data-layout="horizontal">
Step - 3 -> Comment this code {% include 'partials/header.html' %} and {% include 'partials/sidebar.html' %}
Step - 4 -> Uncomment this code {% include 'partials/hori-header.html' %} and {% include 'partials/hori-sidebar.html' %}

						<!-- (Topbar Light) -->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Add data attribute data-topbar="light" data-layout="horizontal"  body element to have light topbar and dark menubar.
            Example -> <body data-topbar="light" data-layout="horizontal">

						<!-- (Colored Topbar) -->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Add data attribute data-topbar="colored" data-layout="horizontal"  body element to have light topbar and dark menubar.
            Example -> <body data-topbar="colored" data-layout="horizontal">

						<!-- (Boxed Layout) -->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Add data attribute  data-topbar="dark" data-layout="horizontal" data-layout-size="boxed"  body element to have boxed layout.
            Example -> <body data-topbar="dark" data-layout="horizontal" data-layout-size="boxed">

<!--=================================================================================================================================================-->


<!--=================================================================================================================================================-->
                                                            <!--light/dark/RTL Mode-->
<!--=================================================================================================================================================-->
			<!--- Dark Mode --->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Add attribute into the body tag [data-topbar="dark" data-layout-mode="dark" data-sidebar="dark" ] 
		Example -> <body data-topbar="dark" data-layout-mode="dark" data-sidebar="dark">

			<!--- Light Mode --->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Add attribute into the body tag [data-layout-mode="light"] 
		Example -> <body data-layout-mode="light" >

			<!--- RTL Mode --->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Add attribute into the HTML tag [lang="en" dir="rtl"] 
		Example -> <html lang="en" dir="rtl" >
Step - 3 -> Go to nazox/static/js/app.js
            Go to line number 176 and add [alreadyVisited = "rtl-mode-switch";]

<!--=================================================================================================================================================-->


<!--=================================================================================================================================================-->
                                                            <!-- Preloader -->
<!--=================================================================================================================================================-->
			<!--- Fluid --->
Step - 1 -> Goto nazox\templates\partials\base.html
Step - 2 -> Preloader block in uncomment this code {% include 'partials/preloader.html' %} 
<!--=================================================================================================================================================-->


>>> Migrate Model 
-> Windows:-python manage.py migrate
-> Linux:-python3 manage.py migrate

>>>Run your project
-Windows:-python manage.py runserver
-Linux:-python3 manage.py runserver
