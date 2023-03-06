   var launchCatapult = func {
	# time on catapult = 1/10 sec
	# speed when leaving catapult = 50 km/h
	var countdownRunning = 1;
	var count = 3;
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
				launch();
			}
		}
	}
	countdown();
	
	var launchRunning = 1;
	var magnitude = 1000; # magnitude of force in lbs
	var launch = func {
		if (launchRunning) {
			if (magnitude == 0){
				launchRunning = 0;
				
				setprop("/fdm/jsbsim/contact/unit[6]/pos-norm",0);
				setprop("/fdm/jsbsim/contact/unit[7]/pos-norm",0);				
				setprop("/fdm/jsbsim/contact/unit[8]/pos-norm",0);				
			}
			setprop("/fdm/jsbsim/external_reactions/catapult/magnitude",magnitude);
			print (magnitude);
			magnitude = 0;
			settimer(launch, 0.1);
		}
	}
}

