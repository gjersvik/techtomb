import 'ball.dart';
import 'render.dart';
import 'game.dart';

import 'dart:math' as Math;

import 'package:box2d/box2d.dart';

import 'package:gamelib/loop.dart';
import 'package:gamelib/loop/timer_runner.dart';

class Balls{
  List balls;
  World _world;
  Math.Random _rand;
  
  Balls(this._world): _rand = new Math.Random(), balls = [];
  
  void genBall(){
    var ball = new BallBody(_world);
    ball.x = _rand.nextDouble() * 100;
    ball.y = _rand.nextDouble() * 100;;
    ball.angle = (_rand.nextDouble() * Math.PI *2) - Math.PI;
    balls.add(ball);
  }
  
  Map toGameState(){
    var i = 1;
    var map = {};
    balls.forEach((ball) {
      map['Ball$i'] = ball.toGameState();
      i += 1;
    });
    return map;
  }
  
}

void main() {
  var render = new Render('#htmlblocks');
  var game = new Game();
  
  var game_loop = new Loop(new TimerRunner());
  
  var balls = new Balls(game.world);
  balls.genBall();
  balls.genBall();
  balls.genBall();
  balls.genBall();
  balls.genBall();
  balls.genBall();
  
  game_loop.callbacks.add((_) => game.world.step(0.016 , 10, 10));
  
  game_loop.callbacks.add((e) => e['gamestate'] = balls.toGameState());
  
  game_loop.callbacks.add((Map event) => render.addState(event['gametime'],event['gamestate']));
  
  game_loop.start();
  render.start();
}

