library painter;

import 'dart:html';
import 'dart:math';

void paint(CanvasRenderingContext2D contex, Map gamestate){
  gamestate.forEach((key, value){
    if(value['type'] == 'ball'){
      paintBall(contex, value);
    }
  });
}

void paintBall(CanvasRenderingContext2D contex, Map ball){
  contex.fillStyle = 'yellow';
  contex.beginPath();
  contex.arc(ball['x'], ball['y'], ball['size'], 0, PI*2, false);
  contex.fill();
}