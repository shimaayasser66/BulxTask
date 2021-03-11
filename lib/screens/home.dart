import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bulx_task/models/product.dart';
import 'details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _productList = List<Product>();
  double _screenWidthAdjustment;

  int currentProductIndex;

  @override
  void initState() {
    super.initState();
    _productList = Product().createSampleList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Left and Right margins 24 + 24 = 48.0 - Text Left and Right Padding 32 + 32 = 64
    _screenWidthAdjustment = MediaQuery.of(context).size.width - 48.0 - 64.0;
  }

  navigateToProductDetails(index){
    return Navigator.of(context).push(
      PageRouteBuilder(
        fullscreenDialog: true,
        transitionDuration: Duration(milliseconds: 1000),
        pageBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Details(
            product: _productList[index],

            productIndex: index,
          );
        },
        transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return FadeTransition(
            opacity:
            animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          //toolbarHeight: height/10,
          centerTitle: true,
          title: Text('Bulx Task',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 30),),
        ),
        body: SafeArea(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            //itemExtent: 180.0,
            itemCount: _productList.length,
            itemBuilder: (BuildContext context, int index) {

              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  // elevation: 4.0,
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(12.0)),
                  //clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Hero(
                      //     tag: 'background' + _productList[index].title,
                      //     child: Container(
                      //       //color: _productList[index].materialColor,
                      //     )),
                      // SizedBox(height: height/30,),

                      Hero(
                              tag: 'text' + _productList[index].title,
                              child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    '${_productList[index].title}',
                                    style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        // color: _productList[index]
                                        //     .materialColor
                                        //     .shade900
                                    ),
                                  ))),

                         // Hero(
                         //      tag: 'subtitle' + _productList[index].title,
                         //      child: Material(
                         //          color: Colors.transparent,
                         //          child: Text(
                         //            _productList[index].subTitle,
                         //            overflow: TextOverflow.ellipsis,
                         //            style: TextStyle(fontSize: 15,color: Colors.black,),
                         //          ))),
                      SizedBox(height: height/40,),
                      Hero(
                          tag: 'price ${index}' + _productList[index].price.toString(),
                          child: Material(
                              color: Colors.transparent,
                              child: Text(
                                "${_productList[index].price} \$",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14,color: Colors.black,),
                              ))),
                      SizedBox(height: height/40,),
                      Hero(
                        tag: 'image' + _productList[index].title,
                        child: Container(

                            height: MediaQuery.of(context).size.height/4,
                            width: MediaQuery.of(context).size.width/1.2,
                            decoration: new BoxDecoration(
                              //color: Colors.pink[400].withOpacity(.4),
                              color: Colors.transparent,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.black.withOpacity(0.5),
                              //     spreadRadius: 2,
                              //     blurRadius: 5,
                              //     offset: Offset(0, 2), // changes position of shadow
                              //   ),
                              // ],
                              image: DecorationImage(
                                image: AssetImage(
                                    _productList[index].image),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),),
                            child: Text("")


                        ),
                      ),
                      SizedBox(height: height/20,),
                      Text(
                        " ${index+1} of ${_productList.length} ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16,color: Colors.black45,),
                      ),

                      SizedBox(height: height/30,),

                      InkWell(
                        onTap: () => navigateToProductDetails(index),
                        child: new Container(
                          width: width/1.5,
                          height: height/20,
                          decoration: new BoxDecoration(
                            color: Colors.black,
                            border: new Border.all(color: Colors.black, width: 2.0),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: new Center(child: new Text('Add to Cart',
                            style: new TextStyle(fontSize: 12.0, color: Colors.white),),),
                        ),),

                      SizedBox(height: height/50,),

                      InkWell(
                        onTap: () => print('hello'),
                        child: new Container(
                          width: width/1.5,
                          height: height/20,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: new Border.all(color: Colors.black45, width: 2.0),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: new Center(child: new Text('Remove From Cart',
                            style: new TextStyle(fontSize: 12.0, color: Colors.black45),),),
                        ),),

                    ],
                  ),
                ),
                onTap: () => navigateToProductDetails(index),
              );
            },
          ),
        ),
      ),
    );
  }
}
