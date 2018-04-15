// Docs: https://community.bistudio.com/wiki/ORBAT_Viewer

class CfgORBAT
{
	class JSOC
	{
		id = 0;
		idType = 2;
		commander = EnglishMen;
		text = "JSOC";
		textShort = "JSOC";
		description= "JSOC Inherent Task Force";
	
		class zulu_company
		{
			id = 26;
			idType = 2;
			side = "West";
			size = "Company";
			type = "MechanizedInfantry";
			commander = EnglishMen;
			text = "Ranger %1 %3";
			textShort = "%1 %3";
			description= "Multi-purpose, direct action company with organic lift";

			class alpha_platoon
			{
				id = 1;
				idType = 2;
				side = "West";
				size = "Platoon";
				type = "Infantry";
				text = "Dragon";
				textShort = "%1 %2 %3";
				description= "Light infantry company";
				assets[] = {CUP_B_M1133_MEV_Desert_Slat, CUP_B_M1130_CV_M2_Desert_Slat};

				class dragon_0
				{
					id = 0;
					idType = 0;
					side = "West";
					size = "FireTeam";
					type = "HQ";
					text = "Dragon'0";
					textShort = "%1 %2 %3";
					description= "HQ";
				};

				class dragon_1
				{
					id = 1;
					idType = 0;
					side = "West";
					size = "Squad";
					type = "Infantry";
					text = "Dragon'1";
					textShort = "%1 %2 %3";
					description= "Rifle Squad";
				};

				class dragon_2
				{
					id = 2;
					idType = 0;
					side = "West";
					size = "Squad";
					type = "Infantry";
					text = "Dragon'2";
					textShort = "%1 %2 %3";
					description= "Rifle Squad";
				};

				class dragon_3
				{
					id = 3;
					idType = 0;
					side = "West";
					size = "Squad";
					type = "Infantry";
					text = "Dragon'3";
					textShort = "%1 %2 %3";
					description= "Weapons Squad";
				};

				class dragon_4
				{
					id = 4;
					idType = 0;
					side = "West";
					size = "FireTeam";
					type = "Recon";
					text = "Dragon'4";
					textShort = "%1 %2 %3";
					description= "Fire Support Team";
				};

				class dragon_5
				{
					id = 5;
					idType = 0;
					side = "West";
					size = "FireTeam";
					type = "Medical";
					text = "Dragon'5";
					textShort = "%1 %2 %3";
					description= "Medical team";
				};

			};

			class badger
			{
				id = 2;
				idType = 2;
				side = "West";
				size = "Section";
				type = "Cavalry";
				text = "Badger";
				textShort = "%1 %2 Section";
				description= "Fire support and transport for Alpha Platoon";
				assets[] = {CUP_B_M1128_MGS_Desert_Slat};
			};

			class ghostrider
			{
				id = 3;
				idType = 2;
				side = "West";
				size = "Section";
				type = "Helicopter";
				text = "Ghost-Rider";
				textShort = "%1 %2";
				description= "160th SOAR attatchment";
				assets[] = {CUP_B_MH60L_DAP_4x_US, CUP_B_MH60L_DAP_4x_US};
			};
		};

		class reaper
		{
			id = 1;
			idType = 2;
			side = "West";
			size = "Section";
			type = "Fighter";
			text = "Reaper, VMM-161, MAG-16, 3rd Marine Air Wing";
			textShort = "Reaper";
			description= "CAS";
			assets[] = {CUP_B_AV8B_DYN_USMC};
		};

		class haymaker
		{
			id = 1;
			idType = 2;
			side = "West";
			size = "Section";
			type = "Artillery";
			text = "Haymaker, Battery C, 1st Battalion, 320th Field Artillery Regiment, USMC";
			textShort = "Haymaker";
			description= "Platoon";
			assets[] = {CUP_B_M119_USMC, CUP_B_M119_USMC, CUP_B_M119_USMC, CUP_B_MTVR_Ammo_USA, CUP_B_MTVR_USA, CUP_B_MTVR_USA, CUP_B_MTVR_USA};
		};
	};

	// Iraqi Army
	class Iraqi15thInfDiv
	{
		id = 15;
		IdType = 0;
		side = "Resistance";
		size = "Division";
		type = "Infantry";
		text = "Iraqi %1 %2 %3";
		textShort = "%1 %2 %3";

