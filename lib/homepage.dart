import 'package:bmi/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'dart:math' as math;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double height=0;
  int weight=0;
  int age=0;
  int gender=1;
  final TextEditingController _controller_weight=TextEditingController();
  final TextEditingController _controller_age=TextEditingController();
  @override
  void initState(){
    super.initState();
    _controller_weight.text=weight.toString();
    _controller_age.text=age.toString();
  }
  @override
  void dispose(){
  }
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom,
          width: MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left,
          child: Column(
            children: <Widget>[
              Container(
                height: 0.15*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 0.2*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left),
                      child: ElevatedButton(onPressed: (){}, child: Icon(Icons.more_horiz_rounded,color: Colors.black54,), style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                        backgroundColor: Colors.white,
                        shadowColor: Colors.grey,
                        elevation: 4,
                      )),
                    ),
                    Container(
                      width: 0.6*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'BMI Calculator',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 0.2*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left),
                      child: ElevatedButton(onPressed: (){}, child: Icon(Icons.person_outline_rounded,color: Colors.black54,),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                            backgroundColor: Colors.white,
                            shadowColor: Colors.grey,
                            elevation: 4,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                height: 0.13*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 0.05*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left),
                    ),
                    Container(
                      height: 0.45*(0.13*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)),
                      width: 0.4*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left),
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              gender=1;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.male,color: (gender==1)?Colors.white:Colors.black54,size:20,),
                              Text(' Male',style: TextStyle(color: (gender==1)?Colors.white:Colors.black54),),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: (gender==1)?Colors.lightBlueAccent:Colors.white,
                            shape: StadiumBorder(),
                            shadowColor: Colors.grey,
                          ),
                        ),
                    ),
                    SizedBox(
                      width: 0.08*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left),
                    ),
                    Container(
                        height: 0.45*(0.13*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)),
                        width: 0.42*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left),
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              gender=2;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.female,color: (gender==2)?Colors.white:Colors.black54,size:20,),
                              Text(' Female',style: TextStyle(color: (gender==2)?Colors.white:Colors.black54,),),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: (gender==2)?Colors.lightBlueAccent:Colors.white,
                            shape: StadiumBorder(),
                            shadowColor: Colors.grey,
                        ),)
                    ),
                    SizedBox(
                      width: 0.05*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left),
                    )
                  ],
                ),
              ),
              Container(
                height: 0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20,0,20,0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(2.0,2.0),
                          )],
                      ),
                      width: 0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-40,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0.05*(0.5*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom)),
                          ),
                          Container(
                            height: 0.05*(0.5*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom)),
                            child: Text('Height (in cm)',style: TextStyle(color: Colors.black54),),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5,0,5,0),
                            height: 0.9*(0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom)),
                            child: Row(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 0.35*(0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-40)-5,
                                    child: SfSliderTheme(
                                      data: SfSliderThemeData(
                                        thumbColor: Colors.black54,
                                      ),
                                      child: SfSlider.vertical(
                                        min: 0,
                                        max: 300,
                                        value: height,
                                        interval:50,
                                        showTicks: true,
                                        minorTicksPerInterval: 3,
                                        labelPlacement: LabelPlacement.onTicks,
                                        activeColor: Colors.lightBlueAccent,
                                        onChanged: (value){
                                          setState(() {
                                            height=value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 0.65*(0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-40)-5,
                                  child:Align(
                                    alignment: Alignment.center,
                                      child: Text('${height.toInt()}',style: TextStyle(color: Colors.black54,fontSize: 55),)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0,0,20,0),
                      width: 0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-20,
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(2.0,2.0),
                              )],
                            ),
                            height: 0.48*(0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 0.07*(0.48*(0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top))),
                                ),
                                Container(
                                  height: 0.17*(0.48*(0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top))),
                                  child: Text('Weight (in kgs)',style: TextStyle(color: Colors.black54)),
                                ),
                                Container(
                                  height: 0.35*(0.48*(0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top))),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: TextFormField(
                                      cursorWidth: 0,
                                      cursorHeight: 0,
                                      cursorColor: Colors.black54,
                                      enableInteractiveSelection: false,
                                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),],
                                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 60,color: Colors.black54),
                                      controller: _controller_weight,
                                      // keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: '0',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 0.4*(0.48*(0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top))),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(width: 0.1*(0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-20)),
                                      Container(
                                          width: 0.29*(0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-20),
                                          child: ElevatedButton(onPressed: (){
                                            if(weight!=double.parse(_controller_weight.text).toInt()){
                                              weight=double.parse(_controller_weight.text).toInt();
                                            }
                                            setState(() {
                                              if(weight>=0){
                                                weight+=1;
                                                _controller_weight.text=weight.toString();
                                              }
                                            });
                                          },child: Icon(Icons.add,color: Colors.black54,),style: ElevatedButton.styleFrom(
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(10),
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.grey,
                                            elevation: 4,
                                          ))
                                      ),
                                      SizedBox(width: 0.2*(0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-20)),
                                      Container(
                                        width: 0.29*(0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-20),
                                          child: ElevatedButton(onPressed: (){
                                            if(weight!=double.parse(_controller_weight.text).toInt()){
                                              weight=double.parse(_controller_weight.text).toInt();
                                            }
                                            if(weight==0){
                                              print('x');
                                            }
                                            else{
                                              setState(() {
                                                if(weight>0){
                                                  weight-=1;
                                                  _controller_weight.text=weight.toString();
                                                }
                                              });
                                            }
                                          }, child: Icon(Icons.remove,color: Colors.black54,),
                                              style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                padding: EdgeInsets.all(10),
                                                backgroundColor: Colors.white,
                                                shadowColor: Colors.grey,
                                                elevation: 4,
                                              )
                                          )
                                      ),
                                      SizedBox(width: 0.1*(0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-20)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 0.02*(0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)),),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              boxShadow: [BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(2.0,2.0),
                              )],
                            ),
                            height: 0.48*(0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 0.07*(0.48*(0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top))),
                                ),
                                Container(
                                  height: 0.12*(0.48*(0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top))),
                                  child: Text('Age (in yrs)',style: TextStyle(color: Colors.black54)),
                                ),
                                Container(
                                  height: 0.4*(0.48*(0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top))),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: TextFormField(
                                      enableInteractiveSelection: false,
                                      cursorHeight: 0,
                                      cursorWidth: 0,
                                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),],
                                      keyboardType: TextInputType.numberWithOptions(decimal: false),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 60,color:Colors.black54),
                                      controller: _controller_age,
                                      //keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '0',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 0.4*(0.48*(0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top))),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(width: 0.1*(0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-20)),
                                      Container(
                                          width: 0.29*(0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-20),
                                          child: ElevatedButton(onPressed: (){
                                            if(age!=double.parse(_controller_age.text).toInt()){
                                              age=double.parse(_controller_age.text).toInt();
                                            }
                                            if(_controller_age.text.isNotEmpty){
                                            }
                                            else{
                                              print('y');
                                            }
                                            setState(() {
                                              age+=1;
                                              _controller_age.text=age.toString();
                                              print('${_controller_age.text}');
                                            });
                                          }, child: Icon(Icons.add,color: Colors.black54,), style: ElevatedButton.styleFrom(
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(10),
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.grey,
                                            elevation: 4,
                                          ),)
                                      ),
                                      SizedBox(width: 0.2*(0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-20)),
                                      Container(
                                          width: 0.29*(0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-20),
                                          child: ElevatedButton(onPressed: (){
                                            if(age!=double.parse(_controller_age.text).toInt()){
                                              age=double.parse(_controller_age.text).toInt();
                                            }
                                            setState(() {
                                              if(age>0){
                                                age-=1;
                                                _controller_age.text=age.toString();
                                              }
                                            });
                                          }, child: Icon(Icons.remove,color: Colors.black54,),style: ElevatedButton.styleFrom(
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(10),
                                            backgroundColor: Colors.white,
                                            shadowColor: Colors.grey,
                                            elevation: 4,
                                          ))
                                      ),
                                      SizedBox(width: 0.1*(0.5*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right)-20)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 0.12*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: 0.5*(0.12*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom)),
                      width: 0.6*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left),
                      child: ElevatedButton(onPressed: (){
                        // Navigator.pushNamed(context,'/results',arguments: {
                        //   'gender': gender,
                        //   'height': height,
                        //   'weight': double.parse(_controller_weight.text),
                        //   'age': double.parse(_controller_age.text),
                        // });
                        if(height==0 || double.parse(_controller_weight.text)==0 || double.parse(_controller_age.text)==0){
                        }
                        else{
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Results(gender,height,_controller_age.text,_controller_weight.text)));
                        }
                        },child: Text('Calculate',style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),),
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}
