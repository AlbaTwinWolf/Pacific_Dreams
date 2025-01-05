from django.shortcuts import render, redirect
from .models import Cliente, Direccion
from .forms import ClienteForm, DireccionForm

def index(request):
    return render(request, 'clientes/index.html')

def clientes_list(request):
    clientes = Cliente.objects.all()
    return render(request, 'clientes/clientes_list.html', {'clientes': clientes})

def direcciones_list(request):
    direcciones = Direccion.objects.all()
    return render(request, 'clientes/direcciones_list.html', {'direcciones': direcciones})

def registrar_cliente(request):
    if request.method == 'POST':
        form = ClienteForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('clientes_list')
    else:
        form = ClienteForm()
    return render(request, 'clientes/registrar_cliente.html', {'form': form})
def registrar_direccion(request, cliente_id):
    cliente = Cliente.objects.get(id=cliente_id)
    if request.method == 'POST':
        form = DireccionForm(request.POST)
        if form.is_valid():
            direccion = form.save(commit=False)
            direccion.cliente = cliente
            direccion.save()
            return redirect('clientes_list')
    else:
        form = DireccionForm()
    return render(request, 'clientes/registrar_direccion.html', {'form': form, 'cliente': cliente})

def contacto(request):
    return render(request, 'clientes/contacto.html')

def experiencia(request):
    return render(request, 'clientes/experiencia.html')

def nosotros(request):
    return render(request, 'clientes/nosotros.html')