/*
      __                 __    __           __  
     / /__      ______  / /_  / /___ ______/ /__
    / __/ | /| / / __ \/ __ \/ / __ `/ ___/ //_/
   / /_ | |/ |/ / /_/ / /_/ / / /_/ / /__/ ,<   
   \__/ |__/|__/\____/_.___/_/\__, /\___/_/|_|  
                                /_/             

               3in1job_system.pwn
*/

// Posao stolar, drvosjeca i dostavljac namjestaja
// twoblqck.art, 17/5/2024

#include < a_samp >
#include < streamer >
#include < Pawn.CMD >

// Varijable
new dostavljacn_vozila[9], 
	drvosjeca_vozila[5],
	Text3D:dostavljacn_3dlabel[9],
	Text3D:drvosjeca_3dlabel[5],
	loop_animacija[MAX_PLAYERS],
	posao_id[MAX_PLAYERS],
	posao_oprema[MAX_PLAYERS],
	zalediodledi_timer[MAX_PLAYERS],
	drvosjeca_timer[MAX_PLAYERS],
	drvo_oboreno[MAX_PLAYERS],
	drvo_uzeto[MAX_PLAYERS],
	drvosjeca_checkpoint[MAX_PLAYERS],
	drvosjeca_progres[MAX_PLAYERS],
	drvosjeca_objekt[MAX_PLAYERS][4],
	namjestaj_checkpoint[MAX_PLAYERS],
	namjestaj_kombi[MAX_PLAYERS],
	namjestaj_uzet[MAX_PLAYERS],
	dostava_checkpoint[MAX_PLAYERS],
	dostava_progres[MAX_PLAYERS],
	stolar_checkpoint[MAX_PLAYERS],
	stolar_objekt[MAX_PLAYERS],
	stolar_timer[MAX_PLAYERS],
	lakirer_checkpoint[MAX_PLAYERS],
	lakirer_timer[MAX_PLAYERS],
	lakirer_progres[MAX_PLAYERS],
	lakirer_objekt[MAX_PLAYERS],
	farba_masina[MAX_PLAYERS],
	farba_progres[MAX_PLAYERS],
	rand_id[MAX_PLAYERS],
	bool:kanta_farbe[MAX_PLAYERS] = false;

//
main()
{
	print("3 in 1 job system");
}

