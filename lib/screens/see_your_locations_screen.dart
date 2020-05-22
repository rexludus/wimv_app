import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/helper_db.dart';
import '../providers/user_inputs.dart';
import './location_detail_screen.dart';

class SeeYourLocationsScreen extends StatefulWidget {
  @override
  _SeeYourLocationsScreenState createState() => _SeeYourLocationsScreenState();
}

class _SeeYourLocationsScreenState extends State<SeeYourLocationsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<UserInputs>(context, listen: false).fetchAndSetPlaces(),
      builder: (ctx, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<UserInputs>(
              child: Center(
                child: const Text("got no records yet, start adding some!"),
              ),
              builder: (ctx, userInputs, ch) => userInputs.items.length <= 0
                  ? ch
                  : ListView.builder(
                      itemCount: userInputs.items.length,
                      itemBuilder: (ctx, i) {
                        final item = userInputs.items[i];

                        return Dismissible(
                          key: Key(item.title),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              HelperDB.delete('user_records', item.id);
                              // print('deleted row $item.id');
                              setState(() {
                                userInputs.items.removeAt(i);
                              });
                              var _nameHolder = item.title;
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("$_nameHolder deleted.")));
                            }
                            else{
                              return ;
                            }
                          }, //direction

                          background: Container(
                            alignment: AlignmentDirectional.centerEnd,
                            color: Colors.red[300],
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                              child: Icon(
                                Icons.delete_forever,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: FileImage(
                                userInputs.items[i].image,
                              ),
                            ),
                            title: Text(userInputs.items[i].title),
                            subtitle:
                                Text(userInputs.items[i].location.address),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                LocationDetailScreen.routeName,
                                arguments: userInputs.items[i].id,
                              );
                            }, // go to location detail page...
                          ),
                        );
                      } //itemBuilder

                      ),
            ),
    );
  }
}
