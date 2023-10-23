import 'package:carousel_slider/carousel_slider.dart';
import 'package:chessmastergame/Dashboard/More.dart';
import 'package:chessmastergame/views/components/shared/text_variable.dart';
import 'package:chessmastergame/views/main_menu_view.dart';
//
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';







class Play_Friend_Tablepage extends StatefulWidget {
  const Play_Friend_Tablepage({Key key}) : super(key: key);

  @override
  State<Play_Friend_Tablepage> createState() => _Play_Friend_TablepageState();
}

class _Play_Friend_TablepageState extends State<Play_Friend_Tablepage> with TickerProviderStateMixin{
  TextEditingController field = TextEditingController();
  String pasteValue='';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    TabController _tabContrller = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffc19272),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Details()));
              },
              icon: Icon(
                Icons.account_balance_wallet,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: width,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/BackGround.png"),fit: BoxFit.fill,)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  height: height*0.5,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  //  autoPlayInterval: Duration(seconds: 3),
                  // autoPlayAnimationDuration: Duration(milliseconds: 800),
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
                items: [
                  Container(alignment: Alignment.center,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Container.jpg"),fit: BoxFit.fill),
                    ),
                    child: ListView(shrinkWrap: true,
                      children: [SizedBox(height: height*0.08,),
                        Column(
                          children: [
                            Text("Level 1",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900,color: Colors.white),),
                            SizedBox(height: height*0.04,),
                            Padding(
                              padding: const EdgeInsets.only(left: 55
                              ),
                              child: Row(
                                children: [
                                  Text("Prize: ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white),),
                                  Text("₹100",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.white),),
                                  Image(image: AssetImage("assets/images/coin.png",),height: 70,),
                                ],
                              ),
                            ),SizedBox(height: height*0.02,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Play Online: ",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.white),),
                                Text("♟️",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22,color: Colors.white),),
                              ],
                            ),
                            SizedBox(height: height*0.03,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Entry Fee:  ",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800)),
                                Text("₹50",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                              ],
                            ),
                            SizedBox(height: height*0.02),
                            InkWell(onTap: (){
                              showDialog(context: context, builder:
                                  (BuildContext context){
                                return AlertDialog(
                                  backgroundColor: Colors.transparent,
                                    scrollable: true,
                                  content: Container(
                                    height:height*0.35,
                                    width: width*0.2,
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Popup2.png"),fit: BoxFit.fill),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: height*0.06,
                                          width: width*0.6,
                                          child: TabBar(
                                            controller: _tabContrller,
                                            indicator: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20), // Creates border
                                                color: Colors.blue),
                                            tabs: [
                                              Tab(
                                                text: ("Invite"),
                                              ),
                                              // Tab(
                                              //   text: ("ONCOMING"),
                                              // ),
                                              Tab(
                                                text: ("Join"),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: height*0.29,
                                          width: width*0.6,
                                          child:  TabBarView(controller: _tabContrller, children: [
                                            Column(
                                              children: [SizedBox(height: 30,),
                                                Container(alignment: Alignment.center,
                                                  height: height*0.07,
                                                  width: width*0.52,
                                                  decoration:  BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                      border: Border.all(width: 5, color: Colors.yellow
                                                      )// Creates border
                                                      ),
                                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text("Room Code:",style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600)),
                                                      Text("07573850",style:TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w800)),
                                                      SizedBox(width: width*0.01,),
                                                      InkWell(
                                                        onTap: (){
                                                          FlutterClipboard.copy('07573850').then(( value ) => print('copied'));
                                                          FlutterClipboard.paste().then((value) {
                                                            // Do what ever you want with the value.
                                                            setState(() {
                                                              field.text = value;
                                                              pasteValue = value;
                                                            });
                                                          });
                                                          },
                                                        child: Icon(Icons.copy,color:Colors.white,size: 15,),
                                                      )

                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 15,),
                                                Card(color: Colors.transparent,
                                                  child: Container(
                                                    height: height*0.04,
                                                    width: width*0.5,
                                                    child: InkWell(
                                                      onTap: (){
                                                        Share.share("Room Code:07573850\nJoin the group");
                                                      },
                                                      child: Row(
                                                        children: [
                                                          CircleAvatar(radius: 20,
                                                              child: Icon(Icons.share,color: Colors.yellow,)),
                                                          Text("Share the code",style:TextStyle(color: Colors.white,fontSize: 16,
                                                              fontWeight: FontWeight.w700,decoration: TextDecoration.underline))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),SizedBox(height: 20,),
                                                InkWell(onTap: (){
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainMenuView()));
                                                },
                                                  child: Container(alignment: Alignment.center,
                                                    height: height*0.04,
                                                    width:  width*0.2,
                                                           decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/btn_sure.png"),fit: BoxFit.fill)
                                                  ),
                                                    child: Text("Join",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                                                  ),
                                                )

                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text("Enter Private Code",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900)),
                                                SizedBox(height: 15,),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(alignment: Alignment.center,
                                                    width:  width*0.5,
                                                      height: height*0.07,

                                                    decoration: BoxDecoration(
                                                      border: Border.all(width: 5, color: Colors.yellow),
                                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                                  ),
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                        border: InputBorder.none,
                                                    ),
                                                  ),),
                                                ),
                                                SizedBox(height: 20,),
                                                InkWell(onTap: (){
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainMenuView()));
                                                },
                                                  child: Container(alignment: Alignment.center,
                                                    height:  height*0.04,
                                                    width:  width*0.2,
                                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/btn_sure.png"),fit: BoxFit.fill),
                                                  ),
                                                    child: Text("Join",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                                                  ),
                                                )

                                              ],
                                            ),
                                          ]),
                                        )
                                      ],

                                    )
                                  ),

                                );
                              }
                              );
                            },
                              child: Card(color: Colors.transparent,elevation: 3,
                                child: Container(alignment:Alignment.center,
                                  width: width*0.4,
                                  height: height*0.05,
                                   decoration: BoxDecoration( border: Border.all( color: Colors.yellow),color: Colors.green,
                                       borderRadius: BorderRadius.all(Radius.circular(50))),

                                  child: Text("Create Room",style:TextStyle(fontSize: 22,color: Colors.white),
                                ),
                            ),
                              )
                            )
                          ],

                        ),
                      ],
                    ),

                  ),
                  Container(alignment: Alignment.center,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Container2.jpg"),fit: BoxFit.fill),
                    ),
                    child: ListView(shrinkWrap: true,
                      children: [SizedBox(height: height*0.08,),
                        Column(
                          children: [
                            Text("Level 2",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900,color: Colors.white),),
                            SizedBox(height: height*0.04,),
                            Padding(
                              padding: const EdgeInsets.only(left: 55
                              ),
                              child: Row(
                                children: [
                                  Text("Prize: ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white),),
                                  Text("₹200",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.white),),
                                  Image(image: AssetImage("assets/images/coin.png",),height: 70,),
                                ],
                              ),
                            ),SizedBox(height: height*0.02,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Play Online: ",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.white),),
                                Text("♟️",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22,color: Colors.white),),
                              ],
                            ),
                            SizedBox(height: height*0.03,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Entry Fee:  ",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800)),
                                Text("₹100",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                              ],
                            ),
                            SizedBox(height: height*0.02),
                            InkWell(onTap: (){
                              showDialog(context: context, builder:
                                  (BuildContext context){
                                return AlertDialog(
                                  backgroundColor: Colors.transparent,
                                  scrollable: true,
                                  content: Container(
                                      height:height*0.35,
                                      width: width*0.2,
                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Popup2.png"),fit: BoxFit.fill),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: height*0.06,
                                            width: width*0.6,
                                            child: TabBar(
                                              controller: _tabContrller,
                                              indicator: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20), // Creates border
                                                  color: Colors.blue),
                                              tabs: [
                                                Tab(
                                                  text: ("Invite"),
                                                ),
                                                // Tab(
                                                //   text: ("ONCOMING"),
                                                // ),
                                                Tab(
                                                  text: ("Join"),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: height*0.29,
                                            width: width*0.6,
                                            child:  TabBarView(controller: _tabContrller, children: [
                                              Column(
                                                children: [SizedBox(height: 30,),
                                                  Container(alignment: Alignment.center,
                                                    height: height*0.07,
                                                    width: width*0.52,
                                                    decoration:  BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        border: Border.all(width: 5, color: Colors.yellow
                                                        )// Creates border
                                                    ),
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text("Room Code:",style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600)),
                                                        Text("07573850",style:TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w800)),
                                                        SizedBox(width: width*0.01,),
                                                        InkWell(
                                                          onTap: (){
                                                            FlutterClipboard.copy('07573850').then(( value ) => print('copied'));
                                                            FlutterClipboard.paste().then((value) {
                                                              // Do what ever you want with the value.
                                                              setState(() {
                                                                field.text = value;
                                                                pasteValue = value;
                                                              });
                                                            });
                                                          },
                                                          child: Icon(Icons.copy,color:Colors.white,size: 15,),
                                                        )

                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),
                                                  Card(color: Colors.transparent,
                                                    child: Container(
                                                      height: height*0.04,
                                                      width: width*0.5,
                                                      child: InkWell(
                                                        onTap: (){
                                                          Share.share("Room Code:07573850\nJoin the group");
                                                        },
                                                        child: Row(
                                                          children: [
                                                            CircleAvatar(radius: 20,
                                                                child: Icon(Icons.share,color: Colors.yellow,)),
                                                            Text("Share the code",style:TextStyle(color: Colors.white,fontSize: 16,
                                                                fontWeight: FontWeight.w700,decoration: TextDecoration.underline))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),SizedBox(height: 20,),
                                                  InkWell(onTap: (){
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainMenuView()));
                                                  },
                                                    child: Container(alignment: Alignment.center,
                                                      height: height*0.04,
                                                      width:  width*0.2,
                                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/btn_sure.png"),fit: BoxFit.fill)
                                                      ),
                                                      child: Text("Join",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                                                    ),
                                                  )

                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("Enter Private Code",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900)),
                                                  SizedBox(height: 15,),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(alignment: Alignment.center,
                                                      width:  width*0.5,
                                                      height: height*0.07,

                                                      decoration: BoxDecoration(
                                                        border: Border.all(width: 5, color: Colors.yellow),
                                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                                      ),
                                                      child: TextField(
                                                        decoration: InputDecoration(
                                                          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                          border: InputBorder.none,
                                                        ),
                                                      ),),
                                                  ),
                                                  SizedBox(height: 20,),
                                                  InkWell(onTap: (){
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainMenuView()));
                                                  },
                                                    child: Container(alignment: Alignment.center,
                                                      height:  height*0.04,
                                                      width:  width*0.2,
                                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/btn_sure.png"),fit: BoxFit.fill),
                                                      ),
                                                      child: Text("Join",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                                                    ),
                                                  )

                                                ],
                                              ),
                                            ]),
                                          )
                                        ],

                                      )
                                  ),

                                );
                              }
                              );
                            },
                                child: Card(color: Colors.transparent,elevation: 3,
                                  child: Container(alignment:Alignment.center,
                                    width: width*0.4,
                                    height: height*0.05,
                                    decoration: BoxDecoration( border: Border.all( color: Colors.yellow),color: Colors.green,
                                        borderRadius: BorderRadius.all(Radius.circular(50))),

                                    child: Text("Create Room",style:TextStyle(fontSize: 22,color: Colors.white),
                                    ),
                                  ),
                                )
                            )
                          ],

                        ),
                      ],
                    ),

                  ),
                  Container(alignment: Alignment.center,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Container3.jpg"),fit: BoxFit.fill),
                    ),
                    child: ListView(shrinkWrap: true,
                      children: [SizedBox(height: height*0.08,),
                        Column(
                          children: [
                            Text("Level 3",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900,color: Colors.white),),
                            SizedBox(height: height*0.04,),
                            Padding(
                              padding: const EdgeInsets.only(left: 55
                              ),
                              child: Row(
                                children: [
                                  Text("Prize: ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white),),
                                  Text("₹300",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.white),),
                                  Image(image: AssetImage("assets/images/coin.png",),height: 70,),
                                ],
                              ),
                            ),SizedBox(height: height*0.02,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Play Online: ",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.white),),
                                Text("♟️",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22,color: Colors.white),),
                              ],
                            ),
                            SizedBox(height: height*0.03,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Entry Fee:  ",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800)),
                                Text("₹150",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                              ],
                            ),
                            SizedBox(height: height*0.02),
                            InkWell(onTap: (){
                              showDialog(context: context, builder:
                                  (BuildContext context){
                                return AlertDialog(
                                  backgroundColor: Colors.transparent,
                                  scrollable: true,
                                  content: Container(
                                      height:height*0.35,
                                      width: width*0.2,
                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Popup2.png"),fit: BoxFit.fill),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: height*0.06,
                                            width: width*0.6,
                                            child: TabBar(
                                              controller: _tabContrller,
                                              indicator: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20), // Creates border
                                                  color: Colors.blue),
                                              tabs: [
                                                Tab(
                                                  text: ("Invite"),
                                                ),
                                                // Tab(
                                                //   text: ("ONCOMING"),
                                                // ),
                                                Tab(
                                                  text: ("Join"),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: height*0.29,
                                            width: width*0.6,
                                            child:  TabBarView(controller: _tabContrller, children: [
                                              Column(
                                                children: [SizedBox(height: 30,),
                                                  Container(alignment: Alignment.center,
                                                    height: height*0.07,
                                                    width: width*0.52,
                                                    decoration:  BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        border: Border.all(width: 5, color: Colors.yellow
                                                        )// Creates border
                                                    ),
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text("Room Code:",style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600)),
                                                        Text("07573850",style:TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w800)),
                                                        SizedBox(width: width*0.01,),
                                                        InkWell(
                                                          onTap: (){
                                                            FlutterClipboard.copy('07573850').then(( value ) => print('copied'));
                                                            FlutterClipboard.paste().then((value) {
                                                              // Do what ever you want with the value.
                                                              setState(() {
                                                                field.text = value;
                                                                pasteValue = value;
                                                              });
                                                            });
                                                          },
                                                          child: Icon(Icons.copy,color:Colors.white,size: 15,),
                                                        )

                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),
                                                  Card(color: Colors.transparent,
                                                    child: Container(
                                                      height: height*0.04,
                                                      width: width*0.5,
                                                      child: InkWell(
                                                        onTap: (){
                                                          Share.share("Room Code:07573850\nJoin the group");
                                                        },
                                                        child: Row(
                                                          children: [
                                                            CircleAvatar(radius: 20,
                                                                child: Icon(Icons.share,color: Colors.yellow,)),
                                                            Text("Share the code",style:TextStyle(color: Colors.white,fontSize: 16,
                                                                fontWeight: FontWeight.w700,decoration: TextDecoration.underline))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),SizedBox(height: 20,),
                                                  InkWell(onTap: (){
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainMenuView()));
                                                  },
                                                    child: Container(alignment: Alignment.center,
                                                      height: height*0.04,
                                                      width:  width*0.2,
                                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/btn_sure.png"),fit: BoxFit.fill)
                                                      ),
                                                      child: Text("Join",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                                                    ),
                                                  )

                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("Enter Private Code",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900)),
                                                  SizedBox(height: 15,),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(alignment: Alignment.center,
                                                      width:  width*0.5,
                                                      height: height*0.07,

                                                      decoration: BoxDecoration(
                                                        border: Border.all(width: 5, color: Colors.yellow),
                                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                                      ),
                                                      child: TextField(
                                                        decoration: InputDecoration(
                                                          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                          border: InputBorder.none,
                                                        ),
                                                      ),),
                                                  ),
                                                  SizedBox(height: 20,),
                                                  InkWell(onTap: (){
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainMenuView()));
                                                  },
                                                    child: Container(alignment: Alignment.center,
                                                      height:  height*0.04,
                                                      width:  width*0.2,
                                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/btn_sure.png"),fit: BoxFit.fill),
                                                      ),
                                                      child: Text("Join",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                                                    ),
                                                  )

                                                ],
                                              ),
                                            ]),
                                          )
                                        ],

                                      )
                                  ),

                                );
                              }
                              );
                            },
                                child: Card(color: Colors.transparent,elevation: 3,
                                  child: Container(alignment:Alignment.center,
                                    width: width*0.4,
                                    height: height*0.05,
                                    decoration: BoxDecoration( border: Border.all( color: Colors.yellow),color: Colors.green,
                                        borderRadius: BorderRadius.all(Radius.circular(50))),

                                    child: Text("Create Room",style:TextStyle(fontSize: 22,color: Colors.white),
                                    ),
                                  ),
                                )
                            )
                          ],

                        ),
                      ],
                    ),

                  ),
                  Container(alignment: Alignment.center,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Container4.jpg"),fit: BoxFit.fill),
                    ),
                    child: ListView(shrinkWrap: true,
                      children: [SizedBox(height: height*0.08,),
                        Column(
                          children: [
                            Text("Level 4",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900,color: Colors.white),),
                            SizedBox(height: height*0.04,),
                            Padding(
                              padding: const EdgeInsets.only(left: 55
                              ),
                              child: Row(
                                children: [
                                  Text("Prize: ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white),),
                                  Text("₹400",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.white),),
                                  Image(image: AssetImage("assets/images/coin.png",),height: 70,),
                                ],
                              ),
                            ),SizedBox(height: height*0.02,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Play Online: ",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.white),),
                                Text("♟️",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22,color: Colors.white),),
                              ],
                            ),
                            SizedBox(height: height*0.03,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Entry Fee:  ",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800)),
                                Text("₹200",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                              ],
                            ),
                            SizedBox(height: height*0.02),
                            InkWell(onTap: (){
                              showDialog(context: context, builder:
                                  (BuildContext context){
                                return AlertDialog(
                                  backgroundColor: Colors.transparent,
                                  scrollable: true,
                                  content: Container(
                                      height:height*0.35,
                                      width: width*0.2,
                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Popup2.png"),fit: BoxFit.fill),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: height*0.06,
                                            width: width*0.6,
                                            child: TabBar(
                                              controller: _tabContrller,
                                              indicator: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20), // Creates border
                                                  color: Colors.blue),
                                              tabs: [
                                                Tab(
                                                  text: ("Invite"),
                                                ),
                                                // Tab(
                                                //   text: ("ONCOMING"),
                                                // ),
                                                Tab(
                                                  text: ("Join"),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: height*0.29,
                                            width: width*0.6,
                                            child:  TabBarView(controller: _tabContrller, children: [
                                              Column(
                                                children: [SizedBox(height: 30,),
                                                  Container(alignment: Alignment.center,
                                                    height: height*0.07,
                                                    width: width*0.52,
                                                    decoration:  BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        border: Border.all(width: 5, color: Colors.yellow
                                                        )// Creates border
                                                    ),
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text("Room Code:",style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600)),
                                                        Text("07573850",style:TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w800)),
                                                        SizedBox(width: width*0.01,),
                                                        InkWell(
                                                          onTap: (){
                                                            FlutterClipboard.copy('07573850').then(( value ) => print('copied'));
                                                            FlutterClipboard.paste().then((value) {
                                                              // Do what ever you want with the value.
                                                              setState(() {
                                                                field.text = value;
                                                                pasteValue = value;
                                                              });
                                                            });
                                                          },
                                                          child: Icon(Icons.copy,color:Colors.white,size: 15,),
                                                        )

                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),
                                                  Card(color: Colors.transparent,
                                                    child: Container(
                                                      height: height*0.04,
                                                      width: width*0.5,
                                                      child: InkWell(
                                                        onTap: (){
                                                          Share.share("Room Code:07573850\nJoin the group");
                                                        },
                                                        child: Row(
                                                          children: [
                                                            CircleAvatar(radius: 20,
                                                                child: Icon(Icons.share,color: Colors.yellow,)),
                                                            Text("Share the code",style:TextStyle(color: Colors.white,fontSize: 16,
                                                                fontWeight: FontWeight.w700,decoration: TextDecoration.underline))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),SizedBox(height: 20,),
                                                  InkWell(onTap: (){
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainMenuView()));
                                                  },
                                                    child: Container(alignment: Alignment.center,
                                                      height: height*0.04,
                                                      width:  width*0.2,
                                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/btn_sure.png"),fit: BoxFit.fill)
                                                      ),
                                                      child: Text("Join",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                                                    ),
                                                  )

                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("Enter Private Code",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900)),
                                                  SizedBox(height: 15,),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(alignment: Alignment.center,
                                                      width:  width*0.5,
                                                      height: height*0.07,

                                                      decoration: BoxDecoration(
                                                        border: Border.all(width: 5, color: Colors.yellow),
                                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                                      ),
                                                      child: TextField(
                                                        decoration: InputDecoration(
                                                          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                          border: InputBorder.none,
                                                        ),
                                                      ),),
                                                  ),
                                                  SizedBox(height: 20,),
                                                  InkWell(onTap: (){
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainMenuView()));
                                                  },
                                                    child: Container(alignment: Alignment.center,
                                                      height:  height*0.04,
                                                      width:  width*0.2,
                                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/btn_sure.png"),fit: BoxFit.fill),
                                                      ),
                                                      child: Text("Join",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                                                    ),
                                                  )

                                                ],
                                              ),
                                            ]),
                                          )
                                        ],

                                      )
                                  ),

                                );
                              }
                              );
                            },
                                child: Card(color: Colors.transparent,elevation: 3,
                                  child: Container(alignment:Alignment.center,
                                    width: width*0.4,
                                    height: height*0.05,
                                    decoration: BoxDecoration( border: Border.all( color: Colors.yellow),color: Colors.green,
                                        borderRadius: BorderRadius.all(Radius.circular(50))),

                                    child: Text("Create Room",style:TextStyle(fontSize: 22,color: Colors.white),
                                    ),
                                  ),
                                )
                            )
                          ],

                        ),
                      ],
                    ),

                  ),
                  Container(alignment: Alignment.center,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Container5.jpg"),fit: BoxFit.fill),
                    ),
                    child: ListView(shrinkWrap: true,
                      children: [SizedBox(height: height*0.08,),
                        Column(
                          children: [
                            Text("Level 5",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900,color: Colors.white),),
                            SizedBox(height: height*0.04,),
                            Padding(
                              padding: const EdgeInsets.only(left: 55
                              ),
                              child: Row(
                                children: [
                                  Text("Prize: ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white),),
                                  Text("₹500",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.white),),
                                  Image(image: AssetImage("assets/images/coin.png",),height: 70,),
                                ],
                              ),
                            ),SizedBox(height: height*0.02,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Play Online: ",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.white),),
                                Text("♟️",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22,color: Colors.white),),
                              ],
                            ),
                            SizedBox(height: height*0.03,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Entry Fee:  ",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800)),
                                Text("₹250",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                              ],
                            ),
                            SizedBox(height: height*0.02),
                            InkWell(onTap: (){
                              showDialog(context: context, builder:
                                  (BuildContext context){
                                return AlertDialog(
                                  backgroundColor: Colors.transparent,
                                  scrollable: true,
                                  content: Container(
                                      height:height*0.35,
                                      width: width*0.2,
                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Popup2.png"),fit: BoxFit.fill),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: height*0.06,
                                            width: width*0.6,
                                            child: TabBar(
                                              controller: _tabContrller,
                                              indicator: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20), // Creates border
                                                  color: Colors.blue),
                                              tabs: [
                                                Tab(
                                                  text: ("Invite"),
                                                ),
                                                // Tab(
                                                //   text: ("ONCOMING"),
                                                // ),
                                                Tab(
                                                  text: ("Join"),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: height*0.29,
                                            width: width*0.6,
                                            child:  TabBarView(controller: _tabContrller, children: [
                                              Column(
                                                children: [SizedBox(height: 30,),
                                                  Container(alignment: Alignment.center,
                                                    height: height*0.07,
                                                    width: width*0.52,
                                                    decoration:  BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        border: Border.all(width: 5, color: Colors.yellow
                                                        )// Creates border
                                                    ),
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text("Room Code:",style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600)),
                                                        Text("07573850",style:TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w800)),
                                                        SizedBox(width: width*0.01,),
                                                        InkWell(
                                                          onTap: (){
                                                            FlutterClipboard.copy('07573850').then(( value ) => print('copied'));
                                                            FlutterClipboard.paste().then((value) {
                                                              // Do what ever you want with the value.
                                                              setState(() {
                                                                field.text = value;
                                                                pasteValue = value;
                                                              });
                                                            });
                                                          },
                                                          child: Icon(Icons.copy,color:Colors.white,size: 15,),
                                                        )

                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),
                                                  Card(color: Colors.transparent,
                                                    child: Container(
                                                      height: height*0.04,
                                                      width: width*0.5,
                                                      child: InkWell(
                                                        onTap: (){
                                                          Share.share("Room Code:07573850\nJoin the group");
                                                        },
                                                        child: Row(
                                                          children: [
                                                            CircleAvatar(radius: 20,
                                                                child: Icon(Icons.share,color: Colors.yellow,)),
                                                            Text("Share the code",style:TextStyle(color: Colors.white,fontSize: 16,
                                                                fontWeight: FontWeight.w700,decoration: TextDecoration.underline))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),SizedBox(height: 20,),
                                                  InkWell(onTap: (){
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainMenuView()));
                                                  },
                                                    child: Container(alignment: Alignment.center,
                                                      height: height*0.04,
                                                      width:  width*0.2,
                                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/btn_sure.png"),fit: BoxFit.fill)
                                                      ),
                                                      child: Text("Join",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                                                    ),
                                                  )

                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("Enter Private Code",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900)),
                                                  SizedBox(height: 15,),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(alignment: Alignment.center,
                                                      width:  width*0.5,
                                                      height: height*0.07,

                                                      decoration: BoxDecoration(
                                                        border: Border.all(width: 5, color: Colors.yellow),
                                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                                      ),
                                                      child: TextField(
                                                        decoration: InputDecoration(
                                                          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                          border: InputBorder.none,
                                                        ),
                                                      ),),
                                                  ),
                                                  SizedBox(height: 20,),
                                                  InkWell(onTap: (){
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainMenuView()));
                                                  },
                                                    child: Container(alignment: Alignment.center,
                                                      height:  height*0.04,
                                                      width:  width*0.2,
                                                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/btn_sure.png"),fit: BoxFit.fill),
                                                      ),
                                                      child: Text("Join",style:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900)),
                                                    ),
                                                  )

                                                ],
                                              ),
                                            ]),
                                          )
                                        ],

                                      )
                                  ),

                                );
                              }
                              );
                            },
                                child: Card(color: Colors.transparent,elevation: 3,
                                  child: Container(alignment:Alignment.center,
                                    width: width*0.4,
                                    height: height*0.05,
                                    decoration: BoxDecoration( border: Border.all( color: Colors.yellow),color: Colors.green,
                                        borderRadius: BorderRadius.all(Radius.circular(50))),

                                    child: Text("Create Room",style:TextStyle(fontSize: 22,color: Colors.white),
                                    ),
                                  ),
                                )
                            )
                          ],

                        ),
                      ],
                    ),

                  ),
                  // ].map((i) {
                  //   return Builder(
                  //     builder: (BuildContext context) {
                  //       return
                  //         Container(
                  //
                  //           width: MediaQuery.of(context).size.width,
                  //           margin: EdgeInsets.symmetric(horizontal: 5.0),
                  //           decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Container.jpg"),fit: BoxFit.fill),
                  //           ),
                  //           child: Column(
                  //             children: [
                  //               Text('text $i', style: TextStyle(fontSize: 16.0),),
                  //             ],
                  //           )
                  //       );
                  //     },
                  //   );
                  // }).toList(),
                ]
            ),

          ],
        ),
      ),
    );
  }
}
