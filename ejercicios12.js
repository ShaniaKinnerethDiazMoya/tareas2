def es_palindromo(cadena):
    cadena = cadena.replace(" ", "").lower()  # Quitar espacios y pasar a minúsculas
    return cadena == cadena[::-1]

# Ejemplo de uso
print(es_palindromo("anita lava la tina"))  # True
