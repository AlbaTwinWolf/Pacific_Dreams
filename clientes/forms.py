from django import forms
from .models import Cliente, Direccion

class ClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = ['nombre', 'apellido', 'email', 'telefono']

class DireccionForm(forms.ModelForm):
    class Meta:
        model = Direccion
        fields = ['direccion', 'ciudad', 'estado', 'codigo_postal', 'pais']

class ContactoForm(forms.Form):
    nombre = forms.CharField(max_length=100)
    email = forms.EmailField()
    mensaje = forms.CharField(widget=forms.Textarea)