		class 23Reg
		{
			id = 23;
			IdType = 0;
			side = "Resistance";
			type = "Infantry"
			size = "Regiment";
			text = "%1 %3";
			textShort = "%1 %3";

			class 4Bat
			{
				id = 4;
				IdType = 0;
				side = "Resistance";
				type = "Infantry"
				size = "Battalion";
				text = "%1 %3";
				textShort = "%1 %3";

				class HQ
				{
					id = 1;
					IdType = 0;
					side = "Resistance";
					size = "Section";
					type = "HQ"
					text = "Battalion HQ";
					textShort = "HQ";
					assets[] = {CUP_I_LR_Transport_RACS, CUP_I_LR_MG_RACS};
				};

				class 1coy
				{
					id = 1;
					IdType = 0;
					side = "Resistance";
					size = "Company";
					type = "Infantry"
					text = "%1 %2 %3";
					textShort = "%1 %2 %3";

					class 1plat
					{
						id = 1;
						IdType = 0;
						side = "Resistance";
						type = "Infantry";
						size = "Platoon"
						text = "%1 %2 %3";
						textShort = "%1 %2 %3";
						assets[] = {CUP_I_M113_RACS, CUP_I_M113_RACS, CUP_I_M113_RACS};
					}

					class 2plat
					{
						id = 2;
						IdType = 0;
						side = "Resistance";
						type = "Infantry";
						size = "Platoon"
						text = "%1 %2 %3";
						textShort = "%1 %2 %3";
						assets[] = {CUP_I_M113_RACS, CUP_I_M113_RACS, CUP_I_M113_RACS};
					}

					class 3plat
					{
						id = 3;
						IdType = 0;
						side = "Resistance";
						size = "Section"
						type = "MechanizedInfantry";
						text = "%1 %2 %3";
						textShort = "%1 %2 %3";
						assets[] = {CUP_I_AAV_RACS, CUP_I_AAV_RACS};
					}
				};
				class 2coy
				{
					id = 2;
					IdType = 0;
					side = "Resistance";
					size = "Company";
					type = "Infantry"
					text = "%1 %2 %3";
					textShort = "%1 %2 %3";

					class 1plat
					{
						id = 1;
						IdType = 0;
						side = "Resistance";
						type = "Infantry";
						size = "Platoon"
						text = "%1 %2 %3";
						textShort = "%1 %2 %3";
						assets[] = {CUP_I_M113_RACS, CUP_I_M113_RACS, CUP_I_M113_RACS};
					}

					class 2plat
					{
						id = 2;
						IdType = 0;
						side = "Resistance";
						type = "Infantry";
						size = "Platoon"
						text = "%1 %2 %3";
						textShort = "%1 %2 %3";
						assets[] = {CUP_I_M113_RACS, CUP_I_M113_RACS, CUP_I_M113_RACS};
					}

					class 3plat
					{
						id = 3;
						IdType = 0;
						side = "Resistance";
						size = "Section"
						type = "MechanizedInfantry";
						text = "%1 %2 %3";
						textShort = "%1 %2 %3";
						assets[] = {CUP_I_AAV_RACS, CUP_I_AAV_RACS};
					}

				};
				class 3coy
				{
					id = 3;
					IdType = 0;
					side = "Resistance";
					size = "Company";
					type = "MechanizedInfantry"
					text = "%1 %2 %3";
					textShort = "%1 %2 %3";

					class 1plat
					{
						id = 1;
						IdType = 0;
						side = "Resistance";
						size = "Platoon"
						type = "MechanizedInfantry";
						text = "%1 %2 %3";
						textShort = "%1 %2 %3";
						assets[] = {CUP_I_AAV_RACS, CUP_I_AAV_RACS, CUP_I_AAV_RACS};
					}

					class 2plat
					{
						id = 2;
						IdType = 0;
						side = "Resistance";
						size = "Platoon"
						type = "MechanizedInfantry";
						text = "%1 %2 %3";
						textShort = "%1 %2 %3";
						assets[] = {CUP_I_AAV_RACS, CUP_I_AAV_RACS, CUP_I_AAV_RACS};
					}

