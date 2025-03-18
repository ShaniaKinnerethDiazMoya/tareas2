const { productos } = require("../database/db"); //! viene dentro de un objeto el productos por eso entre llaves, con require exportas y poner direccion de carpeta

class ProductosService{
    //! crear funciones
    getAll(){
        return productos;
    }

    getOneById(id){
        const producto = productos.filter((pt)=>pt.id==id); //! filtra el producto, 3 iguales 
        return producto;
    }

    create(nombre, precio, stock){
        const nuevoProducto = {
            //*nombre: nombre,
            //*precio: precio,
            //*stock: stock,
            nombre, precio, stock
        };
        productos.push(nuevoProducto);//! siempre debe de regresar algo 
        return nuevoProducto;
    }

    update(id, objeto) {
        const index = productos.findIndex((pt) => pt.id == id);
        if (index === -1) return null;
        
        productos[index] = { ...productos[index], ...objeto };
        return productos[index];
    }

    delete(id) {
        const index = productos.findIndex((pt) => pt.id == id);
        if (index === -1) return null;
        
        const productoEliminado = productos.splice(index, 1);
        return productoEliminado[0];
    }
}

module.exports={ProductosService:new ProductosService()} //! exportar la clase para utilizarla aparte 