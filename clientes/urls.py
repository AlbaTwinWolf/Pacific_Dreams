from django.urls import path
from . import views

urlpatterns = [
    path('registrar/', views.registrar_cliente, name='registrar_cliente'),
    path('', views.index, name='index'),
    path('clientes/', views.clientes_list, name='clientes_list'),
    path('direcciones/', views.direcciones_list, name='direcciones_list'),
    path('contacto/', views.contacto, name='contacto'),
    path('registrar_direccion/<int:cliente_id>/', views.registrar_direccion, name='registrar_direccion'),
    path('experiencia/', views.experiencia, name='experiencia'),
    path('nosotros/', views.nosotros, name='nosotros'),
]