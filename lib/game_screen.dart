import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_toe/sign_controller.dart';

class GameScreen extends StatefulWidget {
  GameScreen({required this.player1name,required this.player2name,super.key});
  String player1name;
  String player2name;
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
      final SignController signchange = Get.put(SignController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     final SignController signchange = Get.find();
    signchange.plname!.value = widget.player1name;
    signchange.p2name!.value = widget.player2name;
  }
  @override
  Widget build(BuildContext context) {
    


    Color bgcol = Color.fromARGB(255, 194, 63, 23);
    Color textcol = Colors.white;
    

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tic Tac Toe',
          style: GoogleFonts.outfit(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: textcol,
          ),
        ),
        backgroundColor: bgcol,
      ),
      body: Container(
        color: bgcol,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 192, 134),
                  borderRadius:
                      BorderRadius.circular(15), // Add border radius here
                ),
                child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(9, (index) {
                    return InkWell(
                      onTap: () {
                        if (signchange.gettile(index) == '') {
                          signchange.updatetile(
                              index, signchange.isX.value ? 'X' : 'O');

                          signchange.isX.value = !signchange.isX.value;
                          signchange.anscheck();
                        }
                      },
                      child: Obx(
                        () => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            margin: EdgeInsets.all(4),
                            color: Color.fromARGB(255, 152, 69, 38),
                            child: Center(
                                child: Text(
                              signchange.gettile(index),
                              style: GoogleFonts.poiretOne(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w100,
                                  color: textcol),
                            )),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 150,
                      width: 170,
                      decoration: BoxDecoration(
                        boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.normal,
                        color: Color.fromARGB(159, 73, 71, 71),
                        offset: Offset(7, 2))
                  ],
                          color: const Color.fromARGB(255, 255, 136, 0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${widget.player1name}'s score:",
                              style: GoogleFonts.outfit(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ),
                          Obx(
                            ()=> Text(
                                signchange.p1s.value.toString(),
                                style: GoogleFonts.outfit(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                          ),
                        ],
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 150,
                      width: 170,
                      decoration: BoxDecoration(
                        boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.normal,
                        color: Color.fromARGB(159, 73, 71, 71),
                        offset: Offset(7, 2))
                  ],
                          color: const Color.fromARGB(255, 255, 136, 0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${widget.player2name}'s score:",
                              style: GoogleFonts.outfit(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),

                            

                          ),
                        
                          Obx(
                            ()=> Text(
                                signchange.p2s.value.toString(),
                                style: GoogleFonts.outfit(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 136, 0),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 7,
                            spreadRadius: 1,
                            blurStyle: BlurStyle.normal,
                            color: Color.fromARGB(159, 73, 71, 71),
                            offset: Offset(7, 2))
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                    onPressed: () => signchange.restart(),
                    child: Text(
                      "New Game",
                      style: GoogleFonts.raleway(
                          color: textcol,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 136, 0),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 7,
                            spreadRadius: 1,
                            blurStyle: BlurStyle.normal,
                            color: Color.fromARGB(159, 73, 71, 71),
                            offset: Offset(7, 2))
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                    onPressed: () => signchange.resetscore(),
                    child: Text(
                      "Reset Score",
                      style: GoogleFonts.raleway(
                          color: textcol,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
