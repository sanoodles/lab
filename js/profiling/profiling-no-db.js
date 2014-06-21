function light_loop() {
  var a = 0;
  for (var i = 0; i < 10 * 1000 * 1000; i++) {
    a = i * i;
  }
}

function heavy_loop() {
  var a = 0;
  for (var i = 0; i < 100 * 1000 * 1000; i++) {
    a = i * i;
  }
}

function mid_tier() {
  light_loop();
  heavy_loop();
}

function top_tier() {
  mid_tier();
}


top_tier();

