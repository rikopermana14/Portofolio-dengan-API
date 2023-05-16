import 'package:flutter/material.dart';
import 'package:utp/models/maroon.dart';
import 'package:utp/services/maroonservice.dart';

class MaroonScreen extends StatefulWidget {
  const MaroonScreen({super.key});

  @override
  State<MaroonScreen> createState() => _MaroonScreenState();
}

class _MaroonScreenState extends State<MaroonScreen> {
  List<Maroon> _items = [];
  Future<void> _fetchItems() async {
    try {
      final items = await MaroonService.readItems();
      setState(() {
        _items = items;
      });
    } catch (e) {
      // print('Error fetching items: $e');
    }
  }

  Future<void> _addItem(Maroon item) async {
    try {
      await MaroonService.createItem(item);
      await _fetchItems();
    } catch (e) {
      // print('Error creating item: $e');
    }
  }

  Future<void> _updateItem(Maroon item) async {
    try {
      await MaroonService.updateItem(
          item.id, item.message, item.name, item.createdAt, item.updatedAt);
      await _fetchItems();
    } catch (e) {
      // print('Error creating item: $e');
    }
  }

  Future<void> _deleteItem(Maroon item) async {
    try {
      await MaroonService.deleteItem(item.id);
      setState(() {
        _items.remove(item);
      });
    } catch (e) {
      // print('Error deleting item: $e');
    }
  }

  Future<void> _showDialog(BuildContext context, Maroon? item,
      {bool delete = false}) {
    final nameController =
        TextEditingController(text: item != null ? item.name : "");

    final messageController = TextEditingController(
        text: item != null
            ? item.message
            : "Selamat telah mengejakan TA Mobile!");
    final createdAtController = TextEditingController(
        text: item != null ? item.createdAt.toIso8601String() : "");
    final updatedAtController = TextEditingController(
        text: item != null ? item.updatedAt.toIso8601String() : "");

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return delete
            ? AlertDialog(
                title: const Text("Hapus data"),
                content: const Text(
                    'Data ini akan terhapus baik dari aplikasi maupun web service API. Yakin ingin menghapus?'),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Batal'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Hapus'),
                    onPressed: () {
                      _deleteItem(item!);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Future.delayed(const Duration(milliseconds: 500),
                          () => Navigator.of(context).pop());
                    },
                  ),
                ],
              )
            : AlertDialog(
                title: item != null
                    ? const Text('Ubah data')
                    : const Text('Tambah data'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'name',
                        ),
                      ),
                      TextField(
                        controller: messageController,
                        decoration: const InputDecoration(
                          labelText: 'message',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Batal'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Simpan'),
                    onPressed: () {
                      final name = nameController.text;
                      final message = messageController.text;
                      final createdAt =
                          DateTime.tryParse(createdAtController.text);
                      final updatedAt =
                          DateTime.tryParse(updatedAtController.text);

                      item != null
                          ? _updateItem(Maroon(
                              id: item.id,
                              name: name,
                              message: item.message,
                              createdAt: item.createdAt,
                              updatedAt: item.updatedAt))
                          : _addItem(Maroon(
                              id: 1,
                              name: name,
                              message: 'Selamat telah mengejakan TA Mobile!',
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now()));

                      nameController.clear();

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Future.delayed(const Duration(milliseconds: 500),
                          () => Navigator.of(context).pop());
                    },
                  ),
                ],
              );
      },
    );
  }

  final snackBar = const SnackBar(
    content: Text('Yay! Berhasil~'),
  );

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(115, 80, 74, 74),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Halaman Maroon"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Center(child: Text('Pengembang')),
                    content: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ListView(
                          children: [
                            ListTile(
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.person),
                                ],
                              ),
                              title: const Text("Riko Permana"),
                              subtitle: const Text("Developer"),
                            ),
                          ],
                        )),
                    actions: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('Tutup'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                }),
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: _items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.blue),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.list_alt_sharp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  title: Text(
                    item.name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'message: ${item.message}',
                    style: TextStyle(color: Colors.white),
                  ),
                  onLongPress: () => _showDialog(context, item, delete: true),
                  onTap: () => _showDialog(context, item),
                );
              },
            ),
    );
  }
}
