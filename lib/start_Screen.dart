import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_toe/game_screen.dart';
import 'package:tic_toe/sign_controller.dart';

class Startscreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

           final SignController signController=Get.put(SignController());

  
    final TextEditingController Player1controller1=TextEditingController();
        
        final TextEditingController Player2controller=TextEditingController();

          signController.plname=Player1controller1.text.obs;
                    signController.p2name=Player2controller.text.obs;


    return

      Scaffold(
        body: Container(
          color: Color.fromARGB(255, 194, 63, 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
            'Tic Tac Toe',
            style: GoogleFonts.outfit(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.white
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: Player1controller1,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    
                    labelText: 'Player 1 Name (X)',
                    
                    
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
           Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.white
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: Player2controller,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    labelText: 'Player 2 Name (O)',
                    
                    
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
             width: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 136, 0),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
            child: TextButton(onPressed:()=>Get.to(GameScreen(player1name: Player1controller1.text,player2name: Player2controller.text)), child: Text("Let's Play!",
             style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
            )),
          )
            ],
          ),
        ),
      );

  }

}