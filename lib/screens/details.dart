import 'package:bulx_task/models/product.dart';
import 'package:bulx_task/widgets/color_drawer.dart';
import 'package:bulx_task/widgets/size_drawer.dart';
import 'package:flutter/material.dart';

String selectedSize;

String selectedColor;

class Details extends StatefulWidget {
  final Product product;
  final int productIndex;

  const Details({Key key, this.product,this.productIndex}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Product _product;
  double _screenWidth;
  int selectOption;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _product = widget.product;

    selectedSize = null;

    selectedColor = null;

    print(widget.product.price);

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black.withOpacity(.5), //desired color
          ),
          child: selectOption==0?SizeDrawer(onClick: callSetState,):ColorDrawer(onClick: callSetState,)),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        //toolbarHeight: height/5,
        centerTitle: true,
        title: Text('Bulx Task',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 30),),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.lightBlueAccent,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Hero(
                  tag: 'text' + widget.product.title,
                  child: Material(
                      color: Colors.transparent,
                      child: Text(
                        '${widget.product.title}',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          // color: widget.product
                          //     .materialColor
                          //     .shade900
                        ),
                      ))),


              SizedBox(height: height/30,),

              Hero(
                  tag: 'price ${widget.productIndex}' + widget.product.price.toString(),
                  child: Material(
                      color: Colors.transparent,
                      child: Text(
                        "${widget.product.price.toString()} \$",
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 24,color: Colors.black,),
                      ))),
              SizedBox(height: height/30,),

              Hero(
                tag: 'image' + widget.product.title,
                child: Container(

                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width/5,
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
                            widget.product.image),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),),
                    child: Text("")


                ),),

              SizedBox(height: height/30,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.product.subTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  style: TextStyle(fontSize: 12,color: Colors.black54,),
                ),
              ),

              SizedBox(height: height/30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {

                      setState(() {
                        selectOption=0;
                      });
                      _scaffoldKey.currentState.openEndDrawer();
                    },
                    child: new Container(
                      width: width/3,
                      height: height/20,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        border: new Border.all(color: Colors.black45, width: 2.0),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: new Center(child: new Text(selectedSize==null?'Select Size':selectedSize,
                        style: new TextStyle(fontSize: selectedSize==null?12.0:14.0, color: Colors.black45
                        ,fontWeight: selectedSize==null?FontWeight.normal:FontWeight.bold),),),
                    ),),

                  InkWell(
                    onTap: () {

                      setState(() {
                        selectOption=1;
                      });
                      _scaffoldKey.currentState.openEndDrawer();
                    },
                    child: new Container(
                      width: width/3,
                      height: height/20,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        border: new Border.all(color: Colors.black45, width: 2.0),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: new Center(child: new Text(selectedColor==null?'Select Color':selectedColor,
                        style: new TextStyle(fontSize: selectedColor==null?12.0:14.0, color: Colors.black45
                        ,fontWeight: selectedColor==null?FontWeight.normal:FontWeight.bold),),),
                    ),),
                ],
              ),

              SizedBox(height: height/50,),

              InkWell(
                onTap: () => print('hello'),
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

            ],
          ),
        ),

      ),
    );
  }
  void callSetState() {
    setState((){}); // it can be called without parameters. It will redraw based on changes done in _SecondWidgetState
  }
}
