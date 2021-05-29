// Docs: https://community.bistudio.com/wiki/ORBAT_Viewer

class CfgORBAT
{
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
			assets[] = {CUP_B_M2A3Bradley_USA_D, CUP_B_M2A3Bradley_USA_D};
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
			description= "Organic lift and CAS for Zulu Coy";
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
			text = "Reaper";
			textShort = "Reaper";
			description= "CAS";
			assets[] = {CUP_B_A10_DYN_USA};
		};
}; 