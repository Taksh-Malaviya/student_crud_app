import 'dart:io';

import 'package:exam_app/examapp/class/class.dart';
import 'package:exam_app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';

import 'Screen/view/HomePage/Homepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idcontrrol = TextEditingController();
  TextEditingController stdcontrrol = TextEditingController();
  File? myImage;

  ImagePicker picker = ImagePicker();
  Future<void> pickImage({required ImageSource source}) async {
    XFile? xFile = await picker.pickImage(
      source: source,
    );
    if (xFile != null) {
      myImage = File(xFile.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Student List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 80.w,
                    backgroundImage: (myImage != null)
                        ? FileImage(myImage!)
                        : const NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQLHZh0aF5Og2DF4G19yPVx_QGjXfaBByFZA&s")
                            as ImageProvider,
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Pick Image"),
                          titleTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 28.sp,
                          ),
                          backgroundColor: Colors.blueAccent,
                          content: Row(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () async {
                                  await pickImage(
                                    source: ImageSource.camera,
                                  ).then((val) {
                                    Navigator.pop(context);
                                  });

                                  setState(() {});
                                },
                                label: Text("Camera"),
                                icon: Icon(CupertinoIcons.camera),
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              ElevatedButton.icon(
                                onPressed: () async {
                                  await pickImage(source: ImageSource.gallery)
                                      .then(
                                    (val) => Navigator.pop(context),
                                  );
                                  setState(() {});
                                },
                                label: Text("Gallery"),
                                icon: Icon(Icons.photo),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.add),
                  )
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                },
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: 'Student Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter id';
                  }
                },
                controller: idcontrrol,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(
                    hintText: 'student id',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter std';
                  }
                },
                controller: stdcontrrol,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(
                    hintText: 'student std',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      int id = int.parse(idcontrrol.text.trim());
                      int std = int.parse(stdcontrrol.text.trim());

                      Contact contact = Contact(
                        image: myImage!,
                        name: name,
                        id: id,
                        std: std,
                      );

                      setState(() {
                        allStudent.add(contact);
                      });
                    },
                    child: const Text('Save'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        String name = nameController.text.trim();
                        int id = int.parse(idcontrrol.text.trim());
                        int std = int.parse(stdcontrrol.text.trim());
                        if (name.isNotEmpty && id > 0 && std > 0) {
                          setState(() {
                            nameController.text = '';
                            idcontrrol.text = '';
                            stdcontrrol.text = '';
                            // allStudent[selectedIndex].name = name;
                            // allStudent[selectedIndex].contact = id;
                          });
                        }
                      },
                      child: const Text('Update')),
                ],
              ),
              const SizedBox(height: 10),
              allStudent.isEmpty
                  ? const Text(
                      'No Contact yet..',
                      style: TextStyle(fontSize: 22),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: allStudent.length,
                        itemBuilder: (context, index) => getRow(index),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.detail,
            arguments: allStudent[index],
          );
        },
        leading: CircleAvatar(
          backgroundImage: FileImage(allStudent[index].image),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              allStudent[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            // Text(allStudent[index].Contact.toString()),
          ],
        ),
        trailing: SizedBox(
          width: 60.w,
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    nameController.text = allStudent[index].name;
                    idcontrrol.text = allStudent[index].id.toString();
                    stdcontrrol.text = allStudent[index].std.toString();
                    setState(() {});
                  },
                  child: const Icon(Icons.edit)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    allStudent.removeAt(index);
                  });
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
