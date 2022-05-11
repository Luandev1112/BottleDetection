from django.urls import path
from components import views
urlpatterns = [
    # UI- ELements
    path('ui-elements/alerts',views.AlertsView.as_view(),name='ui-alerts'), #Alerts
    path('ui-elements/buttons',views.ButtonsView.as_view(),name='ui-buttons'), #BUttons
    path('ui-elements/cards',views.CardsView.as_view(),name='ui-cards'), #Cards
    path('ui-elements/carousel',views.CarouselView.as_view(),name='ui-carousel'), #Carousel
    path('ui-elements/dropdowns',views.DropdownsView.as_view(),name='ui-dropdowns'), #Dropdowns
    path('ui-elements/grid',views.GridView.as_view(),name='ui-grid'), #Grid
    path('ui-elements/images',views.ImagesView.as_view(),name='ui-images'), #Images
    path('ui-elements/lightbox',views.LightboxView.as_view(),name='ui-lightbox'), #Lightbox
    path('ui-elements/modals',views.ModalsView.as_view(),name='ui-modals'), #Modals
    path('ui-elements/offcanvas',views.OffcanvasView.as_view(),name='ui-offcanvas'), #Offcavas
    path('ui-elements/range-slider',views.RangeSliderView.as_view(),name='ui-rangeslider'), #Range Slider
    path('ui-elements/round-slider',views.RoundSliderView.as_view(),name='ui-roundslider'), #Round Slider
    path('ui-elements/session-timeout',views.SessionTimeoutView.as_view(),name='ui-session-timeout'), #Session Timeout
    path('ui-elements/progress-bars',views.ProgressBarsView.as_view(),name='ui-progressbars'), #Progress Bars
    path('ui-elements/sweet-alert',views.SweetAlertView.as_view(),name='ui-sweet-alert'), #Sweetalert
    path('ui-elements/tabs&Accordions',views.TabsAccordionsView.as_view(),name='ui-tabs-accordions'), #Tabs & Accordions
    path('ui-elements/typography',views.TypographyView.as_view(),name='ui-typography'), #Typography
    path('ui-elements/yideo',views.VideoView.as_view(),name='ui-video'), #Video
    path('ui-elements/general',views.GeneralView.as_view(),name='ui-general'), #General
    path('ui-elements/rating',views.RatingView.as_view(),name='ui-rating'), #Rating
    path('ui-elements/notifications',views.NotificationsView.as_view(),name='ui-notifications'), #Notifications
    # Forms
    path('forms/form-elements',views.FormElementsView.as_view(),name='form-elements'), #Form-Elements
    path('forms/form-validation',views.FormValidationView.as_view(),name='form-validation'), #Form-Validation
    path('forms/form-advanced',views.FormAdvancedPluginsView.as_view(),name='form-advanced'), #Form-Advanced
    path('forms/form-editors',views.FrormEditorsView.as_view(),name='form-editors'), #Form-Editors
    path('forms/form-file-upload',views.FormFileUploadView.as_view(),name='form-uploads'), #Form-File-Upload
    path('forms/form-x-editable',views.FormXeditableView.as_view(),name='form-xeditable'), #Form-X-Editable
    path('forms/form-wizard',views.FormWizardView.as_view(),name='form-wizard'), #Form-Wizard
    path('forms/form-mask',views.FormMaskView.as_view(),name='form-mask'), #Form-Mask
    # Tables
    path('tables/tables-basic',views.BasicTableView.as_view(),name='tables-basic'), # Tables-Basic
    path('tables/tables-datatable',views.DatatableView.as_view(),name='tables-datatable'), # Tables-Datatable
    path('tables/tables-editable',views.EditableView.as_view(),name='tables-editable'), # Tables-Editable
    path('tables/tables-responsive',views.ResponsiveView.as_view(),name='tables-responsive'), # Tables-Responsive
    # Charts
    path('charts/apex-charts',views.ApexView.as_view(),name='charts-apex'), # Charts-Apex
    path('charts/chartjs-charts',views.ChartjsView.as_view(),name='charts-chartjs'), # Charts-Chartjs
    path('charts/flot-charts',views.FlotView.as_view(),name='charts-flot'), # Charts-Flot
    path('charts/knob-charts',views.KnobView.as_view(),name='charts-knob'), # Charts-Knob
    path('charts/sparkline-charts',views.SparklineView.as_view(),name='charts-sparkline'), # Charts-Sparkline
    # Icons
    path('icons/remix-icons',views.RemixIconsView.as_view(),name='icons-remix'), # Icons-Remix
    path('icons/materialdesign-icons',views.MaterialdesignIconsView.as_view(),name='icons-materialdesign'), # Icons-Materialdesign
    path('icons/dripicons-icons',views.DripiconsIconsView.as_view(),name='icons-dripicons'), # Icons-Dripicons
    path('icons/fontawesome-icons',views.FontawesomeIconsView.as_view(),name='icons-fontawesome'), # Icons-Fontawesome
    # Maps
    path('maps/google-maps',views.GoogleMapsView.as_view(),name='maps-google'), # Maps-Google
    path('maps/vector-maps',views.VectorMapsView.as_view(),name='maps-vector'), # Maps-Vectors

]