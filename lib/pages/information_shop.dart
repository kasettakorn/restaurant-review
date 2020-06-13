import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/utility/my_style.dart';

class AddInfoShop extends StatefulWidget {
  @override
  _AddInfoShopState createState() => _AddInfoShopState();
}

class _AddInfoShopState extends State<AddInfoShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Information shop"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyStyle().sizedBox(),
            Form("Shop name", Icon(Icons.account_box)),
            MyStyle().sizedBox(),
            Form("Shop address", Icon(Icons.home)),
            MyStyle().sizedBox(),
            Form("Shop tel.", Icon(Icons.phone)),
            groupImages(),
            MyStyle().sizedBox(),
            showGoogleMap(),
            MyStyle().sizedBox(),
            saveButton()
          ],
        ),
      ),
    );
  }

  Widget saveButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton.icon(
        color: MyStyle().primaryColor,
        onPressed: () {},
        icon: Icon(
          Icons.save,
          color: Colors.white,
        ),
        label: Text(
          "Save information",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Container showGoogleMap() {
    LatLng latLng = LatLng(12.663299, 100.952924);
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 16);

    return Container(
      height: 300,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
      ),
    );
  }

  Row groupImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.add_a_photo,
              size: 36,
            ),
            onPressed: () {}),
        Container(
          width: 250.0,
          child: Image.asset('images/shopImage.png'),
        ),
        IconButton(
            icon: Icon(
              Icons.add_photo_alternate,
              size: 36,
            ),
            onPressed: () {}),
      ],
    );
  }

  Widget Form(labelText, prefixIcon) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 250,
              child: TextField(
                keyboardType: (labelText == "Shop tel.")
                    ? TextInputType.number
                    : TextInputType.text,
                decoration: InputDecoration(
                  labelText: labelText,
                  prefixIcon: prefixIcon,
                  border: OutlineInputBorder(),
                ),
              )),
        ],
      );
}
