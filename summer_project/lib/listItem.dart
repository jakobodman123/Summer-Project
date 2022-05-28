import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListItem extends StatelessWidget {
  static const colorDarkRed = Color(0xffb66a6b);
  final int quantity;
  final String name;
  final String type;
  final VoidCallback onTapDelete;
  final VoidCallback onTapUpdate;

  ListItem(
      this.quantity, this.name, this.type, this.onTapDelete, this.onTapUpdate);

  Widget getIcon() {
    if (type == "Fruit") {
      return const Icon(
        Icons.apple,
        color: Colors.white,
      );
    } else if (type == "Meat") {
      return const Icon(
        Icons.room_service,
        color: Colors.white,
      );
    } else if (type == "Cleaning") {
      return const Icon(
        Icons.dry_cleaning,
        color: Colors.white,
      );
    } else if (type == "Snacks") {
      return const Icon(
        Icons.no_food,
        color: Colors.white,
      );
    } else if (type == "Office") {
      return const Icon(
        Icons.desktop_windows,
        color: Colors.white,
      );
    }
    return const Icon(
      Icons.shopping_cart,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  height: 80.0,
                  width: 80.0,
                  child: getIcon(),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      " " + name,
                      style: const TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      //width: 200.0,
                      child: Text(
                        " " + type,
                        style: TextStyle(fontSize: 17.0, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.format_list_numbered,
                        size: 20.0,
                        color: Colors.black,
                      ),
                      Text(quantity.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                          ))
                    ],
                  ),
                ),
              ),
              InkWell(
                /*
                onTap: () {
                  //Deletefunktion här
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text("Confirm"),
                      content: const Text("Do you want to delete the item?"),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () async {
                              ApiCalls function = ApiCalls();
                              try {
                                await function.removeItem(name);
                              } catch (e) {
                                //print('There is an exception.');
                              }

                              Navigator.pop(context, 'OK');
                            },
                            child: const Text('OK')),
                        TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel')),
                      ],
                    ),
                  );
                },
                */
                onTap: onTapDelete,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.delete,
                    size: 30.0,
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: onTapUpdate,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.update,
                    size: 30.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
