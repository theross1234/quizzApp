// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: const Text('Home Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const AboutScreen()),
//             );
//           },
//           child: const Text('Change Screen'),
//         ),
//       ),
//       drawer: const Drawer(
//         child: Center(
//           child: Text('Drawer Content'),
//         ),
//       ),
//     );
//   }
// }
//
// class AboutScreen extends StatelessWidget {
//   const AboutScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: const Text('About Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Back to Home Screen'),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// // Task Model
// class Task {
//   final String title;
//   Task(this.title);
// }
//
// // Task Provider
// class TaskProvider extends ChangeNotifier {
//   List<Task> _tasks = [];
//
//   List<Task> get tasks => _tasks;
//
//   void addTask(String title) {
//     _tasks.add(Task(title));
//     notifyListeners();
//   }
//
//   void removeTask(Task task) {
//     _tasks.remove(task);
//     notifyListeners();
//   }
// }
//
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => TaskProvider(),
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TodoListScreen(),
//     );
//   }
// }
//
// class TodoListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final taskProvider = Provider.of<TaskProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(title: Text("To-Do List")),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: taskProvider.tasks.length,
//               itemBuilder: (context, index) {
//                 final task = taskProvider.tasks[index];
//                 return ListTile(
//                   title: Text(task.title),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {
//                       taskProvider.removeTask(task);
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onSubmitted: (value) {
//                 if (value.isNotEmpty) {
//                   taskProvider.addTask(value);
//                 }
//               },
//               decoration: InputDecoration(
//                 labelText: "Add Task",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// // Product Model
// class Product {
//   final String name;
//   final double price;
//   Product(this.name, this.price);
// }
//
// // Cart Provider
// class CartProvider extends ChangeNotifier {
//   List<Product> _cart = [];
//
//   List<Product> get cart => _cart;
//
//   double get totalPrice => _cart.fold(0, (sum, item) => sum + item.price);
//
//   void addToCart(Product product) {
//     _cart.add(product);
//     notifyListeners();
//   }
//
//   void removeFromCart(Product product) {
//     _cart.remove(product);
//     notifyListeners();
//   }
// }
//
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ProductListScreen(),
//     );
//   }
// }
//
// class ProductListScreen extends StatelessWidget {
//   final List<Product> products = [
//     Product("Apple", 2.0),
//     Product("Banana", 1.5),
//     Product("Orange", 2.5),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shopping Cart"),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//               child: Selector<CartProvider, double>(
//                 selector: (_, provider) => provider.totalPrice,
//                 builder: (_, total, __) => Text("Total: \$${total.toStringAsFixed(2)}"),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           final product = products[index];
//           return ListTile(
//             title: Text(product.name),
//             subtitle: Text("\$${product.price}"),
//             trailing: IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () {
//                 cartProvider.addToCart(product);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:fireship/home/home.dart';
import 'package:fireship/routes.dart';
import 'package:fireship/services/firestore.dart';
import 'package:fireship/services/models.dart';
import 'package:fireship/shared/bottom_nav.dart';
import 'package:fireship/shared/loader.dart';
import 'package:fireship/themes.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('error');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider(
            create: (_) => FirestoreService().streamReport(),
            initialData: Report(),
            child: MaterialApp(
              debugShowCheckedModeBanner: true,
              routes: appRoutes,
              theme: appTheme,
              // home: HomeScreen(),
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const LoadingScreen();
      },
    );
  }
}
