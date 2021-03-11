import 'package:bulx_task/screens/details.dart';
import 'package:flutter/material.dart';


class SizeDrawer extends StatefulWidget {

  final Function onClick;

  const SizeDrawer({Key key, this.onClick}) : super(key: key);

  @override
  _SizeDrawerState createState() => _SizeDrawerState();
}

class _SizeDrawerState extends State<SizeDrawer> {

  List <String> sizes = ["Small","Medium","Large","X-large","2X-large","3X-large"];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: ListTile(
                leading: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close,color: Colors.white.withOpacity(.7),size: 30,)),
                title: Text(
                  'Select A Size',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white.withOpacity(.7), fontSize: 25),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: sizes.length,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(selectedSize==sizes[index]?Icons.radio_button_checked
                          :Icons.radio_button_off,size: 30,color: Colors.white,),
                      title: Text(sizes[index],style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold, color: Colors.white.withOpacity(.7)
                      ),),
                      onTap: (){


                        setState(() {
                          selectedSize = sizes[index];
                        });

                        widget.onClick();

                        print(selectedSize);

                        Navigator.pop(context);
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      child: Divider(color: Colors.grey,thickness: 2,),
                    ),

                  ],
                );
              })
        ],
      ),
    );
  }
}