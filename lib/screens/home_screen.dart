import 'package:favorite_items_selector/providers/favorite_item_provider.dart';
import 'package:favorite_items_selector/screens/favorite_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Favorite Items Selector'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavItemScreen()));
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          Consumer<FavoriteItemProvider>(
            builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        title: Text('Item Number $index'),
                        trailing: value.selectedItem.contains(index)
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border_outlined),
                      );
                    }),
              );
            },
          )
        ],
      ),
    );
  }
}
