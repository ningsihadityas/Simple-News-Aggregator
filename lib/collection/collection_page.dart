import 'package:flutter/material.dart';
import 'package:qlipper/collection/sqflite/db_helper.dart';
import 'package:qlipper/collection/collection_model.dart';

class CollectionPage extends StatefulWidget {
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final _formKey = GlobalKey<FormState>();
  final _ctrlName = TextEditingController();

  Collection _collection = Collection();
  List<Collection> _collections = [];

  DBHelper _dbHelper;

  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DBHelper.instance;
    });
    _refreshCollectionList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Color(0xffE4ECF9),
      extendBodyBehindAppBar: true,
      appBar: new AppBar(
        elevation: 0.0,
        //backgroundColor: Color(0xffE4ECF9),
        iconTheme: IconThemeData(color: Color(0xff081B37)),
        title: Center(
            child: new Text(
          'Qlipper Collection'.toUpperCase(),
          style: TextStyle(color: Color(0xff081B37)),
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          )
        ],
      ),
      body: new Container(
          child: _collections.length == 0
              ? Align(
                  alignment: Alignment.center,
                  child: Center(
                      child: Text(
                    'There is no collection folder',
                    textAlign: TextAlign.center,
                  )),
                )
              : Column(
                  verticalDirection: VerticalDirection.down,
                  children: [
                    Expanded(
                        child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: _list(),
                    )),
                  ],
                )),
    );
  }

  _form() => Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _ctrlName,
                decoration: InputDecoration(labelText: 'Collection Name'),
                onSaved: (value) => setState(() => _collection.name = value),
                validator: (value) =>
                    (value.length == 0 ? 'This field is required' : null),
              ),
              Container(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xff081B37)),
                child: Text('Add'),
                onPressed: () {
                  _onSubmit();
                },
              ))
            ],
          ),
        ),
      );

  _refreshCollectionList() async {
    List<Collection> x = await _dbHelper.fetchCollections();
    setState(() {
      _collections = x;
    });
  }

  _onSubmit() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      if (_collection.id == null)
        await _dbHelper.insertCollection(_collection);
      else
        await _dbHelper.updateCollection(_collection);

      _refreshCollectionList();
      _resetform();
    }
  }

  _resetform() {
    setState(() {
      _formKey.currentState.reset();
      _ctrlName.clear();
      _collection.id = null;
    });
  }

  _list() => ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0),
                ),
                child: ListTile(
                  leading: Icon(Icons.folder, color: Color(0xff081B37)),
                  title: Text(
                    _collections[index].name,
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    setState(() {
                      _collection = _collections[index];
                      _ctrlName.text = _collections[index].name;
                    });
                    // Navigator.of(context).pop();
                  },
                  trailing: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      await _dbHelper.deleteCollection(_collections[index].id);

                      await _refreshCollectionList();
                    },
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: _collections.length,
      );

  _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Add New Collection'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_form()],
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          // textColor: Theme.of(context).primaryColor,
          child: Container(
              padding: EdgeInsets.all(11),
              child: const Text(
                'Close',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )),
        ),
      ],
    );
  }
}
