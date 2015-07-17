#ifndef zamf_medical_params_respawntimer
	#define zamf_medical_params_respawntimer 10000
#endif
class respawntimer {
    title = "    Respawn Delay (use to enable or disable respawn)";
    values[]= {0,5,20,90,10000};
    texts[]= {"0 seconds", "5 seconds", "20 Seconds", "90 Seconds", "No respawn (effectively)"};
    default = zamf_medical_params_respawntimer;
};