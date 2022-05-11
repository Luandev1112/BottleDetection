from django.shortcuts import render
from django.views import View
from django.contrib.auth.mixins import LoginRequiredMixin

# UI-Elements
# Alerts
class AlertsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Alerts"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-alerts.html',greeting)        

# Buttons
class ButtonsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Buttons"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-buttons.html',greeting)        

# Cards
class CardsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Cards"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-cards.html',greeting)        

# Carousel
class CarouselView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Carousel"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-carousel.html',greeting)        

# Dropdowns
class DropdownsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Dropdowns"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-dropdowns.html',greeting)        

# Grid
class GridView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Grid"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-grid.html',greeting)        

# Images
class ImagesView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Images"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-images.html',greeting)        

# Lightbox
class LightboxView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Lightbox"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-lightbox.html',greeting)        

# Modals
class ModalsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Modals"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-modals.html',greeting)        

# Offcavas
class OffcanvasView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Offcanvas"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-offcanvas.html',greeting)        

# Range Slider
class RangeSliderView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Range Slider"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-rangeslider.html',greeting)        

# Round Slider
class RoundSliderView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Round Slider"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-roundslider.html',greeting)        

# Session Timeout
class SessionTimeoutView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Session Timeout"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-session-timeout.html',greeting)        

# Progress Bars
class ProgressBarsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Progress Bars"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-progressbars.html',greeting)        

# Sweetalert 2
class SweetAlertView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Sweetalert 2"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-sweet-alert.html',greeting)        

# Tabs & Accordions
class TabsAccordionsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Tabs & Accordions"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-tabs-accordions.html',greeting)        

# Typography
class TypographyView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Typography"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-typography.html',greeting)        

# Video
class VideoView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Video"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-video.html',greeting)        

# General
class GeneralView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "General"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-general.html',greeting)        

# Rating
class RatingView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Rating"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-rating.html',greeting)        

# Notifications
class NotificationsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Notifications"
        greeting['pageview'] = "UI Elements"
        return render(request,'components/ui-elements/ui-notifications.html',greeting)                                                

# Forms
# Form Elements
class FormElementsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Form Elements"
        greeting['pageview'] = "Forms"
        return render(request,'components/forms/form-elements.html',greeting)        

# Form Validation
class FormValidationView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Form Validation"
        greeting['pageview'] = "Forms"
        return render(request,'components/forms/form-validation.html',greeting)        

# Form Advanced Plugin
class FormAdvancedPluginsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Form Advanced"
        greeting['pageview'] = "Forms"
        return render(request,'components/forms/form-advanced.html',greeting)        

# Form Editors
class FrormEditorsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Form Editors"
        greeting['pageview'] = "Forms"
        return render(request,'components/forms/form-editors.html',greeting)        

# Form File Upload
class FormFileUploadView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Form File Upload"
        greeting['pageview'] = "Forms"
        return render(request,'components/forms/form-uploads.html',greeting)        

# Form X-editable
class FormXeditableView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Form X-editable"
        greeting['pageview'] = "Forms"
        return render(request,'components/forms/form-xeditable.html',greeting)        

# Form Wizard
class FormWizardView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Form Wizard"
        greeting['pageview'] = "Forms"
        return render(request,'components/forms/form-wizard.html',greeting)                                                

# Form Mask
class FormMaskView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Form Mask"
        greeting['pageview'] = "Forms"
        return render(request,'components/forms/form-mask.html',greeting)        


# Tables
# Basic Table
class BasicTableView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Basic Tables"
        greeting['pageview'] = "Tables"
        return render(request,'components/tables/tables-basic.html',greeting)        

# Datatables
class DatatableView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Data Tables"
        greeting['pageview'] = "Tables"
        return render(request,'components/tables/tables-datatable.html',greeting)        

# Editable
class EditableView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Editable Table"
        greeting['pageview'] = "Tables"
        return render(request,'components/tables/tables-editable.html',greeting)                                                

# Responsive Table
class ResponsiveView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Responsive Table"
        greeting['pageview'] = "Tables"
        return render(request,'components/tables/tables-responsive.html',greeting)        

# Charts
# Apex Charts
class ApexView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Apex Charts"
        greeting['pageview'] = "Charts"
        return render(request,'components/charts/charts-apex.html',greeting)        

# Chartjs Charts
class ChartjsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Chartjs Charts"
        greeting['pageview'] = "Charts"
        return render(request,'components/charts/charts-chartjs.html',greeting)        

# Flot Charts
class FlotView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Flot Charts"
        greeting['pageview'] = "Charts"
        return render(request,'components/charts/charts-flot.html',greeting)                                                

# Knob Charts
class KnobView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Jquery Knob Charts"
        greeting['pageview'] = "Charts"
        return render(request,'components/charts/charts-knob.html',greeting) 

# Sparkline Charts
class SparklineView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Sparkline Charts"
        greeting['pageview'] = "Charts"
        return render(request,'components/charts/charts-sparkline.html',greeting) 

# Icons
# Remix Icons
class RemixIconsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Remix Icons"
        greeting['pageview'] = "Icons"
        return render(request,'components/icons/icons-remix.html',greeting)        

# Materialdesign Icons Charts
class MaterialdesignIconsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Material Design"
        greeting['pageview'] = "Icons"
        return render(request,'components/icons/icons-materialdesign.html',greeting)                                                

# Dripicons Icons
class DripiconsIconsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Dripicons"
        greeting['pageview'] = "Icons"
        return render(request,'components/icons/icons-dripicons.html',greeting) 

# Fontawesome Icons
class FontawesomeIconsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Font awesome 5"
        greeting['pageview'] = "Icons"
        return render(request,'components/icons/icons-fontawesome.html',greeting) 

# Maps
# Google Maps
class GoogleMapsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Google Maps"
        greeting['pageview'] = "Maps"
        return render(request,'components/maps/maps-google.html',greeting) 

# Vector Maps
class VectorMapsView(LoginRequiredMixin,View):
    def get(self,request):
        greeting={}
        greeting['title'] = "Vector Maps"
        greeting['pageview'] = "Maps"
        return render(request,'components/maps/maps-vector.html',greeting) 