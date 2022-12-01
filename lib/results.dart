import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Results extends StatefulWidget {
  double height_r;
  int gender_r;
  String weight_r,age_r;
  Results(this.gender_r,this.height_r,this.age_r,this.weight_r);
  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  late double bmi=0;
  late double bmi_percent=0.0;
  void bmi_calc() async{
    bmi=await (double.parse(widget.weight_r))/((widget.height_r/100)*(widget.height_r/100));
    if(widget.height_r==0){
      bmi=0;
    }
    bmi_percent=(bmi/40);
    setState(() {
    });
  }
  void initState(){
    super.initState();
    bmi_calc();
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
          height: MediaQuery.of(context).size.height-MediaQuery.of(context).padding.bottom-MediaQuery.of(context).padding.top,
          width: MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right,
          child: Column(
            children: [
              Container(
                height: 0.15*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.bottom-MediaQuery.of(context).padding.top),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 0.2*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left),
                      child: ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black54,), style: ElevatedButton.styleFrom(
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
                          'BMI Details',
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
                width:  0.6*MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right,
                height: 0.53*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.bottom-MediaQuery.of(context).padding.top),
                child: Container(
                  height: 0.1*(0.6*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.bottom-MediaQuery.of(context).padding.top)),
                  width: 0.1*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2,2),
                      blurRadius: 10.0,
                    )],
                  ),
                  child: CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 14.0,
                    percent: (bmi_percent>1)?1:bmi_percent,
                    animationDuration: 1200,
                    animation: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text((bmi==0)?'0':(bmi>50)?'N/A':'${bmi.toStringAsPrecision(3)}',style: TextStyle(fontSize: 50,color: Colors.black54),),
                    progressColor: Colors.lightBlueAccent,
                    backgroundColor: Colors.black12,
                  ),
                )
              ),
              Container(
                height: 0.2*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.bottom-MediaQuery.of(context).padding.top),
                child: Align(
                  alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                      style: TextStyle(
                        fontSize:25,
                      ),
                        children: <TextSpan>[
                          TextSpan(text: (bmi<18.5)?' UnderWeight ':(bmi<24.9)?' Normal ':(bmi<29.9)?' OverWeight ':(bmi<34.9)? ' Obese ':'Extreme Obese',style: TextStyle(color: Colors.lightBlueAccent)),
                        ]
                    ),
                ),
              ),
              ),
              Container(
                height: 0.12*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.bottom-MediaQuery.of(context).padding.top),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 0.5*(0.12*(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.bottom-MediaQuery.of(context).padding.top)),
                    width: 0.6*(MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right),
                    child: ElevatedButton(
                      onPressed: (){
                      },
                      child: Text('Details',style: TextStyle(
                        color: Colors.black54,
                      ),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                )
              )
            ],
          )
        ),
      ),
    );
  }
}
