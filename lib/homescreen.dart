import 'package:api_app_flutter/Model/get_model.dart';
import 'package:flutter/material.dart';

import 'Services/get_services.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<CommandsModel> commendsModel = [];
  getComments() {
    GetApiServices().getCommentsModel().then((value) {
      setState(() {
        commendsModel = value!;
      });
    });
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Center(child: Text("GET API DATA fetch")),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: commendsModel.length,
          itemBuilder: (context, index) {
            final apidata = commendsModel[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 3,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Text(
                          apidata.id.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.75,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              apidata.name.toString(),
                              maxLines: 1,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              apidata.email.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              apidata.body.toString(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
