#ifndef zamf_world_params_month
	#define zamf_world_params_month -1
#endif
class month {
	title="    Month";
	values[]={-1,1,2,3,4,5,6,7,8,9,10,11,12};
	texts[]={"No change","1","2","3","4","5","6","7","8","9","10","11","12"};
	default = zamf_world_params_month;
};

#ifndef zamf_world_params_day
	#define zamf_world_params_day -1
#endif
class day {
	title="    Day of Month";
	values[]={-1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
	texts[]={"No change","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"};
	default = zamf_world_params_day;
};

#ifndef zamf_world_params_hour
	#define zamf_world_params_hour -1
#endif
class hour {
	title="    Hour";
	values[]={-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
	texts[]={"No change","00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"};
	default = zamf_world_params_hour;
};

#ifndef zamf_world_params_minute
	#define zamf_world_params_minute -1
#endif
class minute {
	title="    Minute";
	values[]={-1,0,5,10,15,20,25,30,35,40,45,50,55};
	texts[]={"No change","00","05","10","15","20","25","30","35","40","45","50","55"};
	default = zamf_world_params_minute;
};

#ifndef zamf_world_params_world_def_view_distance
	#define zamf_world_params_world_def_view_distance 3000
#endif
class def_view_distance {
	title="    View Distance (default)";
	values[]={1000,2000,2500,3000,4000,5000,6000,7000,8000,9000,10000,11000,12000};
	texts[]={"1000m","2000m","2500m","3000m","4000m","5000m","6000m","7000m","8000m","9000m","10000m","11000m","12000m"};
	default = zamf_world_params_world_def_view_distance;
};

#ifndef zamf_world_params_overcast
	#define zamf_world_params_overcast -1
#endif
class overcast {
	title="    Overcast";
	values[]={-1,0,1,2,3,4,5,6,7,8,9,10};
	texts[]={"No change","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
	default = zamf_world_params_overcast;
};

#ifndef zamf_world_params_rain
	#define zamf_world_params_rain -1
#endif
class rain {
	title="    Rain";
	values[]={-1,0,1,2,3,4,5,6,7,8,9,10};
	texts[]={"No change","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
	default = zamf_world_params_rain;
};

#ifndef zamf_world_params_waves
	#define zamf_world_params_waves -1
#endif
class waves {
	title="    Waves";
	values[]={-1,0,1,2,3,4,5,6,7,8,9,10};
	texts[]={"No change","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
	default = zamf_world_params_waves;
};

#ifndef zamf_world_params_lightning
	#define zamf_world_params_lightning -1
#endif
class lightning {
	title="    Lightning";
	values[]={-1,0,1,2,3,4,5,6,7,8,9,10};
	texts[]={"No change","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
	default = zamf_world_params_lightning;
};

#ifndef zamf_world_params_fogValue
	#define zamf_world_params_fogValue -1
#endif
class fogValue {
	title="    Value for fog at base level";
	values[]={-1,0,1,2,3,4,5,6,7,8,9,10};
	texts[]={"No change","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
	default = zamf_world_params_fogValue;
};

#ifndef zamf_world_params_fogDecay
	#define zamf_world_params_fogDecay 0
#endif
class fogDecay {
	title="    Decay of fog density with altitude";
	values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
	texts[]={"0","0.01","0.02","0.03","0.04","0.05","0.06","0.07","0.08","0.09","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
	default = zamf_world_params_fogDecay;
};

#ifndef zamf_world_params_fogBase
	#define zamf_world_params_fogBase 0
#endif
class fogBase {
	title="    Base altitude of fog (in meters)";
	values[]={0,10,20,30,40,50,60,70,80,90,100,150,200,300,500,1000};
	texts[]={"0m","10m","20m","30m","40m","50m","60m","70m","80m","90m","100m","150m","200m","300m","500m","1000m"};
	default = zamf_world_params_fogBase;
};
