import 'package:favorite_items_selector/providers/favorite_item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavItemScreen extends StatefulWidget {
  const FavItemScreen({super.key});

  @override
  State<FavItemScreen> createState() => _FavItemScreenState();
}

class _FavItemScreenState extends State<FavItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Favorite Items'),
      ),
      body: Column(
        children: [
          Consumer<FavoriteItemProvider>(
            builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                    itemCount: value.selectedItem.length,
                    itemBuilder: ((context, index) {
                      final selectedItem = value.selectedItem[index];
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        title: Text('Selected Item Number $selectedItem '),
                        trailing: value.selectedItem.contains(index)
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border_outlined),
                      );
                    })),
              );
            },
          )
        ],
      ),
    );
  }
}
