Abbey Hustis
CSCI 305
Dart Assignment
5/1/2020

import 'dart:html';
import 'dart:math';

CanvasElement canvas;
CanvasRenderingContext2D ctx;

class Ball {
  num x, y, r, vx, vy;
  
  Ball(this.x, this.y, this.r, this.vx, this.vy);
}

void getSum(MouseEvent event){
  int num1 = int.parse((querySelector("#num1") as InputElement).value);
  int num2 = int.parse((querySelector("#num2") as InputElement).value);
  
  var sum = (num1 + num2).toString();
  
  querySelector("#sum").text = "$num1 + $num2 = $sum";
}



void main(){
  var myBall = new Ball(50, 50, 15, 0, 0);
  canvas = querySelector('#canvas');
  
  doMouseDown(event){
    myBall.x = event.clientX;
    myBall.y = event.clientY;
  }
  canvas.addEventListener('mousedown', doMouseDown, false);
  ctx = canvas.getContext('2d'); 
  
  setInterval(){
    ctx.save();
    ctx.fillStyle = "rgba(200, 0, 200, .3)";
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    ctx.restore();
  
    // Update ball (with Physics! =)

    // 1 - apply velocity to position (vx -> x)
    myBall.x += myBall.vx;
    myBall.y += myBall.vy;

    // 2 - apply drag/friction to velocity
    myBall.vx *= .99;
    myBall.vy *= .99;
    // 3 - apply gravity to velocity
    myBall.vy += .25;
    myBall.vx += .25;
    // 4 - check for collisions
    if (myBall.y + myBall.r > canvas.height) {
    myBall.y = canvas.height - myBall.r;
    myBall.vy = -myBall.vy.abs();
    }
    if (myBall.x + myBall.r > canvas.width) {
    myBall.x = canvas.width - myBall.r;
    myBall.vx = -myBall.vx.abs();
    }
    // Draw ball
    ctx.save();
    ctx.translate(myBall.x, myBall.y);
    ctx.fillStyle = "#ffff00";
    ctx.beginPath();
    ctx.arc(0, 0, myBall.r, 0, pi * 2, true);
    ctx.closePath();
    ctx.fill();
    ctx.restore();
  }
 
  setInterval();
  //var myBall = new Ball(50, 50, 15, 0, 0);
  print(myBall.x);
  print('Hello World');
}
