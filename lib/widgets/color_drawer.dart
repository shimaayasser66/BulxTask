import 'package:bulx_task/screens/details.dart';
import 'package:flutter/material.dart';





class ColorDrawer extends StatefulWidget {

  final Function onClick;

  const ColorDrawer({Key key, this.onClick}) : super(key: key);

  @override
  _ColorDrawerState createState() => _ColorDrawerState();
}

class _ColorDrawerState extends State<ColorDrawer> {
  List <String> colors = ["Red", "Blue", "Orange","Purple","Grey"];

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
                  'Select A Color',
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
              itemCount: colors.length,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(selectedColor==colors[index]?Icons.radio_button_checked
                          :Icons.radio_button_off,size: 30,color: Colors.white,),
                      title: Text(colors[index],style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold, color: Colors.white.withOpacity(.7)
                      ),),
                      onTap: (){


                        setState(() {
                          selectedColor = colors[index];
                        });

                        widget.onClick();

                        print(selectedColor);

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