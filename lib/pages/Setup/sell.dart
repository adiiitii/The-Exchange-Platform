import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';




class UploadProductPage extends StatefulWidget
{
  State<StatefulWidget> createState()
  {
    return _UploadProductPageState();
  }
}

class Category {
  int id;
  String name;

  Category(this.id, this.name);

  static List<Category> getCategories() {
    return <Category>[
      Category(1,'Electronic Gadgets'),
      Category(2,'Buckets and other things'),
      Category(3,'Mattresses and Stuff'),
      Category(4,'Others'),
    ];
  }
}

class _UploadProductPageState extends State<UploadProductPage>
{
  File sampleImage;
  String _myvalue;
   String _myvaluee;
    String _myvalueee;
    String _myvalueeee;
  String url;
  final formKey = new GlobalKey<FormState>();


List<Category> _categories = Category.getCategories();
List<DropdownMenuItem<Category>> _dropdownMenuItems;
Category _selectedCategory;



Future getImage() async
{
  var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

  setState(()
  {
    sampleImage = tempImage;
  });
}

bool validateAndSave()
{
  final form = formKey.currentState;

  if(form.validate())
  {
    form.save();
    return true;
  }
  else
  {
    return false;
  }
}

void uploadProductImage() async
{
  if(validateAndSave())
  {
    final StorageReference postImageRef = FirebaseStorage.instance.ref().child("Post Images");

    var timeKey = new DateTime.now();

    final StorageUploadTask uploadTask = postImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);

    var ImageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

    url= ImageUrl.toString();

    print("Image Url =" + url);

    saveToDatabase(url);
  }
}

void saveToDatabase(url)
{
  var dbtimeKey = new DateTime.now();
  var formatDate = new DateFormat('MMM d, yyyy');
  var formatTime = new DateFormat('EEEE, hh:mm aaa');

  String date = formatDate.format(dbtimeKey);
  String time = formatTime.format(dbtimeKey);

  DatabaseReference ref = FirebaseDatabase.instance.reference();

  var data = 
  {
    "Image": url,
    "description": _myvalue,
    "price": _myvaluee,
    "seller name and contact info": _myvalueee,
    "category": _selectedCategory.name,
    "date": date,
    "time": time,
  };
  
  ref.child("Posts").push().set(data);
}







void initState() {
  _dropdownMenuItems = buildDropdownMenuItems(_categories);
  _selectedCategory = _dropdownMenuItems[0].value;
  super.initState();
}

List<DropdownMenuItem<Category>> buildDropdownMenuItems(List categories){
List<DropdownMenuItem<Category>> items = List();
for (Category category in categories){
  items.add(
    DropdownMenuItem(
      value: category,
      child: Text(category.name),
       ),
       );
}
return items;
}



onchangeDropdownItem(Category selectedCategory){
  setState(() {
    _selectedCategory = selectedCategory;
  });
}
@override
Widget build(BuildContext context)
{
  return new Scaffold
  (
    appBar: new AppBar
    (
      title: new Text("Upload Image"),
      centerTitle: true,
    ),
    backgroundColor: Colors.black45,

    body:new Center
    (
      child: sampleImage == null ? Text("Select an Image") : enableUpload(),
    ),

    floatingActionButton: new FloatingActionButton
    (
      tooltip: 'Add Image',
      child: new Icon(Icons.add_a_photo),
      onPressed: getImage,
    ),

  );
}

 

Widget enableUpload()
{
  return Container
  (
    
    child:new Form
    (
      key: formKey,
      child: SingleChildScrollView(
          child: Theme(
            data: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.lightBlue,
                inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                        color: Colors.lightBlue,fontSize: 20.0
                    )
                )
            ),
            child: Container(
              padding: const EdgeInsets.only(
                left: 40,
                top: 0,
                right: 40,
                bottom: 0,
              ),
              child: Column
                (
                children: <Widget>
                [
                  Image.file(sampleImage, height: 250.0, width: 550.0,),


                  Text("Select a category"),
                  DropdownButton(
                    value: _selectedCategory,
                    items: _dropdownMenuItems,
                    onChanged: onchangeDropdownItem,

                  ),


                  TextFormField
                    (
                    decoration: new InputDecoration(labelText: 'Description '),

                    validator: (value)
                    {
                      return value.isEmpty ? 'Product Description  Is Required' : null;
                    },

                    onSaved: (value)
                    {
                      return _myvalue = value;
                    },
                  ),


                  TextFormField
                    (
                    decoration: new InputDecoration(labelText: 'Price'),

                    validator: (value)
                    {
                      return value.isEmpty ? 'Product Price Is Required' : null;
                    },

                    onSaved: (value)
                    {
                      return _myvaluee = value;
                    },
                  ),


                  TextFormField
                    (
                    decoration: new InputDecoration(labelText: 'Seller Name and contact information'),

                    validator: (value)
                    {
                      return value.isEmpty ? 'Name of Seller Is Required' : null;
                    },

                    onSaved: (value)
                    {
                      return _myvalueee = value;
                    },
                  ),


                  SizedBox(height: 15.0,),

                  RaisedButton
                    (
                    elevation: 10.0,
                    child: Text("Add a new post"),
                    textColor: Colors.white,
                    color: Colors.lightBlue,

                    onPressed: uploadProductImage,
                  )

                ],

              ),
            ),
          ),
        ),

      
    ),

  );
}
}