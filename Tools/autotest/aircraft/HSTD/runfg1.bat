C:
cd C:\Program Files\FlightGear 2020.3

SET FG_SCENERY=C:\Program Files\FlightGear 2020.3\data\Scenery; C:\Program Files\FlightGear 2020.3\data\Scenery;  C:\Program Files\FlightGear 2020.3\data\terrasync
SET FG_ROOT=C:\Program Files\FlightGear 2020.3\data
.\\bin\fgfs --aircraft=f16-simplified2 --fdm=jsb --native-fdm=socket,in,30,127.0.0.1,5502,udp --native-ctrls=socket,out,30,127.0.0.1,5505,udp --fog-disable --enable-clouds3d --start-date-lat=2004:06:01:15:00:00 --disable-sound --in-air --enable-fuel-freeze --enable-hud --heading=0 --offset-distance=0 --offset-azimuth=0 --geometry=2000x1000 --view-offset=CENTER