public OnFilterScriptInit()
{
	// Vozila za posao Dostavljac namjestaja
	dostavljacn_vozila[0] = CreateVehicle(440, -1980.1071, -2435.8025, 30.7793, 133.3542, 0, 0, 0); 
	dostavljacn_vozila[1] = CreateVehicle(440, -1983.9734, -2431.3098, 30.7401, 132.4013, 0, 0, 0);
	dostavljacn_vozila[2] = CreateVehicle(440, -1986.7517, -2428.0413, 30.7360, 130.3959, 0, 0, 0);
	dostavljacn_vozila[3] = CreateVehicle(440, -1992.2051, -2423.1599, 30.7464, 134.5331, 0, 0, 0);
	dostavljacn_vozila[4] = CreateVehicle(440, -1996.0574, -2418.6758, 30.7354, 137.2275, 0, 0, 0);
	dostavljacn_vozila[5] = CreateVehicle(440, -2033.7366, -2383.2073, 30.7300, 130.7572, 0, 0, 0); 
	dostavljacn_vozila[6] = CreateVehicle(440, -2038.9432, -2378.1821, 30.7403, 132.3708, 0, 0, 0);
	dostavljacn_vozila[7] = CreateVehicle(440, -2056.4761, -2448.5027, 30.7438, 237.0809, 0, 0, 0);
	dostavljacn_vozila[8] = CreateVehicle(440, -2051.1587, -2441.6929, 30.7513, 233.2193, 0, 0, 0);

	for(new dostavljac_label = 0; dostavljac_label < 9; dostavljac_label++)
	{
		dostavljacn_3dlabel[dostavljac_label] = Create3DTextLabel("DOSTAVLJAC NAMJESTAJA", 0x33CCFFAA, 0.0, 0.0, 0.0, 20.0, 0, 0);
   		Attach3DTextLabelToVehicle(dostavljacn_3dlabel[dostavljac_label], dostavljacn_vozila[dostavljac_label], 0.0, 0.0, 0.0);
	}

	// Vozila za posao Drvosjeca
	drvosjeca_vozila[0] = CreateVehicle(605, -1642.9668, -2223.2527, 30.8408, 98.0672, 0, 0, 0);
	drvosjeca_vozila[1] = CreateVehicle(605, -1642.1703, -2229.1877, 29.7708, 96.0169, 0, 0, 0);
	drvosjeca_vozila[2] = CreateVehicle(605, -1640.2982, -2251.5884, 31.3141, 92.8015, 0, 0, 0);
	drvosjeca_vozila[3] = CreateVehicle(605, -1646.3102, -2264.0283, 32.9103, 69.2222, 0, 0, 0);
	drvosjeca_vozila[4] = CreateVehicle(605, -1651.3549, -2271.0986, 35.1469, 50.1358, 0, 0, 0);

	for(new drvosjeca_label = 0; drvosjeca_label < 5; drvosjeca_label++)
	{
		drvosjeca_3dlabel[drvosjeca_label] = Create3DTextLabel("DRVOSJECA", 0x33CCFFAA, 0.0, 0.0, 0.0, 20.0, 0, 0);
   		Attach3DTextLabelToVehicle(drvosjeca_3dlabel[drvosjeca_label], drvosjeca_vozila[drvosjeca_label], 0.0, 0.0, 0.0);
	}

	// Mape
	// Dostavljac namjestaja oprema
	CreateDynamicObject(2007, -2048.925048, -2458.376708, 29.695001, 0.000000, 0.000000, 140.199920, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(11729, -2049.791992, -2458.097412, 29.574998, 0.000000, 0.000000, 142.900009, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(11729, -2050.350341, -2457.675537, 29.574998, 0.000000, 0.000000, 142.900009, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(11729, -2050.900146, -2457.260009, 29.574998, 0.000000, 0.000000, 142.900009, -1, -1, -1, 300.00, 300.00); 

	// Lakirnica vrata
	CreateDynamicObject(19860, 2535.527587, -1283.144042, 1044.375366, 0.000000, 0.000000, 89.399925, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19860, 2535.569091, -1280.163574, 1044.374023, 0.000000, -0.000000, -91.100036, -1, -1, -1, 300.00, 300.00);

	// Stolar - Ostavljanje namjestaja
	CreateDynamicObject(2636, 2534.580566, -1305.525024, 1043.734985, 0.000000, 0.000000, -138.799987, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2636, 2533.818603, -1305.354003, 1043.734985, 0.000000, 0.000000, -88.699996, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2636, 2533.719970, -1305.242431, 1043.542358, 176.499969, 0.000000, 179.500061, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2636, 2532.905029, -1305.950439, 1043.488159, -84.700065, 76.499992, 179.500061, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2096, 2534.449707, -1305.003051, 1043.125000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2307, 2533.562011, -1305.492309, 1043.125000, 0.000000, 0.000000, 156.600051, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2636, 2531.721923, -1304.966552, 1043.700073, 4.599923, 42.299999, -164.599990, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2307, 2532.811767, -1303.930297, 1043.125000, 0.000000, 0.000000, 93.899993, -1, -1, -1, 300.00, 300.00); 

	// Stolar - Drvo na stolu
	CreateDynamicObject(1463, 2558.986328, -1286.260620, 1044.405151, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 

	// Lakirnica - Uzimanje namjestaja
	CreateDynamicObject(2636, 949.709655, 2104.541748, 1010.639770, 0.000000, 0.000000, -60.900001, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2636, 949.063537, 2104.674072, 1010.639770, 0.000000, 0.000000, -94.800003, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2636, 948.432739, 2104.214355, 1010.639770, 0.000000, 0.000000, 39.499992, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2636, 947.759277, 2104.039794, 1010.639770, 0.000000, 0.000000, -8.600005, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2636, 947.639465, 2104.177978, 1010.518432, 0.000000, -177.199981, -58.399997, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2088, 949.307800, 2104.915771, 1010.223449, 0.000000, 0.000000, -169.299987, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2328, 948.060180, 2105.882324, 1010.023437, 0.000000, 0.000000, 129.399993, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2328, 947.657653, 2106.326416, 1010.743835, 0.000000, 0.000000, 157.899993, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2328, 947.729614, 2106.008300, 1011.483703, 0.000000, 0.000000, 145.299972, -1, -1, -1, 300.00, 300.00); 

	// Labeli i pickupovi
	// Fabrika
	// Ulazi
	CreatePickup(19198, 1, -1971.7169, -2431.4812, 30.6250); // Ulaz u fabriku
	Create3DTextLabel("Ulaz\n\
					  {FFFFFF}Da udjete u fabriku stisnite\nF", 0xFF2200FF, -1971.7169, -2431.4812, 30.6250, 25,0,1);

	CreatePickup(19198, 1, -2002.1569, -2409.1113, 30.6250); // Ulaz u skladiste
	Create3DTextLabel("Ulaz\n\
					  {FFFFFF}Da udjete u skladiste stisnite\nF", 0xFF2200FF, -2002.1569, -2409.1113, 30.6250, 25,0,1);

	CreatePickup(19198, 1, 2531.6917, -1282.0725, 1048.2891); // Ulaz u prostoriju za zaposljavanje
	Create3DTextLabel("Ulaz\n\
					  {FFFFFF}Da udjete u prostoriju stisnite\nF", 0xFF2200FF, 2531.6917, -1282.0725, 1048.2891, 25,0,1);

	CreatePickup(19198, 1, 2536.4954, -1281.1107, 1044.1250); // Ulaz u lakirnicu
	Create3DTextLabel("Ulaz\n\
					  {FFFFFF}Da udjete u lakirnicu stisnite\nF", 0xFF2200FF, 2536.4954, -1281.1107, 1044.1250, 25,0,1);

	// Izlazi
	CreatePickup(19198, 1, 2570.4397, -1301.6830, 1044.1250); // Izlaz iz fabrike
	Create3DTextLabel("Izlaz\n\
					  {FFFFFF}Da izadjete iz prostorije stisnite\nF", 0xFF2200FF, 2570.4397, -1301.6830, 1044.1250, 25,0,1);

	CreatePickup(19198, 1, 2530.1389, -1305.7330, 1048.2891); // Izlaz iz prostorije za zaposljavanje
	Create3DTextLabel("Izlaz\n\
					  {FFFFFF}Da izadjete iz prostorije stisnite\nF", 0xFF2200FF, 2530.1389, -1305.7330, 1048.2891, 25,0,1);

	CreatePickup(19198, 1, 932.9949, 2129.7490, 1011.0234); // Izlaz iz lakirnice
	Create3DTextLabel("Izlaz\n\
					  {FFFFFF}Da izadjete iz prostorije stisnite\nF", 0xFF2200FF, 932.9949, 2129.7490, 1011.0234, 25,0,1);

	CreatePickup(19198, 1, 964.9330, 2160.0876, 1011.0303); // Izlaz iz skladista
	Create3DTextLabel("Izlaz\n\
					  {FFFFFF}Da izadjete iz prostorije stisnite\nF", 0xFF2200FF, 964.9330, 2160.0876, 1011.0303, 25,0,1);

	// Drvosjeca
	CreatePickup(1239, 1, -1640.7117, -2233.1650, 31.4766); // Zaposljavanje
	Create3DTextLabel("Zaposljavanje\n\
					  {FFFFFF}Da se zaposlite kucajte\n/zaposljavanje", 0xFF2200FF, -1640.7117, -2233.1650, 31.4766, 25,0,1);

	CreatePickup(1277, 1, -1639.1935, -2245.8394, 31.4766); // Oprema
	Create3DTextLabel("Oprema\n\
					  {FFFFFF}Da uzmete opremu kucajte\n/posaooprema", 0xFF2200FF, -1639.1935, -2245.8394, 31.4766, 25,0,1);

	// Dostavljac namjestaja
	CreatePickup(1239, 1, -2052.4968, -2455.0635, 30.6250); // Zaposljavanje
	Create3DTextLabel("Zaposljavanje\n\
					  {FFFFFF}Da se zaposlite kucajte\n/zaposljavanje", 0xFF2200FF, -2052.4968, -2455.0635, 30.6250, 25,0,1);

	CreatePickup(1277, 1, -2048.7520, -2457.6887, 30.6250); // Oprema
	Create3DTextLabel("Oprema\n\
					  {FFFFFF}Da uzmete opremu kucajte\n/posaooprema", 0xFF2200FF, -2048.7520, -2457.6887, 30.6250, 25,0,1);

	// Stolar
	CreatePickup(1239, 1, 2529.2551, -1295.1881, 1048.2891); // Zaposljavanje
	Create3DTextLabel("Zaposljavanje\n\
					  {FFFFFF}Da se zaposlite kucajte\n/zaposljavanje", 0xFF2200FF, 2529.2551, -1295.1881, 1048.2891, 25,0,1);

	CreatePickup(1277, 1, 2524.0593, -1294.8953, 1048.2891); // Oprema
	Create3DTextLabel("Oprema\n\
					  {FFFFFF}Da uzmete opremu kucajte\n/posaooprema", 0xFF2200FF, 2524.0593, -1294.8953, 1048.2891, 25,0,1);

	// Lakirer
	CreatePickup(1277, 1, 961.0235, 2099.5051, 1011.0248); // Oprema
	Create3DTextLabel("Oprema\n\
					  {FFFFFF}Da uzmete opremu kucajte\n/posaooprema", 0xFF2200FF, 961.0235, 2099.5051, 1011.0248, 25,0,1);

	CreatePickup(3082, 1, 958.6893, 2111.9355, 1011.0303); // Uzimanje farbe i temeljne boje
	Create3DTextLabel("Farba i temeljna boja\n\
					  {FFFFFF}Da uzmete farbu kucajte\n/kantafarbe", 0xFF2200FF, 958.6893, 2111.9355, 1011.0303, 25,0,1);

	CreatePickup(3082, 1, 940.9603, 2132.9004, 1011.0234); // Ostavljanje farbe i temeljne boje
	Create3DTextLabel("Farba i temeljna boja\n\
					  {FFFFFF}Da ubacite farbu u masinu stisnite\nN", 0xFF2200FF, 940.9603, 2132.9004, 1011.0234, 25,0,1);

	CreatePickup(3082, 1, 940.8111, 2158.2249, 1011.0234); // Ostavljanje farbe i temeljne boje
	Create3DTextLabel("Farba i temeljna boja\n\
					  {FFFFFF}Da ubacite farbu u masinu stisnite\nN", 0xFF2200FF, 940.8111, 2158.2249, 1011.0234, 25,0,1);

	// Skladiste
	CreatePickup(2680, 1, 954.9236, 2172.0149, 1011.0234); // Ostavljanje drvene kutije
	Create3DTextLabel("Skladiste - Drvena kutija\n\
					  {FFFFFF}Da ostavite drvenu kutiju stisnite\nN", 0xFF2200FF, 954.9236, 2172.0149, 1011.0234, 25,0,1);

	CreatePickup(2680, 1, 963.8871, 2171.9973, 1011.0234); // Ostavljanje ormarica
	Create3DTextLabel("Skladiste - Ormaric\n\
					  {FFFFFF}Da ostavite ormaric stisnite\nN", 0xFF2200FF, 963.8871, 2171.9973, 1011.0234, 25,0,1);

	CreatePickup(2680, 1, 959.0905, 2154.9238, 1011.0234); // Ostavljanje stolica
	Create3DTextLabel("Skladiste - Stolica\n\
					  {FFFFFF}Da ostavite stolicu stisnite\nN", 0xFF2200FF, 959.0905, 2154.9238, 1011.0234, 25,0,1);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    // Test komanda za teleportaciju do posla, nije obavezna za rad skripte
    if(!strcmp(cmdtext, "/testkomanda", true))
    {
        SetPlayerPos(playerid, 961.0235, 2099.5051, 1011.0248+1), SetPlayerInterior(playerid, 1), posao_id[playerid] = 3;
        return 1;     
    }
    return 0;
}

public OnPlayerConnect(playerid)
{
	// Resetovanje varijabli pri konektovanju igraca
	loop_animacija[playerid] = 0;
	posao_id[playerid] = 0;
	posao_oprema[playerid] = 0;
	kanta_farbe[playerid] = false;
	drvo_oboreno[playerid] = 0;
	drvosjeca_checkpoint[playerid] = 0;
	drvosjeca_progres[playerid] = 0;
	drvo_uzeto[playerid] = 0;
	namjestaj_checkpoint[playerid] = 0;
	namjestaj_kombi[playerid] = 0;
	namjestaj_uzet[playerid] = 0;
	dostava_checkpoint[playerid] = 0;
	dostava_progres[playerid] = 0;
	stolar_checkpoint[playerid] = 0;
	lakirer_checkpoint[playerid] = 0;
	lakirer_progres[playerid] = 0;
	farba_masina[playerid] = 0;
	farba_progres[playerid] = 0;
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_JUMP && loop_animacija[playerid] > 0)
	{
		switch(loop_animacija[playerid])
		{
			case 1:
			{
				SendClientMessage(playerid, -1, "Nije moguce skakati dok imate nesto u ruci");
        		TogglePlayerControllable(playerid, 0);
				zalediodledi_timer[playerid] = SetTimerEx("ResetAnimaciju", 500, false, "i", playerid);
			}
			case 2:
			{
				SendClientMessage(playerid, -1, "Nije moguce skakati dok imate nesto u ruci");
        		TogglePlayerControllable(playerid, 0);
				zalediodledi_timer[playerid] = SetTimerEx("ResetAnimaciju", 500, false, "i", playerid);
			}
		}
	}
	if(newkeys & KEY_FIRE && loop_animacija[playerid] > 0)
	{
		switch(loop_animacija[playerid])
		{
			case 1:
				ApplyAnimation(playerid, "CHAINSAW", "CSAW_1", 6.1, 1, 1, 1, 0, 0, 1);
			case 2:
				ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
		}
	}

	// Ulazak/Izlazak iz objekta
	if(newkeys & KEY_SECONDARY_ATTACK)
    {
    	if(!IsPlayerInAnyVehicle(playerid))
        {
        	// Ulazi
        	if(IsPlayerInRangeOfPoint(playerid, 5, -1971.7169, -2431.4812, 30.6250)) // Ulaz u fabriku
        	{
        		SendClientMessage(playerid, -1, "Usli ste u prostoriju.");
        		TogglePlayerControllable(playerid, 0);
				zalediodledi_timer[playerid] = SetTimerEx("ZalediOdledi", 4000, false, "i", playerid);
				SetPlayerPos(playerid, 2570.4397, -1301.6830, 1044.1250);
        		SetPlayerInterior(playerid, 2);
        	}

        	if(IsPlayerInRangeOfPoint(playerid, 5, -2002.1569, -2409.1113, 30.6250)) // Ulaz u skladiste
        	{
        		SendClientMessage(playerid, -1, "Usli ste u prostoriju.");
        		TogglePlayerControllable(playerid, 0);
				zalediodledi_timer[playerid] = SetTimerEx("ZalediOdledi", 4000, false, "i", playerid);
				SetPlayerPos(playerid, 964.9330, 2160.0876, 1011.0303);
        		SetPlayerInterior(playerid, 1);
        	}

        	if(IsPlayerInRangeOfPoint(playerid, 5, 2531.6917, -1282.0725, 1048.2891)) // Ulaz u prostoriju za zaposljavanje
			{
				SendClientMessage(playerid, -1, "Usli ste u prostoriju.");
        		TogglePlayerControllable(playerid, 0);
				zalediodledi_timer[playerid] = SetTimerEx("ZalediOdledi", 4000, false, "i", playerid);
				SetPlayerPos(playerid, 2530.1389, -1305.7330, 1048.2891);
        		SetPlayerInterior(playerid, 2);
        	}

        	if(IsPlayerInRangeOfPoint(playerid, 5, 2536.4954, -1281.1107, 1044.1250)) // Ulaz u lakirnicu
        	{
        		SendClientMessage(playerid, -1, "Usli ste u prostoriju.");
        		TogglePlayerControllable(playerid, 0);
				zalediodledi_timer[playerid] = SetTimerEx("ZalediOdledi", 4000, false, "i", playerid);
				SetPlayerPos(playerid, 932.9949, 2129.7490, 1011.0234);
        		SetPlayerInterior(playerid, 1);
        	}

        	// Izlazi
        	if(IsPlayerInRangeOfPoint(playerid, 5, 2570.4397, -1301.6830, 1044.1250)) // Izlaz iz fabrike
        	{
        		SendClientMessage(playerid, -1, "Izasli ste iz prostorije.");
        		TogglePlayerControllable(playerid, 0);
				zalediodledi_timer[playerid] = SetTimerEx("ZalediOdledi", 4000, false, "i", playerid);
				SetPlayerPos(playerid, -1971.7169, -2431.4812, 30.6250);
        		SetPlayerInterior(playerid, 0);
        	}

        	if(IsPlayerInRangeOfPoint(playerid, 5, 964.9330, 2160.0876, 1011.0303)) // Izlaz iz skladista
        	{
        		SendClientMessage(playerid, -1, "Izasli ste iz prostorije.");
        		TogglePlayerControllable(playerid, 0);
				zalediodledi_timer[playerid] = SetTimerEx("ZalediOdledi", 4000, false, "i", playerid);
				SetPlayerPos(playerid, -2002.1569, -2409.1113, 30.6250);
        		SetPlayerInterior(playerid, 0);
        	}

        	if(IsPlayerInRangeOfPoint(playerid, 5, 2530.1389, -1305.7330, 1048.2891)) // Izlaz iz prostorije za zaposljavanje
			{
				SendClientMessage(playerid, -1, "Izasli ste iz prostorije.");
        		TogglePlayerControllable(playerid, 0);
				zalediodledi_timer[playerid] = SetTimerEx("ZalediOdledi", 4000, false, "i", playerid);
				SetPlayerPos(playerid, 2531.6917, -1282.0725, 1048.2891);
        		SetPlayerInterior(playerid, 2);
        	}

        	if(IsPlayerInRangeOfPoint(playerid, 5, 932.9949, 2129.7490, 1011.0234)) // Izlaz iz lakirnice
        	{
        		SendClientMessage(playerid, -1, "Izasli ste iz prostorije.");
        		TogglePlayerControllable(playerid, 0);
				zalediodledi_timer[playerid] = SetTimerEx("ZalediOdledi", 4000, false, "i", playerid);
				SetPlayerPos(playerid, 2536.4954, -1281.1107, 1044.1250);
        		SetPlayerInterior(playerid, 2);
        	}
        }
    }

    //
    if(newkeys & KEY_NO)
    {
    	// Ostavljanje namjestaja u skladiste
    	if(IsPlayerInRangeOfPoint(playerid, 2, 954.9236, 2172.0149, 1011.0234) && lakirer_checkpoint[playerid] == 8) // Ostavljanje drvene kutije
    	{
    		SendClientMessage(playerid, -1, "Zavrsili ste posao i zaradili $1000.");
	    	SkiniAttachment(playerid);
	    	OcistiAnimaciju(playerid);
	    	GivePlayerMoney(playerid, 1000);
	    	DisablePlayerCheckpoint(playerid);
	    	lakirer_checkpoint[playerid] = 0;
	    	lakirer_progres[playerid] = 0;
	    	kanta_farbe[playerid] = false;
    		farba_masina[playerid] = 0;
    		farba_progres[playerid] = 0;
    	}

    	if(IsPlayerInRangeOfPoint(playerid, 2, 963.8871, 2171.9973, 1011.0234) && lakirer_checkpoint[playerid] == 8) // Ostavljanje ormarica
    	{
    		SendClientMessage(playerid, -1, "Zavrsili ste posao i zaradili $1000.");
	    	SkiniAttachment(playerid);
	    	OcistiAnimaciju(playerid);
	    	GivePlayerMoney(playerid, 1000);
	    	DisablePlayerCheckpoint(playerid);
	    	lakirer_checkpoint[playerid] = 0;
	    	lakirer_progres[playerid] = 0;
	    	kanta_farbe[playerid] = false;
    		farba_masina[playerid] = 0;
    		farba_progres[playerid] = 0;
    	}

    	if(IsPlayerInRangeOfPoint(playerid, 2, 959.0905, 2154.9238, 1011.0234) && lakirer_checkpoint[playerid] == 8) // Ostavljanje stolica
		{
			SendClientMessage(playerid, -1, "Zavrsili ste posao i zaradili $1000.");
	    	SkiniAttachment(playerid);
	    	OcistiAnimaciju(playerid);
	    	GivePlayerMoney(playerid, 1000);
	    	DisablePlayerCheckpoint(playerid);
	    	lakirer_checkpoint[playerid] = 0;
	    	lakirer_progres[playerid] = 0;
	    	kanta_farbe[playerid] = false;
    		farba_masina[playerid] = 0;
    		farba_progres[playerid] = 0;
    	}

    	// Drvosjeca ostavljanje drveta u prikolicu tipkom 'N'
    	for(new i = 0; i < sizeof(drvosjeca_vozila); i++)
    	{
	    	if(drvo_uzeto[playerid] == 1 && IsPlayerNearVehicle(playerid, drvosjeca_vozila[i], 5))
	    	{
	    		SendClientMessage(playerid, -1, "Ostavili ste drvo u prikolicu.");
	    		SkiniAttachment(playerid);
	    		OcistiAnimaciju(playerid);
	    		loop_animacija[playerid] = 0;
	    		drvo_uzeto[playerid] = 0;
	    		switch(drvosjeca_progres[playerid])
	    		{
	    			case 1:
	    			{
	    				SendClientMessage(playerid, -1, "Idite do sljedeceg drveta.");
						SetPlayerCheckpoint(playerid, -1586.0774, -2197.6597, 18.1648, 1.5);
	    				drvosjeca_checkpoint[playerid] = 2;
	    			}
	    			case 2:
	    			{
	    				SendClientMessage(playerid, -1, "Idite do sljedeceg drveta.");
						SetPlayerCheckpoint(playerid, -1610.0093, -2259.2915, 29.7057, 1.5);
	    				drvosjeca_checkpoint[playerid] = 3;
	    			}
	    			case 3:
	    			{
	    				SendClientMessage(playerid, -1, "Idite do sljedeceg drveta.");
						SetPlayerCheckpoint(playerid, -1640.6987, -2274.0383, 35.8217, 1.5);
	    				drvosjeca_checkpoint[playerid] = 4;
	    			}
	    			case 4:
	    			{
	    				SendClientMessage(playerid, -1, "Napunili ste prikolicu, idite ju ispraznite.");
	    				SetPlayerCheckpoint(playerid, -1947.0997, -2439.6750, 30.6250, 3);
	    				drvosjeca_checkpoint[playerid] = 5;
	    			}
	    		}
	    	}
    	}

    	// Dostavljac namjestaja ostavljanje paketa u kombi tipkom 'N'
    	for(new i = 0; i < sizeof(dostavljacn_vozila); i++)
    	{
	    	if(namjestaj_uzet[playerid] == 1 && IsPlayerNearVehicle(playerid, dostavljacn_vozila[i], 5))
	    	{
	    		SendClientMessage(playerid, -1, "Ostavili ste paket u kombi.");
	    		SkiniAttachment(playerid);
	    		OcistiAnimaciju(playerid);
	    		loop_animacija[playerid] = 0;
	    		namjestaj_uzet[playerid] = 0;
	    		if(namjestaj_kombi[playerid] > 3)
	    		{
	    			SendClientMessage(playerid, -1, "Ubacili ste dovoljno paketa, sada ih odvezite do lokacije.");
					namjestaj_kombi[playerid] = 0;
					RandomDostava(playerid);
					dostava_checkpoint[playerid] = 4;
	    		}
	    		else RandomNamjestaj(playerid);
	    	}
    	}

    	if(farba_masina[playerid] < 2 && GetPlayerInterior(playerid) == 1 && kanta_farbe[playerid] == true)
    	{
    		if(IsPlayerInRangeOfPoint(playerid, 3, 940.9603, 2132.9004, 1011.0234))
    		{
    			if(farba_progres[playerid] == 1) return SendClientMessage(playerid, -1, "Vec ste ubacili u ovu masinu, sada morate u drugu.");
    			SendClientMessage(playerid, -1, "Ubacili ste farbu u masinu.");
    			SendClientMessage(playerid, -1, "Sada idite ubacite u drugu masinu.");
    			SkiniAttachment(playerid);
	    		OcistiAnimaciju(playerid);
    			kanta_farbe[playerid] = false;
    			farba_progres[playerid] = 1;
    			farba_masina[playerid]++;
    		}
    		else if(IsPlayerInRangeOfPoint(playerid, 3, 940.8111, 2158.2249, 1011.0234))
    		{
    			if(farba_progres[playerid] == 2) return SendClientMessage(playerid, -1, "Vec ste ubacili u ovu masinu, sada morate u drugu.");
    			SendClientMessage(playerid, -1, "Ubacili ste farbu u masinu.");
    			SendClientMessage(playerid, -1, "Sada mozete poceti raditi. (/pokreniposao)");
    			SkiniAttachment(playerid);
	    		OcistiAnimaciju(playerid);
    			kanta_farbe[playerid] = false;
    			farba_progres[playerid] = 2;
    			farba_masina[playerid]++;
    		}
    	}
    }
    return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	// Checkpointi za drvosjecu - Drvo 1 -> Drvo 2 -> Drvo 3 -> Drvo 4 -> Ostavljanje drva -> Unosenje u fabriku
	if(posao_oprema[playerid] == 1 && !IsPlayerInAnyVehicle(playerid))
	{
		if(drvosjeca_checkpoint[playerid] == 1 && GetPlayerWeapon(playerid) == 9)
		{
			SendClientMessage(playerid, -1, "Nakon sto oborite drvo, isjecite ga i ubacite drva u prikolicu vozila.");
			TogglePlayerControllable(playerid, 0); DisablePlayerCheckpoint(playerid);
			ApplyAnimation(playerid, "CHAINSAW", "CSAW_1", 6.1, 1, 1, 1, 0, 0, 1);
			loop_animacija[playerid] = 1;
			zalediodledi_timer[playerid] = SetTimerEx("ZalediOdledi", 4000, false, "i", playerid);
			drvosjeca_objekt[playerid][0] = CreatePlayerObject(playerid, 845, -1630.149658, -2197.912841, 29.842027, 18.499994, -0.800000, -173.799972); 
			SetPlayerCheckpoint(playerid, -1630.149658, -2197.912841, 29.842027, 1.5);
			drvosjeca_checkpoint[playerid] = 0;
			drvo_oboreno[playerid] = 1;

		}
		else if(drvo_oboreno[playerid] == 1 && GetPlayerWeapon(playerid) == 9)
		{
			SendClientMessage(playerid, -1, "Nakon sto izrezete drvo, ubacite ga u prikolicu.");
			TogglePlayerControllable(playerid, 0); DisablePlayerCheckpoint(playerid);
			ApplyAnimation(playerid, "CHAINSAW", "CSAW_1", 6.1, 1, 1, 1, 0, 0, 1);
			loop_animacija[playerid] = 1;
			drvosjeca_timer[playerid] = SetTimerEx("DrvosjecaAttach", 4000, false, "i", playerid);
			drvosjeca_progres[playerid] = 1;
			drvo_oboreno[playerid] = 0;
			drvo_uzeto[playerid] = 1;
		}

		else if(drvosjeca_checkpoint[playerid] == 2 && GetPlayerWeapon(playerid) == 9)
		{
			SendClientMessage(playerid, -1, "Nakon sto oborite drvo, isjecite ga i ubacite drva u prikolicu vozila.");
			TogglePlayerControllable(playerid, 0); DisablePlayerCheckpoint(playerid);
			ApplyAnimation(playerid, "CHAINSAW", "CSAW_1", 6.1, 1, 1, 1, 0, 0, 1);
			loop_animacija[playerid] = 1;
			zalediodledi_timer[playerid] = SetTimerEx("ZalediOdledi", 4000, false, "i", playerid);
			drvosjeca_objekt[playerid][0] = CreatePlayerObject(playerid, 845, -1575.610839, -2191.321777, 15.144578, 18.499994, -0.800000, -173.799972); 
			SetPlayerCheckpoint(playerid, -1575.610839, -2191.321777, 15.144578, 1.5); 
			drvosjeca_checkpoint[playerid] = 0;
			drvo_oboreno[playerid] = 2;
		}
		else if(drvo_oboreno[playerid] == 2 && GetPlayerWeapon(playerid) == 9)
		{
			SendClientMessage(playerid, -1, "Nakon sto izrezete drvo, ubacite ga u prikolicu.");
			TogglePlayerControllable(playerid, 0); DisablePlayerCheckpoint(playerid);
			ApplyAnimation(playerid, "CHAINSAW", "CSAW_1", 6.1, 1, 1, 1, 0, 0, 1);
			loop_animacija[playerid] = 1;
			drvosjeca_timer[playerid] = SetTimerEx("DrvosjecaAttach", 4000, false, "i", playerid);
			drvosjeca_progres[playerid] = 2;
			drvo_oboreno[playerid] = 0;
			drvo_uzeto[playerid] = 1;
		}

		else if(drvosjeca_checkpoint[playerid] == 3 && GetPlayerWeapon(playerid) == 9)
		{
			SendClientMessage(playerid, -1, "Nakon sto oborite drvo, isjecite ga i ubacite drva u prikolicu vozila.");
			TogglePlayerControllable(playerid, 0); DisablePlayerCheckpoint(playerid);
			ApplyAnimation(playerid, "CHAINSAW", "CSAW_1", 6.1, 1, 1, 1, 0, 0, 1);
			loop_animacija[playerid] = 1;
			zalediodledi_timer[playerid] = SetTimerEx("ZalediOdledi", 4000, false, "i", playerid);
			drvosjeca_objekt[playerid][0] = CreatePlayerObject(playerid, 845, -1608.284057, -2253.232421, 28.833259, 18.499994, 3.599999, -126.299934); 
			SetPlayerCheckpoint(playerid, -1608.284057, -2253.232421, 28.833259, 1.5);
			drvosjeca_checkpoint[playerid] = 0;
			drvo_oboreno[playerid] = 3;
		}
		else if(drvo_oboreno[playerid] == 3 && GetPlayerWeapon(playerid) == 9)
		{
			SendClientMessage(playerid, -1, "Nakon sto izrezete drvo, ubacite ga u prikolicu.");
			TogglePlayerControllable(playerid, 0); DisablePlayerCheckpoint(playerid);
			ApplyAnimation(playerid, "CHAINSAW", "CSAW_1", 6.1, 1, 1, 1, 0, 0, 1);
			loop_animacija[playerid] = 1;
			drvosjeca_timer[playerid] = SetTimerEx("DrvosjecaAttach", 4000, false, "i", playerid);
			drvosjeca_progres[playerid] = 3;
			drvo_oboreno[playerid] = 0;
			drvo_uzeto[playerid] = 1;
		}

		else if(drvosjeca_checkpoint[playerid] == 4 && GetPlayerWeapon(playerid) == 9)
		{
			SendClientMessage(playerid, -1, "Nakon sto oborite drvo, isjecite ga i ubacite drva u prikolicu vozila.");
			TogglePlayerControllable(playerid, 0); DisablePlayerCheckpoint(playerid);
			ApplyAnimation(playerid, "CHAINSAW", "CSAW_1", 6.1, 1, 1, 1, 0, 0, 1);
			loop_animacija[playerid] = 1;
			zalediodledi_timer[playerid] = SetTimerEx("ZalediOdledi", 4000, false, "i", playerid);
			drvosjeca_objekt[playerid][0] = CreatePlayerObject(playerid, 845, -1639.286621, -2268.586181, 34.361213, 18.499994, -3.500000, -126.299934); 
			SetPlayerCheckpoint(playerid, -1639.286621, -2268.586181, 34.361213, 1.5); 
			drvosjeca_checkpoint[playerid] = 0;
			drvo_oboreno[playerid] = 4;
		}
		else if(drvo_oboreno[playerid] == 4 && GetPlayerWeapon(playerid) == 9)
		{
			SendClientMessage(playerid, -1, "Nakon sto izrezete drvo, ubacite ga u prikolicu.");
			TogglePlayerControllable(playerid, 0); DisablePlayerCheckpoint(playerid);
			ApplyAnimation(playerid, "CHAINSAW", "CSAW_1", 6.1, 1, 1, 1, 0, 0, 1);
			loop_animacija[playerid] = 1;
			drvosjeca_timer[playerid] = SetTimerEx("DrvosjecaAttach", 4000, false, "i", playerid);
			drvosjeca_progres[playerid] = 4;
			drvo_oboreno[playerid] = 0;
			drvo_uzeto[playerid] = 1;
		}

		else if(drvosjeca_checkpoint[playerid] == 5)
		{
			SendClientMessage(playerid, -1, "Uspjesno ste dovukli i istovarili drva za fabriku.");
			SendClientMessage(playerid, -1, "Sada unesite drva u fabriku.");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2559.1699, -1287.2177, 1044.1250, 1.5);
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
			loop_animacija[playerid] = 2;
			SetPlayerAttachedObject(playerid, 2, 19793, 5, 0.000000, 0.056999, 0.198999, 0.000000, 98.599998, 6.999996, 1.404999, 1.000000, 1.000000);
			drvosjeca_checkpoint[playerid] = 6;
		}

		else if(drvosjeca_checkpoint[playerid] == 6)
		{
			SendClientMessage(playerid, -1, "Zavrsili ste posao i zaradili $1000.");
			SkiniAttachment(playerid);
			DisablePlayerCheckpoint(playerid);
			GivePlayerMoney(playerid, 1000);
			OcistiAnimaciju(playerid);
			ResetPlayerWeapons(playerid);
			loop_animacija[playerid] = 0;
			drvosjeca_checkpoint[playerid] = 0;
			drvo_oboreno[playerid] = 0;
			drvo_uzeto[playerid] = 0;
			drvosjeca_progres[playerid] = 0;
			for(new i = 0; i < sizeof(drvosjeca_objekt); i++) 
			{
				DestroyPlayerObject(playerid, drvosjeca_objekt[playerid][i]);
			}
		}
	}

	// Checkpointi za dostavljaca namjestaja
	if(posao_oprema[playerid] == 1)
	{
		if(namjestaj_kombi[playerid] < 4 && !IsPlayerInAnyVehicle(playerid))
		{
			if(namjestaj_checkpoint[playerid] == 1)
			{
				SendClientMessage(playerid, -1, "Uzeli ste drvenu kutiju, nosite ju do kombija. (Ubacujete u kombi tipkom 'N')");
				SetPlayerAttachedObject(playerid, 1, 3799, 5, 0.000000, -0.092999, 0.155999, -82.300003, 0.000000, 9.800003, 0.180999, 0.200999, 0.195999); // Kutija za dostavljac namjestaja
				ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
				DisablePlayerCheckpoint(playerid);
				loop_animacija[playerid] = 2;
				namjestaj_kombi[playerid]++;
				namjestaj_uzet[playerid] = 1;
			}
			else if(namjestaj_checkpoint[playerid] == 2)
			{
				SendClientMessage(playerid, -1, "Uzeli ste ormaric, nosite ga do kombija. (Ubacujete u kombi tipkom 'N')");
				SetPlayerAttachedObject(playerid, 1, 3799, 5, 0.000000, -0.092999, 0.155999, -82.300003, 0.000000, 9.800003, 0.180999, 0.200999, 0.195999); // Kutija za dostavljac namjestaja
				ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
				DisablePlayerCheckpoint(playerid);
				loop_animacija[playerid] = 2;
				namjestaj_kombi[playerid]++;
				namjestaj_uzet[playerid] = 1;
			}
			else if(namjestaj_checkpoint[playerid] == 3)
			{
				SendClientMessage(playerid, -1, "Uzeli ste stolicu, nosite ju do kombija. (Ubacujete u kombi tipkom 'N')");
				SetPlayerAttachedObject(playerid, 1, 3799, 5, 0.000000, -0.092999, 0.155999, -82.300003, 0.000000, 9.800003, 0.180999, 0.200999, 0.195999); // Kutija za dostavljac namjestaja
				ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
				DisablePlayerCheckpoint(playerid);
				loop_animacija[playerid] = 2;
				namjestaj_kombi[playerid]++;
				namjestaj_uzet[playerid] = 1;
			}
		}

		// Dostava
		if(dostava_checkpoint[playerid] == 4)
		{
			if(dostava_progres[playerid] < 2)
			{
				SendClientMessage(playerid, -1, "Dostavio si paket, sada dostavite sljedeci.");
				DisablePlayerCheckpoint(playerid);
				RandomDostava(playerid);
				dostava_checkpoint[playerid] = 4;
				dostava_progres[playerid]++;
				namjestaj_checkpoint[playerid] = 0;
			}
			else
			{
				SendClientMessage(playerid, -1, "Dostavio si pakete i zaradio $2000.");
				DisablePlayerCheckpoint(playerid);
				loop_animacija[playerid] = 0;
				dostava_progres[playerid] = 0;
				dostava_checkpoint[playerid] = 0;
				namjestaj_checkpoint[playerid] = 0;
				namjestaj_kombi[playerid] = 0;
				namjestaj_uzet[playerid] = 0;
				GivePlayerMoney(playerid, 2000);
			}
		}
	}

	if(posao_oprema[playerid] == 1)
	{
		// Checkpointi za stolara
		if(stolar_checkpoint[playerid] == 1 && GetPlayerInterior(playerid) == 2)
		{
			SendClientMessage(playerid, -1, "Uzeli ste drva sa stola, sada ih stavite na pokretnu traku.");
			SetPlayerAttachedObject(playerid, 2, 19793, 5, 0.000000, 0.056999, 0.198999, 0.000000, 98.599998, 6.999996, 1.404999, 1.000000, 1.000000); // Drvo za stolara + drvosjecu
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
			SetPlayerCheckpoint(playerid, 2560.4814, -1291.6953, 1044.1250, 1.5);
			loop_animacija[playerid] = 2;
			stolar_checkpoint[playerid] = 2;
		}
		else if(stolar_checkpoint[playerid] == 2 && GetPlayerInterior(playerid) == 2)
		{
			SendClientMessage(playerid, -1, "Ostavili ste drvo na traku, sada sacekajte da se preradi.");
			OcistiAnimaciju(playerid);
			DisablePlayerCheckpoint(playerid);
			SkiniAttachment(playerid);
			stolar_objekt[playerid] = CreatePlayerObject(playerid, 19793, 2559.371337, -1291.931640, 1044.174682, 0.000000, 0.000000, 0.000000);
			MovePlayerObject(playerid, stolar_objekt[playerid], 2553.029052, -1291.931640, 1044.174682, 0.85, 0.000000, 0.000000, 0.000000);
			stolar_timer[playerid] = SetTimerEx("StolarObjekti", 7000, false, "ii", playerid, 1);
			loop_animacija[playerid] = 0;

		}

		else if(stolar_checkpoint[playerid] == 3 &&  GetPlayerInterior(playerid) == 2)
		{
			SendClientMessage(playerid, -1, "Uzeli ste daske, sada ih odnesite dalje.");
			SetPlayerAttachedObject(playerid, 3, 2410, 5, 0.000000, 0.033000, 0.068000, -82.499938, 5.000000, -72.999984, 0.601999, 0.771000, 1.000000); // Daska za stolara
			DestroyPlayerObject(playerid, stolar_objekt[playerid]);
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
			SetPlayerCheckpoint(playerid, 2551.7605, -1294.9249, 1044.1250, 1.5);
			loop_animacija[playerid] = 2;
			stolar_checkpoint[playerid] = 4;
		}
		else if(stolar_checkpoint[playerid] == 4 && GetPlayerInterior(playerid) == 2)
		{
			SendClientMessage(playerid, -1, "Ostavili ste daske na traku, sada sacekajte da se prerade.");
			OcistiAnimaciju(playerid);
			DisablePlayerCheckpoint(playerid);
			SkiniAttachment(playerid);
			stolar_objekt[playerid] = CreatePlayerObject(playerid, 2410, 2553.423339, -1294.894409, 1044.105468, 0.000000, 0.000000, 0.000000);
			MovePlayerObject(playerid, stolar_objekt[playerid], 2559.314697, -1294.894409, 1044.105468, 0.75, 0.000000, 0.000000, 0.000000);
			stolar_timer[playerid] = SetTimerEx("StolarObjekti", 7000, false, "ii", playerid, random(3)+2);
			loop_animacija[playerid] = 0;

		}

		else if(stolar_checkpoint[playerid] == 5 && GetPlayerInterior(playerid) == 2)
		{
			SendClientMessage(playerid, -1, "Uzeli ste kutiju, sada ju odnesite dalje.");
			SetPlayerAttachedObject(playerid, 4, 2328, 5, 0.351000, -0.187000, 1.249999, -83.900016, 0.000000, 11.099997, 1.000000, 1.000000, 1.000000); // Kutija drvena za stolara
			DestroyPlayerObject(playerid, stolar_objekt[playerid]);
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
			SetPlayerCheckpoint(playerid, 2551.1084, -1299.8948, 1044.1250, 1.5);
			loop_animacija[playerid] = 2;
			stolar_checkpoint[playerid] = 8;
		}
		else if(stolar_checkpoint[playerid] == 6 && GetPlayerInterior(playerid) == 2)
		{
			SendClientMessage(playerid, -1, "Uzeli ste stolicu, sada ju odnesite dalje.");
			SetPlayerAttachedObject(playerid, 3, 2636, 5, 0.000000, 0.239000, 0.070000, -170.800094, -18.799995, 83.599929, 1.000000, 1.000000, 1.000000); // Stolica za stolara
			DestroyPlayerObject(playerid, stolar_objekt[playerid]);
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
			SetPlayerCheckpoint(playerid, 2551.1084, -1299.8948, 1044.1250, 1.5);
			loop_animacija[playerid] = 2;
			stolar_checkpoint[playerid] = 9;
		}
		else if(stolar_checkpoint[playerid] == 7 && GetPlayerInterior(playerid) == 2)
		{
			SendClientMessage(playerid, -1, "Uzeli ste ormaric, sada ga odnesite dalje.");
			SetPlayerAttachedObject(playerid, 5, 912, 5, 0.092999, 0.317999, 0.215000, -83.800018, 0.000000, 92.299987, 0.755999, 0.695999, 0.623999); // Ormaric za stolara
			DestroyPlayerObject(playerid, stolar_objekt[playerid]);
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
			SetPlayerCheckpoint(playerid, 2551.1084, -1299.8948, 1044.1250, 1.5);
			loop_animacija[playerid] = 2;
			stolar_checkpoint[playerid] = 10;
		}

		else if(stolar_checkpoint[playerid] == 8 && GetPlayerInterior(playerid) == 2)
		{
			SendClientMessage(playerid, -1, "Ostavili ste kutiju da se obradi.");
			OcistiAnimaciju(playerid);
			DisablePlayerCheckpoint(playerid);
			SkiniAttachment(playerid);
			TogglePlayerControllable(playerid, 0);
			ApplyAnimation(playerid, "BOX", "boxhipin", 3.1, 0, 0, 0, false, 6000);
			stolar_objekt[playerid] = CreatePlayerObject(playerid, 2328, 2550.804443, -1299.819091, 1044.065673, 0.000000, 0.000000, -167.500061);
			stolar_timer[playerid] = SetTimerEx("StolarObjekti", 7000, false, "ii", playerid, 5);
			loop_animacija[playerid] = 0;
		}
		else if(stolar_checkpoint[playerid] == 9 && GetPlayerInterior(playerid) == 2)
		{
			SendClientMessage(playerid, -1, "Ostavili ste stolicu da se obradi.");
			OcistiAnimaciju(playerid);
			DisablePlayerCheckpoint(playerid);
			SkiniAttachment(playerid);
			TogglePlayerControllable(playerid, 0);
			ApplyAnimation(playerid, "BOX", "boxhipin", 3.1, 0, 0, 0, false, 6000);
			stolar_objekt[playerid] = CreatePlayerObject(playerid, 2636, 2551.114501, -1300.927001, 1044.715332, 0.000000, 0.000000, 0.000000);
			stolar_timer[playerid] = SetTimerEx("StolarObjekti", 7000, false, "ii", playerid, 6);
			loop_animacija[playerid] = 0;
		}
		else if(stolar_checkpoint[playerid] == 10 && GetPlayerInterior(playerid) == 2)
		{
			SendClientMessage(playerid, -1, "Ostavili ste ormaric da se obradi.");
			OcistiAnimaciju(playerid);
			DisablePlayerCheckpoint(playerid);
			SkiniAttachment(playerid);
			TogglePlayerControllable(playerid, 0);
			ApplyAnimation(playerid, "BOX", "boxhipin", 3.1, 0, 0, 0, false, 6000);
			stolar_objekt[playerid] = CreatePlayerObject(playerid, 912, 2551.080078, -1300.951049, 1044.614868, 0.000000, 0.000000, -176.800018);
			stolar_timer[playerid] = SetTimerEx("StolarObjekti", 7000, false, "ii", playerid, 7);
			loop_animacija[playerid] = 0;
		}
		else if(stolar_checkpoint[playerid] == 11 && GetPlayerInterior(playerid) == 2)
		{
			SendClientMessage(playerid, -1, "Zavrsili ste ovaj dio posla i zaradili $500. Sada mozete ici u lakirnicu ili nastaviti raditi ovaj posao.");
			OcistiAnimaciju(playerid);
			DisablePlayerCheckpoint(playerid);
			SkiniAttachment(playerid);
			GivePlayerMoney(playerid, 500);
			stolar_checkpoint[playerid] = 0;
		}

		// Checkpointi za lakirera
		if(lakirer_checkpoint[playerid] == 1)
		{
			new rand = random(3);
			SkiniAttachment(playerid);
			switch(rand)
			{
				case 0:
				{
					SendClientMessage(playerid, -1, "Uzeli ste ormaric, odnesite ga do masine za finu obradu.");
					SetPlayerAttachedObject(playerid, 5, 912, 5, 0.092999, 0.317999, 0.215000, -83.800018, 0.000000, 92.299987, 0.755999, 0.695999, 0.623999); // Ormaric
					lakirer_progres[playerid] = 1;
				}
				case 1:
				{
					SendClientMessage(playerid, -1, "Uzeli ste stolic, odnesite ga do masine za finu obradu.");
					SetPlayerAttachedObject(playerid, 6, 1820, 5, -0.260000, -0.479999, 0.637000, -82.000015, 6.100000, 0.000000, 1.000000, 1.000000, 1.000000); // Stolic za lakirera
					lakirer_progres[playerid] = 2;
				}
				case 2: 
				{
					SendClientMessage(playerid, -1, "Uzeli ste kutiju, odnesite ju do masine za finu obradu.");
					SetPlayerAttachedObject(playerid, 4, 2328, 5, 0.351000, -0.187000, 1.249999, -83.900016, 0.000000, 11.099997, 1.000000, 1.000000, 1.000000); // Kutija drvena
					lakirer_progres[playerid] = 3;
				}
			}
			SetPlayerCheckpoint(playerid, 942.4181, 2117.6594, 1011.0303, 1.5);
			TogglePlayerControllable(playerid, 1);
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
			loop_animacija[playerid] = 2;
			lakirer_checkpoint[playerid] = 2;
		}
		else if(lakirer_checkpoint[playerid] == 2)
		{
			switch(lakirer_progres[playerid])
			{
				case 1:
				{
					lakirer_objekt[playerid] = CreatePlayerObject(playerid, 912, 942.363037, 2118.678955, 1011.713317, 0.000000, 0.000000, -88.600006); // Pocetak fine obrade ormaric
					MovePlayerObject(playerid, lakirer_objekt[playerid], 941.935058, 2136.206787, 1011.713317, 0.75, 0.000000, 0.000000, -88.600006);
				}
				case 2:
				{
					lakirer_objekt[playerid] = CreatePlayerObject(playerid, 1820, 941.950805, 2118.395019, 1011.143188, 0.000000, 0.000000, 0.000000); // Pocetak fine obrade stolic
					MovePlayerObject(playerid, lakirer_objekt[playerid], 941.950805, 2135.869140, 1011.143188, 0.75, 0.000000, 0.000000, 0.000000);
				}
				case 3:
				{
					lakirer_objekt[playerid] = CreatePlayerObject(playerid, 2328, 942.390991, 2117.724121, 1011.140380, 0.000000, 0.000000, 0.000000); // Pocetak fine obrade kutija
					MovePlayerObject(playerid, lakirer_objekt[playerid], 942.390991, 2135.324218, 1011.140380, 0.75, 0.000000, 0.000000, 0.000000);
				}
			}
			DisablePlayerCheckpoint(playerid);
			SendClientMessage(playerid, -1, "Sacekajte da se namjestaj obradi na masini.");
			SkiniAttachment(playerid);
			OcistiAnimaciju(playerid);
			lakirer_timer[playerid] = SetTimerEx("LakirerCheckpoint", 21000, false, "ii", playerid, 1);
		}
		else if(lakirer_checkpoint[playerid] == 3 && IsPlayerObjectMoving(playerid, lakirer_objekt[playerid]) == 0)
		{
			SendClientMessage(playerid, -1, "Uzeli ste namjestaj iz masine, odnesite ga na farbanje temeljnom bojom.");
			DestroyPlayerObject(playerid, lakirer_objekt[playerid]);
			switch(lakirer_progres[playerid])
			{
				case 1:
					SetPlayerAttachedObject(playerid, 5, 912, 5, 0.092999, 0.317999, 0.215000, -83.800018, 0.000000, 92.299987, 0.755999, 0.695999, 0.623999); // Ormaric
				case 2:
					SetPlayerAttachedObject(playerid, 6, 1820, 5, -0.260000, -0.479999, 0.637000, -82.000015, 6.100000, 0.000000, 1.000000, 1.000000, 1.000000); // Stolic za lakirera
				case 3:
					SetPlayerAttachedObject(playerid, 4, 2328, 5, 0.351000, -0.187000, 1.249999, -83.900016, 0.000000, 11.099997, 1.000000, 1.000000, 1.000000); // Kutija drvena
			}
			SetPlayerCheckpoint(playerid, 942.3478, 2153.7080, 1011.0234, 1.5);
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
			loop_animacija[playerid] = 2;
			lakirer_checkpoint[playerid] = 4;
		}
		else if(lakirer_checkpoint[playerid] == 4)
		{
			switch(lakirer_progres[playerid])
			{
				case 1:
				{
					lakirer_objekt[playerid] = CreatePlayerObject(playerid, 912, 942.097412, 2154.557617, 1011.713317, 0.000000, 0.000000, -88.600006); // Pocetak temeljne boje ormaric
					MovePlayerObject(playerid, lakirer_objekt[playerid], 942.188171, 2172.158935, 1011.713317, 0.75, 0.000000, 0.000000, -88.600006);
				}
				case 2:
				{
					lakirer_objekt[playerid] = CreatePlayerObject(playerid, 1820, 941.950805, 2154.221923, 1011.143188, 0.000000, 0.000000, 0.000000); // Pocetak temeljne boje stolic
					MovePlayerObject(playerid, lakirer_objekt[playerid], 941.950805, 2171.775146, 1011.143188, 0.75, 0.000000, 0.000000, 0.000000);
				}
				case 3:
				{
					lakirer_objekt[playerid] = CreatePlayerObject(playerid, 2328, 942.390991, 2153.537841, 1011.140380, 0.000000, 0.000000, 0.000000); // Pocetak temeljne boje kutija
					MovePlayerObject(playerid, lakirer_objekt[playerid], 942.390991, 2171.231201, 1011.140380, 0.75, 0.000000, 0.000000, 0.000000);
				}
			}
			DisablePlayerCheckpoint(playerid);
			SkiniAttachment(playerid);
			OcistiAnimaciju(playerid);
			lakirer_timer[playerid] = SetTimerEx("LakirerCheckpoint", 15000, false, "ii", playerid, 2);
		}
		else if(lakirer_checkpoint[playerid] == 5 && IsPlayerObjectMoving(playerid, lakirer_objekt[playerid]) == 0)
		{
			SendClientMessage(playerid, -1, "Uzeli ste namjestaj iz masine, odnesite ga na farbanje konacnom bojom.");
			DestroyPlayerObject(playerid, lakirer_objekt[playerid]);
			switch(lakirer_progres[playerid])
			{
				case 1:
					SetPlayerAttachedObject(playerid, 5, 912, 5, 0.092999, 0.317999, 0.215000, -83.800018, 0.000000, 92.299987, 0.755999, 0.695999, 0.623999, 0xFFF3FF8A); // Ormaric
				case 2:
					SetPlayerAttachedObject(playerid, 6, 1820, 5, -0.260000, -0.479999, 0.637000, -82.000015, 6.100000, 0.000000, 1.000000, 1.000000, 1.000000, 0xFFF3FF8A); // Stolic za lakirera
				case 3:
					SetPlayerAttachedObject(playerid, 4, 2328, 5, 0.351000, -0.187000, 1.249999, -83.900016, 0.000000, 11.099997, 1.000000, 1.000000, 1.000000, 0xFFF3FF8A); // Kutija drvena
			}
			SetPlayerCheckpoint(playerid, 942.4181, 2117.6594, 1011.0303, 1.5);
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
			loop_animacija[playerid] = 2;
			lakirer_checkpoint[playerid] = 6;
		}
		else if(lakirer_checkpoint[playerid] == 6)
		{
			switch(lakirer_progres[playerid])
			{
				case 1:
				{
					lakirer_objekt[playerid] = CreatePlayerObject(playerid, 912, 942.363037, 2118.678955, 1011.713317, 0.000000, 0.000000, -88.600006); // Pocetak farbanja ormaric
					MovePlayerObject(playerid, lakirer_objekt[playerid], 941.935058, 2136.206787, 1011.713317, 0.75, 0.000000, 0.000000, -88.600006);
				}
				case 2:
				{
					lakirer_objekt[playerid] = CreatePlayerObject(playerid, 1820, 941.950805, 2118.395019, 1011.143188, 0.000000, 0.000000, 0.000000); // Pocetak farbanja stolic
					MovePlayerObject(playerid, lakirer_objekt[playerid], 941.950805, 2135.869140, 1011.143188, 0.75, 0.000000, 0.000000, 0.000000);
				}
				case 3:
				{
					lakirer_objekt[playerid] = CreatePlayerObject(playerid, 2328, 942.390991, 2117.724121, 1011.140380, 0.000000, 0.000000, 0.000000); // Pocetak farbanja kutija
					MovePlayerObject(playerid, lakirer_objekt[playerid], 942.390991, 2135.324218, 1011.140380, 0.75, 0.000000, 0.000000, 0.000000);
				}
			}
			SetPlayerObjectMaterial(playerid, lakirer_objekt[playerid], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
			DisablePlayerCheckpoint(playerid);
			SendClientMessage(playerid, -1, "Sacekajte da se namjestaj ofarba na masini.");
			SkiniAttachment(playerid);
			OcistiAnimaciju(playerid);
			lakirer_timer[playerid] = SetTimerEx("LakirerCheckpoint", 21000, false, "ii", playerid, 3);
		}
		else if(lakirer_checkpoint[playerid] == 7 && IsPlayerObjectMoving(playerid, lakirer_objekt[playerid]) == 0)
		{
			SendClientMessage(playerid, -1, "Uzeli ste namjestaj iz masine, odnesite ga u skladiste.");
			DestroyPlayerObject(playerid, lakirer_objekt[playerid]);
			switch(rand_id[playerid])
			{
				case 0:
				{
					#define BOJA 0xFFFF5733
				}
				case 1:
				{
					#undef BOJA
					#define BOJA 0xFF82ED0B
				}
				case 2:
				{
					#undef BOJA
					#define BOJA 0xFF0BCFED
				}
				case 3:
				{
					#undef BOJA
					#define BOJA 0xFF0B14ED
				}
				case 4:
				{
					#undef BOJA
					#define BOJA 0xFFED0BEB
				}
			}

			switch(lakirer_progres[playerid])
			{
				case 1:
				{
					SetPlayerAttachedObject(playerid, 5, 912, 5, 0.092999, 0.317999, 0.215000, -83.800018, 0.000000, 92.299987, 0.755999, 0.695999, 0.623999, BOJA);
					SetPlayerCheckpoint(playerid, 963.8871, 2171.9973, 1011.0234, 1.5); // Ormaric
				}
				case 2:
				{
					SetPlayerAttachedObject(playerid, 6, 1820, 5, -0.260000, -0.479999, 0.637000, -82.000015, 6.100000, 0.000000, 1.000000, 1.000000, 1.000000, BOJA);
					SetPlayerCheckpoint(playerid, 959.0905, 2154.9238, 1011.0234, 1.5); // Stolic za lakirera
				}
				case 3:
				{
					SetPlayerAttachedObject(playerid, 4, 2328, 5, 0.351000, -0.187000, 1.249999, -83.900016, 0.000000, 11.099997, 1.000000, 1.000000, 1.000000, BOJA); 
					SetPlayerCheckpoint(playerid, 954.9236, 2172.0149, 1011.0234, 1.5); // Kutija drvena
				}
			}
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
			loop_animacija[playerid] = 2;
			lakirer_checkpoint[playerid] = 8;
		}
	}	
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid)
{
	// Provjera da li igrac napada druge igrace motorkom
	if(GetPlayerWeapon(playerid) == 9)
	{
		new Float:HP;
		SendClientMessage(playerid, -1, "Ne smijete napadati druge igrace motorkom.");
		GetPlayerHealth(damagedid, HP);
		SetPlayerHealth(damagedid, HP+amount);
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		SetPlayerPos(playerid, X, Y, Z+5);
	}
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	loop_animacija[playerid] = 0;

	// Provjera da li je igrac zaposljen da bi mogao voziti vozilo od posla
	if(!ispassenger)
	{
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		for(new i = 0; i < sizeof(drvosjeca_vozila); i++)
		{
			if(vehicleid == drvosjeca_vozila[i] && posao_id[playerid] != 1) return SetPlayerPos(playerid, X, Y, Z+2), SendClientMessage(playerid, -1, "Niste zaposljeni kao drvosjeca.");
		}

		for(new i = 0; i < sizeof(dostavljacn_vozila); i++)
		{
			if(vehicleid == dostavljacn_vozila[i] && posao_id[playerid] != 2) return SetPlayerPos(playerid, X, Y, Z+2), SendClientMessage(playerid, -1, "Niste zaposljeni kao dostavljac namjestaja.");
		}
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	// Fix za postavljanje animacije igracu od prvi put
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 0.1, 1, 1, 1, 1, 1);
	ApplyAnimation(playerid, "CHAINSAW", "CSAW_1", 0.1, 1, 1, 1, 1, 1, 1);
	ApplyAnimation(playerid, "BOX", "boxhipin", 0.1, 1, 1, 1, 1, 1);
	loop_animacija[playerid] = 0;
	return 1;
}

// Komande
CMD:zaposljavanje(playerid)
{
	// Drvosjeca
	if(IsPlayerInRangeOfPoint(playerid, 5, -1640.7117, -2233.1650, 31.4766) && posao_id[playerid] == 0)
	{
		SendClientMessage(playerid, -1, "Uspjesno ste se zaposlili kao drvosjeca.");
		posao_id[playerid] = 1;
	}
	// Dostavljac namjestaja
	else if(IsPlayerInRangeOfPoint(playerid, 5, -2052.4968, -2455.0635, 30.6250) && posao_id[playerid] == 0)
	{
		SendClientMessage(playerid, -1, "Uspjesno ste se zaposlili kao dostavljac namjestaja.");
		posao_id[playerid] = 2;
	}
	// Stolar / Lakirer
	else if(IsPlayerInRangeOfPoint(playerid, 5, 2529.2551, -1295.1881, 1048.2891) && posao_id[playerid] == 0) 
	{
		SendClientMessage(playerid, -1, "Uspjesno ste se zaposlili kao stolar / lakirer.");
		posao_id[playerid] = 3;
	}
	else if(posao_id[playerid] > 0)
	{
		SendClientMessage(playerid, -1, "Vec si zaposljen - /posaootkaz");
	}
	else return SendClientMessage(playerid, -1, "Nisi na mjestu za zaposljavanje!");
	return 1;
}

CMD:posaootkaz(playerid)
{
	if(posao_id[playerid] == 0) return SendClientMessage(playerid, -1, "Nisi zaposljen.");
	if(posao_oprema[playerid] == 1) return SendClientMessage(playerid, -1, "Nisi skinuo opremu.");
	SendClientMessage(playerid, -1, "Dao si otkaz na poslu.");
	SetPlayerSkin(playerid, 20);
	DisablePlayerCheckpoint(playerid);
	posao_id[playerid] = 0;
	loop_animacija[playerid] = 0;
	return 1;
}

CMD:posaooprema(playerid)
{
	// Drvosjeca
	if(posao_id[playerid] == 1 && IsPlayerInRangeOfPoint(playerid, 5, -1639.1935, -2245.8394, 31.4766) && posao_oprema[playerid] == 0)
	{
		SendClientMessage(playerid, -1, "Uzeo si opremu od posla drvosjece.");
		GivePlayerWeapon(playerid, 9, 1);
		SetPlayerSkin(playerid, 27);
		posao_oprema[playerid] = 1;
	}
	// Dostavljac namjestaja
	else if(posao_id[playerid] == 2 && IsPlayerInRangeOfPoint(playerid, 5, -2048.7520, -2457.6887, 30.6250) && posao_oprema[playerid] == 0)
	{
		SendClientMessage(playerid, -1, "Uzeo si opremu od posla dostavljac namjestaja.");
		SetPlayerSkin(playerid, 170);
		posao_oprema[playerid] = 1;
	}
	// Stolar
	else if(posao_id[playerid] == 3 && IsPlayerInRangeOfPoint(playerid, 5, 2524.0593, -1294.8953, 1048.2891) && posao_oprema[playerid] == 0)
	{
		SendClientMessage(playerid, -1, "Uzeo si opremu od posla stolar.");
		SetPlayerSkin(playerid, 16);
		posao_oprema[playerid] = 1;
	}
	// Lakirer
	else if(posao_id[playerid] == 3 && IsPlayerInRangeOfPoint(playerid, 5, 961.0235, 2099.5051, 1011.0248) && posao_oprema[playerid] == 0)
	{
		SendClientMessage(playerid, -1, "Uzeo si opremu od posla lakirer.");
		SetPlayerSkin(playerid, 144);
		posao_oprema[playerid] = 1;
	}
	else if(posao_oprema[playerid] == 1)
	{
		SendClientMessage(playerid, -1, "Skinuo si opremu.");
		SetPlayerSkin(playerid, 20);
		posao_oprema[playerid] = 0;
		loop_animacija[playerid] = 0;
	}
	else return SendClientMessage(playerid, -1, "Nisi zaposljen ili nisi na mjestu za uzimanje opreme.");
	return 1;
}

CMD:pokreniposao(playerid)
{
	// Drvosjeca
	if(posao_id[playerid] == 1 && posao_oprema[playerid] == 1)
	{
		SendClientMessage(playerid, -1, "Zapoceli ste posao, pratite checkpointe. (Morate imati motorku u ruci)");
		SetPlayerCheckpoint(playerid, -1638.5691, -2202.0093, 32.0088, 1.5);
		drvosjeca_checkpoint[playerid] = 1;
	}
	// Dostavljac namjestaja
	else if(posao_id[playerid] == 2 && posao_oprema[playerid] == 1)
	{
		SendClientMessage(playerid, -1, "Zapoceli ste posao, pratite checkpointe. (Udjite u skladiste)");
		RandomNamjestaj(playerid);
	}
	// Stolar / Lakirer
	else if(posao_id[playerid] == 3 && posao_oprema[playerid] == 1 && GetPlayerSkin(playerid) == 16 && GetPlayerInterior(playerid) == 2)
	{
		SendClientMessage(playerid, -1, "Pokrenuli ste posao, uzmite drva i stavite ih na pokretnu traku za obradu.");
		SetPlayerCheckpoint(playerid, 2559.1699, -1287.2177, 1044.1250, 1.5);
		stolar_checkpoint[playerid] = 1;
	}
	else if(posao_id[playerid] == 3 && posao_oprema[playerid] == 1 && GetPlayerSkin(playerid) == 144 && GetPlayerInterior(playerid) == 1)
	{
		if(farba_masina[playerid] < 2) return SendClientMessage(playerid, -1, "Prvo morate ubaciti farbu u masine");
		SendClientMessage(playerid, -1, "Pokrenuli ste posao, uzmite namjestaj i stavite ga u masinu.");
		SetPlayerCheckpoint(playerid, 948.5063, 2104.7615, 1011.0234, 1.5);
		lakirer_checkpoint[playerid] = 1;
	}
	else if(GetPlayerInterior(playerid) == 1 && GetPlayerSkin(playerid) != 144)
	{
		SendClientMessage(playerid, -1, "Moras uzeti opremu od posla lakirer.");
		SetPlayerCheckpoint(playerid, 961.0235, 2099.5051, 1011.0248, 1.5);
	}
	else return SendClientMessage(playerid, -1, "Nisi zaposljen ili nemas opremu.");
	return 1;
}

CMD:kantafarbe(playerid)
{
	// Lakirer
	if(IsPlayerInRangeOfPoint(playerid, 5, 958.6893, 2111.9355, 1011.0303)) // Uzimanje farbe
	{
		if(posao_id[playerid] != 3) return SendClientMessage(playerid, -1, "Nisi zapoljen kao stolar / lakirer.");
		if(kanta_farbe[playerid] == true) return SendClientMessage(playerid, -1, "Vec imate kantu farbe kod sebe.");
		SendClientMessage(playerid, -1, "Uzeli ste kantu farbe, sada ju odnesite do masine.");
		SkiniAttachment(playerid);
		SetPlayerAttachedObject(playerid, 8, 3082, 5, 0.000000, 0.000000, 0.115000, 7.199998, 14.099990, 0.000000, 1.000000, 1.000000, 0.539000); // Kanta farbe
		ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
		loop_animacija[playerid] = 2;
		kanta_farbe[playerid] = true;
	}
	else SendClientMessage(playerid, -1, "Nisi na mjestu za uzimanje farbe.");
	return 1;
}

CMD:komandeposla(playerid)
{
	SendClientMessage(playerid, -1, " ");
	SendClientMessage(playerid, -1, "Posao - /zaposljavanje - Uzimanje posla.");
	SendClientMessage(playerid, -1, "Posao - /posaootkaz - Uzimanje posla.");
	SendClientMessage(playerid, -1, "Posao - /posaooprema - Uzimanje posla.");
	SendClientMessage(playerid, -1, "Posao - /pokreniposao - Uzimanje posla.");

	SendClientMessage(playerid, -1, "Lakirer - /kantafarbe - Uzimanje farbe za ubacivanje u masinu.");

	SendClientMessage(playerid, -1, "Uopsteno - 'F' Ulazak/izlazak iz prostorije");
	SendClientMessage(playerid, -1, "Uopsteno - 'N' Uzimanje/ostavljanje namjestaja/drva/farbe");
	return 1;
}

//
forward ZalediOdledi(playerid);
public ZalediOdledi(playerid)
{
	TogglePlayerControllable(playerid, 1);
	KillTimer(zalediodledi_timer[playerid]);
    return 1;
}

forward ResetAnimaciju(playerid);
public ResetAnimaciju(playerid)
{
	TogglePlayerControllable(playerid, 1);
	KillTimer(zalediodledi_timer[playerid]);
	switch(loop_animacija[playerid])
	{
		case 1:
			ApplyAnimation(playerid, "CHAINSAW", "CSAW_1", 6.1, 1, 1, 1, 0, 0, 1);
		case 2:
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
	}
    return 1;
}

forward DrvosjecaAttach(playerid);
public DrvosjecaAttach(playerid)
{
	SendClientMessage(playerid, -1, "Uzeli ste drvo, sada ga odnesite do prikolice i stisnite N.");
	KillTimer(drvosjeca_timer[playerid]);
	TogglePlayerControllable(playerid, 1);
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
	SkiniAttachment(playerid);
	SetPlayerAttachedObject(playerid, 2, 19793, 5, 0.000000, 0.056999, 0.198999, 0.000000, 98.599998, 6.999996, 1.404999, 1.000000, 1.000000);
	loop_animacija[playerid] = 2;
    return 1;
}

forward RandomNamjestaj(playerid);
public RandomNamjestaj(playerid)
{
	new namjestaj_id = random(3);
	switch(namjestaj_id)
	{
		case 0: 
			SetPlayerCheckpoint(playerid, 954.9236, 2172.0149, 1011.0234, 1.5), namjestaj_checkpoint[playerid] = 1;
		case 1: 
			SetPlayerCheckpoint(playerid, 963.8871, 2171.9973, 1011.0234, 1.5), namjestaj_checkpoint[playerid] = 2;
		case 2: 
			SetPlayerCheckpoint(playerid, 959.0905, 2154.9238, 1011.0234, 1.5), namjestaj_checkpoint[playerid] = 3;
	}
	return 1;
}

forward RandomDostava(playerid);
public RandomDostava(playerid)
{
	new dostava_id = random(5);
	switch(dostava_id)
	{
		case 0: 
			SetPlayerCheckpoint(playerid, -2236.9082, -2560.9790, 31.9219, 3), dostava_checkpoint[playerid] = 1;
		case 1: 
			SetPlayerCheckpoint(playerid, -1888.9055, -1693.2911, 21.7378, 3), dostava_checkpoint[playerid] = 1;
		case 2: 
			SetPlayerCheckpoint(playerid, -2403.6057, -2192.4695, 33.2891, 3), dostava_checkpoint[playerid] = 1;
		case 3: 
			SetPlayerCheckpoint(playerid, -1625.4692, -2696.3376, 48.5391, 3), dostava_checkpoint[playerid] = 1;
		case 4: 
			SetPlayerCheckpoint(playerid, -1098.3723, -1636.5469, 76.3672, 3), dostava_checkpoint[playerid] = 1;
	}
	return 1;
}

forward StolarObjekti(playerid, id);
public StolarObjekti(playerid, id)
{
	KillTimer(stolar_timer[playerid]);
	switch(id)
	{
		case 1: // Daska
		{
			SendClientMessage(playerid, -1, "Drvo je preradeno, pokupite daske.");
			SetPlayerCheckpoint(playerid, 2551.8367, -1291.7209, 1044.1250, 1.5);
			DestroyPlayerObject(playerid, stolar_objekt[playerid]);
			stolar_objekt[playerid] = CreatePlayerObject(playerid, 2410, 2553.423339, -1291.902343, 1044.105468, 0.000000, 0.000000, 0.000000);
			stolar_checkpoint[playerid] = 3;
		}
		case 2: // Kutija
		{
			SendClientMessage(playerid, -1, "Kutija je preradena, pokupite kutiju i odnesite do mjesta za obradu namjestaja.");
			SetPlayerCheckpoint(playerid, 2560.2773, -1294.9209, 1044.1250, 1.5);
			DestroyPlayerObject(playerid, stolar_objekt[playerid]);
			stolar_objekt[playerid] = CreatePlayerObject(playerid, 2328, 2559.337402, -1296.210937, 1044.065673, 0.000000, 0.000000, 0.000000);
			stolar_checkpoint[playerid] = 5;
		}
		case 3: // Stolica
		{
			SendClientMessage(playerid, -1, "Stolica je preradena, pokupite stolicu i odnesite do mjesta za obradu namjestaja.");
			SetPlayerCheckpoint(playerid, 2560.2773, -1294.9209, 1044.1250, 1.5);
			DestroyPlayerObject(playerid, stolar_objekt[playerid]);
			stolar_objekt[playerid] = CreatePlayerObject(playerid, 2636, 2559.365478, -1295.017456, 1044.715332, 0.000000, 0.000000, 0.000000);
			stolar_checkpoint[playerid] = 6;
		}
		case 4: // Ormaric
		{
			SendClientMessage(playerid, -1, "Ormaric je preraden, pokupite ormaric i odnesite do mjesta za obradu namjestaja.");
			SetPlayerCheckpoint(playerid, 2560.2773, -1294.9209, 1044.1250, 1.5);
			DestroyPlayerObject(playerid, stolar_objekt[playerid]);
			stolar_objekt[playerid] = CreatePlayerObject(playerid, 912, 2559.239501, -1295.080688, 1044.614868, 0.000000, 0.000000, 0.000000);
			stolar_checkpoint[playerid] = 7;
		}
		case 5: // Kutija obrada
		{
			SendClientMessage(playerid, -1, "Kutija je obradena, odnesite ju i zavrsite ovaj dio posla.");
			SetPlayerCheckpoint(playerid, 2532.8152, -1305.3618, 1044.1250, 1.5);
			SkiniAttachment(playerid);
			DestroyPlayerObject(playerid, stolar_objekt[playerid]);
			SetPlayerAttachedObject(playerid, 4, 2328, 5, 0.351000, -0.187000, 1.249999, -83.900016, 0.000000, 11.099997, 1.000000, 1.000000, 1.000000); // Kutija drvena za stolara
			TogglePlayerControllable(playerid, 1);
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
			loop_animacija[playerid] = 2;
			stolar_checkpoint[playerid] = 11;
		}
		case 6: // Stolica obrada
		{
			SendClientMessage(playerid, -1, "Stolica je obradena, odnesite ju i zavrsite ovaj dio posla.");
			SetPlayerCheckpoint(playerid, 2532.8152, -1305.3618, 1044.1250, 1.5);
			SkiniAttachment(playerid);
			DestroyPlayerObject(playerid, stolar_objekt[playerid]);
			SetPlayerAttachedObject(playerid, 3, 2636, 5, 0.000000, 0.239000, 0.070000, -170.800094, -18.799995, 83.599929, 1.000000, 1.000000, 1.000000); // Stolica za stolara
			TogglePlayerControllable(playerid, 1);
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
			loop_animacija[playerid] = 2;
			stolar_checkpoint[playerid] = 11;
		}
		case 7: // Ormaric obrada
		{
			SendClientMessage(playerid, -1, "Ormaric je obraden, odnesite ga i zavrsite ovaj dio posla.");
			SetPlayerCheckpoint(playerid, 2532.8152, -1305.3618, 1044.1250, 1.5);
			SkiniAttachment(playerid);
			DestroyPlayerObject(playerid, stolar_objekt[playerid]);
			SetPlayerAttachedObject(playerid, 5, 912, 5, 0.092999, 0.317999, 0.215000, -83.800018, 0.000000, 92.299987, 0.755999, 0.695999, 0.623999); // Ormaric za stolara
			TogglePlayerControllable(playerid, 1);
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1);
			loop_animacija[playerid] = 2;
			stolar_checkpoint[playerid] = 11;
		}
	}
    return 1;
}

forward LakirerCheckpoint(playerid, id);
public LakirerCheckpoint(playerid, id)
{
	TogglePlayerControllable(playerid, 1);
	KillTimer(zalediodledi_timer[playerid]);
	switch(id)
	{
		case 1: 
		{
			SetPlayerCheckpoint(playerid, 942.4745, 2137.2949, 1011.0234, 1.5);
			lakirer_checkpoint[playerid] = 3;
		}
		case 2: 
		{
			SetPlayerObjectMaterial(playerid, lakirer_objekt[playerid], 0, 10765, "airportgnd_sfse", "white", 0xFFFFFFFF);
			SetPlayerCheckpoint(playerid, 942.2686, 2173.3093, 1011.0234, 1.5);
			lakirer_checkpoint[playerid] = 5;
		}
		case 3: 
		{
			rand_id[playerid] = random(5);
			switch(rand_id[playerid])
			{
				case 0:
				{
					#undef BOJA
					#define BOJA 0xFFFF5733
				}
				case 1:
				{
					#undef BOJA
					#define BOJA 0xFF82ED0B
				}
				case 2:
				{
					#undef BOJA
					#define BOJA 0xFF0BCFED
				}
				case 3:
				{
					#undef BOJA
					#define BOJA 0xFF0B14ED
				}
				case 4:
				{
					#undef BOJA
					#define BOJA 0xFFED0BEB
				}
			}
			SetPlayerObjectMaterial(playerid, lakirer_objekt[playerid], 0, 10765, "airportgnd_sfse", "white", BOJA);
			SetPlayerCheckpoint(playerid, 942.4745, 2137.2949, 1011.0234, 1.5);
			lakirer_checkpoint[playerid] = 7;
		}
	}
    return 1;
}

//
SkiniAttachment(playerid)
{
	RemovePlayerAttachedObject(playerid, 0), 
	RemovePlayerAttachedObject(playerid, 1), 
	RemovePlayerAttachedObject(playerid, 2), 
	RemovePlayerAttachedObject(playerid, 3), 
	RemovePlayerAttachedObject(playerid, 4),
	RemovePlayerAttachedObject(playerid, 5), 
	RemovePlayerAttachedObject(playerid, 6), 
	RemovePlayerAttachedObject(playerid, 7), 
	RemovePlayerAttachedObject(playerid, 8), 
	RemovePlayerAttachedObject(playerid, 9),
	RemovePlayerAttachedObject(playerid, 10);
	loop_animacija[playerid] = 0;
}

IsPlayerNearVehicle(playerid, vehicleid, Float:range)
{
    if(!GetVehicleModel(vehicleid)) return 0;
    new Float:x, Float:y, Float:z;
    GetVehiclePos(vehicleid, x, y, z);
    return IsPlayerInRangeOfPoint(playerid, range, x, y, z);
}

OcistiAnimaciju(playerid)
{
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
	ClearAnimations(playerid); loop_animacija[playerid] = 0;
}
