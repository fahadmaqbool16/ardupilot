

var inAutostart = 0;
var countdownRunning = 1;
var count = 10;


var repair3 = func {
  setprop("f16/engine/jsf-start", 1);
  screen.log.write("Attempting engine start, standby for engine..");
  inAutostart = 0;
}

var autostart = func {
  if (inAutostart) {
  screen.log.write("Unable to start...");
    return;
  }
  var countdown = func {
  if (countdownRunning) {
			if (count != 0) {
				setprop("/sim/screen/red",count);
				count = count - 1;
				settimer(countdown, 1);
			}
			else {
				countdownRunning = 0;
				setprop("/sim/screen/red","Go!");
  				inAutostart = 1;
  				
  				screen.log.write("Starting, standby..");
  				setprop("fdm/jsbsim/elec/switches/epu",1);
  				setprop("fdm/jsbsim/elec/switches/main-pwr",2);
  				
  				if (getprop("engines/engine[0]/running")!=1) {
						    setprop("f16/engine/feed",1);
						    setprop("f16/engine/jet-fuel",1);
						    setprop("f16/engine/jsf-start",0);
						    settimer(repair3, 10);
				  } else {
				    screen.log.write("Done.");
				    inAutostart = 0;
  				}
			}
		}
	}
		countdown();
}




screen.log.write("Trying to start engine    (2)");
autostart();