					class 3plat
					{
						id = 3;
						IdType = 0;
						side = "Resistance";
						size = "Platoon"
						type = "Armored";
						text = "%1 %2 %3";
						textShort = "%1 %2 %3";
						assets[] = {CUP_I_T72_RACS, CUP_I_T72_RACS, CUP_I_T72_RACS};
					}

				};
				class 4coy
				{
					id = 4;
					IdType = 0;
					side = "Resistance";
					size = "Company";
					type = "Support"
					text = "%1 %2 %3";
					textShort = "%1 %2 %3";

					class 1plat
					{
						id = 1;
						IdType = 0;
						side = "Resistance";
						size = "Platoon"
						type = "Mortar";
						text = "%1 %2 %3";
						textShort = "%1 %2 %3";
						assets[] = {CUP_I_M252_RACS, CUP_I_M252_RACS, CUP_I_M252_RACS, CUP_I_LR_Transport_RACS, CUP_I_LR_Transport_RACS, CUP_I_LR_Transport_RACS};
					}

					class 2plat
					{
						id = 2;
						IdType = 0;
						side = "Resistance";
						size = "Section"
						type = "Medical";
						text = "%1 %2 %3";
						textShort = "%1 %2 %3";
						assets[] = {CUP_I_M113_Med_RACS, CUP_I_M113_Med_RACS};
					}

					class 3plat
					{
						id = 3;
						IdType = 0;
						side = "Resistance";
						size = "Platoon"
						type = "Maintenance";
						text = "%1 %2 %3";
						textShort = "%1 %2 %3";
						assets[] = {CUP_I_V3S_Rearm_TKG, CUP_I_V3S_Refuel_TKG, CUP_I_V3S_Repair_TKG};
					}
				};
			};
		};
	};

	// Peshmerga
	class PeshRGB
	{
		side = "Resistance";
		type = "Infantry";
		text = "Peshmerga Regional Guard Brigades";
		textShort = "Peshmerga RGB";

		class Arjin
		{
			side = "Resistance";
			type = "Infantry";
			text = "Arjin Brigade";
			textShort = "Arjin";
		};
		class Daran
		{
			side = "Resistance";
			type = "Infantry";
			text = "Daran Brigade";
			textShort = "Daran";
		};
		class Muhaha
		{
			side = "Resistance";
			type = "Infantry";
			text = "Muhaha Brigade";
			textShort = "Muhaha";
		};
		class Yezdanser
		{
			side = "Resistance";
			type = "Infantry";
			text = "Yezdanser Brigade";
			textShort = "Yezdanser";
		};
		class Sozan
		{
			side = "Resistance";
			type = "Infantry";
			text = "Sozan Brigade";
			textShort = "Sozan";
		};
		class Gorkem
		{
			side = "Resistance";
			type = "Infantry";
			text = "Gorkem Brigade";
			textShort = "Gorkem";
		};
		class Eylo
		{
			side = "Resistance";
			type = "Infantry";
			text = "Eylo Brigade";
			textShort = "Eylo";
		};
		class Azwer
		{
			side = "Resistance";
			type = "Infantry";
			text = "Azwer Brigade";
			textShort = "Azwer";
		};
	};

	// ISIS
	class ISIS
	{
		side = "East";
		type = "Infantry";
		text = "ISIS Regional Command";
		textShort = "ISIS RC";

		class AbdalJabbar
		{
			side = "East";
			type = "Infantry";
			text = "Abd al Jabbar Cell";
			textShort = "Abd al Jabbar";
		};
		class AbdalBari
		{
			side = "East";
			type = "Infantry";
			text = "Abd al Bari Cell";
			textShort = "Abd al Bari";
		};
		class Almira
		{
			side = "East";
			type = "Infantry";
			text = "Almira Cell";
			textShort = "Almira";
		};
		class Azzam
		{
			side = "East";
			type = "Infantry";
			text = "Azzam Cell";
			textShort = "Azzam";
		};
		class Aswad
		{
			side = "East";
			type = "Infantry";
			text = "Aswad Cell";
			textShort = "Aswad";
		};
		class Kadar
		{
			side = "East";
			type = "Infantry";
			text = "Kadar Cell";
			textShort = "Kadar";
		};
		class Khalid
		{
			side = "East";
			type = "Infantry";
			text = "Khalid Cell";
			textShort = "Khalid";
		};
		class Nasser
		{
			side = "East";
			type = "Infantry";
			text = "Nasser Cell";
			textShort = "Nasser";
		};
	};
}; 