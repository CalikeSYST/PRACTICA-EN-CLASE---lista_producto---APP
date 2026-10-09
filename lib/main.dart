import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Declaración de la clase Producto
class Producto {
  final String id;
  final String nombre;
  final String descripcion;
  final double precio;
  final String categoria;

// Constructor
  const Producto({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.categoria,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Productos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
      home: const HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Menú Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.store, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 20),
            const Text(
              'Bienvenido a CarTeK',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('selecciona el catálogo de productos.'),
            const SizedBox(height: 30),
            
            // Botón
            ElevatedButton.icon(
              onPressed: () {

                // REDIRECCIONA: Navega hacia la pantalla del listado de productos
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListaProductosScreen(title: 'Catálogo de Productos'),
                  ),
                );
              },
              icon: const Icon(Icons.list_alt),
              label: const Text('Ver Lista de Productos'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ListaProductosScreen extends StatelessWidget {
  const ListaProductosScreen({super.key, required this.title});

  final String title;

  // Listado de 10 productos iniciales
  final List<Producto> productos = const [
    Producto(id: '1', nombre: 'Laptop Gamer', descripcion: 'Procesador i7, 16GB RAM, SSD 512GB', precio: 1250.00, categoria: 'Tecnología'),
    Producto(id: '2', nombre: 'Mouse Inalámbrico', descripcion: 'Óptico ergonómico con batería recargable', precio: 25.50, categoria: 'Accesorios'),
    Producto(id: '3', nombre: 'Teclado Mecánico', descripcion: 'RGB con switches mecánicos red', precio: 65.00, categoria: 'Accesorios'),
    Producto(id: '4', nombre: 'Monitor 24 pulgadas', descripcion: 'Resolución Full HD IPS 100Hz', precio: 180.00, categoria: 'Tecnología'),
    Producto(id: '5', nombre: 'Audífonos Bluetooth', descripcion: 'Cancelación de ruido activa y sonido Hi-Fi', precio: 85.00, categoria: 'Audio'),
    Producto(id: '6', nombre: 'Silla Ergonómica', descripcion: 'Ajustable con soporte lumbar para oficina', precio: 210.00, categoria: 'Muebles'),
    Producto(id: '7', nombre: 'Smartphone X', descripcion: 'Pantalla AMOLED 6.5", 128GB ROM', precio: 650.00, categoria: 'Telefonía'),
    Producto(id: '8', nombre: 'Tablet Pro', descripcion: 'Pantalla 11", 64GB, compatible con lápiz', precio: 320.00, categoria: 'Tecnología'),
    Producto(id: '9', nombre: 'Impresora Multifuncional', descripcion: 'Sistema continuo de tinta a color', precio: 195.00, categoria: 'Oficina'),
    Producto(id: '10', nombre: 'Disco Duro Externo 1TB', descripcion: 'USB 3.0 portátil de alta velocidad', precio: 60.00, categoria: 'Almacenamiento'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  producto.id,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                producto.nombre,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(producto.descripcion),
                  const SizedBox(height: 4),
                  Text(
                    'Categoría: ${producto.categoria}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              trailing: Text(
                '\$${producto.precio.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}