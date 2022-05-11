from django.urls import path
from layouts import views

urlpatterns = [
    # Vertical Layouts
    path('vertical/light-sidebar',views.LightSidebarView.as_view(),name="layouts-light-sidebar"),# Light Sidebar
    path('vertical/compact-sidebar',views.CompactSidebarView.as_view(),name="layouts-compact-sidebar"),# Compact Sidebar
    path('vertical/icon-sidebar',views.IconSidebarView.as_view(),name="layouts-icon-sidebar"),# Icon Sidebar
    path('vertical/boxed-layout',views.BoxedLayoutView.as_view(),name="layouts-boxed"),# Boxed Layout
    path('vertical/preloader-layout',views.PreloaderLayoutView.as_view(),name="layouts-preloader"),# Preloader Layout
    path('vertical/colored-sidebar',views.ColoredSidebarView.as_view(),name="layouts-colored-sidebar"),# Colored Sidebar
    # path('vertical/Vertical-Scrollable',views.VerticalScrollableView.as_view(),name="layouts-scrollable"),# Vertical Scrollable
    
    # Horizontal Layouts
    path('horizontal/horizontal-layout',views.HorizontalView.as_view(),name="layouts-horizontal"),# Horizontal Layout
    path('horizontal/topbar-light',views.TopbarLightView.as_view(),name="layouts-hori-topbar-light"),# Topbar Light
    path('horizontal/boxed-width',views.BoxedWidthView.as_view(),name="layouts-hori-boxed-width"),# Boxed Width
    path('horizontal/horizontal-preloader-layout',views.HorizontalPreloaderLayoutView.as_view(),name="layouts-hori-preloader"),# Preloader Layout
    path('horizontal/colored-header',views.ColoredHeaderView.as_view(),name="layouts-colored-header"),# Colored Header
    # path('horizontal/Horizontal-Scrollable',views.HorizontalScrollableView.as_view(),name="layouts-hori-scrollable"),# Horizontal Scrollable
]


