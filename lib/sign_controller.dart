import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_toe/start_Screen.dart';

class SignController extends GetxController{

var tiles=List.generate(9, (index)=>RxString('')).obs;


RxBool isX=true.obs;
RxInt p1s=0.obs;
RxInt p2s=0.obs;
RxString? plname=''.obs;
RxString? p2name=''.obs;


void updatetile(int index,String value)
{

tiles[index].value=value;

}

String gettile(int index){

return tiles[index].value;

}

SnackbarController? anscheck(){

  if(tiles.elementAt(0).value=='X' &&tiles.elementAt(1).value=='X' &&tiles.elementAt(2).value=='X'||
     tiles.elementAt(0).value=='X' &&tiles.elementAt(3).value=='X' &&tiles.elementAt(6).value=='X'||
     tiles.elementAt(1).value=='X' &&tiles.elementAt(4).value=='X' &&tiles.elementAt(7).value=='X'||
     tiles.elementAt(3).value=='X' &&tiles.elementAt(4).value=='X' &&tiles.elementAt(5).value=='X'||
     tiles.elementAt(2).value=='X' &&tiles.elementAt(5).value=='X' &&tiles.elementAt(8).value=='X'||
     tiles.elementAt(6).value=='X' &&tiles.elementAt(7).value=='X' &&tiles.elementAt(8).value=='X'||
     tiles.elementAt(0).value=='X' &&tiles.elementAt(4).value=='X' &&tiles.elementAt(8).value=='X'||
     tiles.elementAt(2).value=='X' &&tiles.elementAt(4).value=='X' &&tiles.elementAt(6).value=='X'
  
  ){
      p1s.value++;
      
    Get.snackbar("Winner", "${plname!.value} Won!",snackStyle: SnackStyle.GROUNDED,
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds: 4)
    ,    backgroundGradient: LinearGradient(colors: [const Color.fromARGB(77, 236, 46, 46),const Color.fromARGB(255, 236, 222, 217)])

    );
  }

  else if(
            tiles.elementAt(0).value=='O' &&tiles.elementAt(1).value=='O' &&tiles.elementAt(2).value=='O'||
     tiles.elementAt(0).value=='O' &&tiles.elementAt(3).value=='O' &&tiles.elementAt(6).value=='O'||
     tiles.elementAt(1).value=='O' &&tiles.elementAt(4).value=='O' &&tiles.elementAt(7).value=='O'||
     tiles.elementAt(3).value=='O' &&tiles.elementAt(4).value=='O' &&tiles.elementAt(5).value=='O'||
     tiles.elementAt(2).value=='O' &&tiles.elementAt(5).value=='O' &&tiles.elementAt(8).value=='O'||
     tiles.elementAt(6).value=='O' &&tiles.elementAt(7).value=='O' &&tiles.elementAt(8).value=='O'||
     tiles.elementAt(0).value=='O' &&tiles.elementAt(4).value=='O' &&tiles.elementAt(8).value=='O'||
     tiles.elementAt(2).value=='O' &&tiles.elementAt(4).value=='O' &&tiles.elementAt(6).value=='O'

  ){
        p2s.value++;
         Get.snackbar("Winner", "${p2name!.value} Won!",snackStyle: SnackStyle.GROUNDED,
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds: 4),
    backgroundGradient: LinearGradient(colors: [const Color.fromARGB(77, 236, 46, 46),const Color.fromARGB(255, 236, 222, 217)])
    );


  }
}

void restart(){
 
  for(int i=0;i<9;i++)
  {
    tiles[i].value='';
  }

   isX=true.obs;

}

void resetscore(){

p1s.value=0;
p2s.value=0;

}




}

