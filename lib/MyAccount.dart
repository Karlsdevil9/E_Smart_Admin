import 'package:flutter/material.dart';
import './EditProfile.dart';

Map accDetails = {
  'Name': "Rahul",
  "House no": "E-2/90C",
  'Road Name': "Gali number-10",
  'City': 'Laxmi Nagar',
  'State': "Delhi",
  'Pincode': '110096',
  'Landmark': 'Ram Mandir',
  'Phone Number': '1234567890'
};

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esmart"),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.28,
        child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${accDetails['Name']}\n",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${accDetails['House no']}" +
                      ", ${accDetails['Road Name']}, " +
                      "${accDetails['Landmark']}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                    "${accDetails['City']}" +
                        ", ${accDetails['State']}" +
                        "-${accDetails['Pincode']}\n",
                    style: TextStyle(
                      fontSize: 15,
                    )),
                Text("${accDetails['Phone Number']}\n",
                    style: TextStyle(
                      fontSize: 15,
                    )),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext ctx) => EditProfile()));
                    },
                    child: Container(
                      width: 110,
                      child: Row(
                        children: [
                          Text(
                            "Edit Profile ",
                            style: TextStyle(fontSize: 15),
                          ),
                          Icon(Icons.edit)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
