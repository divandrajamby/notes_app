import 'package:flutter/material.dart';
import 'package:notesapp/helpers/helpers.dart';
import 'package:notesapp/models/note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _getNotes();
  }

  Future<void> _getNotes() async {
    //get notes
    List<Note> notes = await getNote();
    // print(notes);
    setState(() {
      _notes = notes;
    });
  }

  Future<void> _onLogout() async {
    removeUser();
    Navigator.pushReplacementNamed(context, '/login');
  }

  Future<void> _deleteNotes(int index) async {
    //delete notes
    Future<List<Note>> newNotes = deleteNotes(index);
    List<Note> notes = await newNotes;
    setState(() {
      _notes = notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List Notes'),
          // leading: Container(),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Konfirmasi'),
                  content: const Text('Apakah Anda yakin ingin logout?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => _onLogout(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add-notes').then((value) {
              _getNotes();
            });
          },
          child: const Icon(Icons.note_add),
        ),
        body: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            return Card(
              // color: Colors.white,
              // elevation: 2.0,
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.note),
                ),
                title: Text(
                  _notes[index].judul!,
                ),
                subtitle: Text(
                  _notes[index].isi!,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      child: const Icon(Icons.edit),
                      onTap: () {
                        Navigator.pushNamed(context, '/edit-notes', arguments: {
                          'index': index,
                          'note': _notes[index],
                        }).then((value) {
                          _getNotes();
                        });
                      },
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      child: const Icon(Icons.delete),
                      onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Konfirmasi'),
                          content: const Text(
                              'Apakah Anda yakin ingin menghapus notes ini?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                _deleteNotes(index);
                                Navigator.pop(context, 'OK');
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
